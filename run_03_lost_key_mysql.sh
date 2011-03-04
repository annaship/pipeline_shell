#!/bin/sh
# params: 
# $1 = rundate

if [ $# -ne 1 ]; then
    echo "Usage: $0 rundate";
    echo "rundate format: YYYYMMDD"
    exit 1;
fi

sql="
SELECT substring(s.sequence, 1,5) as firstfive, region, count(t.read_id) as cnt, 
COUNT(CASE WHEN deleted=0 then t.read_id ELSE NULL END) as cntkept, 
COUNT(CASE WHEN deleted=1 then t.read_id ELSE NULL END) as cntdeleted 
FROM `trimseq` as t join rawseq as s using (read_id) 
WHERE t.run=$rundate and s.run=$rundate
GROUP BY region, firstfive 
ORDER BY cnt desc
"

mysql -p -h jbpcdb.mbl.edu env454 -e <<EOF
  $sql;
EOF