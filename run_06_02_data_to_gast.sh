#! /bin/sh
# params: 
# $1 = rundate
# $2 = h_region

if [ $# -ne 2 ]; then
    echo "Usage: $0 rundate hypervariable_region_sequenced";
    echo "rundate format: YYYYMMDD";
    echo "hypervariable_region_sequenced example: v6v4";
    exit 1;
fi

# variables:
rundate="$1"
h_region="$2"
dir_name="$1_$2"
table_name="gast_$1_$2"

cd g454/gast/$dir_name
gast_cleanup -r $rundate -reg $h_region &
