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
-- Table `mydb`.`professors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`professors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `deptid` INT NULL,
  `birthdate` DATE NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `depkey_idx` (`deptid` ASC) VISIBLE,
  CONSTRAINT `depkey`
    FOREIGN KEY (`deptid`)
    REFERENCES `mydb`.`departemts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`departemts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`departemts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `proid` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `depid_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `prokey_idx` (`proid` ASC) VISIBLE,
  CONSTRAINT `prokey`
    FOREIGN KEY (`proid`)
    REFERENCES `mydb`.`professors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`students` (
  `stid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `birthdate` DATE NULL,
  `email` VARCHAR(45) NULL,
  `depid` INT NULL,
  PRIMARY KEY (`stid`),
  UNIQUE INDEX `stid_UNIQUE` (`stid` ASC) VISIBLE,
  INDEX `deptkey_idx` (`depid` ASC) VISIBLE,
  CONSTRAINT `deptkey`
    FOREIGN KEY (`depid`)
    REFERENCES `mydb`.`departemts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`courses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `deptid` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `depkey_idx` (`deptid` ASC) VISIBLE,
  CONSTRAINT `depkey`
    FOREIGN KEY (`deptid`)
    REFERENCES `mydb`.`departemts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`assistants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`assistants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `deptid` INT NULL,
  `birthdate` DATE NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `depkey_idx` (`deptid` ASC) VISIBLE,
  CONSTRAINT `depkey`
    FOREIGN KEY (`deptid`)
    REFERENCES `mydb`.`departemts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`buildings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`buildings` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`classes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `courseid` INT NULL,
  `professorid` INT NULL,
  `assistantid` INT NULL,
  `buildingid` INT NULL,
  `semester` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `coukey_idx` (`courseid` ASC) VISIBLE,
  INDEX `prokey_idx` (`professorid` ASC) VISIBLE,
  INDEX `asskey_idx` (`assistantid` ASC) VISIBLE,
  INDEX `buldkey_idx` (`buildingid` ASC) VISIBLE,
  CONSTRAINT `coukey`
    FOREIGN KEY (`courseid`)
    REFERENCES `mydb`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prokey`
    FOREIGN KEY (`professorid`)
    REFERENCES `mydb`.`professors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `asskey`
    FOREIGN KEY (`assistantid`)
    REFERENCES `mydb`.`assistants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `buldkey`
    FOREIGN KEY (`buildingid`)
    REFERENCES `mydb`.`buildings` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;