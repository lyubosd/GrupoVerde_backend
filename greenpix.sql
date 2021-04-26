-- MySQL Script generated by MySQL Workbench
-- Mon Apr 26 22:10:26 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema laravel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema laravel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `laravel` DEFAULT CHARACTER SET utf8 ;
USE `laravel` ;

-- -----------------------------------------------------
-- Table `laravel`.`user`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `laravel`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `hash` VARCHAR(300) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `url` VARCHAR(150) NULL,
  `email_verificate_at` DATE NOT NULL,
  `created_at` DATE NULL DEFAULT DATE,
  `upDATEd_at` DATE NULL DEFAULT DATE ON UPDATE DATE,
  PRIMARY KEY (`iduser`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`customer` (
  `idcustomer` INT NOT NULL AUTO_INCREMENT,
  `iduser` INT NOT NULL,
  `firstname` VARCHAR(100) NOT NULL,
  `secondname` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(100) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `adress1` VARCHAR(100) NOT NULL,
  `adress2` VARCHAR(100) NULL,
  PRIMARY KEY (`idcustomer`),
  INDEX `fk_cliente_idusuario_idx` (`iduser` ASC),
  CONSTRAINT `fk_customer_idusuario`
    FOREIGN KEY (`iduser`)
    REFERENCES `laravel`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`proveedor` (
  `idproveedor` INT NOT NULL,
  PRIMARY KEY (`idproveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`supplier` (
  `idsupplier` INT NOT NULL AUTO_INCREMENT,
  `companyName` VARCHAR(45) NOT NULL,
  `contactFName` VARCHAR(45) NOT NULL,
  `contactLName` VARCHAR(45) NOT NULL,
  `contactTitle` VARCHAR(45) NOT NULL,
  `address1` VARCHAR(100) NOT NULL,
  `address2` VARCHAR(100) NULL,
  `city` VARCHAR(100) NOT NULL,
  `postalcode` VARCHAR(45) NOT NULL,
  `country` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `fax` VARCHAR(255) NULL,
  `created_at` DATE NULL DEFAULT DATE,
  `upDATEd_at` DATE NULL DEFAULT DATE ON UPDATE DATE,
  PRIMARY KEY (`idsupplier`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`promotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`promotion` (
  `idpromotion` INT NOT NULL AUTO_INCREMENT,
  `discount` DECIMAL NOT NULL,
  `code` VARCHAR(45) NOT NULL,
  `promotioncode` VARCHAR(100) NULL,
  `created_at` DATE NULL,
  `upDATEd_at` DATE NULL,
  PRIMARY KEY (`idpromotion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`product` (
  `idproduct` INT NOT NULL AUTO_INCREMENT,
  `idsupplier` INT NOT NULL,
  `idpromotion` INT NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  `product_description` VARCHAR(45) NULL,
  `price` DECIMAL(5) NOT NULL,
  `type` VARCHAR(45) NULL,
  `size` INT NULL,
  `created_at` DATE NULL DEFAULT DATE,
  `upDATEd_at` DATE NULL DEFAULT DATE ON UPDATE DATE,
  PRIMARY KEY (`idproduct`),
  INDEX `fk_product_idsupplier_idx` (`idsupplier` ASC),
  INDEX `fk_product_idpromotion_idx` (`idpromotion` ASC),
  CONSTRAINT `fk_product_idsupplier`
    FOREIGN KEY (`idsupplier`)
    REFERENCES `laravel`.`supplier` (`idsupplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_idpromotion`
    FOREIGN KEY (`idpromotion`)
    REFERENCES `laravel`.`promotion` (`idpromotion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`order` (
  `idorder` INT NOT NULL AUTO_INCREMENT,
  `iduser` INT NOT NULL,
  `numorder` VARCHAR(45) NOT NULL,
  `successful` TINYINT NOT NULL DEFAULT 0,
  `created_at` DATE NULL DEFAULT DATE,
  PRIMARY KEY (`idorder`),
  INDEX `fk_order_iduser_idx` (`iduser` ASC),
  CONSTRAINT `fk_order_iduser`
    FOREIGN KEY (`iduser`)
    REFERENCES `laravel`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`orderdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`orderdetails` (
  `idorderdetails` INT NOT NULL AUTO_INCREMENT,
  `idorder` INT NOT NULL,
  `idproduct` INT NOT NULL,
  `numorder` TINYINT(2) NOT NULL,
  `cuantity` INT NOT NULL DEFAULT 1,
  `upDATEd_at` DATE NULL DEFAULT DATE ON UPDATE DATE,
  INDEX `fk_basket_idproduct_idx` (`idproduct` ASC),
  INDEX `fk_basket_order_idx` (`idorder` ASC),
  PRIMARY KEY (`idorderdetails`),
  CONSTRAINT `fk_orderdetails_idproduct`
    FOREIGN KEY (`idproduct`)
    REFERENCES `laravel`.`product` (`idproduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderdetails_idorder`
    FOREIGN KEY (`idorder`)
    REFERENCES `laravel`.`order` (`idorder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`token` (
  `idtoken` INT NOT NULL AUTO_INCREMENT,
  `iduser` INT NOT NULL,
  `token` VARCHAR(300) NOT NULL,
  `hmac` VARCHAR(300) NULL,
  `ip` VARCHAR(45) NULL,
  `platform` VARCHAR(45) NULL,
  `active` TINYINT NULL,
  `created_at` DATE NULL DEFAULT DATE,
  PRIMARY KEY (`idtoken`),
  INDEX `fk_token_iduser_idx` (`iduser` ASC),
  CONSTRAINT `fk_token_iduser`
    FOREIGN KEY (`iduser`)
    REFERENCES `laravel`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`admin` (
  `idadmin` INT NOT NULL AUTO_INCREMENT,
  `iduser` INT NOT NULL,
  PRIMARY KEY (`idadmin`),
  INDEX `fk_admin_iduser_idx` (`iduser` ASC),
  CONSTRAINT `fk_admin_iduser`
    FOREIGN KEY (`iduser`)
    REFERENCES `laravel`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`photo` (
  `idphoto` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(5) NOT NULL,
  `stock` INT NOT NULL,
  PRIMARY KEY (`idphoto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`customer_has_photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`customer_has_photo` (
  `customer_idcustomer` INT NOT NULL,
  `photo_idphoto` INT NOT NULL,
  `created_at` DATE NULL DEFAULT DATE,
  INDEX `fk_customer_has_photo_photo1_idx` (`photo_idphoto` ASC),
  INDEX `fk_customer_has_photo_customer1_idx` (`customer_idcustomer` ASC),
  CONSTRAINT `fk_customer_has_photo_customer1`
    FOREIGN KEY (`customer_idcustomer`)
    REFERENCES `laravel`.`customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_has_photo_photo1`
    FOREIGN KEY (`photo_idphoto`)
    REFERENCES `laravel`.`photo` (`idphoto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`payment` (
  `idcustomer` INT NOT NULL AUTO_INCREMENT,
  `cardnumber` INT NOT NULL,
  `expiryDATE` DATE NOT NULL,
  `ownername` VARCHAR(255) NOT NULL,
  `cvv` VARCHAR(10) NOT NULL,
  `upDATEd_at` DATE NULL DEFAULT DATE ON UPDATE DATE,
  PRIMARY KEY (`idcustomer`),
  CONSTRAINT `fk_payment_idcustomer`
    FOREIGN KEY (`idcustomer`)
    REFERENCES `laravel`.`customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`product_has_promotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`product_has_promotion` (
  `product_idproduct` INT NOT NULL,
  `promotion_idpromotion` INT NOT NULL,
  `created_at` DATE NULL DEFAULT DATE,
  `end_at` DATE NULL DEFAULT DATE ON UPDATE DATE,
  INDEX `fk_product_has_promotion_promotion1_idx` (`promotion_idpromotion` ASC),
  INDEX `fk_product_has_promotion_product1_idx` (`product_idproduct` ASC),
  CONSTRAINT `fk_product_has_promotion_product1`
    FOREIGN KEY (`product_idproduct`)
    REFERENCES `laravel`.`product` (`idproduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_promotion_promotion1`
    FOREIGN KEY (`promotion_idpromotion`)
    REFERENCES `laravel`.`promotion` (`idpromotion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`category` (
  `idcategory` INT NOT NULL,
  `name` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`idcategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`photo_has_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`photo_has_category` (
  `photo_idphoto` INT NOT NULL,
  `category_idcategory` INT NOT NULL,
  INDEX `fk_photo_has_category_category1_idx` (`category_idcategory` ASC),
  INDEX `fk_photo_has_category_photo1_idx` (`photo_idphoto` ASC),
  CONSTRAINT `fk_photo_has_category_photo1`
    FOREIGN KEY (`photo_idphoto`)
    REFERENCES `laravel`.`photo` (`idphoto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_photo_has_category_category1`
    FOREIGN KEY (`category_idcategory`)
    REFERENCES `laravel`.`category` (`idcategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`product_has_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`product_has_category` (
  `product_idproduct` INT NOT NULL,
  `category_idcategory` INT NOT NULL,
  INDEX `fk_product_has_category_category1_idx` (`category_idcategory` ASC),
  INDEX `fk_product_has_category_product1_idx` (`product_idproduct` ASC),
  CONSTRAINT `fk_product_has_category_product1`
    FOREIGN KEY (`product_idproduct`)
    REFERENCES `laravel`.`product` (`idproduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_category_category1`
    FOREIGN KEY (`category_idcategory`)
    REFERENCES `laravel`.`category` (`idcategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


insert into user (username, hash, email, created_at, upDATEd_at, email_verificate_at, url) values ('lainsby0', '2f06ce8eaf4114ddce1879be47c6bc7e', 'ekorbmaker0@desdev.cn', '03/08/2021', '04/13/2021', '08/19/2020', 'http://dummyimage.com/119x100.png/5fa2dd/ffffff');
insert into user (username, hash, email, created_at, upDATEd_at, email_verificate_at, url) values ('mhousecroft1', '4b70c95c94b5e34f349e6c2b705b70eb', 'mattrill1@elpais.com', '03/22/2021', '08/07/2020', '09/19/2020', 'http://dummyimage.com/173x100.png/dddddd/000000');
insert into user (username, hash, email, created_at, upDATEd_at, email_verificate_at, url) values ('nbunston2', '4be462926514f02a7a71fbd3cca43b9c', 'tvarley2@parallels.com', '12/25/2020', '08/09/2020', '11/30/2020', 'http://dummyimage.com/144x100.png/ff4444/ffffff');
insert into user (username, hash, email, created_at, upDATEd_at, email_verificate_at, url) values ('athouless3', '416a82bbad217f99ee89253c1aebe7ce', 'mkubacek3@hibu.com', '04/09/2021', '09/10/2020', '11/10/2020', 'http://dummyimage.com/225x100.png/5fa2dd/ffffff');
insert into user (username, hash, email, created_at, upDATEd_at, email_verificate_at, url) values ('jchater4', '4f425eb80ace1d81ef986c3ad3a18841', 'yjanas4@sakura.ne.jp', '05/09/2020', '05/09/2020', '08/07/2020', 'http://dummyimage.com/184x100.png/dddddd/000000');
insert into user (username, hash, email, created_at, upDATEd_at, email_verificate_at, url) values ('mclemson5', '64b323976e956fccffa8c9460ea22de2', 'gsturrock5@bizjournals.com', '03/04/2021', '10/16/2020', '07/07/2020', 'http://dummyimage.com/189x100.png/cc0000/ffffff');
insert into user (username, hash, email, created_at, upDATEd_at, email_verificate_at, url) values ('iiwaszkiewicz6', '25e38b700093f90f3fc9d62007d7178d', 'tilsley6@purevolume.com', '05/31/2020', '06/16/2020', '07/07/2020', 'http://dummyimage.com/193x100.png/5fa2dd/ffffff');
insert into user (username, hash, email, created_at, upDATEd_at, email_verificate_at, url) values ('twitherbed7', '4662c2fd71eaa92fad742ffe2cc10d73', 'fantunez7@theguardian.com', '05/30/2020', '09/02/2020', '09/05/2020', 'http://dummyimage.com/118x100.png/dddddd/000000');
insert into user (username, hash, email, created_at, upDATEd_at, email_verificate_at, url) values ('psalkeld8', '8f96df14cf1b3b012a9dceec95f0dc1c', 'lbreffit8@ted.com', '05/11/2020', '04/03/2021', '08/30/2020', 'http://dummyimage.com/201x100.png/ff4444/ffffff');
insert into user (username, hash, email, created_at, upDATEd_at, email_verificate_at, url) values ('mkobieriecki9', 'b361ccc43443934534a7c808615ec97e', 'nerrichelli9@intel.com', '10/08/2020', '04/21/2021', '07/14/2020', 'http://dummyimage.com/122x100.png/ff4444/ffffff');


insert into token (token, hmac, ip, plataform, active, created_at) values ('http://thetimes.co.uk/lacus/morbi/sem/mauris/laoreet/ut/rhoncus.jsp', '75-1B-9F-B9-A4-21', '42.65.233.71', 'Y-find', 85, '5/5/2020');
insert into token (token, hmac, ip, plataform, active, created_at) values ('https://tumblr.com/magna/bibendum/imperdiet.js', 'D6-1A-50-64-77-5F', '0.202.106.49', 'Viva', 16, '6/8/2020');
insert into token (token, hmac, ip, plataform, active, created_at) values ('https://elpais.com/erat.xml', 'B9-C8-9C-15-B0-7B', '109.158.236.85', 'Mat Lam Tam', 33, '8/1/2020');
insert into token (token, hmac, ip, plataform, active, created_at) values ('http://themeforest.net/quisque.html', 'B3-B0-B2-8A-DE-96', '106.42.237.252', 'Tampflex', 31, '4/16/2021');
insert into token (token, hmac, ip, plataform, active, created_at) values ('https://ucla.edu/interdum/in/ante/vestibulum/ante/ipsum.jsp', 'CA-51-5D-A9-6A-B3', '8.142.71.99', 'Zamit', 89, '6/6/2020');
insert into token (token, hmac, ip, plataform, active, created_at) values ('https://dailymail.co.uk/quis/turpis/sed/ante/vivamus/tortor.aspx', 'C3-B4-91-C9-45-21', '125.85.204.251', 'Fix San', 79, '7/26/2020');
insert into token (token, hmac, ip, plataform, active, created_at) values ('https://alexa.com/eget/nunc/donec/quis.jsp', '83-80-C2-EF-87-C0', '144.94.7.155', 'Zathin', 57, '4/5/2021');
insert into token (token, hmac, ip, plataform, active, created_at) values ('https://bigcartel.com/luctus/cum/sociis/natoque/penatibus.jpg', '0E-56-2E-FF-B7-E5', '7.93.21.171', 'Opela', 84, '3/19/2021');
insert into token (token, hmac, ip, plataform, active, created_at) values ('https://bigcartel.com/varius/ut.png', '11-E3-9A-73-24-26', '64.234.230.126', 'Voyatouch', 76, '6/12/2020');
insert into token (token, hmac, ip, plataform, active, created_at) values ('http://admin.ch/turpis.png', '61-44-91-44-22-0A', '35.42.118.129', 'Tampflex', 77, '3/22/2021');


insert into supplier (companyName, contactFName, contactLName, contactTitle, adress1, adress2, city, postalcode, country, phone, email, fax, created_at, upDATEd_at) values ('Skyvu', 'Jacquenette', 'Drinkall', 'Dr', '677 Veith Alley', '4907 Commercial Center', 'Chaem Luang', '44110', 'Thailand', '515-548-1186', 'jdrinkall0@feedburner.com', '503-499-8277', '8/6/2020', '11/10/2020');
insert into supplier (companyName, contactFName, contactLName, contactTitle, adress1, adress2, city, postalcode, country, phone, email, fax, created_at, upDATEd_at) values ('Vinder', 'Trumann', 'Leteurtre', 'Dr', '6667 Sugar Avenue', null, 'Rybnik', '44-274', 'Poland', '258-478-6684', 'tleteurtre1@mapquest.com', '158-546-7037', '10/18/2020', '9/15/2020');
insert into supplier (companyName, contactFName, contactLName, contactTitle, adress1, adress2, city, postalcode, country, phone, email, fax, created_at, upDATEd_at) values ('Zoomdog', 'Bancroft', 'Rennebach', 'Mrs', '9 Susan Junction', '82839 Arrowood Hill', 'Pinillos', '134008', 'Colombia', '656-534-3834', 'brennebach2@naver.com', '515-909-5577', '11/30/2020', '9/12/2020');
insert into supplier (companyName, contactFName, contactLName, contactTitle, adress1, adress2, city, postalcode, country, phone, email, fax, created_at, upDATEd_at) values ('Yakitri', 'Jocelin', 'Aucock', 'Mrs', '80174 Roxbury Crossing', null, 'San Andros', null, 'Bahamas', '417-780-6029', 'jaucock3@shinystat.com', '526-509-2424', '9/25/2020', '3/24/2021');
insert into supplier (companyName, contactFName, contactLName, contactTitle, adress1, adress2, city, postalcode, country, phone, email, fax, created_at, upDATEd_at) values ('Bluejam', 'Anitra', 'Wisniewski', 'Rev', '60 Bashford Hill', null, 'Kribi', null, 'Cameroon', '502-748-2348', 'awisniewski4@uol.com.br', '680-646-6169', '10/18/2020', '12/31/2020');
insert into supplier (companyName, contactFName, contactLName, contactTitle, adress1, adress2, city, postalcode, country, phone, email, fax, created_at, upDATEd_at) values ('Abatz', 'Merrick', 'Di Angelo', 'Rev', '03611 Lien Hill', '79 Manley Court', 'Dallas', '75260', 'United States', '214-509-5012', 'mdiangelo5@wired.com', '574-636-0667', '3/13/2021', '7/26/2020');
insert into supplier (companyName, contactFName, contactLName, contactTitle, adress1, adress2, city, postalcode, country, phone, email, fax, created_at, upDATEd_at) values ('Mynte', 'Vally', 'Oliva', 'Dr', '6 Mallard Center', '4 Green Hill', 'Vetluzhskiy', '157510', 'Russia', '893-315-0932', 'voliva6@naver.com', '197-225-4427', '2/16/2021', '12/7/2020');
insert into supplier (companyName, contactFName, contactLName, contactTitle, adress1, adress2, city, postalcode, country, phone, email, fax, created_at, upDATEd_at) values ('Demivee', 'Angel', 'Liger', 'Rev', '38147 Sugar Place', '8 Norway Maple Court', 'Upernavik', '3962', 'Greenland', '430-399-3604', 'aliger7@berkeley.edu', '213-715-1928', '5/3/2020', '5/15/2020');
insert into supplier (companyName, contactFName, contactLName, contactTitle, adress1, adress2, city, postalcode, country, phone, email, fax, created_at, upDATEd_at) values ('Skyndu', 'Erwin', 'Goodwins', 'Mr', '5 Loeprich Hill', null, 'Yongtai', null, 'China', '191-234-5555', 'egoodwins8@toplist.cz', '211-567-4796', '11/7/2020', '6/7/2021');
insert into supplier (companyName, contactFName, contactLName, contactTitle, adress1, adress2, city, postalcode, country, phone, email, fax, created_at, upDATEd_at) values ('Feedfire', 'Sophia', 'Espino', 'Mrs', '5 Annamark Parkway', null, 'Ko Samui', '84140', 'Thailand', '445-288-7407', 'sespino9@google.com.hk', '980-267-8811', '1/7/2021', '1/21/2021');


insert into promotion (discount, code, promotioncode, created_at, upDATEd_at) values (0.02, '9394793e5d9db61b8e8eb0b669d07e6ef0419633', '927ae017d60e4939877d03eb9adabab6b52a8c90', '4/23/2021', '6/20/2020');
insert into promotion (discount, code, promotioncode, created_at, upDATEd_at) values (0.25, '42e3b402712644de4fb62c32072d4fd3fda936dc', '7a159c0fb9fac86f1f25319467bdbf8a377190ec', '10/28/2020', '8/9/2020');
insert into promotion (discount, code, promotioncode, created_at, upDATEd_at) values (0.73, 'eaa21518f8dca236e9aee9d4cd07db823006a7c3', '39a812a21e509c38fecc8e4390446dbea9acd2e8', '3/19/2021', '2/17/2021');
insert into promotion (discount, code, promotioncode, created_at, upDATEd_at) values (0.88, '02452b571070b669e84bd74db883f80be20b4b72', '7bd6a3e29376f3127bde40b50484af78268ff44b', '5/25/2020', '12/21/2020');
insert into promotion (discount, code, promotioncode, created_at, upDATEd_at) values (0.67, '18d7a8f57ee997f829ede54bcb223fe0935d76df', '8d0c6ffb2812d39d6ba9d9f8ec559464af01030c', '5/7/2021', '11/20/2020');
insert into promotion (discount, code, promotioncode, created_at, upDATEd_at) values (0.04, 'fd79bd1569febf7a521840ff8100d48258fab2bc', '7af2a90dda77d1db0d2aa83b601fc376e195ec9c', '6/26/2020', '12/4/2020');
insert into promotion (discount, code, promotioncode, created_at, upDATEd_at) values (0.36, 'd502f2e4cbf219b79c2551be8fda62433fe0e4cc', '8d482939e1797cbdbce11d647a946f81c3e477c1', '10/14/2020', '6/1/2020');
insert into promotion (discount, code, promotioncode, created_at, upDATEd_at) values (0.13, '0950735b0325c99484e7b60fbe3f5963e2322607', '54377ff23309e11898c697eef47b0eb6b844bd45', '3/22/2021', '5/7/2021');
insert into promotion (discount, code, promotioncode, created_at, upDATEd_at) values (0.15, '0789eb2f80b26fe12962720e27979197eab444e0', '2ffcd8ca62a0c65c6956a60d1ade4afdb798b8a8', '11/5/2020', '4/29/2021');
insert into promotion (discount, code, promotioncode, created_at, upDATEd_at) values (0.28, '41327a104638fbc02758c0c3ec5d741aef2ea821', '45511f1f93a624099a1f9512dde2c7503220cabb', '4/11/2021', '12/19/2020');


insert into product_has_promotion (created_at, upDATEd_at) values ('6/17/2021', '5/15/2021');
insert into product_has_promotion (created_at, upDATEd_at) values ('11/28/2020', '1/4/2021');
insert into product_has_promotion (created_at, upDATEd_at) values ('6/29/2021', '7/4/2020');
insert into product_has_promotion (created_at, upDATEd_at) values ('9/26/2020', '5/31/2020');
insert into product_has_promotion (created_at, upDATEd_at) values ('5/20/2020', '8/3/2020');
insert into product_has_promotion (created_at, upDATEd_at) values ('6/21/2021', '1/22/2021');
insert into product_has_promotion (created_at, upDATEd_at) values ('5/4/2021', '9/22/2020');
insert into product_has_promotion (created_at, upDATEd_at) values ('9/28/2020', '6/8/2021');
insert into product_has_promotion (created_at, upDATEd_at) values ('8/3/2020', '5/31/2020');
insert into product_has_promotion (created_at, upDATEd_at) values ('5/1/2020', '5/21/2020');


insert into product (product_name, product_description, price, type, size, created_at, upDATEd_at) values ('Beer - Fruli', 'Adaptive encompassing strategy', '$120.07', 'application/mspowerpoint', 3, '4/2/2021', '9/1/2020');
insert into product (product_name, product_description, price, type, size, created_at, upDATEd_at) values ('Easy Off Oven Cleaner', 'Ergonomic regional knowledge base', '$381.01', 'application/vnd.ms-excel', 24, '8/19/2020', '6/14/2020');
insert into product (product_name, product_description, price, type, size, created_at, upDATEd_at) values ('Beer - Sleeman Fine Porter', 'Grass-roots holistic benchmark', '$586.98', 'application/x-excel', 47, '9/28/2020', '11/30/2020');
insert into product (product_name, product_description, price, type, size, created_at, upDATEd_at) values ('Sherry - Dry', 'Synchronised analyzing emulation', '$34.79', 'application/pdf', 68, '8/1/2020', '3/3/2021');
insert into product (product_name, product_description, price, type, size, created_at, upDATEd_at) values ('Shrimp, Dried, Small / Lb', 'Business-focused intangible definition', '$887.65', 'application/vnd.ms-powerpoint', 77, '8/12/2020', '8/25/2020');
insert into product (product_name, product_description, price, type, size, created_at, upDATEd_at) values ('Fish - Base, Bouillion', 'Vision-oriented asynchronous application', '$7.38', 'application/msword', 80, '12/3/2020', '2/15/2021');
insert into product (product_name, product_description, price, type, size, created_at, upDATEd_at) values ('Bread Base - Toscano', 'Distributed bottom-line moratorium', '$25.38', 'text/plain', 94, '6/9/2020', '11/12/2020');
insert into product (product_name, product_description, price, type, size, created_at, upDATEd_at) values ('Muffin Mix - Corn Harvest', 'Switchable foreground firmware', '$395.70', 'application/x-msexcel', 13, '7/16/2020', '10/30/2020');
insert into product (product_name, product_description, price, type, size, created_at, upDATEd_at) values ('Wine - Rioja Campo Viejo', 'Front-line reciprocal internet solution', '$244.99', 'image/png', 4, '9/8/2020', '6/9/2020');
insert into product (product_name, product_description, price, type, size, created_at, upDATEd_at) values ('Cabbage - Green', 'Streamlined multi-tasking matrix', '$210.05', 'image/png', 23, '8/31/2020', '1/3/2021');


insert into photo (url, name, price, stock) values ('http://yellowpages.com/pellentesque/quisque/porta.json', 'Beastmaster, The', 17, '7/27/2020');
insert into photo (url, name, price, stock) values ('https://vinaora.com/ut/at/dolor/quis.json', 'Storm in Summer, A', 77, '6/21/2020');
insert into photo (url, name, price, stock) values ('http://spotify.com/lorem/ipsum.jsp', 'Indie Game: The Movie', 70, '12/31/2020');
insert into photo (url, name, price, stock) values ('https://wiley.com/justo/lacinia/eget/tincidunt/eget/tempus.json', 'Upside Down', 67, '11/2/2020');
insert into photo (url, name, price, stock) values ('http://smh.com.au/tincidunt/eget/tempus/vel/pede/morbi.aspx', '3096 Days', 21, '2/16/2021');
insert into photo (url, name, price, stock) values ('https://1688.com/odio/donec/vitae.xml', 'Lies and Illusions', 60, '8/11/2020');
insert into photo (url, name, price, stock) values ('https://engadget.com/dui/vel/nisl.json', 'Incredible Hulk Returns, The', 41, '7/15/2020');
insert into photo (url, name, price, stock) values ('http://craigslist.org/nulla/elit/ac/nulla/sed.jpg', 'Italian Straw Hat, The (Un chapeau de paille d''Italie)', 48, '10/10/2020');
insert into photo (url, name, price, stock) values ('http://intel.com/duis/faucibus.js', '9', 35, '8/19/2020');
insert into photo (url, name, price, stock) values ('https://histats.com/donec/semper/sapien/a/libero.json', 'Man You Had in Mind, The', 19, '12/31/2020');


insert into payment (cardnumber, expiryDATE, ownername, cvv, upDATEd_at) values ('3542319037308221', '2/25/2021', 'Raoul Verne', 506, '8/30/2020');
insert into payment (cardnumber, expiryDATE, ownername, cvv, upDATEd_at) values ('5602258570182577162', '12/3/2020', 'Denys Frandsen', 766, '7/6/2020');
insert into payment (cardnumber, expiryDATE, ownername, cvv, upDATEd_at) values ('3582704014453671', '5/19/2020', 'Carlota Decroix', 277, '1/1/2021');
insert into payment (cardnumber, expiryDATE, ownername, cvv, upDATEd_at) values ('4405589923749993', '11/13/2020', 'Bat Crole', 977, '5/15/2020');
insert into payment (cardnumber, expiryDATE, ownername, cvv, upDATEd_at) values ('560223856400451661', '11/24/2020', 'Hatti Lagde', 790, '12/2/2020');
insert into payment (cardnumber, expiryDATE, ownername, cvv, upDATEd_at) values ('3534307440436135', '9/26/2020', 'Torin Maskelyne', 843, '11/22/2020');
insert into payment (cardnumber, expiryDATE, ownername, cvv, upDATEd_at) values ('201754092694370', '2/3/2021', 'Ernesta Willshee', 971, '1/9/2021');
insert into payment (cardnumber, expiryDATE, ownername, cvv, upDATEd_at) values ('3583569328046043', '10/25/2020', 'Maxy Wilman', 385, '9/18/2020');
insert into payment (cardnumber, expiryDATE, ownername, cvv, upDATEd_at) values ('30482136957309', '5/20/2020', 'Gabriel Naile', 409, '6/3/2020');
insert into payment (cardnumber, expiryDATE, ownername, cvv, upDATEd_at) values ('201562132789138', '3/5/2021', 'Darby Eleshenar', 350, '12/29/2020');

insert into orderdetails (numorder, cuantity, upDATEs_at) values (683, 867, '12/11/2020');
insert into orderdetails (numorder, cuantity, upDATEs_at) values (38, 216, '10/1/2020');
insert into orderdetails (numorder, cuantity, upDATEs_at) values (501, 823, '1/15/2021');
insert into orderdetails (numorder, cuantity, upDATEs_at) values (903, 732, '7/4/2020');
insert into orderdetails (numorder, cuantity, upDATEs_at) values (295, 514, '2/27/2021');
insert into orderdetails (numorder, cuantity, upDATEs_at) values (753, 881, '6/15/2020');
insert into orderdetails (numorder, cuantity, upDATEs_at) values (653, 245, '9/2/2020');
insert into orderdetails (numorder, cuantity, upDATEs_at) values (165, 366, '12/15/2020');
insert into orderdetails (numorder, cuantity, upDATEs_at) values (317, 810, '3/21/2021');
insert into orderdetails (numorder, cuantity, upDATEs_at) values (796, 627, '7/21/2020');

insert into orders (numorder, successful, created_at) values ('08b02845664b506ea10b41e77bc95c1d08c8e742', 309, '4/11/2021');
insert into orders (numorder, successful, created_at) values ('577eff2be86b002231dac12d06ec2c0953f2ce25', 603, '11/12/2020');
insert into orders (numorder, successful, created_at) values ('d0199391ac9e1d6ee1e0bcbdabd55cb9356322f5', 215, '8/28/2020');
insert into orders (numorder, successful, created_at) values ('c2d34b2785d921397ec344c484ab2f1379e03c0a', 713, '5/23/2020');
insert into orders (numorder, successful, created_at) values ('73ce57e4af75592f4064013ecebbf007e1a2052b', 190, '11/10/2020');
insert into orders (numorder, successful, created_at) values ('37c8fbbd51be970b7cc8340e0387d9187cd4ea7b', 224, '7/20/2020');
insert into orders (numorder, successful, created_at) values ('2fb0fcf506ee858dc010dcc9e61a5605bff54f70', 576, '4/8/2021');
insert into orders (numorder, successful, created_at) values ('56ac0fbcefa2f8da34e462cdcda6e98add993d25', 938, '6/1/2020');
insert into orders (numorder, successful, created_at) values ('13d5c2d5bf97474ec138aeff24b238c3ef4d2f66', 544, '5/9/2020');
insert into orders (numorder, successful, created_at) values ('21789fe478512e74879b63711bc898cb2bc9a1cd', 734, '8/1/2020');

insert into customer (firstname, secondname, phone, gender, address1, address2) values ('Hardy', 'Querree', '9775922206', 'Genderfluid', 'hquerree0@woothemes.com', 'hquerree0@cbslocal.com');
insert into customer (firstname, secondname, phone, gender, address1, address2) values ('Hubie', 'Brownsea', '6283848731', 'Genderfluid', 'hbrownsea1@scientificamerican.com', 'hbrownsea1@google.ru');
insert into customer (firstname, secondname, phone, gender, address1, address2) values ('Aile', 'Reuter', '6831002323', 'Genderqueer', 'areuter2@comcast.net', 'areuter2@google.cn');
insert into customer (firstname, secondname, phone, gender, address1, address2) values ('Marylin', 'Lesper', '6993874898', 'Non-binary', 'mlesper3@wsj.com', 'mlesper3@parallels.com');
insert into customer (firstname, secondname, phone, gender, address1, address2) values ('Brigg', 'Karpe', '4025597157', 'Polygender', 'bkarpe4@berkeley.edu', 'bkarpe4@umich.edu');
insert into customer (firstname, secondname, phone, gender, address1, address2) values ('Denys', 'Chittock', '3125189930', 'Agender', 'dchittock5@cnbc.com', 'dchittock5@aol.com');
insert into customer (firstname, secondname, phone, gender, address1, address2) values ('Arlena', 'Verbrugge', '7948147877', 'Agender', 'averbrugge6@npr.org', 'averbrugge6@sfgate.com');
insert into customer (firstname, secondname, phone, gender, address1, address2) values ('Vaughan', 'Rame', '9529731160', 'Female', 'vrame7@biblegateway.com', 'vrame7@tripadvisor.com');
insert into customer (firstname, secondname, phone, gender, address1, address2) values ('Josiah', 'Jaouen', '6901481649', 'Genderqueer', 'jjaouen8@woothemes.com', 'jjaouen8@constantcontact.com');
insert into customer (firstname, secondname, phone, gender, address1, address2) values ('Leone', 'Bertwistle', '8644608536', 'Male', 'lbertwistle9@goo.ne.jp', 'lbertwistle9@wisc.edu');

insert into category (name) values ('dgenner0');
insert into category (name) values ('sflahive1');
insert into category (name) values ('cgerard2');
insert into category (name) values ('clucia3');
insert into category (name) values ('rtaffe4');
insert into category (name) values ('asouttar5');
insert into category (name) values ('ncolwell6');
insert into category (name) values ('jproschke7');
insert into category (name) values ('lgainfort8');
insert into category (name) values ('tsimons9');