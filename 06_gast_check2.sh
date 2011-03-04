#! /bin/sh
# params: 
# $1 = rundate
# $2 = h_region

if [ $# -ne 2 ]; then
    echo "Usage: pipeline.sh rundate hypervariable_region_sequenced";
    echo "rundate format: YYYYMMDD";
    echo "hypervariable_region_sequenced example: v6v4";
    exit 1;
fi

# variables:
rundate="$1"
h_region="$2"
dir_name="$1_$2"
table_name="gast_$1_$2"

facount $dir_name.unique.fa 
# If the counts are off, first check that the initial set of sequences is correct
grep -c ">" $dir_name/*.fa
./mysql_count.sh $rundate $h_region


