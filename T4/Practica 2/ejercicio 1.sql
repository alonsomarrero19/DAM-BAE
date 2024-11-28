-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema T4P2.1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema T4P2.1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `T4P2.1` DEFAULT CHARACTER SET utf8 ;
USE `T4P2.1` ;

-- -----------------------------------------------------
-- Table `T4P2.1`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.1`.`cliente` (
  `dni` VARCHAR(9) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.1`.`propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.1`.`propietario` (
  `id_propietario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`id_propietario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.1`.`apartamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.1`.`apartamento` (
  `id_apartamento` INT NOT NULL AUTO_INCREMENT,
  `dirección` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  `num_hab` INT NULL,
  `primera_linea` TINYINT NULL,
  `id_propietario` INT NOT NULL,
  PRIMARY KEY (`id_apartamento`),
  INDEX `id_propietario` (`id_propietario` ASC) VISIBLE,
  CONSTRAINT `propietarioApartamento`
    FOREIGN KEY (`id_propietario`)
    REFERENCES `T4P2.1`.`propietario` (`id_propietario`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.1`.`temporada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.1`.`temporada` (
  `quincena` INT NOT NULL,
  `mes` INT NOT NULL,
  `año` INT NOT NULL,
  PRIMARY KEY (`quincena`, `mes`, `año`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.1`.`coste`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.1`.`coste` (
  `quincena` INT NOT NULL,
  `mes` INT NOT NULL,
  `año` INT NOT NULL,
  `€para_propietariio` INT NOT NULL,
  `€para_Agencia` INT NOT NULL,
  `idApartamento` INT NOT NULL,
  PRIMARY KEY (`quincena`, `mes`, `año`),
  INDEX `quincena` (`quincena` ASC) INVISIBLE,
  INDEX `mes` (`mes` ASC) INVISIBLE,
  INDEX `año` (`año` ASC) INVISIBLE,
  INDEX `id_apartamento` (`idApartamento` ASC) VISIBLE,
  CONSTRAINT `costeTemporada`
    FOREIGN KEY (`quincena` , `mes` , `año`)
    REFERENCES `T4P2.1`.`temporada` (`quincena` , `mes` , `año`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `costeApartamento`
    FOREIGN KEY (`idApartamento`)
    REFERENCES `T4P2.1`.`apartamento` (`id_apartamento`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T4P2.1`.`alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T4P2.1`.`alquiler` (
  `quincena` INT NOT NULL,
  `mes` INT NOT NULL,
  `año` INT NOT NULL,
  `dni` VARCHAR(9) NULL,
  `id_apartamento` INT NULL,
  `€señal` INT NULL,
  `€coste` INT NULL,
  PRIMARY KEY (`quincena`, `mes`, `año`),
  INDEX `quincena` (`quincena` ASC) INVISIBLE,
  INDEX `mes` (`mes` ASC) INVISIBLE,
  INDEX `año` (`año` ASC) INVISIBLE,
  INDEX `dni` (`dni` ASC) INVISIBLE,
  INDEX `id_apartamento` (`id_apartamento` ASC) VISIBLE,
  CONSTRAINT `alquilerTemporada`
    FOREIGN KEY (`quincena` , `mes` , `año`)
    REFERENCES `T4P2.1`.`temporada` (`quincena` , `mes` , `año`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `alquilerCliente`
    FOREIGN KEY (`dni`)
    REFERENCES `T4P2.1`.`cliente` (`dni`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `alquilerApartamento`
    FOREIGN KEY (`id_apartamento`)
    REFERENCES `T4P2.1`.`apartamento` (`id_apartamento`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
