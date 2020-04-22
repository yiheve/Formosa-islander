SELECT
    (SELECT COUNT(*)
    FROM curve.analytics.transaction
    WHERE (user_id=212118)) AS num_of_transactions,

    (SELECT COUNT(funding_card_capture_status) AS num_of_successful_txns
    FROM curve.analytics.transaction
    WHERE (user_id=212118 AND funding_card_capture_status = 'APPROVED')) AS num_of_successful_txns,

    (SELECT COUNT(pos_auth_currency_iso)
    FROM curve.analytics.transaction
    WHERE (user_id=212118 AND pos_auth_currency_iso != 'GBP')) AS num_of_noneGBP,

    (SELECT COUNT(billing_amount_captured)
    FROM curve.analytics.transaction
    WHERE (user_id=212118 AND billing_amount_captured >10000)) AS num_of_txns_over_100gbp

FROM curve.analytics.transaction
GROUP BY num_of_transactions;

#breakdown
#how many transactions you have
SELECT COUNT (*) AS Transaction
FROM analytics.transaction
LEFT JOIN public.api_users ON public.api_users.id = analytics.transaction.id
WHERE user_id = 212118;

#how many successful transactions you have (the results are different in is_declined is false funding_card_capture_status = 'APPROVED')
SELECT COUNT(pos_auth_currency_iso)
FROM curve.analytics.transaction
WHERE user_id=212118 AND pos_auth_currency_iso != 'GBP'

#how many transactions you have in a different currency to GBP
SELECT COUNT(pos_auth_currency_iso)
FROM curve.analytics.transaction
WHERE user_id=212118 AND pos_auth_currency_iso != 'GBP'

#how many transactions above £100 you have.
SELECT COUNT(billing_amount_captured)
FROM curve.analytics.transaction
WHERE (user_id=212118 AND billing_amount_captured >10000);