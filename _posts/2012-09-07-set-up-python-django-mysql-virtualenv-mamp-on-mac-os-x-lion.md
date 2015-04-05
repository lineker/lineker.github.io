---
title: Set Up Python + Django + MySql + VirtualEnv (+ MAMP) on Mac OS X Lion
author: Lineker Tomazeli
layout: post
permalink: set-up-python-django-mysql-virtualenv-mamp-on-mac-os-x-lion
---
We will be setting up VirtualEnv first so we can easily create dev environment. If you don&#8217;t know what VirtualEnv is go [here  
][1]After that we will install MySql and set up our requirements file so we can run [pip][2]Â&nbsp;to install mysql python driver and django.

Most of this content was gathered from different sources. Please see the end of the article for references.

### Python site-packages

Managing Python packages is not the easiest thing in the world. Installing is not so bad but them when we have to delete that things become messy if we are not careful. First thing we are going to do is install Distribute.Â&nbsp;[Distribute][3]Â&nbsp;is a fork of Setuptools/easy_install that aims to be more reliable with lessÂ&nbsp;bugs.  
So If I decide to install a python package but later I want to delete it, I can just drag and drop to trash without issues. We will be setting up Â&nbsp;the following path to hold our python packages &#8220;~/.local&#8221;

Letâ€™s installÂ&nbsp;Distribute:

<pre class="brush: bash; title: ; notranslate" title="">mkdir -p ~/.local/lib/python2.7/site-packages
wget http://pypi.python.org/packages/source/d/distribute/distribute-0.6.28.tar.gz
tar -xzf distribute-0.6.28.tar.gz
cd distribute-0.6.28
python setup.py install --prefix=~/.local</pre>

Because we have installed in &#8220;~/.local&#8221; we need to add some locations to the PATH and PYTHONPATH environment variables

<pre class="brush: bash; title: ; notranslate" title="">vim ~/.bash_profile</pre>

Add a few lines

<pre class="brush: bash; title: ; notranslate" title=""># Path ------------------------------------------------------------
if [ -d ~/.local/bin ]; then
  export PATH=~/.local/bin:$PATH
fi

# Python path -----------------------------------------------------
if [ -d ~/.local/lib/python2.7/site-packages ]; then
  export PYTHONPATH=~/.local/lib/python2.7/site-packages:$PYTHONPATH
fi

# Load in .bashrc -------------------------------------------------
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi</pre>

Now let&#8217;s reload our profile:

<pre class="prettyprint">touch ~/.bashrc
source ~/.bash_profile</pre>

<pre>Now let's check that we are running from the correct place:</pre>

<pre class="prettyprint">which easy_install</pre>

Assuming the response is ~/.local/bin/easy_install, then weâ€™re all set!

### VirtualEnv

&#8220;Python packages installed to ~/.local are indeed local to the user, but they are also global in the sense that they are available across all of a given userâ€™s projects. That can be convenient at times, but it also creates problems. For example, sometimes one project needs the latest version of Django, while another needs Django 1.3 to retain compatibility with a critical third-party extension. This is precisely the problem that virtualenv was designed to solve.&#8221; On my systems, virtualenv, virtualenvwrapper, and Git are the only Python packages that are always available â€” every other package is confined to its virtual environment.

Letâ€™s install virtualenv and virtualenvwrapper:

<pre class="prettyprint">easy_install --prefix=~/.local virtualenv virtualenvwrapper</pre>

Weâ€™ll then open/create the ~/.bashrc file:

<pre class="prettyprint">vim ~/.bashrc</pre>

and add some lines to it:

<pre class="prettyprint"># Turn on advanced bash completion if the file exists
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

# Locate virtualenvwrapper binary
if [ -f ~/.local/bin/virtualenvwrapper.sh ]; then
    export VENVWRAP=~/.local/bin/virtualenvwrapper.sh
fi

if [ ! -z $VENVWRAP ]; then
    # virtualenvwrapper --------------------------------------
    # make sure env directory exists; else create it
    [ -d $HOME/sites/env ] || mkdir -p $HOME/sites/env
    export WORKON_HOME=$HOME/sites/env
    source $VENVWRAP

    # virtualenv ---------------------------------------------
    export VIRTUALENV_USE_DISTRIBUTE=true

    # pip ----------------------------------------------------
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export PIP_REQUIRE_VIRTUALENV=true
    export PIP_RESPECT_VIRTUALENV=true
    export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
fi</pre>

Letâ€™s re-load our bash environment again:

<pre class="prettyprint">source ~/.bash_profile</pre>

Let&#8217;s add some customization to the postactivation script, which defines what happens after activating a virtual environment:

<pre class="prettyprint">vim ~/sites/env/postactivate</pre>

Add the following lines:

<pre class="prettyprint">proj_name=${VIRTUAL_ENV##*/}

# Add the active project to the PYTHONPATH
if [ -d ~/sites/env/$proj_name/lib/python2.7/site-packages ]; then
  add2virtualenv ~/sites/env/$proj_name/lib/python2.7/site-packages
fi

# "cd" into the virtualenv, or its "project" folder if there is one
if [ -d ~/sites/env/$proj_name/project ]; then
  cd ~/sites/env/$proj_name/project
# I'm using sublime text2, so I like to open my project right at the same time
  subl ~/sites/env/$proj_name/project
else
  cd ~/sites/env/$proj_name
  subl ~/sites/env/$proj_name
fi</pre>

Now we have virtualenv and virtualenvwrapper installed and ready to create new virtual environments, which will be stored in ~/sites/env/.

**Creating virtual environments**

Letâ€™s create a virtual environment called â€œtestingprojectâ€:

<pre class="prettyprint">mkvirtualenv testingproject</pre>

That should create a new virtual environment and automatically switch our present working directory to that new testingproject environment.

In the future, when you want to work on a project contained in a virtual environment, use the â€œworkonâ€ command followed by the name of the virtual environment:

<pre class="prettyprint">workon testingproject</pre>

That will activate the â€œtestingprojectâ€ virtual environment, and if youâ€™ve made the changes I recommended earlier to the â€œpostactivateâ€ script, you should be taken directly to the virtual environmentâ€™s directory at ~/sites/env/testingproject. If not, you can always get there via the â€œcdvirtualenvâ€ command, which will take you to the currently-active virtual environmentâ€™s home.

### MySQL

To make django and python work with mysql we will need to install MySQLdb package. Unfortunately we have to compile it and to do so we need to do a full installation of MySQL server on Mac OS Lion. After installing and compiling everything you can use MAMP if you want.

If you want to use MAMP go to step 2, otherwise keep reading

1) Go to dev.mysql.com/downloads/ and download to latest version. I got mysql-5.5.25-osx10.6-x86_64.dmg and followed the instructions for the installation. If you set the preferences correctly in Startup Package and Preferences Pane (double click MySQLStartupItem.pkg and then MySQL.prefPane), you can configure mysql to be started/stopped from System Preferences.

2) Let make a hard copy of MySql so we can have all the dependencies to compile MySQLdb.  
Dowload the tar.gz from dev.mysql.com/downloads/, than in the command line:

<pre class="prettyprint">tar -xvzf mysql-5.5.25-osx10.6-x86_64.tar.gz
sudo cp -r mysql-5.5.25-osx10.6-x86_64 /usr/local/
sudo mv -r /usr/local/mysql-5.5.20-osx10.6-x86_64 /usr/local/mysql</pre>

Add this to your .bash_profile, so that your system will know where to find mysql related files:

<pre class="prettyprint">cd ~
vim .bash_profile
export PATH=$PATH:/usr/local/mysql/bin #add this line
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib #add this line</pre>

This is it for MySQL for now.

### Final touchs

Now we are going to set up our requirements.txt document with all the packages that we need and pip will take care of downloading and compiling our virtual environment

<pre class="prettyprint">workon testingproject
mkdir project
vim project/requirements.txt</pre>

Add the following lines:

<pre class="prettyprint">Python&gt;=2.7.1
Django
MySQL-python</pre>

First line specify python version that you need. Than Django and MySql-python (MySQLdb) package.  
Save the file and run

<pre class="prettyprint">pip install -r project/requirements.txt</pre>

It will install Python and Django but you going to see an error message like this for MySQL-python:

<pre class="prettyprint">EnvironmentError: mysql_config not found</pre>

It&#8217;s ok. We are going to fix this. We will notice that pip created a folder called &#8220;build&#8221;. Let change one file to make it work.

<pre class="prettyprint">cd build
cd MySQL-python
vim site.cfg</pre>

change the mysql path as follows

<pre class="prettyprint">mysql_config = /usr/local/mysql/bin/mysql_config</pre>

Save and close, then run the pip command again.

<pre class="prettyprint">pip install -r project/requirements.txt</pre>

Now everything should work and you should be able to to &#8220;import MySQLdb&#8221; from inside you python shell.

*If you want to make django work with MAMP, you can just change the HOST inside settings.py:

<pre class="prettyprint">'HOST': '/Applications/MAMP/tmp/mysql/mysql.sock'</pre>

 [1]: http://www.virtualenv.org/en/latest/index.html
 [2]: http://www.pip-installer.org/en/latest/index.html
 [3]: http://pypi.python.org/pypi/distribute
