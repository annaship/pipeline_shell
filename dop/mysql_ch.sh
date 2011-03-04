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
user=`whoami`
host="localhost"
db="development_db"
# host="jbpcdb.mbl.edu"
# db="env454"
sql="SELECT COUNT(DISTINCT sequence) FROM test1 WHERE deleted=0 AND run=\"$rundate\" AND source=\"$h_region\""

/usr/local/mysql/bin/mysql -u "$user" -h "$host" -p <<EOF
  use $db;
  $sql;
EOF

