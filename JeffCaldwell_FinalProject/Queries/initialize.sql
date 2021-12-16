
-- Create and use db
CREATE DATABASE IF NOT EXISTS `kw_dev`;

USE `kw_dev`;


-- Primary Tables
-- Ingredient
CREATE TABLE `Ingredient` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NULL,

    UNIQUE INDEX `Ingredient_name_key`(`name`),
    PRIMARY KEY (`id`)
);

-- Note
CREATE TABLE `Note` (
    `id` int NOT NULL AUTO_INCREMENT,
    `text` VARCHAR(191) NULL,
    `recipe_id` int NOT NULL,

    PRIMARY KEY (`id`)
);

-- Person
CREATE TABLE `Person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255),
  `phone` VARCHAR(255),

  UNIQUE INDEX `Person_email_key`(`email`),
  PRIMARY KEY (`id`)
);


-- Recipe
CREATE TABLE `Recipe` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NULL,
    `servings` int,
    `preptime` int,
    `cooktime` int,
    `instructions` text,
    `photourl` varchar(255),

    UNIQUE INDEX `Recipe_name_key`(`name`),
    PRIMARY KEY (`id`)
);


-- ShoppingList
CREATE TABLE `ShoppingList` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,

    PRIMARY KEY (`id`)
);

-- Junction Tables --

-- PeopleShoppingLists
CREATE TABLE `PeopleShoppingLists`(
  `person_id` int NOT NULL,
  `shopping_id` int NOT NULL,

  PRIMARY KEY (`person_id`,`shopping_id`)
);

-- RecipeIngredients
CREATE TABLE `RecipeIngredients` (
    `recipe_id` int NOT NULL,
    `ingredient_id` int NOT NULL,

    PRIMARY KEY (`recipe_id`, `ingredient_id`)
);

-- ShoppingIngredients
CREATE TABLE `ShoppingIngredients` (
    `shopping_id` int NOT NULL,
    `ingredient_id` int NOT NULL,

    PRIMARY KEY (`shopping_id`, `ingredient_id`)
);



-- Add foreign keys after table creation to avoid errors

-- Add recipe_id Foreign Key to Note
ALTER TABLE `Note` ADD CONSTRAINT `Note_recipe_id_fkey` FOREIGN KEY (`recipe_id`) REFERENCES `Recipe`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Add person_id Foreign Key to PeopleShoppingLists
ALTER TABLE `PeopleShoppingLists` ADD CONSTRAINT `person_id_fkey` FOREIGN KEY (`person_id`) REFERENCES `Person`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Add shoppinglist_id Foreign Key to PeopleShoppingLists
ALTER TABLE `PeopleShoppingLists` ADD CONSTRAINT `shoppinglist_id_fkey` FOREIGN KEY (`shopping_id`) REFERENCES `ShoppingList`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Add ingredient_id Foreign Key to RecipeIngredients
ALTER TABLE `RecipeIngredients` ADD CONSTRAINT `RecipeIngredients_ingredient_id_fkey` FOREIGN KEY (`ingredient_id`) REFERENCES `Ingredient`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Add recipe_id Foreign Key to RecipeIngredients
ALTER TABLE `RecipeIngredients` ADD CONSTRAINT `RecipeIngredients_recipe_id_fkey` FOREIGN KEY (`recipe_id`) REFERENCES `Recipe`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Add ingredient_id Foreign Key to Shopping Ingredients
ALTER TABLE `ShoppingIngredients` ADD CONSTRAINT `ShoppingIngredients_ingredient_id_fkey` FOREIGN KEY (`ingredient_id`) REFERENCES `Ingredient`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Add shopping_id Foreign Key to ShoppingIngredients
ALTER TABLE `ShoppingIngredients` ADD CONSTRAINT `ShoppingIngredients_shopping_id_fkey` FOREIGN KEY (`shopping_id`) REFERENCES `ShoppingList`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

