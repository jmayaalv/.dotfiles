#!/bin/sh

# start emacs server - replace with path to your emacs
/Applications/Emacs.app/Contents/MacOS/Emacs --daemon

# start emacs client - replace with path to your emacsclient
# this is usually in the same place as your emacs executable
/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_9/emacsclient -c $argv

