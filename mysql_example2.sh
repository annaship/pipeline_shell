#!/bin/sh
user="dbuser"
pass="dbpassword"
db="dbnme"
sql="select * from tal_name"
mysql -u "$user" -p"$pass"  <<EOF
  use $db;
  $sql;
EOF
