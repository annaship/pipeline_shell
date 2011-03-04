#! /bin/sh

# 1) change permissions for all csv files in the current dir
# 
chgrp g454 *.csv
chmod 664 *.csv

# 2) Convert files to UNIX 
# dos2unix:    s/\r\n/\n/;
# mac2unix.pl: s/\r/\n/g;

dos2unix *.csv
mac2unix *.csv

# 3) validation
#  Andy's script + 4,5,5b from pipline wiki
