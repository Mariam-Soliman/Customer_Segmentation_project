use customers;

select * from customer_segmentation_data limit 5;

-- finding number of customers
select count(id) from customer_segmentation_data;

-- finding distribution of genders 
select gender,count(gender) as gender_count,round(count(gender)/(select count(*) from customer_segmentation_data)*100,1) as gender_percentage from customer_segmentation_data group by gender;

-- finding customers age range
select min(age),max(age),avg(age) from customer_segmentation_data;

-- finding income range
select min(income),max(income),round(avg(income),1) from customer_segmentation_data;

-- finding average spending score by age
select case when age<20 then 'under 20' 
			when age>=20 and age<30 then '20-30' 
			when age>=30 and age<40 then '30-40'
            when age>=40 and age<50 then '40-50'
            when age>=50 and age<60 then '50-60'
            when age>=60 then '60 and over'
            end as age_range,
            round(avg(spending_score),2) as average_spending_score from customer_segmentation_data group by age_range order by average_spending_score;

-- finding average spending score by income
select case when income between 30000 and 70000 then '30k-70k' 
    when income between 70001 and 110000 then '70k-110k' 
    when income between 110001 and 150000 then '110k-150k' end as income_range,
             round(avg(spending_score),2) as average_spending_score from customer_segmentation_data group by income_range;	

-- finding average spending score by gender
select gender,avg(spending_score) from customer_segmentation_data where gender = 'Female' or gender='Male' group by gender; 

-- finding the range for membership years
select min(membership_years),max(membership_years),round(avg(membership_years),1) as avg_membership_years from customer_segmentation_data;

-- finding average spending score by membership years
select membership_years,avg(spending_score) from customer_segmentation_data group by membership_years order by membership_years; 

-- finding range for purchase frequency
select min(purchase_frequency),max(purchase_frequency),round(avg(purchase_frequency)) as avg_purchase_frequency from customer_segmentation_data;

-- finding purchase frequency by age
select case when age<20 then 'under 20' 
			when age>=20 and age<30 then '20-30' 
			when age>=30 and age<40 then '30-40'
            when age>=40 and age<50 then '40-50'
            when age>=50 and age<60 then '50-60'
            when age>=60 then '60 and over'
            end as age_range,
            round(avg(purchase_frequency),1) as average_purchase_frequency from customer_segmentation_data group by age_range order by average_purchase_frequency;

-- finding purchase frequency by income
select case when income between 30000 and 70000 then '30k-70k' 
    when income between 70001 and 110000 then '70k-110k' 
    when income between 110001 and 150000 then '110k-150k' end as income_range,
             round(avg(purchase_frequency),1) as purchase_frequency from customer_segmentation_data group by income_range;

-- finding purchase frequency by gender
select gender,avg(purchase_frequency) from customer_segmentation_data where gender = 'Female' or gender='Male' group by gender; 

-- finding purchase frequency by membership years
select membership_years,avg(purchase_frequency) from customer_segmentation_data group by membership_years order by membership_years; 

-- finding distribution of preferred category
select preferred_category,count(preferred_category) as preferred_category_count from customer_segmentation_data group by preferred_category order by preferred_category_count;

