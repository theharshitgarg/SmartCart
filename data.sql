DROP TABLE `test_schema`.`transaction`;
DROP TABLE `test_schema`.`product`;
DROP TABLE `test_schema`.`product_category`;


CREATE TABLE `test_schema`.`product_category` (
  `product_cat_id` INT NOT NULL,
  `product_cat_type` VARCHAR(45) NULL,
  PRIMARY KEY (`product_cat_id`));
  
  CREATE TABLE `test_schema`.`product` (
  `product_id` INT NOT NULL,
  `product_name` VARCHAR(45) NULL,
  `product_price` INT NULL,
  `product_cat_id` INT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `product_cat_id_fk_idx` (`product_cat_id` ASC),
  CONSTRAINT `product_cat_id_fk`
    FOREIGN KEY (`product_cat_id`)
    REFERENCES `test_schema`.`product_category` (`product_cat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `test_schema`.`transaction` (
  `item_id` INT NOT NULL,
  `vendor_id` VARCHAR(45) NULL,
  `date` DATETIME NULL);
  
  
insert into `test_schema`.`product_category` values(1,"Beverages");
insert into `test_schema`.`product_category` values(2,"Bread/Bakery");
insert into `test_schema`.`product_category` values(3,"Canned/Jarred Goods");
insert into `test_schema`.`product_category` values(4,"Dairy");
insert into `test_schema`.`product_category` values(5,"Dry/Baking Goods");
insert into `test_schema`.`product_category` values(6,"Frozen Foods");
insert into `test_schema`.`product_category` values(7,"Meat");
insert into `test_schema`.`product_category` values(8,"Fruits/Vegetables");
insert into `test_schema`.`product_category` values(9,"Cleaners");
insert into `test_schema`.`product_category` values(10,"Paper Goods");
insert into `test_schema`.`product_category` values(11,"Personal Care");
insert into `test_schema`.`product_category` values(12,"Baby items");
insert into `test_schema`.`product_category` values(13,"Pet items");
/* insert into products */
insert into `test_schema`.`product` values(1,"Coffee",99,1);
insert into `test_schema`.`product` values(2,"Tea",80,1);
insert into `test_schema`.`product` values(3,"Juice",20,1);
insert into `test_schema`.`product` values(4,"Soda",12,1);
insert into `test_schema`.`product` values(5,"Pepsi",25,1);
insert into `test_schema`.`product` values(6,"Coca Cola",25,1);

insert into `test_schema`.`product` values(7,"Bread",22,2);
insert into `test_schema`.`product` values(8,"Cake",18,2);
insert into `test_schema`.`product` values(9,"Bun",9,2);
insert into `test_schema`.`product` values(10,"Muffin",6,2);

insert into `test_schema`.`product` values(11,"cheese",55,4);
insert into `test_schema`.`product` values(12,"eggs",22,4);
insert into `test_schema`.`product` values(13,"milk",22,4);
insert into `test_schema`.`product` values(14,"yogurt",19,4);
insert into `test_schema`.`product` values(15,"butter",99,4);

insert into `test_schema`.`product` values(16,"Banana",24,8);
insert into `test_schema`.`product` values(17,"Apple",199,8);
insert into `test_schema`.`product` values(18,"Spinach",27,8);
insert into `test_schema`.`product` values(19,"Mango",149,8);
insert into `test_schema`.`product` values(20,"Green peas",44,8);



insert into `test_schema`.`transaction` values (1,"A","2016-01-01 08:49:43");
insert into `test_schema`.`transaction` values (2,"A","2016-01-01 08:49:43");
insert into `test_schema`.`transaction` values (7,"A","2016-01-01 08:49:43");
insert into `test_schema`.`transaction` values (8,"A","2016-01-01 08:49:43");
insert into `test_schema`.`transaction` values (12,"A","2016-01-01 08:49:43");

insert into `test_schema`.`transaction` values (1,"A","2016-01-03 06:30:3");
insert into `test_schema`.`transaction` values (2,"A","2016-01-03 06:30:3");
insert into `test_schema`.`transaction` values (12,"A","2016-01-03 06:30:3");
insert into `test_schema`.`transaction` values (13,"A","2016-01-03 06:30:3");

insert into `test_schema`.`transaction` values (13,"A","2016-01-05 10:49:4");
insert into `test_schema`.`transaction` values (12,"A","2016-01-05 10:49:4");
insert into `test_schema`.`transaction` values (7,"A","2016-01-05 10:49:4");

insert into `test_schema`.`transaction` values (13,"A","2016-01-10 13:49:04");
insert into `test_schema`.`transaction` values (12,"A","2016-01-10 13:49:04");
insert into `test_schema`.`transaction` values (1,"A","2016-01-10 13:49:04");
insert into `test_schema`.`transaction` values (2,"A","2016-01-10 13:49:04");
insert into `test_schema`.`transaction` values (7,"A","2016-01-10 13:49:04");

insert into `test_schema`.`transaction` values (3,"A","2016-01-11 13:22:04");
insert into `test_schema`.`transaction` values (5,"A","2016-01-11 13:22:04");
insert into `test_schema`.`transaction` values (4,"A","2016-01-11 13:22:04");
insert into `test_schema`.`transaction` values (5,"A","2016-01-11 13:22:04");
insert into `test_schema`.`transaction` values (10,"A","2016-01-11 13:22:04");

insert into `test_schema`.`transaction` values (13,"A","2016-01-16 17:01:04");
insert into `test_schema`.`transaction` values (12,"A","2016-01-16 17:01:04");
insert into `test_schema`.`transaction` values (11,"A","2016-01-16 17:01:04");
insert into `test_schema`.`transaction` values (7,"A","2016-01-16 17:01:04");
insert into `test_schema`.`transaction` values (3,"A","2016-01-16 17:01:04");
