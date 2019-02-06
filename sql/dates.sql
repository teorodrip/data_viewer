CREATE OR REPLACE VIEW ciq.min_max_dates AS
SELECT * 
FROM
(
SELECT ticker_bbg
, concat('{"min_date": "', min(period_date), '", "max_date": "', max(period_date), '"}') AS statements_standard_year
FROM ciq.statements_standard_year
GROUP BY ticker_bbg
) AS y
FULL OUTER JOIN
(
SELECT ticker_bbg
, concat('{"min_date": "', min(period_date), '", "max_date": "', max(period_date), '"}') AS statements_standard_quarter
FROM ciq.statements_standard_quarter
GROUP BY ticker_bbg
) AS q
USING(ticker_bbg)
