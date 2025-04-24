Create database playstoregames;

select * from googleplaystore;

Select installs, app from googleplaystore      #To sort the apps from highest downloads to lowest
order by installs desc;

select * from googleplaystore;                 #To display the table

Select app, `Android Ver` from googleplaystore
Where `Android Ver` >= 4
order by app desc;                             #To sort the table only with columns app and android ver and ordering it by descending order of app

Select app,
max(Reviews) as reviews,
max(installs) as installs,
max(rating) as rating,
max(`android ver`) as `android ver`
from googleplaystore
where rating >= 4 
and Cast(Replace(Replace(installs, ',', ''), '+', '') As UNSIGNED) >= 1000000 
and Cast(`Android Ver` as decimal (3,1)) >= 4
group by app;                                   #To sort the table and show apps which have over a million downloads with rating above 4 and android version 4 and above, this command also removes the commas and "+" from installs.

Select `android ver` as android_version,
avg(Reviews) as avg_reviews,
avg(cast(replace(replace(size, ',', ''), 'M', '') as decimal(6,2))) as avg_size,
avg(cast(replace(replace(installs, ',', ''), '+', '') as unsigned)) as avg_installs
from googleplaystore
where `android ver` >= 4
group by `android ver`;                          #to show the average reviews, size and installs for versions above 4

SELECT 
    googleplaystore.app, 
    googleplaystore.Rating, 
    developers.developer_name, 
    developers.contact_email, 
    developers.website_url, 
    developers.country
FROM googleplaystore
INNER JOIN developers
ON googleplaystore.app = developers.app_id;      #to join two tables googleplaystore and developers

Select app,installs
from googleplaystore
where installs > (Select avg(installs) from googleplaystore);           #subquery to find apps with above average installs

Create view app_details as
select app, installs, reviews, `Android ver`
from googleplaystore;

Select * from app_details;                        #to create and then display app details such as app name, installs, reviews and android version

CREATE INDEX idx_app_id ON googleplaystore(app(255));