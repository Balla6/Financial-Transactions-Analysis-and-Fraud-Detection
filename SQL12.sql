CREATE DATABASE mimic_demo;
USE mimic_demo;

CREATE TABLE admissions (
    subject_id INT,
    hadm_id INT,
    admittime DATETIME,
    dischtime DATETIME,
    deathtime DATETIME,
    admission_type VARCHAR(50),
    admit_provider_id VARCHAR(50),
    admission_location VARCHAR(100),
    discharge_location VARCHAR(100),
    insurance VARCHAR(50),
    language VARCHAR(50),
    marital_status VARCHAR(50),
    race VARCHAR(100),
    edregtime DATETIME,
    edouttime DATETIME,
    hospital_expire_flag TINYINT
);

ALTER TABLE admissions DROP COLUMN admit_provider_id;

CREATE TABLE patients (
    subject_id INT PRIMARY KEY,
    gender VARCHAR(10),
    anchor_age INT,
    anchor_year INT,
    anchor_year_group VARCHAR(20),
    dod DATE
);

ALTER TABLE patients DROP COLUMN anchor_year;
DELETE FROM patients;
SELECT * FROM patients;
DESCRIBE patients;
ALTER TABLE patients MODIFY dod DATE NULL;






CREATE TABLE diagnoses_icd (
    subject_id INT,
    hadm_id INT,
    seq_num INT,
    icd_code VARCHAR(20),
    icd_version TINYINT
);

SELECT * FROM diagnoses_icd;

CREATE TABLE procedures_icd (
    subject_id INT,
    hadm_id INT,
    seq_num INT,
    chartdate DATE,
    icd_code VARCHAR(20),
    icd_version TINYINT
);

ALTER TABLE procedures_icd DROP COLUMN chartdate;
DELETE FROM procedures_icd;
SELECT * FROM procedures_icd;

CREATE TABLE services (
    subject_id INT,
    hadm_id INT,
    transfertime DATETIME,
    prev_service VARCHAR(50),
    curr_service VARCHAR(50)
);
ALTER TABLE services DROP COLUMN prev_service;
DELETE FROM services;
SELECT * FROM services;
DESCRIBE services;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/services.csv'
INTO TABLE services
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(subject_id, hadm_id, transfertime, curr_service);



CREATE TABLE labevents (
    labevent_id INT,
    subject_id INT,
    hadm_id INT,
    specimen_id INT,
    itemid INT,
    order_provider_id INT,
    charttime DATETIME,
    storetime DATETIME,
    value VARCHAR(100),
    valuenum FLOAT,
    valueuom VARCHAR(20),
    ref_range_lower FLOAT,
    ref_range_upper FLOAT,
    flag VARCHAR(20),
    priority VARCHAR(20),
    comments TEXT
);
ALTER TABLE labevents DROP COLUMN  comments;
DELETE FROM labevents;
SELECT * FROM labevents;
DESCRIBE labevents;

ALTER TABLE labevents MODIFY order_provider_id TEXT;


CREATE TABLE prescriptions (
    subject_id INT,
    hadm_id INT,
    pharmacy_id INT,
    poe_id INT,
    poe_seq INT,
    order_provider_id INT,
    starttime DATETIME,
    stoptime DATETIME,
    drug_type VARCHAR(50),
    drug VARCHAR(100),
    formulary_drug_cd VARCHAR(50),
    gsn VARCHAR(50),
    ndc VARCHAR(50),
    prod_strength VARCHAR(100),
    form_rx VARCHAR(50),
    dose_val_rx FLOAT,
    dose_unit_rx VARCHAR(20),
    form_val_disp FLOAT,
    form_unit_disp VARCHAR(20),
    doses_per_24_hrs FLOAT,
    route VARCHAR(50)
);

ALTER TABLE prescriptions
DROP COLUMN pharmacy_id,
DROP COLUMN poe_id,
DROP COLUMN poe_seq,
DROP COLUMN order_provider_id,
DROP COLUMN formulary_drug_cd,
DROP COLUMN gsn,
DROP COLUMN ndc,
DROP COLUMN prod_strength,
DROP COLUMN form_rx,
DROP COLUMN dose_val_rx,
DROP COLUMN dose_unit_rx,
DROP COLUMN form_val_disp,
DROP COLUMN form_unit_disp,
DROP COLUMN doses_per_24_hrs;

DELETE FROM prescriptions;
SELECT * FROM prescriptions;
DESCRIBE labevents;



CREATE TABLE microbiologyevents (
    microevent_id INT,
    subject_id INT,
    hadm_id INT,
    micro_specimen_id INT,
    order_provider_id INT,
    chartdate DATE,
    charttime DATETIME,
    spec_itemid INT,
    spec_type_desc VARCHAR(100),
    test_seq INT,
    storedate DATE,
    storetime DATETIME,
    test_itemid INT,
    test_name VARCHAR(150),
    org_itemid INT,
    org_name VARCHAR(150),
    isolate_num INT,
    quantity FLOAT,
    ab_itemid INT,
    ab_name VARCHAR(100),
    dilution_text VARCHAR(50),
    dilution_comparison VARCHAR(50),
    dilution_value FLOAT,
    interpretation VARCHAR(50),
    comments TEXT
);
ALTER TABLE microbiologyevents
DROP COLUMN microevent_id,
DROP COLUMN order_provider_id,
DROP COLUMN chartdate,
DROP COLUMN test_seq,
DROP COLUMN storedate,
DROP COLUMN storetime,
DROP COLUMN isolate_num,
DROP COLUMN quantity,
DROP COLUMN dilution_text,
DROP COLUMN dilution_comparison,
DROP COLUMN comments;
ALTER TABLE microbiologyevents DROP COLUMN spec_itemid;  
ALTER TABLE microbiologyevents DROP COLUMN org_itemid;
ALTER TABLE microbiologyevents DROP COLUMN  ab_itemid;

ALTER TABLE microbiologyevents MODIFY order_provider_id TEXT;
DELETE FROM microbiologyevents;
SELECT * FROM microbiologyevents;


CREATE TABLE icustays (
    subject_id INT,
    hadm_id INT,
    stay_id INT,
    first_careunit VARCHAR(100),
    last_careunit VARCHAR(100),
    intime DATETIME,
    outtime DATETIME,
    los FLOAT
);

ALTER TABLE icustays
DROP COLUMN first_careunit,
DROP COLUMN last_careunit;
DELETE FROM icustays;
SELECT * FROM icustays;

CREATE TABLE procedureevents (
    subject_id INT,
    hadm_id INT,
    stay_id INT,
    caregiver_id INT,
    starttime DATETIME,
    endtime DATETIME,
    storetime DATETIME,
    itemid INT,
    value FLOAT,
    valueuom VARCHAR(20),
    location VARCHAR(100),
    locationcategory VARCHAR(100),
    orderid INT,
    linkorderid INT,
    ordercategoryname VARCHAR(100),
    ordercategorydescription VARCHAR(150),
    patientweight FLOAT,
    isopenbag TINYINT,
    continueinnextdept TINYINT,
    statusdescription VARCHAR(50),
    originalamount FLOAT,
    originalrate FLOAT
);

SELECT * FROM procedureevents;
ALTER TABLE procedureevents MODIFY originalrate BOOLEAN;

ALTER TABLE procedureevents
DROP COLUMN caregiver_id,
DROP COLUMN storetime,
DROP COLUMN location,
DROP COLUMN locationcategory,
DROP COLUMN orderid,
DROP COLUMN linkorderid,
DROP COLUMN ordercategoryname,
DROP COLUMN ordercategorydescription,
DROP COLUMN patientweight,
DROP COLUMN isopenbag,
DROP COLUMN continueinnextdept,
DROP COLUMN statusdescription;


CREATE TABLE inputevents (
    subject_id INT,
    hadm_id INT,
    stay_id INT,
    caregiver_id INT,
    starttime DATETIME,
    endtime DATETIME,
    storetime DATETIME,
    itemid INT,
    amount FLOAT,
    amountuom VARCHAR(20),
    rate FLOAT,
    rateuom VARCHAR(20),
    orderid INT,
    linkorderid INT,
    ordercategoryname VARCHAR(100),
    secondaryordercategoryname VARCHAR(100),
    ordercomponenttypedescription VARCHAR(150),
    ordercategorydescription VARCHAR(150),
    patientweight FLOAT,
    totalamount FLOAT,
    totalamountuom VARCHAR(20),
    isopenbag TINYINT,
    continueinnextdept TINYINT,
    statusdescription VARCHAR(50),
    originalamount FLOAT,
    originalrate FLOAT
);

ALTER TABLE inputevents
DROP COLUMN caregiver_id,
DROP COLUMN storetime,
DROP COLUMN orderid,
DROP COLUMN linkorderid,
DROP COLUMN ordercategoryname,
DROP COLUMN secondaryordercategoryname,
DROP COLUMN ordercomponenttypedescription,
DROP COLUMN ordercategorydescription,
DROP COLUMN patientweight,
DROP COLUMN isopenbag,
DROP COLUMN continueinnextdept,
DROP COLUMN statusdescription,
DROP COLUMN originalamount,
DROP COLUMN originalrate;

DELETE FROM inputevents;
SELECT * FROM inputevents;
select * from admissions;


CREATE TABLE outputevents (
    subject_id INT,
    hadm_id INT,
    stay_id INT,
    caregiver_id INT,
    charttime DATETIME,
    storetime DATETIME,
    itemid INT,
    value FLOAT,
    valueuom VARCHAR(20)
);

ALTER TABLE outputevents
DROP COLUMN caregiver_id,
DROP COLUMN storetime;

DELETE FROM outputevents;
SELECT * FROM outputevents;






select * from microbiologyevents;
