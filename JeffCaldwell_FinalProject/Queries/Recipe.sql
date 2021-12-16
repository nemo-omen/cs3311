
-- Simple SELECT
SELECT * FROM `Ingredient`;

-- SELECT all Recipes, their ingredients, and notes
SELECT
  Recipe.*,
  Ingredient.id as ingId,
  Ingredient.name as ingredient,
  Note.id as noteId,
  Note.text as note
FROM `RecipeIngredients`
JOIN `Recipe` ON RecipeIngredients.recipe_id = Recipe.id
JOIN `Ingredient` ON RecipeIngredients.ingredient_id = Ingredient.id
JOIN `Note` ON RecipeIngredients.recipe_id = Note.id;


-- SELECT a single Recipe, its ingredients, and notes
SELECT 
  Recipe.*,
  Ingredient.id as ingId,
  Ingredient.name as ingredient,
  Note.id as noteId,
  Note.text as note
FROM `RecipeIngredients`
JOIN `Recipe` ON RecipeIngredients.recipe_id = Recipe.id
JOIN `Ingredient` ON RecipeIngredients.ingredient_id = Ingredient.id
JOIN `Note` ON RecipeIngredients.recipe_id = Note.id
WHERE RecipeIngredients.recipe_id = 1;

-- SELECT Recipe and associated entities using Recipe.name LIKE
SELECT 
  Recipe.*,
  Ingredient.id as ingId,
  Ingredient.name as ingredient,
  Note.id as noteId,
  Note.text as note
FROM `RecipeIngredients`
JOIN `Recipe` ON RecipeIngredients.recipe_id = Recipe.id
JOIN `Ingredient` ON RecipeIngredients.ingredient_id = Ingredient.id
JOIN `Note` ON RecipeIngredients.recipe_id = Note.id
WHERE Recipe.name LIKE '%Peanut%';

-- SELECT Recipe by Ingredient.id
SELECT
  Recipe.*,
  Ingredient.name
FROM `RecipeIngredients`
JOIN `Recipe` ON RecipeIngredients.recipe_id = Recipe.id
JOIN `Ingredient` ON RecipeIngredients.ingredient_id = Ingredient.id
WHERE Ingredient.id = 2;

-- SELECT Recipe by Ingredient.name LIKE
SELECT
  Recipe.*,
  Ingredient.name
FROM `RecipeIngredients`
JOIN `Recipe` ON RecipeIngredients.recipe_id = Recipe.id
JOIN `Ingredient` ON RecipeIngredients.ingredient_id = Ingredient.id
WHERE Ingredient.name LIKE '%Cheese%';


-- SELECT Recipe where servings > n
SELECT
  Recipe.*,
  Ingredient.name as Ingredient
FROM `RecipeIngredients`
JOIN `Recipe` ON RecipeIngredients.recipe_id = Recipe.id
JOIN `Ingredient` ON RecipeIngredients.ingredient_id = Ingredient.id
GROUP BY Recipe.id
HAVING servings > 2;

-- UPDATES --

-- UPDATE with id
UPDATE
  `Recipe`
SET
  instructions = '1. Spread peanut butter on one slice of bread.\n 2. Spread jelly on the other slice of bread.\n 3. Place slices of bread together with peanut butter and jelly facing inward.\n 4. Serve.'
WHERE
  id = 1;