
-- Create and use db
CREATE DATABASE IF NOT EXISTS `kw_dev`;

USE `kw_dev`;


-- Primary Tables
-- Ingredient
CREATE TABLE `Ingredient` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` CHAR(255) NULL,

    UNIQUE INDEX `Ingredient_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Note
CREATE TABLE `Note` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `text` VARCHAR(191) NULL,
    `recipe_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Person
CREATE TABLE `Person` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255),
  `phone` VARCHAR(255),

  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Recipe
CREATE TABLE `Recipe` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` CHAR(255) NULL,
    `servings` INTEGER NULL,
    `preptime` INTEGER NULL,
    `cooktime` INTEGER NULL,
    `instructions` VARCHAR(191) NULL,
    `photourl` CHAR(255) NULL,

    UNIQUE INDEX `Recipe_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- ShoppingList
CREATE TABLE `ShoppingList` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `listName` CHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Tag
CREATE TABLE `Tag` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` CHAR(255) NOT NULL,

    UNIQUE INDEX `Tag_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;



-- Junction Tables

-- PeopleShoppingLists
CREATE TABLE `PeopleShoppingLists`(
  `person_id` INTEGER NOT NULL,
  `shoppinglist_id` INTEGER NOT NULL,

  PRIMARY KEY (`person_id`,`shoppinglist_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- RecipeIngredients
CREATE TABLE `RecipeIngredients` (
    `recipe_id` INTEGER NOT NULL,
    `ingredient_id` INTEGER NOT NULL,

    PRIMARY KEY (`recipe_id`, `ingredient_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- ShoppingIngredients
CREATE TABLE `ShoppingIngredients` (
    `shopping_id` INTEGER NOT NULL,
    `ingredient_id` INTEGER NOT NULL,

    PRIMARY KEY (`shopping_id`, `ingredient_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- RecipeTags
CREATE TABLE `RecipeTags` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `recipe_id` INTEGER NULL,
    `tag_id` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;




-- Add foreign keys after table creation to avoid errors

-- Add recipe_id Foreign Key to Note
ALTER TABLE `Note` ADD CONSTRAINT `Note_recipe_id_fkey` FOREIGN KEY (`recipe_id`) REFERENCES `Recipe`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Add person_id Foreign Key to PeopleShoppingLists
ALTER TABLE `PeopleShoppingLists` ADD CONSTRAINT `person_id_fkey` FOREIGN KEY (`person_id`) REFERENCES `Person`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Add shoppinglist_id Foreign Key to PeopleShoppingLists
ALTER TABLE `PeopleShoppingLists` ADD CONSTRAINT `shoppinglist_id_fkey` FOREIGN KEY (`shoppinglist_id`) REFERENCES `ShoppingList`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Add ingredient_id Foreign Key to RecipeIngredients
ALTER TABLE `RecipeIngredients` ADD CONSTRAINT `RecipeIngredients_ingredient_id_fkey` FOREIGN KEY (`ingredient_id`) REFERENCES `Ingredient`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Add recipe_id Foreign Key to RecipeIngredients
ALTER TABLE `RecipeIngredients` ADD CONSTRAINT `RecipeIngredients_recipe_id_fkey` FOREIGN KEY (`recipe_id`) REFERENCES `Recipe`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Add ingredient_id Foreign Key to Shopping Ingredients
ALTER TABLE `ShoppingIngredients` ADD CONSTRAINT `ShoppingIngredients_ingredient_id_fkey` FOREIGN KEY (`ingredient_id`) REFERENCES `Ingredient`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Add shopping_id Foreign Key to ShoppingIngredients
ALTER TABLE `ShoppingIngredients` ADD CONSTRAINT `ShoppingIngredients_shopping_id_fkey` FOREIGN KEY (`shopping_id`) REFERENCES `ShoppingList`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Add recipe_id Foreign Key to RecipeTags
ALTER TABLE `RecipeTags` ADD CONSTRAINT `RecipeTags_recipe_id_fkey` FOREIGN KEY (`recipe_id`) REFERENCES `Recipe`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Add tag_id Foreign Key to RecipeTags
ALTER TABLE `RecipeTags` ADD CONSTRAINT `RecipeTags_tag_id_fkey` FOREIGN KEY (`tag_id`) REFERENCES `Tag`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
