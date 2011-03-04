#!/bin/sh
user="system"
pass="manager"
var="$1"
sqlplus -S $user/$pass <<EOF
 SELECT * FROM tableName WHERE username=$var;
 exit;
EOF