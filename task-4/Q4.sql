SELECT api_users.id AS User_id, first_name,last_name
FROM public.api_users
LEFT JOIN analytics.user ON analytics.user.id = api_users.id
WHERE username = 'yiheve@gmail.com';