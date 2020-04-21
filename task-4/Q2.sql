SELECT date_part(year,date_of_birth) AS "Year", count(*) AS "Count"
FROM public.api_users
GROUP BY year
ORDER BY year ASC;