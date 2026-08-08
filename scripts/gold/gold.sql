create view gold.dim_customer as
select row_number() over(order by customer_id) as customer_key, customer_id, customer_zip_code_prefix, customer_city, customer_state
from silver.olist_customers_dataset;

create view gold.dim_seller as
select row_number() over(order by seller_id) as seller_key, seller_id, seller_zip_code_prefix, seller_city, seller_state 
from silver.olist_sellers_dataset;

create view gold.dim_product as
select row_number() over(order by product_id) as product_key, product_id, product_category_name, product_name_lenght, 
	product_description_lenght, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm 
from silver.olist_products_dataset;

create view gold.fact_orders as
select o.order_id, cu.customer_key, pr.product_key, sl.seller_key, pr.product_category_name, o.order_status, p.payment_type, p.payment_value, 
	o.order_purchase_timestamp, o.order_approved_at, o.order_delivered_carrier_date, o.order_delivered_customer_date 
from silver.olist_orders_dataset as o
left join gold.dim_customer cu on cu.customer_id = o.customer_id
left join silver.olist_order_payments_dataset p on p.order_id = o.order_id
left join silver.olist_order_items_dataset i on i.order_id = p.order_id
left join gold.dim_product pr on pr.product_id = i.product_id
left join gold.dim_seller sl on sl.seller_id = i.seller_id;
