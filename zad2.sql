-- 1. úloha najdenie chýbajúcich záznamov v tabuľke, ak sa nachádza nejaký chýbajúci záznam, vypíše sa správa
-- "Yes, there are missing measurements.", inak "No, there are no missing measurements."

WITH expected_times AS (
    SELECT generate_series('2024-04-21 00:00'::timestamp, '2024-04-21 23:45'::timestamp, '15 minutes'::interval) as expected_time
)
SELECT
    CASE
        WHEN COUNT(*) > 0 THEN 'Yes, there are missing measurements.'
        ELSE 'No, there are no missing measurements.'
    END as missing_measurement_status
FROM expected_times
LEFT JOIN electro ON expected_times.expected_time = electro.datum_cas
WHERE electro.datum_cas IS NULL;

-- 2. úloha zobrazenie chýbajúcich záznamov v tabuľke, vypíše sa čas, kedy chýba záznam
WITH expected_times AS (
    SELECT generate_series('2024-04-21 00:00'::timestamp, '2024-04-21 23:45'::timestamp, '15 minutes'::interval) as expected_time
)
SELECT expected_times.expected_time
FROM expected_times
LEFT JOIN electro ON expected_times.expected_time = electro.datum_cas AND DATE(electro.datum_cas) = '2024-04-21'
WHERE electro.datum_cas IS NULL;