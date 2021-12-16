-- SELECT all ShoppingList ordered by id
SELECT * FROM `ShoppingList` ORDER BY id ASC;

-- SELECT all ShoppingList ordered by name
SELECT * FROM `ShoppingList` ORDER BY name ASC;

-- SELECT ShoppingList associated with a given Person
SELECT
  ShoppingList.*,
  Person.name as AssignedTo
FROM `PeopleShoppingLists`
JOIN `Person` ON PeopleShoppingLists.person_id = Person.id
JOIN `ShoppingList` ON PeopleShoppingLists.shopping_id = ShoppingList.id
Where PeopleShoppingLists.person_id = 1;

-- SELECT all shopping lists grouped by person with count of items in each list
SELECT
  Person.name as Shopper,
  ShoppingList.name as Name,
  COUNT(ShoppingIngredients.ingredient_id) as NumItems
FROM `PeopleShoppingLists`
JOIN `Person` ON PeopleShoppingLists.person_id = Person.id
JOIN `ShoppingList` ON PeopleShoppingLists.shopping_id = ShoppingList.id
JOIN `ShoppingIngredients` ON PeopleShoppingLists.shopping_id = ShoppingIngredients.shopping_id
GROUP BY Person.id;

-- SELECT all ingredients on shopping list by id
SELECT
  Ingredient.name as WhatToBuy
FROM
  `ShoppingIngredients`
JOIN `Ingredient` on ShoppingIngredients.ingredient_id = Ingredient.id
JOIN `ShoppingList` ON ShoppingIngredients.shopping_id = ShoppingList.id
WHERE ShoppingList.id = 1
ORDER BY Ingredient.name ASC;

-- SELECT shopping list by Person.id and list all items with name
SELECT
  Ingredient.name as Item,
  Person.name as Shopper,
  ShoppingList.name as List
FROM
  `ShoppingIngredients`
JOIN `Ingredient` ON ShoppingIngredients.ingredient_id = Ingredient.id
JOIN `PeopleShoppingLists` ON ShoppingIngredients.shopping_id = PeopleShoppingLists.shopping_id
JOIN `Person` ON PeopleShoppingLists.person_id = Person.id
JOIN `ShoppingList` ON PeopleShoppingLists.shopping_id = ShoppingList.id
WHERE PeopleShoppingLists.person_id = 1;

-- SELECT shopping list by name LIKE
SELECT 
  ShoppingList.name as List,
  Ingredient.name as Item
FROM `ShoppingIngredients`
JOIN `Ingredient` ON ShoppingIngredients.ingredient_id = Ingredient.id
JOIN `ShoppingList` ON ShoppingIngredients.shopping_id = ShoppingList.id
WHERE ShoppingList.name LIKE '%HEB%';

-- SELECT items in shopping list by shopping list name LIKE
SELECT 
  Ingredient.name as Item
FROM `ShoppingIngredients`
JOIN `Ingredient` ON ShoppingIngredients.ingredient_id = Ingredient.id
JOIN `ShoppingList` ON ShoppingIngredients.shopping_id = ShoppingList.id
WHERE ShoppingList.name LIKE '%HEB%';