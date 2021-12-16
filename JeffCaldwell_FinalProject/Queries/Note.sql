-- SELECT Notes associated with a given Recipe
SELECT text FROM `Note`
WHERE recipe_id = 2;

-- SELECT Note by search term
SELECT 
  Note.text as Note,
  Recipe.name as Recipe
FROM `Note`
JOIN `Recipe` ON Recipe.id = Note.recipe_id
WHERE Note.Text LIKE '%cheap%';