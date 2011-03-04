#! /bin/sh
# params: 
# $1 = rundate
# $2 = h_region

if [ $# -ne 2 ]; then
    echo "Usage: mysql_count.sh rundate hypervariable_region_sequenced";
    echo "rundate format: YYYYMMDD";
    echo "hypervariable_region_sequenced example: v6v4";
    exit 1;
fi

# variables:
rundate="$1"
h_region="$2"
db="development_db"
host="localhost"
user=`whoami`
echo "username = $user"
sql="SELECT COUNT(DISTINCT sequence) FROM test1 WHERE deleted=0 AND run=\"$rundate\" AND source=\"$h_region\""

/usr/local/mysql/bin/mysql -u "$user" -h "$host" -p <<EOF
  use $db;
  $sql;
EOF

