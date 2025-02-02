 /* staging.dailymed_interaction */
 DROP TABLE IF EXISTS staging.dailymed_interaction CASCADE;

 CREATE TABLE IF NOT EXISTS staging.dailymed_interaction (
	spl 					TEXT NOT NULL,
	document_id 			TEXT NOT NULL,
	set_id			 		TEXT,
	version_number 			TEXT,
   	interaction_text		TEXT
); 

with xml_table as
(
select spl, xml_content::xml as xml_column
from datasource.dailymed_rx_full
)

INSERT INTO staging.dailymed_interaction
SELECT spl, y.*
    FROM   xml_table x,
            XMLTABLE('dailymed/InteractionText'
              PASSING xml_column
              COLUMNS 
                document_id 	 TEXT  PATH '../documentId',
				set_id  		 TEXT  PATH '../SetId',
				version_number	 TEXT  PATH '../VersionNumber',
				interaction_text TEXT PATH '.'
					) y
ON CONFLICT DO NOTHING;