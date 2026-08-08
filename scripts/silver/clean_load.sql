create or replace procedure silver.charger_silver()
language plpgsql
as $$
begin
	
	raise notice 'Début du chargement...' ;

	truncate table silver.olist_customers_dataset;
	insert into silver.olist_customers_dataset(customer_id, customer_zip_code_prefix, customer_city, customer_state)
	select customer_id, customer_zip_code_prefix, customer_city, customer_state 
	from bronze.olist_customers_dataset;

	truncate table silver.olist_geolocation_dataset;
	insert into silver.olist_geolocation_dataset(geolocation_zip_code_prefi, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state)
	select geolocation_zip_code_prefi, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state
	from bronze.olist_geolocation_dataset;

	truncate table silver.olist_order_items_dataset;
	insert into silver.olist_order_items_dataset (order_id,	order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value)
	select order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value
	from bronze.olist_order_items_dataset;

	truncate table silver.olist_order_payments_dataset;
	insert into silver.olist_order_payments_dataset (order_id, payment_sequential, payment_type, payment_installments, payment_value)
	select order_id, payment_sequential, payment_type, payment_installments, payment_value
	from bronze.olist_order_payments_dataset;

	truncate table silver.olist_order_reviews_dataset;
	insert into silver.olist_order_reviews_dataset (review_id, order_id, review_score, review_comment_title, review_comment_message,
													review_creation_date, review_answer_timestamp)
	select distinct review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp
	from bronze.olist_order_reviews_dataset;

	truncate table silver.olist_orders_dataset;
	insert into silver.olist_orders_dataset (order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, 
											 order_delivered_carrier_date, order_delivered_customer_date)
	select order_id, customer_id, order_status,	order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, 
		order_delivered_customer_date
	from bronze.olist_orders_dataset;

	truncate table silver.olist_products_dataset;
	insert into silver.olist_products_dataset (product_id, product_category_name, product_name_lenght, product_description_lenght, product_photos_qty, product_weight_g, 
		product_length_cm, product_height_cm, product_width_cm)
	select product_id, product_category_name, product_name_lenght, product_description_lenght, product_photos_qty, product_weight_g, 
		product_length_cm, product_height_cm, product_width_cm
	from bronze.olist_products_dataset;

	truncate table silver.olist_sellers_dataset;
	insert into silver.olist_sellers_dataset (seller_id, seller_zip_code_prefix, seller_city, seller_state)
	select seller_id, seller_zip_code_prefix, seller_city, seller_state
	from bronze.olist_sellers_dataset;
	
	raise notice 'Fin du chargement';
	
exception
	when others then
		raise notice 'Erreur : %', sqlerrm;
		raise notice 'Code : %', sqlstate;
	rollback;	
end;
$$;

-- call silver.charger_silver()
