#!/usr/bin/env python3
import mpd
# let sys.argv be available
import sys

# use_unicode will enable the utf-8 mode for python2
# see https://python-mpd2.readthedocs.io/en/latest/topics/advanced.html#unicode-handling
client = mpd.MPDClient(use_unicode=True)
client.connect("localhost", 6600)

#print ("")
for entry in client.lsinfo(sys.argv[1]):
    vartest = dict(entry)
    d = vartest.get('directory')
    if d:
        print (d)
