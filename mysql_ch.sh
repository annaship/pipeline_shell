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
db="development_db"
host="localhost"
sql="SELECT COUNT(DISTINCT sequence) FROM test1 WHERE deleted=0 AND run=\"$rundate\" AND source=\"$h_region\""

/usr/local/mysql/bin/mysql -u -h "$host" -p <<EOF
  use $db;
  $sql;
EOF

