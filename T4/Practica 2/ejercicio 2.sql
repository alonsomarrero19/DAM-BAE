-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema T4P2.2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema T4P2.2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `T4P2.2` DEFAULT CHARACTER SET utf8 ;
USE `T4P2.2` ;

-- -----------------------------------------------------
-- Table `T4P2.2`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.2`.`curso` (
  `idcurso` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `duracion` INT UNSIGNED NULL,
  `coste` INT UNSIGNED NULL,
  PRIMARY KEY (`idcurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.2`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.2`.`empleado` (
  `idempleado` INT UNSIGNED NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `telefono` VARCHAR(15) NULL,
  `nif` VARCHAR(9) NULL,
  `salario` FLOAT NULL,
  `fecha_nac` DATE NULL,
  `direccion` VARCHAR(45) NULL,
  `capacitado` TINYINT NULL,
  PRIMARY KEY (`idempleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.2`.`edicion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.2`.`edicion` (
  `idedicion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lugar` VARCHAR(45) NULL,
  `fecha` DATE NULL,
  `horario` VARCHAR(45) NULL,
  `idcurso` INT UNSIGNED NULL,
  `idempleado` INT UNSIGNED NULL,
  PRIMARY KEY (`idedicion`),
  INDEX `idcurso` (`idcurso` ASC) VISIBLE,
  INDEX `idempleado` (`idempleado` ASC) VISIBLE,
  CONSTRAINT `edicionCurso`
    FOREIGN KEY (`idcurso`)
    REFERENCES `T4P2.2`.`curso` (`idcurso`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `edicionEmpleado`
    FOREIGN KEY (`idempleado`)
    REFERENCES `T4P2.2`.`empleado` (`idempleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.2`.`prerequisito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.2`.`prerequisito` (
  `idcurso` INT UNSIGNED NOT NULL,
  `idcurso_pre` INT UNSIGNED NOT NULL,
  `obligatorio` VARCHAR(45) NULL,
  PRIMARY KEY (`idcurso`, `idcurso_pre`),
  INDEX `idcurso` (`idcurso` ASC) INVISIBLE,
  INDEX `idcurso_pre` (`idcurso_pre` ASC) VISIBLE,
  CONSTRAINT `prerequisitoCurso`
    FOREIGN KEY (`idcurso`)
    REFERENCES `T4P2.2`.`curso` (`idcurso`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `prerequisitoCursoRef`
    FOREIGN KEY (`idcurso_pre`)
    REFERENCES `T4P2.2`.`curso` (`idcurso`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.2`.`Recibe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.2`.`Recibe` (
  `idcurso` INT UNSIGNED NOT NULL,
  `idempleado` INT UNSIGNED NOT NULL,
  `idedicion` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idcurso`, `idempleado`, `idedicion`),
  INDEX `idcurso` (`idcurso` ASC) INVISIBLE,
  INDEX `idempleado` (`idempleado` ASC) INVISIBLE,
  INDEX `idedicion` (`idedicion` ASC) VISIBLE,
  CONSTRAINT `recibeCurso`
    FOREIGN KEY (`idcurso`)
    REFERENCES `T4P2.2`.`curso` (`idcurso`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `recibeEmpleado`
    FOREIGN KEY (`idempleado`)
    REFERENCES `T4P2.2`.`empleado` (`idempleado`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `recibeEdicion`
    FOREIGN KEY (`idedicion`)
    REFERENCES `T4P2.2`.`edicion` (`idedicion`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
