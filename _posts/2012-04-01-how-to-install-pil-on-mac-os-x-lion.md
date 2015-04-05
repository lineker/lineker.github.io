---
title: How to install PIL on Mac OS X Lion
author: Lineker Tomazeli
layout: post
permalink: how-to-install-pil-on-mac-os-x-lion
---
On the terminal

`# download<br />
curl -O -L http://effbot.org/downloads/Imaging-1.1.7.tar.gz<br />
# extract<br />
tar -xzf Imaging-1.1.7.tar.gz<br />
cd Imaging-1.1.7<br />
# build and install<br />
python setup.py build<br />
sudo python setup.py install<br />
# or install it for just you without requiring admin permissions:<br />
# python setup.py install --user<br />
`

source: http://stackoverflow.com/questions/9070074/how-to-install-pil-on-mac-os-x-10-7-2-lion
