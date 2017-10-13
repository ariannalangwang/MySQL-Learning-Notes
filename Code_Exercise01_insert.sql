-- INSERT Challenge Solution Code

CREATE TABLE people
  (
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
  );

DESC people; /* check if table created correctly*/

INSERT INTO people(first_name, last_name, age)
VALUES ('Tina', 'Belcher', 13);

SELECT * FROM people;  

INSERT INTO people(age, last_name, first_name)
VALUES (42, 'Belcher', 'Bob');

SELECT * FROM people;

INSERT INTO people(first_name, last_name, age)
VALUES('Linda', 'Belcher', 45)
     ,('Phillip', 'Frond', 38)
     ,('Calvin', 'Fischoeder', 70);

SELECT * FROM people; 

DROP TABLE people; 

SHOW TABLES; 

-- Get a warning?
SHOW WARNINGS;