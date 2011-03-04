#! /bin/sh
# params: 
# $1 = rundate
# $2 = h_region

if [ $# -ne 2 ]; then
    echo "Usage: $0 rundate hypervariable_region_sequenced";
    echo "rundate format: YYYYMMDD";
    echo "hypervariable_region_sequenced example: v6v4"
    exit 1;
fi

# variables:
rundate="$1"
h_region="$2"

# 1. Log onto the cluster .

cd /xraid2-2/g454/gast
# clustergast -r 20100929 -s v6v4
clustergast -r $rundate -s $h_region
