/* datasource.fda_excluded_package */
DROP TABLE IF EXISTS datasource.fda_excluded_product CASCADE;

CREATE TABLE datasource.fda_excluded_product (
productid                           TEXT,
productndc                          TEXT,
producttypename                     TEXT,
proprietaryname                     TEXT,
proprietarynamesuffix               TEXT,
nonproprietaryname                  TEXT,
dosageformname                      TEXT,
routename                           TEXT,
startmarketingdate                  TEXT,
endmarketingdate                    TEXT,
marketingcategoryname               TEXT,
applicationnumber                   TEXT,
labelername                         TEXT,
substancename                       TEXT,
active_numerator_strength           TEXT,
active_ingred_unit                  TEXT,
pharm_classes                       TEXT,
deaschedule                         TEXT,
ndc_exclude_flag                    TEXT,
listing_record_certified_through    TEXT,
PRIMARY KEY (productid)
);

COPY datasource.fda_excluded_product
FROM '{{ ti.xcom_pull(key='file_path',task_ids='get_fda_excluded') }}/Products_excluded.txt' DELIMITER E'\t' CSV HEADER ENCODING 'WIN1252';;