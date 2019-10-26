#!/usr/bin/env bash

#dependencies
wget "http://fr.archive.ubuntu.com/ubuntu/pool/main/g/gst-plugins-base0.10/libgstreamer-plugins-base0.10-0_0.10.36-1_amd64.deb"
wget "http://fr.archive.ubuntu.com/ubuntu/pool/universe/g/gstreamer0.10/libgstreamer0.10-0_0.10.36-1.5ubuntu1_amd64.deb"
sudo dpkg -i libgstreamer*.deb
rm libgstreamer*.deb

#toggl
wget "https://github.com/toggl/toggldesktop/releases/download/v7.4.528/toggldesktop_7.4.528_amd64.deb"
sudo dpkg -i toggldesktop*.deb
rm toggldesktop*.deb