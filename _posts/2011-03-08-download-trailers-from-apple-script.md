---
title: 'Download trailers from apple [script]'
author: Lineker Tomazeli
layout: post
permalink: download-trailers-from-apple-script
---
Last month I bought a <a href="http://patriotmem.com/products/detailp.jsp?prodline=6&catid=69&prodgroupid=159&id=895&type=20" target="_blank">box media player</a> and I filled with I bunch of movies that were stuck in my laptop. I realized that if a invite my friends to watch a movie, it would be nice to have the trailer so I don&#8217;t have to tell them what&#8217;s the movie is about.

So I wrote this little script which given a movie name or a file with a list of names, it will search for it and download to the current directory.

All trailers will be downloaded from www.apple.com/trailers but the links are provided byÂ http://www.hd-trailers.net/

what you need:

&#8211; <a href="http://www.python.org/" target="_blank">Python</a>  
&#8211; <a href="http://www.gnu.org/software/wget/" target="_blank">Wget</a>

<pre class="prettyprint linenums">import urllib
import re
import sys
import os
import string

from urllib import FancyURLopener

class myOpenUrl(FancyURLopener):
    version = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1.11) Gecko/20071127 Firefox/2.0.0.11'

#strap movie url from html
def getMovieUrl(movieName, resolution):

    moviePageUrl = getMoviePage(movieName,resolution)

    f = urllib.urlopen(moviePageUrl)
    s = f.read()

    s = re.findall(r'http.+apple.+'+resolution+'.+mov', s)

    if s:
        return s[0]
    else:
        print "Trailer not found"

#strap movie page from google search
def getMoviePage(movieName, resolution):
    try:

        myopener = myOpenUrl()
        page = myopener.open('http://www.google.com/search?q='+ string.join(movieName.split(), "+") + "+site:http://www.hd-trailers.net/")
        html = page.read()

        s = re.findall(r'href=['"]/url.q=([^'"&#038; >]+)',html)
        return s[0]

    except e:
        print "Search failed: %s" % e

def main():

    #if you want you can change to 720 or 1080, but is not garantee that it will find it
    resolution = "480"

    movieNameList = []
    if len(sys.argv) > 1:
        if (sys.argv[1] == "-h"):
            print "usages: ./trailerDownloader.py"
            print "OR"
            print "usage: ./trailerDownloader.py listOfMovie.txt"
            sys.exit(0)
        source = open(sys.argv[1], 'r')
        movieNameList = source.readlines()
        source.close()
    else:
        movieName = raw_input("Name of the movie : ")
        movieNameList.append(movieName)

    for movieName in movieNameList:

        print "Searching for '"+movieName+"'..."
        movieUrl = getMovieUrl(movieName,resolution)

        if movieUrl:
            try:
                print "starting to download : "+ movieUrl
                cmd = 'wget -U QuickTime/7.6.2 ' + movieUrl
                os.system(cmd)
            except e:
                print "Error when trying to download : " + movieName
        else:
            print "movie not found"

if __name__ == '__main__':
    main()
</pre>

<a href="http://cid-04a483189133b6e0.office.live.com/self.aspx/CodeShare/trailerDownloader.py" target="_blank">source</a>

to run the script first you have to give permission

**$ chmod +x ./trailerDownloader.py**

to run you have 2 options:  
1) if you want to download only one trailer, the script will ask you for the name.  
$Â **./trailerDownloader.py**

2)if you want to download more than you.  
**$ ./trailerDownloader.py listOfMovies.txt**

Feel free to improve the script, and please let me know so I can update here.

And of course, use it at your own risk

Leave your comments <img src="http://tomazeli.net/wp-includes/images/smilies/icon_smile.gif" alt=":)" class="wp-smiley" />
