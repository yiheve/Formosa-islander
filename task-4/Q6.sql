SELECT first_name + ' ' + last_name AS Name,house_number + ' ' + address_line1 + ' ' +address_line2 + ' ' + postcode + ' ' + city + ' ' + public.shared_addresses.country AS Home_Address
FROM  public.shared_addresses
LEFT JOIN public.api_users ON public.api_users.home_address_id = public.shared_addresses.id
WHERE (public.api_users.email='yiheve@gmail.com')