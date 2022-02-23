-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categories` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`producers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`producers` (
  `id` INT NOT NULL,
  `name` VARCHAR(80) NULL,
  `number` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `id` INT NOT NULL,
  `productIndex` INT NULL,
  `currentliAvailable` VARCHAR(45) NULL,
  `productName` VARCHAR(45) NULL,
  `shortDescription` VARCHAR(150) NULL,
  `description` VARCHAR(200) NULL,
  `quantityInStock` INT NULL,
  `price` DOUBLE NULL,
  `seasonalPrice` DOUBLE NULL,
  `specialPrice` DOUBLE NULL,
  `creationDate` DATE NULL,
  `dateOfLastChange` DATE NULL,
  `vegeterian` TINYINT NULL,
  `vegan` TINYINT NULL,
  `calories` DOUBLE NULL,
  `sugar` DOUBLE NULL,
  `categories_id` INT NOT NULL,
  `producers_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Products_categories`
    FOREIGN KEY (`categories_id`)
    REFERENCES `mydb`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_producers1`
    FOREIGN KEY (`producers_id`)
    REFERENCES `mydb`.`producers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`curiers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`curiers` (
  `id` INT NOT NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clients` (
  `id` INT NOT NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `id` INT NOT NULL,
  `curiers_id` INT NOT NULL,
  `clients_id` INT NOT NULL,
  `deliverydate` DATE NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_orders_curiers1`
    FOREIGN KEY (`curiers_id`)
    REFERENCES `mydb`.`curiers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_clients1`
    FOREIGN KEY (`clients_id`)
    REFERENCES `mydb`.`clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orderprodconn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orderprodconn` (
  `id` INT NOT NULL,
  `products_id` INT NOT NULL,
  `orders_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_orderprodconn_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderprodconn_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `mydb`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
