-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema kingdom_coverage_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `kingdom_coverage_db` ;

-- -----------------------------------------------------
-- Schema kingdom_coverage_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `kingdom_coverage_db` DEFAULT CHARACTER SET utf8 ;
USE `kingdom_coverage_db` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `species`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `species` ;

CREATE TABLE IF NOT EXISTS `species` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `cost_multiplier` DECIMAL(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `occupation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `occupation` ;

CREATE TABLE IF NOT EXISTS `occupation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `cost_multiplier` DECIMAL(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(100) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `realm` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insured`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `insured` ;

CREATE TABLE IF NOT EXISTS `insured` (
  `id` INT NOT NULL,
  `age` INT NOT NULL,
  `gender` CHAR(1) NOT NULL,
  `species_id` INT NOT NULL,
  `occupation_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  INDEX `fk_insured_species_id_to_species_id_idx` (`species_id` ASC),
  INDEX `fk_insured_occupation_id_to_occupation_id_idx` (`occupation_id` ASC),
  INDEX `fk_insured_address_id_to_address_id_idx` (`address_id` ASC),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `species_id_UNIQUE` (`species_id` ASC),
  UNIQUE INDEX `occupation_id_UNIQUE` (`occupation_id` ASC),
  UNIQUE INDEX `address_id_UNIQUE` (`address_id` ASC),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC),
  CONSTRAINT `fk_insured_species_id_to_species_id`
    FOREIGN KEY (`species_id`)
    REFERENCES `species` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_insured_occupation_id_to_occupation_id`
    FOREIGN KEY (`occupation_id`)
    REFERENCES `occupation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_insured_address_id_to_address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_insured_user_id_to_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agent` ;

CREATE TABLE IF NOT EXISTS `agent` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `address_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_agent_address_id_to_address_id_idx` (`address_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `address_id_UNIQUE` (`address_id` ASC),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC),
  CONSTRAINT `fk_agent_address_id_to_address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agent_user_id_to_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insurance_plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `insurance_plan` ;

CREATE TABLE IF NOT EXISTS `insurance_plan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `create_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `active` CHAR(1) NOT NULL,
  `insured_id` INT NOT NULL,
  `agent_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_insurance_plan_insured_id_to_insured_id_idx` (`insured_id` ASC),
  INDEX `fk_insurance_plan_agent_id_to_agent_id_idx` (`agent_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `insured_id_UNIQUE` (`insured_id` ASC),
  UNIQUE INDEX `agent_id_UNIQUE` (`agent_id` ASC),
  CONSTRAINT `fk_insurance_plan_insured_id_to_insured_id`
    FOREIGN KEY (`insured_id`)
    REFERENCES `insured` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_insurance_plan_agent_id_to_agent_id`
    FOREIGN KEY (`agent_id`)
    REFERENCES `agent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `option`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `option` ;

CREATE TABLE IF NOT EXISTS `option` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `cost` DECIMAL(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `plan_option`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `plan_option` ;

CREATE TABLE IF NOT EXISTS `plan_option` (
  `insurance_plan_id` INT NOT NULL,
  `option_id` INT NOT NULL,
  INDEX `fk_plan_option_insurance_plan_id_insurance_plan_id_idx` (`insurance_plan_id` ASC),
  PRIMARY KEY (`insurance_plan_id`, `option_id`),
  INDEX `fk_plan_option_option_id_to_option_id_idx` (`option_id` ASC),
  UNIQUE INDEX `insurance_plan_id_UNIQUE` (`insurance_plan_id` ASC),
  UNIQUE INDEX `option_id_UNIQUE` (`option_id` ASC),
  CONSTRAINT `fk_plan_option_insurance_plan_id_to_insurance_plan_id`
    FOREIGN KEY (`insurance_plan_id`)
    REFERENCES `insurance_plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plan_option_option_id_to_options_id`
    FOREIGN KEY (`option_id`)
    REFERENCES `option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `message` ;

CREATE TABLE IF NOT EXISTS `message` (
  `id` INT NOT NULL,
  `insured_id` INT NOT NULL,
  `agent_id` INT NOT NULL,
  `message_body` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_message_insured_id_to_agent__idx` (`insured_id` ASC),
  INDEX `fk_message_agent_id_to_agent_id_idx` (`agent_id` ASC),
  CONSTRAINT `fk_message_insured_id_to_insurance_agent_`
    FOREIGN KEY (`insured_id`)
    REFERENCES `insured` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_agent_id_to_agent_id`
    FOREIGN KEY (`agent_id`)
    REFERENCES `agent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO admin;
 DROP USER admin;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'admin' IDENTIFIED BY 'admin';

GRANT SELECT, INSERT, TRIGGER ON TABLE * TO 'admin';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'admin';
SET SQL_MODE = '';
GRANT USAGE ON *.* TO user;
 DROP USER user;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'user' IDENTIFIED BY 'user';

GRANT SELECT ON TABLE * TO 'user';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `user` (`id`, `name`, `password`) VALUES (1, 'bilbo', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (2, 'gandalf', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (3, 'jake', 'wombat1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `species`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (1, 'Hobbit', 0.5);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (2, 'Human', 1.2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `occupation`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (1, 'Adventurer', 1.5);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (2, 'Wizard', 1.3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (1, '123 Fake St.', 'Hobbiton', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (2, '123 Street St.', 'Mordor', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (3, '123 Road St.', 'Denver', 'Earth');

COMMIT;


-- -----------------------------------------------------
-- Data for table `insured`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (1, 131, 'm', 1, 1, 1, 1, 'Bilbo', 'Baggins');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (2, 2000, 'm', 2, 2, 2, 2, 'Gandalf', 'The White');

COMMIT;


-- -----------------------------------------------------
-- Data for table `agent`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `agent` (`id`, `name`, `address_id`, `user_id`) VALUES (1, 'Jake', 3, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `insurance_plan`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (1, 'Wizard Plan', '1999-01-01', '1999-01-01', 'y', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `option`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `option` (`id`, `name`, `cost`) VALUES (1, 'Dragon Burns', 50);

COMMIT;


-- -----------------------------------------------------
-- Data for table `plan_option`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `plan_option` (`insurance_plan_id`, `option_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `message`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `message` (`id`, `insured_id`, `agent_id`, `message_body`) VALUES (1, 1, 1, 'This is a message.');

COMMIT;
