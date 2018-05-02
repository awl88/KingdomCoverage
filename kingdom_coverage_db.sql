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
  `id` INT NOT NULL AUTO_INCREMENT,
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
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
  `name` VARCHAR(100) NULL DEFAULT 'Custom',
  `create_date` DATE NOT NULL,
  `end_date` DATE NULL,
  `active` CHAR(1) NOT NULL,
  `insured_id` INT NOT NULL,
  `agent_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_insurance_plan_insured_id_to_insured_id_idx` (`insured_id` ASC),
  INDEX `fk_insurance_plan_agent_id_to_agent_id_idx` (`agent_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
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
-- Table `coverage_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coverage_type` ;

CREATE TABLE IF NOT EXISTS `coverage_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `cost` DECIMAL(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `plan_coverage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `plan_coverage` ;

CREATE TABLE IF NOT EXISTS `plan_coverage` (
  `insurance_plan_id` INT NOT NULL AUTO_INCREMENT,
  `coverage_id` INT NOT NULL,
  INDEX `fk_plan_coverage_insurance_plan_id_insurance_plan_id_idx` (`insurance_plan_id` ASC),
  PRIMARY KEY (`insurance_plan_id`, `coverage_id`),
  INDEX `fk_plan_coverage_coverage_id_to_coverage_id_idx` (`coverage_id` ASC),
  CONSTRAINT `fk_plan_coverage_insurance_plan_id_to_insurance_plan_id`
    FOREIGN KEY (`insurance_plan_id`)
    REFERENCES `insurance_plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plan_coverage_coverage_id_to_coverage_type_id`
    FOREIGN KEY (`coverage_id`)
    REFERENCES `coverage_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `message` ;

CREATE TABLE IF NOT EXISTS `message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `insured_id` INT NOT NULL,
  `agent_id` INT NOT NULL,
  `message_body` VARCHAR(500) NOT NULL,
  `admin` VARCHAR(45) NULL,
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
INSERT INTO `user` (`id`, `name`, `password`) VALUES (1, 'jakethesnake', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (2, 'RAAllen', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (3, 'EliHarper', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (4, 'addufres', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (5, 'awl88', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (6, 'bilbo', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (7, 'gandalf', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (8, 'chlodowig', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (9, 'turpin', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (10, 'ragnfred', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (11, 'folco', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (12, 'angilbart', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (13, 'scudamor', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (14, 'isembold', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (15, 'wichmann', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (16, 'filibert', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (17, 'gorbadoc', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (18, 'verbena', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (19, 'viola', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (20, 'pointsetta', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (21, 'clematis', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (22, 'corna', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (23, 'cercis', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (24, 'cleome', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (25, 'datura', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (26, 'jade', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (27, 'angelonia', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (28, 'nukuhr', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (29, 'orug', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (30, 'ukog', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (31, 'kusikug', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (32, 'baarug', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (33, 'braytynth', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (34, 'qodrayn', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (35, 'imun', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (36, 'kenia', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (37, 'anfalen', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (38, 'rosaria', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (39, 'gaeleath', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (40, 'laamtora', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (41, 'iolas', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (42, 'helartha', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (43, 'xhalth', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (44, 'jakdroukara', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (45, 'dhodreak', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (46, 'yarraeginn', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (47, 'yarsal', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (48, 'grourgaemora', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (49, 'nuradmoth', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (50, 'darerheamora', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (51, 'fizzin', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (52, 'sapphira', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (53, 'aliester', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (54, 'muto', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (55, 'wrobgant', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (56, 'zlukbarg', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (57, 'bumjar', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (58, 'cliglo', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (59, 'japrecuss', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (60, 'wreaq', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (61, 'anilk', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (62, 'verestag', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (63, 'clobor', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (64, 'larry', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (65, 'asteria', 'wombat1');
INSERT INTO `user` (`id`, `name`, `password`) VALUES (66, 'charlietheunicorn', 'wombat1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `species`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (1, 'Hobbit', 0.5);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (2, 'Human', 1.2);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (3, 'Ogre', 1.4);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (4, 'Dragon', 0.9);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (5, 'Elf', 0.9);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (6, 'Dwarf', 2.7);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (7, 'Vampire', 7.3);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (8, 'Giant', 2.1);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (9, 'Gnome', 0.5);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (10, 'Goblin', 3.2);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (11, 'Gremlin', 1.2);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (12, 'Centaur', 2.7);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (13, 'Kobold', 4.7);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (14, 'Werewolf', 6.1);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (15, 'Dryad', 1.4);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (16, 'Nymph', 1.6);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (17, 'Mermaid', 0.7);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (18, 'Unicorn', 10.3);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (19, 'Cyclops', 6.3);
INSERT INTO `species` (`id`, `name`, `cost_multiplier`) VALUES (20, 'Treant', 1.2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `occupation`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (1, 'Adventurer', 1.5);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (2, 'Wizard', 1.3);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (3, 'Paladin', 1.1);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (4, 'Friar', 0.8);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (5, 'Dragon Slayer', 7.2);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (6, 'Slave Master', 4.2);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (7, 'Programmer', 3.14);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (8, 'Treasure Hunter', 5.1);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (9, 'Sage', 0.8);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (10, 'Assassin', 10.0);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (11, 'Cheesemaker', 0.5);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (12, 'Pirate', 4.1);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (13, 'Milkmaid', 0.3);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (14, 'Peasant', 2.1);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (15, 'Thief', 5.2);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (16, 'Healer', 1.1);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (17, 'Guildmaster', 9.7);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (18, 'Loremaster', 0.8);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (19, 'Minstrel', 0.9);
INSERT INTO `occupation` (`id`, `name`, `cost_multiplier`) VALUES (20, 'Ranger', 2.3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (1, '11 Jagged Way', 'Hobbiton', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (2, '12 Eastern Alley', 'Bonewind', 'The Malachite Isles');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (3, '10 Ethereal Passage', 'Smoothfell', 'The Destiny Forest');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (4, '17 Giant Leap Alley', 'Swiftguard', 'The Obscure Vales');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (5, '29 Blue Trail', 'Eldermeadow', 'The Barbarian World');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (6, '30 Restless Lane', 'Stormford', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (7, '20 Gnums Pass', 'Stormbreak', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (8, '11 Vluq Walk', 'Gloomshade\n', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (9, '12 Fiipt Alley', 'Cragrock\n', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (10, '31 Sremom Trail', 'Oakendrift\n', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (11, '24 Shimmering Pass', 'Earthwatch', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (12, '41 Thornbush Path', 'Deadside', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (13, '51 Five Mile Passage', 'Dewburn', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (14, '27 Isolation Pass', 'Dogtide', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (15, '71 Tavern Pass', 'Mightmount', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (16, '20 Terraced Pass', 'Ravenpond', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (17, '31 Tros Way', 'Dewharbor', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (18, '51 Trars Route', 'Wolfview', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (19, '36 Truob Route', 'Freyview', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (20, '54 Tamis Lane', 'Newwater', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (21, '38 Moonset Route', 'Roserun', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (22, '26 Stepping Stone Trail', 'Knightborough', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (23, '66 Blue Comet Path', 'Whitfell', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (24, '102 Lost Soul Street', 'Dimmount', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (25, '101 Basilisk Lane', 'Millhost', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (26, '107 Golden Route', 'Springhorn', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (27, '203 Glawth Lane', 'Pinewood', 'Middle Earth');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (28, '202 Ons Trail', 'Deadgrave', 'The Malachite Isles');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (29, '145 Wropur Alley', 'Mythview', 'The Malachite Isles');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (30, '69 Klebilf Road', 'Fayfalls', 'The Malachite Isles');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (31, '205 Frightening Highway', 'Eastville', 'The Malachite Isles');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (32, '55 Frozen Mountain Route', 'Elderyard', 'The Malachite Isles');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (33, '61 Living Passage', 'Lagoonmore', 'The Malachite Isles');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (34, '69 Champion\'s Pass', 'Slychill', 'The Malachite Isles');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (35, '94 Strawberry Route', 'Slygrasp', 'The Malachite Isles');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (36, '77 Black Castle Highway', 'Grimgarde', 'The Malachite Isles');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (37, '81 Durf Street', 'Purehollow', 'The Malachite Isles');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (38, '82 Crurt Alley', 'Wolfstrand', 'The Destiny Forest');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (39, '33 Fonils Avenue', 'Brittlemoor\n', 'The Destiny Forest');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (40, '74 Kloxyhx Avenue', 'Moonmere', 'The Destiny Forest');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (41, '32 Riverside Route', 'Swiftbell', 'The Destiny Forest');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (42, '22 Lurking Crows Route', 'Basinmount', 'The Destiny Forest');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (43, '99 Queen\'s Street', 'Mutepond', 'The Destiny Forest');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (44, '103 Champion\'s Path', 'Blindhand', 'The Destiny Forest');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (45, '202 Broken Ruins Highway', 'Wildscar', 'The Destiny Forest');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (46, '203 Roaming Giant Lane', 'Shimmercliff', 'The Obscure Vales');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (47, '304 Slilt Avenue', 'Fairdenn', 'The Obscure Vales');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (48, '444 Tolp Walk', 'Dawnfair', 'The Obscure Vales');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (49, '222 Wokikx Passage', 'Bridgegate', 'The Obscure Vales');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (50, '308 Vruim Lane', 'Smoothhand', 'The Obscure Vales');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (51, '445 Thundercloud Walk', 'Crystalfell', 'The Obscure Vales');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (52, '33 Fallen Soldier Walk\n', 'Wildeminster', 'The Obscure Vales');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (53, '44 Black Brick Route\n', 'Flatport', 'The Obscure Vales');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (54, '50 Phoenix Avenue\n', 'Midmire', 'The Barbarian World');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (55, '55 Pigmy Street\n', 'Thorncliff', 'The Barbarian World');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (56, '43 Hurricane Street\n', 'Brineshire', 'The Barbarian World');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (57, '67 Qys Trail\n', 'Silvercrest', 'The Barbarian World');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (58, '74 Srymn Trail\n', 'Bronzeshear', 'The Barbarian World');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (59, '85 Zuwysk Way\n', 'Wildespire', 'The Barbarian World');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (60, '88 Hotehr Route\n', 'Westfrost', 'The Barbarian World');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (61, '13 Fabled Way', 'Evergrove', 'The Malachite Isles');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (62, '63 Silent Pass\n', 'Shademaw', 'The Destiny Forest');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (63, '84 Lava Flow Path\n', 'Crowhand', 'The Obscure Vales');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (64, '99 Lava Flow Alley\n', 'Rockkeep', 'The Barbarian World');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (65, '102 Blue Comet Track\n', 'Fearwood', 'The Barbarian World');
INSERT INTO `address` (`id`, `street`, `city`, `realm`) VALUES (66, '101 Gumdrop Way', 'Candy Mountain', 'The Barbarian World');

COMMIT;


-- -----------------------------------------------------
-- Data for table `insured`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (1, 131, 'm', 1, 1, 6, 6, 'Bilbo', 'Baggins');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (2, 2000, 'm', 2, 2, 7, 7, 'Gandalf', 'The Grey');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (3, 25, 'm', 1, 11, 8, 8, 'Chlodowig', 'Mugwort');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (4, 43, 'm', 1, 3, 9, 9, 'Turpin', 'Stoor');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (5, 44, 'm', 2, 4, 10, 10, 'Ragnfred', 'Clayhanger');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (6, 54, 'm', 1, 8, 11, 11, 'Folco', 'Hayward');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (7, 76, 'm', 1, 6, 12, 12, 'Angilbart', 'Boffin');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (8, 17, 'm', 2, 5, 13, 13, 'Scudamor', 'Sandyman');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (9, 38, 'm', 1, 9, 14, 14, 'Isembold', 'Brown');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (10, 99, 'm', 1, 7, 15, 15, 'Wichmann', 'Whitfoot');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (11, 47, 'm', 1, 10, 16, 16, 'Filibert', 'Twofoot');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (12, 32, 'm', 2, 15, 17, 17, 'Gorbadoc', 'Lightfoot');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (13, 43, 'f', 1, 12, 18, 18, 'Verbena', 'Whitfoot');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (14, 22, 'f', 1, 13, 19, 19, 'Viola', 'Townsend');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (15, 21, 'f', 1, 14, 20, 20, 'Poinsetta', 'Oldbuck');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (16, 90, 'f', 1, 16, 21, 21, 'Clematis', 'Puddifoot');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (17, 43, 'f', 2, 17, 22, 22, 'Corna', 'Sackville');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (18, 77, 'f', 1, 18, 23, 23, 'Cercis', 'Zaragamba');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (19, 26, 'f', 1, 19, 24, 24, 'Cleome', 'Puddifoot');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (20, 37, 'f', 2, 20, 25, 25, 'Datura', 'Goodenough');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (21, 35, 'f', 1, 1, 26, 26, 'Jade', 'Greenholm');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (22, 24, 'f', 1, 6, 27, 27, 'Angelonia', 'Goold');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (23, 45, 'f', 3, 2, 28, 28, 'Nukuhr', 'Zorok');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (24, 30, 'm', 3, 3, 29, 29, 'Orug', 'Dozig');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (25, 22, 'f', 3, 4, 30, 30, 'Ukog', 'Drikozag');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (26, 34, 'm', 3, 5, 31, 31, 'Kusikug', 'Baarug');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (27, 77, 'f', 3, 7, 32, 32, 'Baarug', 'Zirozug');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (28, 103, 'm', 4, 8, 33, 33, 'Braytynth', 'The Voiceless');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (29, 99, 'f', 4, 9, 34, 34, 'Qodrayn', 'Giver Of Life');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (30, 77, 'm', 4, 10, 35, 35, 'Imun', 'The Youngling');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (31, 299, 'f', 5, 11, 36, 36, 'Kenia', 'Glynven');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (32, 301, 'm', 5, 12, 37, 37, 'Anfalen', 'Glynzana');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (33, 203, 'f', 5, 13, 38, 38, 'Rosaria', 'Kelmoira');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (34, 199, 'm', 5, 14, 39, 39, 'Gaeleath', 'Origolor');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (35, 175, 'f', 5, 15, 40, 40, 'Laamtora', 'Chaejor');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (36, 155, 'm', 5, 16, 41, 41, 'Iolas', 'Therona');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (37, 409, 'f', 5, 17, 42, 42, 'Helartha', 'Naewenys');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (38, 207, 'm', 5, 18, 43, 43, 'Xhalth', 'Iancaryn');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (39, 77, 'f', 6, 19, 44, 44, 'Jakdroukara', 'Jadebelly');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (40, 43, 'm', 6, 20, 45, 45, 'Dhodreak', 'Deepback');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (41, 44, 'f', 6, 1, 46, 46, 'Yarraeginn', 'Shadowbraid');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (42, 57, 'm', 6, 2, 47, 47, 'Yarsal', 'Mithrilmantle');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (43, 99, 'f', 6, 3, 48, 48, 'Grourgaemora', 'Oregrip');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (44, 21, 'm', 6, 4, 49, 49, 'Nuradmoth', 'Oakbelly');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (45, 22, 'f', 6, 5, 50, 50, 'Darerheamora', 'Snowspine');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (46, 33, 'm', 6, 6, 51, 51, 'Fizzin', 'Axeflayer');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (47, 599, 'f', 7, 7, 52, 52, 'Sapphira', 'The Seductress');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (48, 666, 'm', 7, 8, 53, 53, 'Aliester', 'The Ancient');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (49, 49, 'm', 8, 9, 54, 54, 'Muto', 'The Mutant');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (50, 77, 'm', 8, 10, 55, 55, 'Wrobgant', 'The Warmonger');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (51, 45, 'm', 8, 11, 56, 56, 'Zlukbarg', 'The Zealot');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (52, 44, 'm', 9, 12, 57, 57, 'Bumjur', 'Bankap');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (53, 23, 'f', 9, 13, 58, 58, 'Cliglo', 'Shedwon');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (54, 31, 'm', 9, 14, 59, 59, 'Japrecuss', 'Waundefinedepnass');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (55, 77, 'f', 10, 15, 60, 60, 'Wreaq', 'Tioqa');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (56, 55, 'm', 10, 16, 61, 61, 'Anilk', 'Griolsebs');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (57, 32, 'f', 12, 17, 62, 62, 'Verestag', 'Euxyfan');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (58, 29, 'm', 13, 18, 63, 63, 'Clobor', 'Uribates');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (59, 39, 'm', 14, 19, 64, 64, 'Larry', 'Longsnout');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (60, 107, 'm', 15, 20, 65, 65, 'Asteria', 'Sanguinea');
INSERT INTO `insured` (`id`, `age`, `gender`, `species_id`, `occupation_id`, `address_id`, `user_id`, `first_name`, `last_name`) VALUES (61, 13, 'm', 18, 1, 66, 66, 'Charlie', 'The Unicorn');

COMMIT;


-- -----------------------------------------------------
-- Data for table `agent`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `agent` (`id`, `first_name`, `last_name`, `address_id`, `user_id`) VALUES (1, 'Jake', 'From State Farm', 1, 1);
INSERT INTO `agent` (`id`, `first_name`, `last_name`, `address_id`, `user_id`) VALUES (2, 'Rebecca', 'Allen', 2, 2);
INSERT INTO `agent` (`id`, `first_name`, `last_name`, `address_id`, `user_id`) VALUES (3, 'Eli', 'Harper', 3, 3);
INSERT INTO `agent` (`id`, `first_name`, `last_name`, `address_id`, `user_id`) VALUES (4, 'Drew', 'Dufresne', 4, 4);
INSERT INTO `agent` (`id`, `first_name`, `last_name`, `address_id`, `user_id`) VALUES (5, 'Andrew', 'Lyon', 5, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `insurance_plan`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (1, '', '1999-01-01', '2000-01-01', 'n', 1, 1);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (2, NULL, '2011-02-12', NULL, 'y', 2, 1);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (3, NULL, '2016-04-28', NULL, 'y', 3, 1);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (4, NULL, '1998-10-22', '2002-01-22', 'n', 4, 1);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (5, NULL, '2001-02-03', NULL, 'y', 5, 1);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (6, NULL, '2005-01-01', NULL, 'y', 28, 2);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (7, NULL, '2003-06-09', '2007-06-09', 'n', 29, 2);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (8, NULL, '1999-02-19', NULL, 'y', 30, 2);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (9, NULL, '2009-08-01', NULL, 'y', 31, 2);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (10, NULL, '2010-03-07', '2013-03-07', 'n', 32, 2);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (11, NULL, '2011-02-04', NULL, 'y', 38, 3);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (12, NULL, '2014-05-17', NULL, 'y', 39, 3);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (13, NULL, '2015-01-01', '2016-01-01', 'n', 40, 3);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (14, NULL, '2017-04-22', NULL, 'y', 41, 3);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (15, NULL, '2009-05-04', '2011-05-04', 'n', 42, 3);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (16, NULL, '2004-02-16', NULL, 'y', 46, 4);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (17, NULL, '2005-07-17', NULL, 'y', 47, 4);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (18, NULL, '2007-01-08', NULL, 'y', 48, 4);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (19, NULL, '2011-03-05', '2014-03-05', 'n', 49, 4);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (20, NULL, '2008-08-18', NULL, 'y', 50, 4);
INSERT INTO `insurance_plan` (`id`, `name`, `create_date`, `end_date`, `active`, `insured_id`, `agent_id`) VALUES (21, NULL, '2001-01-01', NULL, 'y', 61, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `coverage_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (1, 'Castle', 50.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (2, 'Steed', 7.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (3, 'Galley', 11.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (4, 'Dinghy', 3.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (5, 'Cottage', 7.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (6, 'Camel', 8.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (7, ' Unicorn', 100.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (8, 'Arrow to the Knee', 7.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (9, 'Dragon Fire', 10.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (10, 'Shack', 3.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (11, 'Hobbit House', 1.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (12, 'Pegasus', 25.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (13, 'Caravel', 10.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (14, 'Hydra Bite', 21.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (15, 'Axe to the Elbow', 9.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (16, 'Hammer to the Humerus', 5.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (17, 'Magical Damage', 20.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (18, 'Vampire Bite', 10.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (19, 'Impalation', 11.0);
INSERT INTO `coverage_type` (`id`, `name`, `cost`) VALUES (20, 'Life', 13.0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `plan_coverage`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (1, 1);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (1, 2);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (2, 3);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (2, 6);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (3, 4);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (4, 5);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (4, 7);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (5, 8);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (6, 9);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (7, 10);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (7, 11);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (8, 12);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (8, 13);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (8, 14);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (9, 15);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (10, 16);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (10, 17);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (11, 18);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (11, 19);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (11, 20);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (12, 1);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (13, 2);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (13, 3);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (14, 4);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (14, 5);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (15, 6);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (15, 7);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (15, 8);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (16, 9);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (17, 10);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (17, 11);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (18, 12);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (19, 13);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (19, 14);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (20, 15);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (20, 16);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (20, 17);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 1);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 2);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 3);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 4);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 5);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 6);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 7);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 8);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 9);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 10);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 11);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 12);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 13);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 14);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 15);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 16);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 17);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 18);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 19);
INSERT INTO `plan_coverage` (`insurance_plan_id`, `coverage_id`) VALUES (21, 20);

COMMIT;


-- -----------------------------------------------------
-- Data for table `message`
-- -----------------------------------------------------
START TRANSACTION;
USE `kingdom_coverage_db`;
INSERT INTO `message` (`id`, `insured_id`, `agent_id`, `message_body`, `admin`) VALUES (1, 1, 1, 'Hey Jake. It\'s me Bilbo. What are you wearing?', 'n');
INSERT INTO `message` (`id`, `insured_id`, `agent_id`, `message_body`, `admin`) VALUES (2, 2, 1, 'Hey Jake. It\'s me Gandalf. What are you wearing?', 'n');
INSERT INTO `message` (`id`, `insured_id`, `agent_id`, `message_body`, `admin`) VALUES (3, 28, 2, 'Hey Rebecca. I was hoping you\'d be able to get me a new Dragon Fire coverage plan. Thanks!', 'n');
INSERT INTO `message` (`id`, `insured_id`, `agent_id`, `message_body`, `admin`) VALUES (4, 29, 2, 'Rebecca - I just got bit by a vampire, can you please contact me asap.', 'n');
INSERT INTO `message` (`id`, `insured_id`, `agent_id`, `message_body`, `admin`) VALUES (5, 38, 3, 'Hey Eli. I am planning on buying a new schooner. Can we get together at ye olde tavern to talk about boat insurance?', 'n');
INSERT INTO `message` (`id`, `insured_id`, `agent_id`, `message_body`, `admin`) VALUES (6, 39, 3, 'Eli - I am planning on going on a vacation to Morodor. I think I need to get a new plan.', 'n');
INSERT INTO `message` (`id`, `insured_id`, `agent_id`, `message_body`, `admin`) VALUES (7, 46, 4, 'Drew - A wizard just shot a fireball at my cottage and the thatch roof is on fire. HELP!', 'n');
INSERT INTO `message` (`id`, `insured_id`, `agent_id`, `message_body`, `admin`) VALUES (8, 47, 4, 'Hello Drew. I wanted to get together to talk about some unicorn insurance. I see one outside and I am going to go try to catch him.', 'n');
INSERT INTO `message` (`id`, `insured_id`, `agent_id`, `message_body`, `admin`) VALUES (9, 54, 5, 'Andrew- New York sucks.', 'n');
INSERT INTO `message` (`id`, `insured_id`, `agent_id`, `message_body`, `admin`) VALUES (10, 55, 5, 'Hey Andrew. Can we please get together soon to talk about a castle policy at ye olde tavern? Thanks.', NULL);

COMMIT;