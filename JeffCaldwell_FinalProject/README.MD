# Jeff Caldwell
# CS 3311
# Final Project

## Usage

This project is split into 7 files located in the `/Queries` directory. This was done to keep code pertaining to different aspects of the aplicatioon separate.


## Files

### `initialize.sql`
This is the database and table setup file. Queries can be run in order to set up all databases for testing. (Note: Foreign key constraints were added to tables after initial table creation to avoid errors)

### `seed.sql`
This file contains a few basic queries for inserting a small amount of test data into the tables.

### Entities
The files, `Ingredient.sql`, `Recipe.sql`, `ShoppingList.sql`, `Note.sql`, and `Person.sql` contain various selection queries for exposing the data in the database in different ways.

### ERD
The ERD diagram (in `.pdf` format) for this project is located in the `/ERD` directory.

### Presentation
The assets for the final presentation are located in the `/Presentation` directory. This includes the final PowerPoint as well as all images used in the slides.

## Notes

### Update queries
Most `UPDATE` queries are very simple and use only a basic `WHERE` query. This is because it feels dangerous to `UPDATE` based on a `LIKE` query.
