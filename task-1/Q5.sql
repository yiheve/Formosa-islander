WITH ordered AS (SELECT currency, rate, row_number() over (partition  by currency order by rate) as row_num  FROM exchange_rates ORDER by currency, rate) select * from ordered where row_num = 530
