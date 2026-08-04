USE healthcare_outpatient_analytics;
LOAD DATA LOCAL INFILE 'C:\Users\USER\Desktop\healthcare-outpatient-analytics\Data\processed\visits_processed.csv'
INTO TABLE visits
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;