CREATE DATABASE Chocolate_fact;

CREATE TABLE Product(
				      prod_id INT NOT NULL,
					  prod_name VARCHAR(50) NOT NULL,
					  quantity INT NOT NULL
					  CONSTRAINT pro_pk PRIMARY KEY (prod_id)
)
CREATE TABLE Component(
					   
					   comp_id INT NOT NULL,
					   comp_name VARCHAR(50) NOT NULL,
					   description VARCHAR(50),
					   quantitiy_comp INT NOT NULL,
					   CONSTRAINT comp_pk PRIMARY KEY (comp_id)
)
CREATE TABLE Supplier(

					   supp_id INT NOT NULL,
					   supp_name VARCHAR(50) NOT NULL,
					   supp_location VARCHAR(50) NOT NULL,
					   supp_country VARCHAR(50) NOT NULL,
					   is_active BIT,
					   CONSTRAINT supp_pk PRIMARY KEY (supp_id)
)
CREATE TABLE Prod_Comp(

					   prod_id INT NOT NULL,
					   comp_id INT NOT NULL,
					   quantity_comp INT NOT NULL,
					   CONSTRAINT pro_comp_pks PRIMARY KEY(prod_id,comp_id),
					   CONSTRAINT pro_comp_fk_pro FOREIGN KEY (prod_id) REFERENCES dbo.Product(prod_id),
					   CONSTRAINT pro_comp_fk_comp FOREIGN KEY(comp_id) REFERENCES dbo.Component(comp_id)
)

CREATE TABLE Comp_Supp(

					   supp_id INT NOT NULL,
					   comp_id INT NOT NULL,
					   order_date DATE NOT NULL,
					   quantity INT NOT NULL,
					   CONSTRAINT comp_supp_pks PRIMARY KEY (supp_id,comp_id),
					   CONSTRAINT comp_supp_fk_sup FOREIGN KEY (supp_id) REFERENCES dbo.Supplier(supp_id),
					   CONSTRAINT comp_supp_fk_com FOREIGN KEY (comp_id) REFERENCES dbo.Component(comp_id)
)
