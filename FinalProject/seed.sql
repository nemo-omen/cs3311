INSERT INTO
  `Ingredient`(name)
VALUES
  ('Grape Jelly').
  ('White Bread'),
  ('Peanut Butter'),
  ('Butter'),
  ('American Cheese');

INSERT INTO 
  `Recipe`(name, servings, preptime, cooktime, instructions, photourl)
VALUES
  ('Peanut Butter and Jelly Sandwich', 1, 5, 0, 'Spread peanut button on one piece of bread. Spread jelly on the other. Place both slices of bread together so the peanut butter and jelly are inside.', 'pbj.jpg'),
  ('Grilled Cheese Sandwich', 1, 3, 6, 'Place American cheese slices between two slices of bread. Heat skillet on medium-high heat. Melt butter and grill sandwich for two or three minutes on each side - until golden brown.', 'gc.jpg');

INSERT INTO `Note`
  (text, recipe_id)
VALUES
  ('Tasty, quick, and cheap. Not much nutritional value!', 1),
  ('Tasty and comforting. Great with tomato soup!', 2);

INSERT INTO `Person`
  (name, email, phone)
VALUES
  ('Jeff', 'jeff@hello.com', '555-555-5555'),
  ('Mary', 'mary@whatever.com', '666-666-6666');

INSERT INTO `ShoppingList`
  (listName)
VALUES
  ('HEB - Saturday'),
  ('Market Street - Sunday');

INSERT INTO `Tag`
  (name)
VALUES
  ('quick'),
  ('cheap'),
  ('comfort food');

INSERT INTO `RecipeIngredients`
  (recipe_id, ingredient_id)
VALUES
  (1,1),
  (1,2),
  (1,3),
  (2,2),
  (2,4),
  (2,5);

INSERT INTO `RecipeTags`
  (recipe_id, tag_id)
VALUES
  (1,1),
  (1,2),
  (2,1),
  (2,3),
  (2,2);

INSERT INTO `ShoppingIngredients`
  (shopping_id, ingredient_id)
VALUES
  (1, 2),
  (1, 3);

INSERT INTO `ShoppingIngredients`
  (shopping_id, ingredient_id)
VALUES
  (2, 4),
  (2, 5),
  (2, 1);

INSERT INTO `PeopleShoppingLists`
  (person_id, shoppinglist_id)
VALUES
  (1,2),
  (2,1);