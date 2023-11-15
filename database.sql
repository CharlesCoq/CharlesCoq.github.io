#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
CREATE DATABASE `le_royaume_de_la_chaussette`
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE le_royaume_de_la_chaussette;

#------------------------------------------------------------
# Table: n53s5_categories
#------------------------------------------------------------

CREATE TABLE n53s5_categories(
        id   Int  Auto_increment  NOT NULL ,
        name Varchar (70) NOT NULL
	,CONSTRAINT categories_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: n53s5_products
#------------------------------------------------------------

CREATE TABLE n53s5_products(
        id                  Int  Auto_increment  NOT NULL ,
        name                Varchar (50) NOT NULL ,
        description         Varchar (255) NOT NULL ,
        views               Int NOT NULL ,
        id_categories Int NOT NULL
	,CONSTRAINT products_PK PRIMARY KEY (id)

	,CONSTRAINT products_categories_FK FOREIGN KEY (id_categories) REFERENCES n53s5_categories(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: n53s5_sizes
#------------------------------------------------------------

CREATE TABLE n53s5_sizes(
        id   Int  Auto_increment  NOT NULL ,
        name Varchar (70) NOT NULL
	,CONSTRAINT sizes_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: n53s5_users_role
#------------------------------------------------------------

CREATE TABLE n53s5_users_role(
        id   Int  Auto_increment  NOT NULL ,
        name Varchar (20) NOT NULL
	,CONSTRAINT users_role_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: n53s5_users
#------------------------------------------------------------

CREATE TABLE n53s5_users(
        id                  Int  Auto_increment  NOT NULL ,
        username            Varchar (50) NOT NULL ,
        birthdate           Date NOT NULL ,
        email               Varchar (255) NOT NULL ,
        password            Varchar (255) NOT NULL ,
        firstname           Varchar (70) NOT NULL ,
        lastname            Varchar (70) NOT NULL ,
        adress              Varchar (255) NOT NULL ,
        zipcode             Int NOT NULL ,
        city                Varchar (70) NOT NULL ,
        country             Varchar (70) NOT NULL ,
        id_users_role Int NOT NULL
	,CONSTRAINT users_PK PRIMARY KEY (id)

	,CONSTRAINT users_users_role_FK FOREIGN KEY (id_users_role) REFERENCES n53s5_users_role(id)
	,CONSTRAINT users_users_role_AK UNIQUE (id_users_role)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: n53s5_users_content
#------------------------------------------------------------

CREATE TABLE n53s5_users_content(
        id             Int  Auto_increment  NOT NULL ,
        title          Varchar (70) NOT NULL ,
        description    Text NOT NULL ,
        picture        Varchar (255) NOT NULL ,
        id_users Int NOT NULL
	,CONSTRAINT users_content_PK PRIMARY KEY (id)

	,CONSTRAINT users_content_users_FK FOREIGN KEY (id_users) REFERENCES n53s5_users(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: n53s5_comments
#------------------------------------------------------------

CREATE TABLE n53s5_comments(
        id                     Int  Auto_increment  NOT NULL ,
        title                  Varchar (70) NOT NULL ,
        content                Text NOT NULL ,
        date                   Datetime NOT NULL ,
        id_users         Int NOT NULL ,
        id_users_content Int NOT NULL
	,CONSTRAINT comments_PK PRIMARY KEY (id)

	,CONSTRAINT comments_users_FK FOREIGN KEY (id_users) REFERENCES n53s5_users(id)
	,CONSTRAINT comments_users_content_FK FOREIGN KEY (id_users_content) REFERENCES n53s5_users_content(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: n53s5_orders
#------------------------------------------------------------

CREATE TABLE n53s5_orders(
        id             Int  Auto_increment  NOT NULL ,
        date           Datetime NOT NULL ,
        id_users Int NOT NULL
	,CONSTRAINT orders_PK PRIMARY KEY (id)

	,CONSTRAINT orders_users_FK FOREIGN KEY (id_users) REFERENCES n53s5_users(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: n53s5_products_sizes
#------------------------------------------------------------

CREATE TABLE n53s5_products_sizes(
        id                Int NOT NULL ,
        id_products Int NOT NULL ,
        stock             Int NOT NULL
	,CONSTRAINT products_sizes_PK PRIMARY KEY (id,id_products)

	,CONSTRAINT products_sizes_sizes_FK FOREIGN KEY (id) REFERENCES n53s5_sizes(id)
	,CONSTRAINT products_sizes_products_FK FOREIGN KEY (id_products) REFERENCES n53s5_products(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: n53s5_orders_contents
#------------------------------------------------------------

CREATE TABLE n53s5_orders_contents(
        id              Int NOT NULL ,
        id_orders Int NOT NULL ,
        id_sizes  Int NOT NULL ,
        quantity        Int NOT NULL
	,CONSTRAINT orders_contents_PK PRIMARY KEY (id,id_orders,id_sizes)

	,CONSTRAINT orders_contents_products_FK FOREIGN KEY (id) REFERENCES n53s5_products(id)
	,CONSTRAINT orders_contents_orders_FK FOREIGN KEY (id_orders) REFERENCES n53s5_orders(id)
	,CONSTRAINT orders_contents_sizes_FK FOREIGN KEY (id_sizes) REFERENCES n53s5_sizes(id)
)ENGINE=InnoDB;

