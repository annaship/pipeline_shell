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

# 1)
mysql -h jbpcdb.mbl.edu env454 -e "SELECT COUNT(distinct read_id) FROM $table_name" 

# 2)
cat $dir_name/$table_name.*.txt | cut -f1 | sort | uniq | wc -l

# TODO: compare automatically
echo "Is the last number equal the number of reads in the gast_run table? (yes, no)"

read equal

echo "The answer is $equal"

if [ $equal = 'yes' ]
then
  run_06_gast_check2.sh $rundate $h_region
elif [ $equal = 'no' ]
  # not equal the number of reads in the gast_run table, then you will need to manually load the remaining data
then
  # cd g454/gast/20100929_v6v4
  cd g454/gast/$dir_name
  for i in $table_name.*.txt; 
    do mysqlimport -i -C -v -L -h jbpcdb env454 $i; 
  done; 
  $0 $rundate $h_region
else
  echo "Is the last number equal the number of reads in the gast_run table? (yes, no)"
fi


