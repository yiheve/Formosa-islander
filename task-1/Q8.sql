select date_of_fx, count(*) from exchange_rates group by date_of_fx order by count asc;


# OR 

SELECT DISTINCT COUNT(rate) FROM fx GROUP BY date_of_fx; 