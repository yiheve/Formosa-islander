#ext2a: Find a count of all users with a date of birth greater than today’s date split by year
SELECT COUNT(id) AS num_of_User, DATE_PART(y, date_of_birth) AS Born_after_2020_04_22
FROM analytics.user
WHERE date_of_birth >= '2020-04-22'
GROUP BY Born_after_2020_04_22
ORDER BY num_of_User ASC;

#ext2b: Find how many Zendesk tickets each user has submitted (analytics.zendesk_ticket)
SELECT COUNT(*) AS num_of_contact,user_id
FROM analytics.zendesk_ticket
GROUP BY user_id
ORDER BY num_of_contact DESC;

#ext2c: Find all the different promo codes that have been used (don’t use Admin to find  them)
#How can I find out if they're used?'
SELECT promo_code FROM public.api_users
GROUP BY promo_code;

#ext2d:Write  a query that returns a user’s email address, user id, referral code and referral link
SELECT id,email, referral_code, 'https://www.curve.come/join#'+ referral_code AS ref_link
FROM public.api_users
ORDER BY id ASC;

#ext2e: Find all curve user emails that have a pending refund (challenging) (public.pe_issuer_request, analytics.curve_card)

SELECT COUNT(public.pe_issuer_request.type) AS num_of_pending_refunds, api_users.email
FROM public.pe_issuer_request
LEFT JOIN analytics.curve_card ON analytics.curve_card.id = public.pe_issuer_request.curve_card_id
LEFT JOIN public.api_users ON public.api_users.id = analytics.curve_card.user_id
WHERE (type = 'Refund' AND transaction_id IS NULL)
GROUP BY api_users.email;
