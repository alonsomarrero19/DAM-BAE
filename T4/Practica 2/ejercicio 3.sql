-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema T4P2.3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema T4P2.3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `T4P2.3` DEFAULT CHARACTER SET utf8 ;
USE `T4P2.3` ;

-- -----------------------------------------------------
-- Table `T4P2.3`.`Participante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.3`.`Participante` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nombre` VARCHAR(20) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.3`.`Asociacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.3`.`Asociacion` (
  `CIF` VARCHAR(9) NOT NULL,
  `denominacion` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  `provincia` VARCHAR(45) NULL,
  PRIMARY KEY (`CIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.3`.`Trabajador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.3`.`Trabajador` (
  `DNI` VARCHAR(9) NOT NULL,
  `Fec_ini` DATE NULL,
  `CIF` VARCHAR(9) NULL,
  PRIMARY KEY (`DNI`),
  INDEX `DNI` (`DNI` ASC) VISIBLE,
  INDEX `CIF` (`CIF` ASC) VISIBLE,
  CONSTRAINT `ParticipanteTrabajador`
    FOREIGN KEY (`DNI`)
    REFERENCES `T4P2.3`.`Participante` (`DNI`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `TrabajadorAsociacion`
    FOREIGN KEY (`CIF`)
    REFERENCES `T4P2.3`.`Asociacion` (`CIF`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.3`.`Socio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.3`.`Socio` (
  `DNI` VARCHAR(9) NOT NULL,
  `Direccion` VARCHAR(45) NULL,
  `Provincia` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`),
  INDEX `DNI` (`DNI` ASC) VISIBLE,
  CONSTRAINT `ParticipanteSocio`
    FOREIGN KEY (`DNI`)
    REFERENCES `T4P2.3`.`Participante` (`DNI`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.3`.`Asalariado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.3`.`Asalariado` (
  `DNI` VARCHAR(9) NOT NULL,
  `NSS` VARCHAR(12) NULL,
  `IRPF` FLOAT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `DNI` (`DNI` ASC) VISIBLE,
  CONSTRAINT `TrabajadorAsalariado`
    FOREIGN KEY (`DNI`)
    REFERENCES `T4P2.3`.`Trabajador` (`DNI`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.3`.`Voluntario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.3`.`Voluntario` (
  `DNI` VARCHAR(9) NOT NULL,
  `edad` INT NULL,
  `horas` FLOAT NULL,
  `profesion` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`),
  INDEX `DNI` (`DNI` ASC) VISIBLE,
  CONSTRAINT `TrabajadorVoluntario`
    FOREIGN KEY (`DNI`)
    REFERENCES `T4P2.3`.`Trabajador` (`DNI`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.3`.`Proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.3`.`Proyecto` (
  `N_id` INT NOT NULL,
  `objetivo` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `beneficiarios` VARCHAR(45) NULL,
  `zona` VARCHAR(45) NULL,
  `CIF` VARCHAR(9) NULL,
  PRIMARY KEY (`N_id`),
  INDEX `CIF` (`CIF` ASC) VISIBLE,
  CONSTRAINT `CIF_Aso`
    FOREIGN KEY (`CIF`)
    REFERENCES `T4P2.3`.`Asociacion` (`CIF`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.3`.`Esta_formada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.3`.`Esta_formada` (
  `DNI` VARCHAR(9) NOT NULL,
  `CIF` VARCHAR(9) NOT NULL,
  `fec_alta` DATE NULL,
  `cuota` FLOAT NULL,
  `aportacion` FLOAT NULL,
  PRIMARY KEY (`DNI`, `CIF`),
  INDEX `DNI` (`DNI` ASC) INVISIBLE,
  INDEX `CIF` (`CIF` ASC) VISIBLE,
  CONSTRAINT `DNI_Socio`
    FOREIGN KEY (`DNI`)
    REFERENCES `T4P2.3`.`Socio` (`DNI`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `CIF_Asocia`
    FOREIGN KEY (`CIF`)
    REFERENCES `T4P2.3`.`Asociacion` (`CIF`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.3`.`Compuesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.3`.`Compuesto` (
  `N_id` INT NOT NULL,
  `N_id_com` INT NOT NULL,
  PRIMARY KEY (`N_id`, `N_id_com`),
  INDEX `N_id` (`N_id` ASC) VISIBLE,
  INDEX `N_id_com` (`N_id_com` ASC) INVISIBLE,
  CONSTRAINT `N_id`
    FOREIGN KEY (`N_id`)
    REFERENCES `T4P2.3`.`Proyecto` (`N_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `N_id_com`
    FOREIGN KEY (`N_id_com`)
    REFERENCES `T4P2.3`.`Proyecto` (`N_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
