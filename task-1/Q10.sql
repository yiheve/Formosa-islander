select currency,stddev(rate) from exchange_rates where currency = 'GBP' group by currency;
