-- SELECT all ingredients ordered by id
SELECT * FROM `Ingredient` ORDER BY id ASC;

-- SELECT all ingredients ordered by name
SELECT * FROM `Ingredient` ORDER BY name ASC;

-- SELECT all Ingredients associated with Recipe 1
SELECT
  Ingredient.*,
  Recipe.id as RecipeId,
  Recipe.name as RecipeName
FROM `RecipeIngredients`
JOIN `Recipe` ON RecipeIngredients.recipe_id = Recipe.id
JOIN `Ingredient` ON RecipeIngredients.ingredient_id = Ingredient.id
Where RecipeIngredients.recipe_id = 1;

-- SELECT all Ingredients associated with Recipe 2
SELECT
  Ingredient.*,
  Recipe.id as RecipeId,
  Recipe.name as RecipeName
FROM `RecipeIngredients`
JOIN `Recipe` ON RecipeIngredients.recipe_id = Recipe.id
JOIN `Ingredient` ON RecipeIngredients.ingredient_id = Ingredient.id
Where RecipeIngredients.recipe_id = 2; 

-- SELECT all Ingredients with count of Recipes they're used in
SELECT
  Ingredient.id AS IngId, Ingredient.name AS IngName,
  Count(*) as NumRecipes
FROM `RecipeIngredients`
INNER JOIN Ingredient ON RecipeIngredients.ingredient_id = Ingredient.id
INNER JOIN `Recipe` ON RecipeIngredients.recipe_id = Recipe.id
GROUP BY Ingredient.id;

-- SELECT all Ingredients with count of shopping lists they're on
SELECT
  Ingredient.id AS IngId, Ingredient.name AS IngName,
  Count(*) as ShoppingLists
FROM `ShoppingIngredients`
INNER JOIN `Ingredient` ON ShoppingIngredients.ingredient_id = Ingredient.id
INNER JOIN `ShoppingList` ON ShoppingIngredients.shopping_id = ShoppingList.id
GROUP BY Ingredient.id;

-- SELECT all ingredients associated with more than one Recipe
SELECT
  Ingredient.name as Ingredient,
  Recipe.name as Recipe,
  Count(RecipeIngredients.ingredient_id) as NumberOfRecipes
FROM `RecipeIngredients`
JOIN `Ingredient` ON RecipeIngredients.ingredient_id = Ingredient.id
JOIN `Recipe` ON RecipeIngredients.recipe_id = Recipe.id
GROUP BY Recipe
HAVING Count(DISTINCT RecipeIngredients.ingredient_id) > 1
ORDER BY NumberOfRecipes;