-- MySQL Script generated by MySQL Workbench
-- Wed May  2 15:25:38 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema valstand
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema valstand
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `valstand` DEFAULT CHARACTER SET utf8 ;
USE `valstand` ;

-- -----------------------------------------------------
-- Table `valstand`.`administradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `valstand`.`administradores` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `apellido_paterno` VARCHAR(255) NOT NULL,
  `apellido_materno` VARCHAR(255) NOT NULL,
  `usuario` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `valstand`.`noticias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `valstand`.`noticias` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `caratula` VARCHAR(255) NOT NULL,
  `titulo` VARCHAR(255) NOT NULL,
  `tema` VARCHAR(255) NOT NULL,
  `contenido` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `valstand`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `valstand`.`proyectos` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NULL,
  `descripcion` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `valstand`.`imagenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `valstand`.`imagenes` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `proyectos_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC),
  INDEX `fk_imagen_proyectos_idx` (`proyectos_id` ASC),
  CONSTRAINT `fk_imagen_proyectos`
    FOREIGN KEY (`proyectos_id`)
    REFERENCES `valstand`.`proyectos` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `valstand`.`socios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `valstand`.`socios` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `logotipo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `valstand`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `valstand`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido_paterno` VARCHAR(45) NOT NULL,
  `apellido_materno` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `compañia` VARCHAR(45) NOT NULL,
  `registro` ENUM('facebook', 'google', 'normal') NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `remember_token` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `valstand`.`subastas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `valstand`.`subastas` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `caratula` VARCHAR(255) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `status` ENUM('activa', 'finalizada') NOT NULL DEFAULT 'activa',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `valstand`.`propuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `valstand`.`propuesta` (
  `id` INT NOT NULL,
  `descripcion` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `usuarios_id` INT NOT NULL,
  `subastas_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_propuesta_usuarios1_idx` (`usuarios_id` ASC),
  INDEX `fk_propuesta_subastas1_idx` (`subastas_id` ASC),
  CONSTRAINT `fk_propuesta_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `valstand`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_propuesta_subastas1`
    FOREIGN KEY (`subastas_id`)
    REFERENCES `valstand`.`subastas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
