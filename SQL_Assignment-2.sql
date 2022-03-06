

-----ID FIRST NAME and SECOND NAME BASE CONDITION
CREATE VIEW res_1 as 
SELECT c.customer_id,d.first_name,d.last_name
FROM  product.product A
INNER JOIN sale.order_item B 
ON a.product_id = b.product_id
INNER JOIN sale.orders C
ON  b.order_id = c.order_id
INNER JOIN sale.customer D
ON c.customer_id = d.customer_id
WHERE A.product_name = '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD'

SELECT * FROM dbo.res_1

-- FIRST PRODUCT
CREATE VIEW frt_prd as 
SELECT a.*,D.product_name
FROM dbo.res_1 a
INNER JOIN sale.orders b
on a.customer_id = b.customer_id
INNER JOIN sale.order_item C
on b.order_id =c.order_id
inner join product.product D
on c.product_id = d.product_id
where d.product_name = 'Polk Audio - 50 W Woofer - Black' 


-- SECOND PRODUCT
CREATE VIEW sc_prd as 
SELECT a.*,D.product_name
FROM dbo.res_1 a
INNER JOIN sale.orders b
on a.customer_id = b.customer_id
INNER JOIN sale.order_item C
on b.order_id =c.order_id
inner join product.product D
on c.product_id = d.product_id
where d.product_name = 'SB-2000 12 500W Subwoofer (Piano Gloss Black)' 


-- THIRD PRODUCT
CREATE VIEW trd_prd as 
SELECT a.*,D.product_name
FROM dbo.res_1 a
INNER JOIN sale.orders b
on a.customer_id = b.customer_id
INNER JOIN sale.order_item C
on b.order_id =c.order_id
inner join product.product D
on c.product_id = d.product_id
where d.product_name = 'Virtually Invisible 891 In-Wall Speakers (Pair)' 



-------------

SELECT A.*, 
ISNULL(NULLIF(ISNULL(NULLIF(b.product_name,'Yes'),'No'),'Polk Audio - 50 W Woofer - Black'),'Yes') as first_product,
ISNULL(NULLIF(ISNULL(NULLIF(c.product_name,'Yes'),'No'),'SB-2000 12 500W Subwoofer (Piano Gloss Black)'),'Yes') as second_product,
ISNULL(NULLIF(ISNULL(NULLIF(d.product_name,'Yes'),'No'),'Virtually Invisible 891 In-Wall Speakers (Pair)'),'Yes') as third_product
FROM dbo.res_1 A 
LEFT JOIN dbo.frt_prd B
ON A.customer_id=B.customer_id
LEFT JOIN dbo.sc_prd C
ON A.customer_id=c.customer_id
LEFT JOIN dbo.trd_prd D
ON A.customer_id=D.customer_id
ORDER BY A.customer_id ASC







