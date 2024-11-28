-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ExamenT4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ExamenT4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ExamenT4` DEFAULT CHARACTER SET utf8 ;
USE `ExamenT4` ;

-- -----------------------------------------------------
-- Table `ExamenT4`.`Sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExamenT4`.`Sucursal` (
  `Código` INT NOT NULL,
  `Direccion` VARCHAR(45) NULL,
  `Sucursalcol` VARCHAR(45) NULL,
  `Telefono` VARCHAR(20) NULL,
  `Ciudad` VARCHAR(20) NULL,
  `Provincia` VARCHAR(20) NULL,
  PRIMARY KEY (`Código`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExamenT4`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExamenT4`.`Empleado` (
  `ID` INT NOT NULL,
  `NIF` VARCHAR(9) NULL,
  `Nombre` VARCHAR(20) NULL,
  `Apellido1` VARCHAR(10) NULL,
  `Apellido2` VARCHAR(10) NULL,
  `Telefono` VARCHAR(20) NULL,
  `Cod_Sucursal` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Cod_Sucursal` (`Cod_Sucursal` ASC) VISIBLE,
  CONSTRAINT `EmpleadoSucursal`
    FOREIGN KEY (`Cod_Sucursal`)
    REFERENCES `ExamenT4`.`Sucursal` (`Código`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExamenT4`.`Revista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExamenT4`.`Revista` (
  `Num_registro` INT NOT NULL,
  `Titulo` VARCHAR(45) NULL,
  `Tipo` VARCHAR(30) NULL,
  `Periocidad` VARCHAR(20) NULL,
  PRIMARY KEY (`Num_registro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExamenT4`.`Periodista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExamenT4`.`Periodista` (
  `ID` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido1` VARCHAR(10) NULL,
  `Apellido2` VARCHAR(10) NULL,
  `Telefono` VARCHAR(20) NULL,
  `Especialidad` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExamenT4`.`Seccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExamenT4`.`Seccion` (
  `ID` INT NOT NULL,
  `Titulo` VARCHAR(45) NULL,
  `Extension` INT NULL,
  `Revista` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Seccion_Rev` (`Revista` ASC) INVISIBLE,
  CONSTRAINT `SeccionRevista`
    FOREIGN KEY (`Revista`)
    REFERENCES `ExamenT4`.`Revista` (`Num_registro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExamenT4`.`Ejemplar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExamenT4`.`Ejemplar` (
  `ID` INT NOT NULL,
  `Fecha` DATE NULL,
  `Num_paginas` INT NULL,
  `Num_ejemplares` INT NULL,
  `Revista` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Revista` (`Revista` ASC) VISIBLE,
  CONSTRAINT `EjemplarRevista`
    FOREIGN KEY (`Revista`)
    REFERENCES `ExamenT4`.`Revista` (`Num_registro`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExamenT4`.`Publica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExamenT4`.`Publica` (
  `Codigo_Sucursal` INT NOT NULL,
  `N_registro` INT NOT NULL,
  PRIMARY KEY (`Codigo_Sucursal`, `N_registro`),
  INDEX `codigo_sucursal` (`Codigo_Sucursal` ASC) INVISIBLE,
  INDEX `n_registro` (`N_registro` ASC) VISIBLE,
  CONSTRAINT `SucursalPublica`
    FOREIGN KEY (`Codigo_Sucursal`)
    REFERENCES `ExamenT4`.`Sucursal` (`Código`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `PublicaRevista`
    FOREIGN KEY (`N_registro`)
    REFERENCES `ExamenT4`.`Revista` (`Num_registro`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExamenT4`.`Escribe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExamenT4`.`Escribe` (
  `n_reg` INT NOT NULL,
  `ID_periodista` INT NOT NULL,
  PRIMARY KEY (`n_reg`, `ID_periodista`),
  INDEX `n_reg` (`n_reg` ASC) VISIBLE,
  INDEX `ID_periodista` (`ID_periodista` ASC) VISIBLE,
  CONSTRAINT `n_reg`
    FOREIGN KEY (`n_reg`)
    REFERENCES `ExamenT4`.`Revista` (`Num_registro`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `ID_periodista`
    FOREIGN KEY (`ID_periodista`)
    REFERENCES `ExamenT4`.`Periodista` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
