INSERT INTO
  `Ingredient`(name)
VALUES
  ('Grape Jelly'),
  ('White Bread'),
  ('Peanut Butter'),
  ('Butter'),
  ('American Cheese'),
  ('Jalapenos'),
  ('Sharp Cheddar Cheese'),
  ('Cream Cheese'),
  ('Bacon'),
  ('Avocado Oil Cooking Spray');

INSERT INTO 
  `Recipe`(name, servings, preptime, cooktime, instructions, photourl)
VALUES
  ('Peanut Butter and Jelly Sandwich', 1, 5, 0, 'Spread peanut button on one piece of bread. Spread jelly on the other. Place both slices of bread together so the peanut butter and jelly are inside.', 'pbj.jpg'),
  ('Grilled Cheese Sandwich', 1, 3, 6, 'Place America cheese slices between two slices of bread. Heat skillet on medium-high heat. Melt butter and grill sandwich for two or three minutes on each side - until golden brown.', 'gc.jpg'),
  (
    'Jalapeno Poppers',
    8,
    25,
    25,
    '1. Preheat the oven to 400F.\n
    2. Cut a thin slit down the length of each pepper and carefully remove the inner ribs and seeds, trying to keep the pepper itself as intact as possible.\n
    3. Use a fork to mash together the cheddar and cream cheeses in a small bowl.\n
    4. Stuff the cheese mixture into each pepper, closing each pepper up as much as possible.\n
    5. Wrap a slice of bacon around the outside of each pepper, securing with a toothpick if necessary.\n
    6. Lightly spray each popper with avocado oil.\n
    7. Arrange the poppers on a large baking sheet and bake until the bacon is crispy, about 20 minutes. You can broil the poppers for a couple minutes at the end if you want to brown them more.\n
    8. Serve.',
    '/jalpoppers.jpg'
  );


INSERT INTO `Note`
  (text, recipe_id)
VALUES
  ('Tasty, quick, and cheap. Not much nutritional value!', 1),
  ('Tasty and comforting. Great with tomato soup!', 2),
  ('This is a second test note!', 1),
  ('This is a second test note!', 2),
  ('This is a test note!', 3);
  

INSERT INTO `Person`
  (name, email, phone)
VALUES
  ('Jeff', 'jeff@hello.com', '555-555-5555'),
  ('Mary', 'mary@whatever.com', '666-666-6666');

INSERT INTO `ShoppingList`
  (name)
VALUES
  ('HEB - Saturday'),
  ('Market Street - Sunday');


INSERT INTO `RecipeIngredients`
  (recipe_id, ingredient_id)
VALUES
  (1,1),
  (1,2),
  (1,3),
  (2,2),
  (2,4),
  (2,5),
  (3,6),
  (3,7),
  (3,8),
  (3,9),
  (3,10);

INSERT INTO `ShoppingIngredients`
  (shopping_id, ingredient_id)
VALUES
  (1, 2),
  (1, 3),
  (1, 6),
  (1, 8),
  (2, 4),
  (2, 5),
  (2, 9),
  (2, 10),
  (2, 1);

INSERT INTO `PeopleShoppingLists`
  (person_id, shopping_id)
VALUES
  (1,2),
  (2,1);