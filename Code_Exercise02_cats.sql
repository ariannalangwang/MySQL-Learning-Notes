--Create a new cats table:
CREATE TABLE cats 
  ( 
     cat_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
     name   VARCHAR(100), 
     breed  VARCHAR(100), 
     age    INT
  ); 
  
DESC cats; 

--Insert some rows:
INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

--Look at some columns
SELECT * FROM cats;  /* '*' means 'all' */
SELECT name FROM cats;
SELECT name, age, cat_id FROM cats;

--Look at some rows and columns
SELECT name, age FROM cats WHERE breed="Tabby";
SELECT cat_id, age FROM cats WHERE cat_id=age;

--Update some entries
UPDATE cats SET name="Jack"
WHERE name="Jacson";

UPDATE cats SET breed="British Shorthair"
WHERE name="Ringo";

UPDATE cats SET age=12
WHERE breed="Maine Coon";

--Delete some entries
DELETE FROM cats WHERE age=4;
DELETE FROM cats WHERE age=cat_id;
DELETE FROM cats;  /* Warning: this will delete all contents from TABLE cats */
