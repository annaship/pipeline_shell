#! /bin/sh
# params: 
# $1 = rundate

if [ $# -ne 2 ]; then
    echo "Usage: $0 rundate";
    echo "rundate format: YYYYMMDD"
    exit 1;
fi

# variables:
rundate="$1"
username=`whoami`

# Removes low quality reads and the primers from the high quality reads, and assigns dataset and project names to each read
#  1.  Log on to the cluster (grendel).
#       
#        From the run directory submit clustertrim to the cluster and run:
       noclustertrim -r $rundate
#        
echo "You can check for when your processes have completed on the cluster:"

#        qstat
#     
#    or :
      qstat | grep $username
#   
#  2.  When the trimming is complete, finishing running the statistics (still in the downloads/run directory)
#       
#        report_trimmingstats -trim rundate
       # report_trimmingstats -trim $rundate
#        
#        This will run the following queries: 
#         
#        count the total reads
#        SELECT count(*) from trimseq where run=20081120
#     
#         count reads for each dataset
#          SELECT project, dataset, deleted, count(*) 
#          FROM trimseq where run=20081120 and dataset !=  and project != 
#          GROUP BY dataset, deleted ORDER BY dataset, deleted
#  
#        count the reads that were deleted and why
#        SELECT delete_reason, COUNT(*) 
#        FROM trimseq WHERE run='20081120' 
#        GROUP by delete_reason

# echo "
#            delete_reason=0 (not deleted) should be much greater than all other reasons.
#            If any delete_reason is greater than 1% (except proximal), the trimming should 
#            be investigated before proceeding. 
#           
#            If the total is greater than 15 % look at the biggest reason.
#           
#            If  biggest delete_reason is 'key' then the regions may be confused run:
#            
#            $ run_03_lost_key_mysql.sh rundate
#           
#            This query shows the results for all keys.  Useful for finding lost keys, i.e. if no data 
#            was recovered for a particular key:
#     
#            SELECT substr(sequence,1,5) as rkey, r.region, dataset, count(*) as cnt
#            FROM rawseq as r left join run_keys as k on (r.run = k.run and r.region=k.region 
#            and substr(sequence,1,5)=k.run_key)
#            WHERE r.run='20080507'
#            GROUP by rkey, r.region
#            ORDER by cnt desc
#     
# 
# "
