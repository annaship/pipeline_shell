<?php
// Make a MySQL Connection
mysql_connect("localhost", "root", "") or die(mysql_error());
mysql_select_db("development_db") or die(mysql_error());

$trimseq_fields = array(
	"read_id",
	"run_key",
	"deleted",
	"delete_reason",
	"prox_primer",
	"orientation",
	"distal_primer",
	"countN",
	"length",
	"sequence",
	"run",
	"dataset",
	"project",
	"source",
	"date_trimmed",
);


foreach ($trimseq_fields as $trimseq_field) {
	mysql_query("INSERT INTO test1 
	(
		"read_id",
		"run_key",
		"deleted",
		"delete_reason",
		"prox_primer",
		"orientation",
		"distal_primer",
		"countN",
		"length",
		"sequence",
		"run",
		"dataset",
		"project",
		"source",
		"date_trimmed",
	) VALUES(	'FX18VMI02I6WCE', 'CTCTA', '0', '967F'-'AQ', +, 'AGGTGGTGCATGGCTGTC', '0', '62', 'CACCTTTGACATGTACGGAATCCTTTAGAGATAGAGGAGTGCTCGAAAGAGAGCCGTAACAC', '20090625', '23_SS_04_01_2008', 'SLM_SWG_Bv6', 'v6', '2009'-'07'-'23') ") 
	or die(mysql_error());  

	mysql_query("INSERT INTO test1 
	($trimseq_field) VALUES(
							'FX18VMI02IKKXE', 'CTCTA', '0', '967F'-'AQ', +, 'AGGTGGTGCATGGCTGTC', '0', '62', 'CACCTTTGACATGTACGGAATCCTTTAGAGATAGAGGAGTGCTCGAAAGAGAGCCGTAACAC', '20090625', '23_SS_04_01_2008', 'SLM_SWG_Bv6', 'v6', '2009'-'07'-'23'
			) ") 
	or die(mysql_error());  
}

echo "Data Inserted!";

?>