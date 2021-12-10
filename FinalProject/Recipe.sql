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

-- SELECT Recipe by ingredient
SELECT
  Recipe.*,
  Ingredient.name
FROM `RecipeIngredients`
JOIN `Recipe` ON RecipeIngredients.recipe_id = Recipe.id
JOIN `Ingredient` ON RecipeIngredients.ingredient_id = Ingredient.id
WHERE Ingredient.id = 2;