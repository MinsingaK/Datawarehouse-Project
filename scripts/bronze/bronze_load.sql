create or replace procedure bronze.charger_extractions()
language plpgsql
as $$
begin

	raise notice 'Début du chargement...' ;
	
	truncate table bronze.olist_customers_dataset;
	copy bronze.olist_customers_dataset
		from 'H:\Personal work\BD\postgresql\Datawarehouse 2\datasets\olist_customers_dataset.csv'
		with (format csv, header true, delimiter ',');

	truncate table bronze.olist_geolocation_dataset;	
	copy bronze.olist_geolocation_dataset
		from 'H:\Personal work\BD\postgresql\Datawarehouse 2\datasets\olist_geolocation_dataset.csv'
		with (format csv, header true, delimiter ',');

	truncate table bronze.olist_order_items_dataset;	
	copy bronze.olist_order_items_dataset
		from 'H:\Personal work\BD\postgresql\Datawarehouse 2\datasets\olist_order_items_dataset.csv'
		with (format csv, header true, delimiter ',');

	truncate table bronze.olist_order_payments_dataset;	
	copy bronze.olist_order_payments_dataset
		from 'H:\Personal work\BD\postgresql\Datawarehouse 2\datasets\olist_order_payments_dataset.csv'
		with (format csv, header true, delimiter ',');

	truncate table bronze.olist_order_reviews_dataset;	
	copy bronze.olist_order_reviews_dataset
		from 'H:\Personal work\BD\postgresql\Datawarehouse 2\datasets\olist_order_reviews_dataset.csv'
		with (format csv, header true, delimiter ',');

	truncate table bronze.olist_orders_dataset;
	copy bronze.olist_orders_dataset
		from 'H:\Personal work\BD\postgresql\Datawarehouse 2\datasets\olist_orders_dataset.csv'
		with (format csv, header true, delimiter ',');

	truncate table bronze.olist_products_dataset;
	copy bronze.olist_products_dataset
		from 'H:\Personal work\BD\postgresql\Datawarehouse 2\datasets\olist_products_dataset.csv'
		with (format csv, header true, delimiter ',');

	truncate table bronze.olist_sellers_dataset;	
	copy bronze.olist_sellers_dataset
		from 'H:\Personal work\BD\postgresql\Datawarehouse 2\datasets\olist_sellers_dataset.csv'
		with (format csv, header true, delimiter ',');

	truncate table bronze.product_category_name_translation;	
	copy bronze.product_category_name_translation
		from 'H:\Personal work\BD\postgresql\Datawarehouse 2\datasets\product_category_name_translation.csv'
		with (format csv, header true, delimiter ',');
		
	raise notice 'Chargement terminé avec succès';
exception
	when others then
	raise notice 'Erreur : %', sqlerrm;
	raise notice 'Code : %', sqlstate;
	ROLLBACK;

end;
$$;

-- call bronze.charger_extractions()
