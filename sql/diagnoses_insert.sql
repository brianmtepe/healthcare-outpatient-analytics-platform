USE healthcare_outpatient_analytics;

DELETE FROM diagnoses;

INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (1, 'B54', 'Malaria', 'Communicable');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (2, 'J06.9', 'Upper Respiratory Infection', 'Communicable');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (3, 'E11', 'Type 2 Diabetes', 'Non-Communicable');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (4, 'I10', 'Essential Hypertension', 'Non-Communicable');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (5, 'J45', 'Asthma', 'Non-Communicable');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (6, 'A09', 'Gastroenteritis', 'Communicable');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (7, 'N39.0', 'Urinary Tract Infection', 'Communicable');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (8, 'O26', 'Antenatal Care', 'Maternal Health');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (9, 'Z39', 'Postnatal Care', 'Maternal Health');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (10, 'K02', 'Dental Caries', 'Dental');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (11, 'H10', 'Conjunctivitis', 'Eye');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (12, 'H66', 'Otitis Media', 'ENT');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (13, 'A15', 'Tuberculosis', 'Communicable');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (14, 'L08', 'Skin Infection', 'Dermatology');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (15, 'K27', 'Peptic Ulcer Disease', 'Gastrointestinal');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (16, 'M79.7', 'Musculoskeletal Pain', 'Musculoskeletal');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (17, 'G40', 'Epilepsy', 'Neurology');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (18, 'F41', 'Anxiety Disorder', 'Mental Health');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (19, 'E44', 'Protein-Energy Malnutrition', 'Nutrition');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (20, 'J30', 'Allergic Rhinitis', 'ENT');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (21, 'A01', 'Typhoid Fever', 'Communicable');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (22, 'S00', 'Soft Tissue Injury', 'Injury');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (23, 'T30', 'Burn Injury', 'Injury');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (24, 'R51', 'Headache', 'General Medicine');
INSERT INTO diagnoses (diagnosis_id, icd_code, diagnosis_name, category) VALUES (25, 'M54', 'Low Back Pain', 'Musculoskeletal');
