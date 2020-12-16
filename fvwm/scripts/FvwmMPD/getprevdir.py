#!/usr/bin/env python3
# Return the path to the previous mpd library directory
import sys

if __name__ == "__main__":
	if (sys.argv[1].rfind('/') == -1):
		#No slashes probably means we're one down from the mpd root
		print("''")
	else:
		print(sys.argv[1][:sys.argv[1].rfind('/')])
