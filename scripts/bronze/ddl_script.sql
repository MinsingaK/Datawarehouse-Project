drop table if exists bronze.olist_customers_dataset cascade;
create table bronze.olist_customers_dataset
(
	customer_id varchar(60),
	customer_unique_id varchar(60),
	customer_zip_code_prefix varchar(10),
	customer_city varchar(50),
	customer_state varchar(5)
);

drop table if exists bronze.olist_geolocation_dataset cascade;
create table bronze.olist_geolocation_dataset
(
	geolocation_zip_code_prefi varchar(10),
	geolocation_lat double precision,
	geolocation_lng double precision,
	geolocation_city varchar(50),
	geolocation_state varchar(5)
);

drop table if exists bronze.olist_order_items_dataset cascade;
create table bronze.olist_order_items_dataset
(
	order_id varchar(100),
	order_item_id varchar(5),
	product_id varchar(60),
	seller_id varchar(60),
	shipping_limit_date timestamp,
	price decimal,
	freight_value decimal
);

drop table if exists bronze.olist_order_payments_dataset cascade;
create table bronze.olist_order_payments_dataset
(
	order_id varchar(60),
	payment_sequential varchar(5),
	payment_type varchar(20),
	payment_installments varchar(5),
	payment_value decimal
);

drop table if exists bronze.olist_order_reviews_dataset cascade;
create table bronze.olist_order_reviews_dataset
(
	review_id varchar(60),
	order_id varchar(60),
	review_score int,
	review_comment_title varchar(60),
	review_comment_message text,
	review_creation_date timestamp,
	review_answer_timestamp timestamp
);

drop table if exists bronze.olist_orders_dataset cascade;
create table bronze.olist_orders_dataset
(
	order_id varchar(60),
	customer_id varchar(60),
	order_status varchar(20),
	order_purchase_timestamp timestamp,
	order_approved_at timestamp,
	order_delivered_carrier_date timestamp,
	order_delivered_customer_date timestamp,
	order_estimated_delivery_date timestamp
);

drop table if exists bronze.olist_products_dataset cascade;
create table bronze.olist_products_dataset
(
	product_id varchar(60),
	product_category_name varchar(60),
	product_name_lenght int,
	product_description_lenght int,
	product_photos_qty int,
	product_weight_g int,
	product_length_cm int,
	product_height_cm int,
	product_width_cm int
);
	
drop table if exists bronze.olist_sellers_dataset cascade;
create table bronze.olist_sellers_dataset
(
	seller_id varchar(60),
	seller_zip_code_prefix varchar(10),
	seller_city varchar(50),
	seller_state varchar(5)
);

drop table if exists bronze.product_category_name_translation cascade;
create table bronze.product_category_name_translation
(
	product_category_name varchar(50),
	product_category_name_english varchar(50)
);
