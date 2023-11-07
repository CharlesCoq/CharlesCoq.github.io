CREATE DATABASE `biblio`
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;
USE biblio;

#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: p852_Clients
#------------------------------------------------------------

CREATE TABLE p852_Clients(
        id        Int  Auto_increment  NOT NULL ,
        firstname Varchar (50) NOT NULL ,
        lastname  Varchar (50) NOT NULL ,
        birthdate Date NOT NULL ,
        email     Varchar (50) NOT NULL
	,CONSTRAINT Clients_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: p852_genres
#------------------------------------------------------------

CREATE TABLE p852_genres(
        id   Int  Auto_increment  NOT NULL ,
        name Varchar (50) NOT NULL
	,CONSTRAINT genres_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: p852_books
#------------------------------------------------------------

CREATE TABLE p852_books(
        id             Int  Auto_increment  NOT NULL ,
        title          Varchar (50) NOT NULL ,
        id_genres Int NOT NULL
	,CONSTRAINT books_PK PRIMARY KEY (id)

	,CONSTRAINT books_genres_FK FOREIGN KEY (id_genres) REFERENCES p852_genres(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: p852_author
#------------------------------------------------------------

CREATE TABLE p852_author(
        id       Int  Auto_increment  NOT NULL ,
        firstname Varchar (50) NOT NULL ,
        lastname Varchar (50) NOT NULL
	,CONSTRAINT author_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: register
#------------------------------------------------------------

CREATE TABLE register(
        id              Int NOT NULL ,
        id_Clients Int NOT NULL ,
        borrow          Date NOT NULL ,
        `return`          Date NOT NULL
	,CONSTRAINT register_PK PRIMARY KEY (id,id_Clients)

	,CONSTRAINT register_books_FK FOREIGN KEY (id) REFERENCES p852_books(id)
	,CONSTRAINT register_Clients_FK FOREIGN KEY (id_Clients) REFERENCES p852_Clients(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: write
#------------------------------------------------------------

CREATE TABLE `write`(
        id_books           Int NOT NULL ,
        id_author Int NOT NULL
	,CONSTRAINT write_PK PRIMARY KEY (id,id_author)

	,CONSTRAINT write_books_FK FOREIGN KEY (id_books) REFERENCES p852_books(id)
	,CONSTRAINT write_author_FK FOREIGN KEY (id_author) REFERENCES p852_author(id)
)ENGINE=InnoDB;



#------------------------------------------------------------
# Insertion des genres de livres:
#------------------------------------------------------------

USE `biblio`;
INSERT INTO `p852_genres` (`name`)
VALUES 
('Horreur'),
('Science Fiction'),
('Roman'),
('Jeunesse');