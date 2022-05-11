-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema consad
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema consad
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `consad` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `consad` ;

-- -----------------------------------------------------
-- Table `consad`.`dm_questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consad`.`dm_questions` (
  `_id` VARCHAR(24) NOT NULL,
  `templateId` VARCHAR(36) NOT NULL,
  `questionId` VARCHAR(50) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`questionId`, `templateId`),
  INDEX `questionRef_fk_idx` (`templateId` ASC, `questionId` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `consad`.`tb_forms_respondentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consad`.`tb_forms_respondentes` (
  `_id` VARCHAR(24) NOT NULL,
  `templateId` VARCHAR(36) NOT NULL,
  `recipient` VARCHAR(64) NULL DEFAULT NULL,
  `email` VARCHAR(64) NULL DEFAULT NULL,
  `qUF` VARCHAR(2) NULL DEFAULT NULL,
  `qOrgao` VARCHAR(150) NULL DEFAULT NULL,
  `qNomeCompleto` VARCHAR(64) NULL DEFAULT NULL,
  `qFuncao` VARCHAR(100) NULL DEFAULT NULL,
  `qEmail` VARCHAR(64) NULL DEFAULT NULL,
  `qTelefoneCelular` INT NULL DEFAULT NULL,
  `qTelefoneFixo` INT NULL DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE INDEX `_id_UNIQUE` (`_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `consad`.`tb_answers_values`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consad`.`tb_answers_values` (
  `_id` VARCHAR(24) NOT NULL,
  `templateId` VARCHAR(36) NOT NULL,
  `questionId` VARCHAR(50) NOT NULL,
  `value` VARCHAR(200) NULL DEFAULT NULL,
  INDEX `_id_fk_idx` (`_id` ASC) VISIBLE,
  INDEX `templatId_fk_idx` (`templateId` ASC, `questionId` ASC) VISIBLE,
  CONSTRAINT `_id_fk0010`
    FOREIGN KEY (`_id`)
    REFERENCES `consad`.`tb_forms_respondentes` (`_id`),
  CONSTRAINT `questionRef_fk0010`
    FOREIGN KEY (`templateId` , `questionId`)
    REFERENCES `consad`.`dm_questions` (`templateId` , `questionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `consad`.`tb_aposentar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consad`.`tb_aposentar` (
  `_id` VARCHAR(24) NOT NULL,
  `templateId` VARCHAR(36) NOT NULL,
  `questionId` VARCHAR(50) NOT NULL,
  `orgao` VARCHAR(100) NULL DEFAULT NULL,
  `aposentar` VARCHAR(64) NULL DEFAULT NULL,
  `value` INT NULL DEFAULT NULL,
  INDEX `_id_fk_idx` (`_id` ASC) VISIBLE,
  INDEX `templatId_fk_idx` (`templateId` ASC, `questionId` ASC) VISIBLE,
  CONSTRAINT `_id_fk0000000`
    FOREIGN KEY (`_id`)
    REFERENCES `consad`.`tb_forms_respondentes` (`_id`),
  CONSTRAINT `questionRef_fk0000000`
    FOREIGN KEY (`templateId` , `questionId`)
    REFERENCES `consad`.`dm_questions` (`templateId` , `questionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `consad`.`tb_carreiras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consad`.`tb_carreiras` (
  `_id` VARCHAR(24) NOT NULL,
  `templateId` VARCHAR(36) NOT NULL,
  `questionId` VARCHAR(50) NOT NULL,
  `Área` VARCHAR(30) NULL DEFAULT NULL,
  `Carreira` VARCHAR(30) NULL DEFAULT NULL,
  `Patente (militares)` VARCHAR(25) NULL DEFAULT NULL,
  `Regime Jurídico` VARCHAR(20) NULL DEFAULT NULL,
  `Nível de Escolaridade para Ingresso` VARCHAR(20) NULL DEFAULT NULL,
  `Carga Horária Semanal` INT NULL DEFAULT NULL,
  `Normativa Referente à Escala` VARCHAR(60) NULL DEFAULT NULL,
  `Fixação Quantidade em Lei` VARCHAR(3) NULL DEFAULT NULL,
  `Quantitativo em Lei` INT NULL DEFAULT NULL,
  `Quantitativo de Servidores Ativos` INT NULL DEFAULT NULL,
  `Quantitativo de Servidores Inativos` INT NULL DEFAULT NULL,
  `Sistema Remuneração` VARCHAR(15) NULL DEFAULT NULL,
  `Remuneração Inicial (R$)` DECIMAL(10,2) NULL DEFAULT NULL,
  `Remuneração Final (35 anos) (R$)` DECIMAL(10,2) NULL DEFAULT NULL,
  `Avaliação de Desempenho para Desenvolvimento na Carreira` VARCHAR(45) NULL DEFAULT NULL,
  INDEX `_id_fk_idx` (`_id` ASC) VISIBLE,
  INDEX `templatId_fk_idx` (`templateId` ASC, `questionId` ASC) VISIBLE,
  CONSTRAINT `_id_fk000000000`
    FOREIGN KEY (`_id`)
    REFERENCES `consad`.`tb_forms_respondentes` (`_id`),
  CONSTRAINT `questionRef_fk000000000`
    FOREIGN KEY (`templateId` , `questionId`)
    REFERENCES `consad`.`dm_questions` (`templateId` , `questionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `consad`.`tb_categoria_sn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consad`.`tb_categoria_sn` (
  `_id` VARCHAR(24) NOT NULL,
  `templateId` VARCHAR(36) NOT NULL,
  `questionId` VARCHAR(50) NOT NULL,
  `categoria` VARCHAR(100) NULL DEFAULT NULL,
  `value` VARCHAR(3) NULL DEFAULT NULL,
  INDEX `_id_fk_idx` (`_id` ASC) VISIBLE,
  INDEX `templatId_fk_idx` (`templateId` ASC, `questionId` ASC) VISIBLE,
  CONSTRAINT `_id_fk00100`
    FOREIGN KEY (`_id`)
    REFERENCES `consad`.`tb_forms_respondentes` (`_id`),
  CONSTRAINT `questionRef_fk00100`
    FOREIGN KEY (`templateId` , `questionId`)
    REFERENCES `consad`.`dm_questions` (`templateId` , `questionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `consad`.`tb_escolaridade_orgao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consad`.`tb_escolaridade_orgao` (
  `_id` VARCHAR(24) NOT NULL,
  `templateId` VARCHAR(36) NOT NULL,
  `questionId` VARCHAR(50) NOT NULL,
  `grauEscolaridade` VARCHAR(40) NULL DEFAULT NULL,
  `orgao` VARCHAR(20) NULL DEFAULT NULL,
  `value` INT NULL DEFAULT NULL,
  INDEX `_id_fk_idx` (`_id` ASC) VISIBLE,
  INDEX `templatId_fk_idx` (`templateId` ASC, `questionId` ASC) VISIBLE,
  CONSTRAINT `_id_fk001`
    FOREIGN KEY (`_id`)
    REFERENCES `consad`.`tb_forms_respondentes` (`_id`),
  CONSTRAINT `questionRef_fk001`
    FOREIGN KEY (`templateId` , `questionId`)
    REFERENCES `consad`.`dm_questions` (`templateId` , `questionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `consad`.`tb_escolaridade_vinculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consad`.`tb_escolaridade_vinculo` (
  `_id` VARCHAR(24) NOT NULL,
  `templateId` VARCHAR(36) NOT NULL,
  `questionId` VARCHAR(50) NOT NULL,
  `grauEscolaridade` VARCHAR(40) NULL DEFAULT NULL,
  `tipoVinculo` VARCHAR(28) NULL DEFAULT NULL,
  `value` INT NULL DEFAULT NULL,
  INDEX `_id_fk_idx` (`_id` ASC) VISIBLE,
  INDEX `templatId_fk_idx` (`templateId` ASC, `questionId` ASC) VISIBLE,
  CONSTRAINT `_id_fk00`
    FOREIGN KEY (`_id`)
    REFERENCES `consad`.`tb_forms_respondentes` (`_id`),
  CONSTRAINT `questionRef_fk00`
    FOREIGN KEY (`templateId` , `questionId`)
    REFERENCES `consad`.`dm_questions` (`templateId` , `questionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `consad`.`tb_exonerados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consad`.`tb_exonerados` (
  `_id` VARCHAR(24) NOT NULL,
  `templateId` VARCHAR(36) NOT NULL,
  `questionId` VARCHAR(50) NOT NULL,
  `orgao` VARCHAR(100) NULL DEFAULT NULL,
  `motivo` VARCHAR(50) NULL DEFAULT NULL,
  `value` INT NULL DEFAULT NULL,
  INDEX `_id_fk_idx` (`_id` ASC) VISIBLE,
  INDEX `templatId_fk_idx` (`templateId` ASC, `questionId` ASC) VISIBLE,
  CONSTRAINT `_id_fk00000`
    FOREIGN KEY (`_id`)
    REFERENCES `consad`.`tb_forms_respondentes` (`_id`),
  CONSTRAINT `questionRef_fk00000`
    FOREIGN KEY (`templateId` , `questionId`)
    REFERENCES `consad`.`dm_questions` (`templateId` , `questionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `consad`.`tb_faixa_etaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consad`.`tb_faixa_etaria` (
  `_id` VARCHAR(24) NOT NULL,
  `templateId` VARCHAR(36) NOT NULL,
  `questionId` VARCHAR(50) NOT NULL,
  `faixaEtaria` VARCHAR(15) NULL DEFAULT NULL,
  `tipoVinculo` VARCHAR(28) NULL DEFAULT NULL,
  `value` INT NULL DEFAULT NULL,
  INDEX `_id_fk_idx` (`_id` ASC) VISIBLE,
  INDEX `templatId_fk_idx` (`templateId` ASC, `questionId` ASC) VISIBLE,
  CONSTRAINT `_id_fk0000`
    FOREIGN KEY (`_id`)
    REFERENCES `consad`.`tb_forms_respondentes` (`_id`),
  CONSTRAINT `questionRef_fk0000`
    FOREIGN KEY (`templateId` , `questionId`)
    REFERENCES `consad`.`dm_questions` (`templateId` , `questionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `consad`.`tb_func_confianca_gratificada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consad`.`tb_func_confianca_gratificada` (
  `_id` VARCHAR(24) NOT NULL,
  `templateId` VARCHAR(36) NOT NULL,
  `questionId` VARCHAR(50) NOT NULL,
  `orgao` VARCHAR(100) NULL DEFAULT NULL,
  `funcao` VARCHAR(25) NULL DEFAULT NULL,
  `value` INT NULL DEFAULT NULL,
  INDEX `_id_fk_idx` (`_id` ASC) VISIBLE,
  INDEX `templatId_fk_idx` (`templateId` ASC, `questionId` ASC) VISIBLE,
  CONSTRAINT `_id_fk00000000`
    FOREIGN KEY (`_id`)
    REFERENCES `consad`.`tb_forms_respondentes` (`_id`),
  CONSTRAINT `questionRef_fk00000000`
    FOREIGN KEY (`templateId` , `questionId`)
    REFERENCES `consad`.`dm_questions` (`templateId` , `questionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `consad`.`tb_genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consad`.`tb_genero` (
  `_id` VARCHAR(24) NOT NULL,
  `templateId` VARCHAR(36) NOT NULL,
  `questionId` VARCHAR(50) NOT NULL,
  `sexo` VARCHAR(10) NULL DEFAULT NULL,
  `tipoVinculo` VARCHAR(28) NULL DEFAULT NULL,
  `value` INT NULL DEFAULT NULL,
  INDEX `_id_fk_idx` (`_id` ASC) VISIBLE,
  INDEX `templatId_fk_idx` (`templateId` ASC, `questionId` ASC) VISIBLE,
  CONSTRAINT `_id_fk000`
    FOREIGN KEY (`_id`)
    REFERENCES `consad`.`tb_forms_respondentes` (`_id`),
  CONSTRAINT `questionRef_fk000`
    FOREIGN KEY (`templateId` , `questionId`)
    REFERENCES `consad`.`dm_questions` (`templateId` , `questionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `consad`.`tb_licenca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consad`.`tb_licenca` (
  `_id` VARCHAR(24) NOT NULL,
  `templateId` VARCHAR(36) NOT NULL,
  `questionId` VARCHAR(50) NOT NULL,
  `orgao` VARCHAR(100) NULL DEFAULT NULL,
  `licenca` VARCHAR(64) NULL DEFAULT NULL,
  `value` INT NULL DEFAULT NULL,
  INDEX `_id_fk_idx` (`_id` ASC) VISIBLE,
  INDEX `templatId_fk_idx` (`templateId` ASC, `questionId` ASC) VISIBLE,
  CONSTRAINT `_id_fk000000`
    FOREIGN KEY (`_id`)
    REFERENCES `consad`.`tb_forms_respondentes` (`_id`),
  CONSTRAINT `questionRef_fk000000`
    FOREIGN KEY (`templateId` , `questionId`)
    REFERENCES `consad`.`dm_questions` (`templateId` , `questionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `consad`.`tb_values_orgaos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consad`.`tb_values_orgaos` (
  `_id` VARCHAR(24) NOT NULL,
  `templateId` VARCHAR(36) NOT NULL,
  `questionId` VARCHAR(50) NOT NULL,
  `orgao` VARCHAR(100) NULL DEFAULT NULL,
  `value` INT NULL DEFAULT NULL,
  INDEX `_id_fk_idx` (`_id` ASC) VISIBLE,
  INDEX `templatId_fk_idx` (`templateId` ASC, `questionId` ASC) VISIBLE,
  CONSTRAINT `_id_fk0`
    FOREIGN KEY (`_id`)
    REFERENCES `consad`.`tb_forms_respondentes` (`_id`),
  CONSTRAINT `questionRef_fk0`
    FOREIGN KEY (`templateId` , `questionId`)
    REFERENCES `consad`.`dm_questions` (`templateId` , `questionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `consad`.`tb_values_vinculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consad`.`tb_values_vinculos` (
  `_id` VARCHAR(24) NOT NULL,
  `templateId` VARCHAR(36) NOT NULL,
  `questionId` VARCHAR(50) NOT NULL,
  `tipoVinculo` VARCHAR(45) NULL DEFAULT NULL,
  `value` INT NULL DEFAULT NULL,
  INDEX `_id_fk_idx` (`_id` ASC) VISIBLE,
  INDEX `questionRef_fk_idx` (`templateId` ASC, `questionId` ASC) INVISIBLE,
  CONSTRAINT `_id_fk`
    FOREIGN KEY (`_id`)
    REFERENCES `consad`.`tb_forms_respondentes` (`_id`),
  CONSTRAINT `questionRef_fk`
    FOREIGN KEY (`templateId` , `questionId`)
    REFERENCES `consad`.`dm_questions` (`templateId` , `questionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
