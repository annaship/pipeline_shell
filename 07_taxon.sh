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

# 7.  Log back onto the cluster.   Assign taxonomy to each read with gast2tax which stores data the tagtax table.
#     Use defaults for the output table, boot scores and majority.
#     The reference table should be refhvr_* where * is the vregion from 5' to 3' -- in other words, for v6v4 specify refhvr_v4v6.
#     This should be run from the gast directory corresponding to this run
#      
#     Usage:  clusterize gast2tax -g gastTable -reg referenceRegionTable -ref refhvrTable
#      
#     clusterize gast2tax -g gast_20100929_v6v4 -reg v6v4 -ref  refhvr_v4v6 
#   
#     To verify, query tagtax.  The count should match the sum of the counts from step 6 above, e.g. count of reads in gast tables from all regions.
#     
#     select count(*) 
#     from tagtax as x join trimseq as t using(read_id) 
#     where run='20100929' and deleted=0
#  
#     select taxonomy, count(*) from 
#     tagtax as x join trimseq as t using(read_id)
#     where run=20100929
#     group by taxonomy
