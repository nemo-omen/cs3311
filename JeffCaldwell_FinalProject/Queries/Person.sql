-- SELECT persons by name LIKE
SELECT * FROM `Person`
WHERE name LIKE '%jeff%';

-- SELECT Ingredient in ShoppingList associated with Person
-- using name LIKE as search
SELECT
  Ingredient.name as Item,
  ShoppingList.name
FROM
  `ShoppingIngredients`
JOIN `Ingredient` ON ShoppingIngredients.ingredient_id = Ingredient.id
JOIN `PeopleShoppingLists` ON ShoppingIngredients.shopping_id = PeopleShoppingLists.shopping_id
JOIN `Person` ON PeopleShoppingLists.person_id = Person.id
JOIN `ShoppingList` ON PeopleShoppingLists.shopping_id = ShoppingList.id
WHERE Person.name LIKE '%jeff%';

-- UPDATE Person.email
UPDATE `Person`
SET email = 'test@test.com'
WHERE email = 'jeff@hello.com';