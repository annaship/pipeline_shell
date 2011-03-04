#! /bin/sh
# params: 
# $1 = rundate
# $2 = CSV file name
# $3 = SFF file name

if [ $# -ne 3 ]; then
    echo "Usage: $0 rundate CSV_file_name SFF_file_name";
    echo "rundate format: YYYYMMDD"
    exit 1;
fi

# 6. Import the project, researcher, run keys, and dataset information with import_flxruninfo.
# If samples are external, double-check the run date to see if it already exists in run_keys. This will write into tables: projects, run_keys, run_primers
# import_flxruninfo -r rundate -f SeqReq_MBJ_GOS_Bv3v5.csv
import_flxruninfo -r $rundate -f $csv_name

# 7. Import the sff files into the database with import_flxrun, import once for each region. 
# This will write into rawseq, rawqual, rawflow, rawflowindex. The ampersand "&" allows the command to run in the background.
import_flxrun -r $rundate -i $sff_name &
    # import_flxrun -r $1 -i EFWL25X02.sff &

# 8. Check that the sequences imported fully. Often the database connection is dropped and the import fails before all sequences are imported.
#    a.  determine the number of reads you should have:
head sff/*.sff.txt | grep "# of Reads:" 

   # b.  determine the number of reads that made it into the database:
# !!! add -p ?
# mysql -h jbpcdb.mbl.edu env454 -e "SELECT region, count(*) as seqcnt FROM rawseq WHERE run=20081125 group by region order by region" 
mysql -p -h jbpcdb.mbl.edu env454 -e "SELECT region, count(*) as seqcnt FROM rawseq WHERE run=$rundate group by region order by region"

# TODO: compare 8a & b automatically
