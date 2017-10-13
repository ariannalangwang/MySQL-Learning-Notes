-- Exercise
CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35')
      ('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('toaster', CURDATE(), CURTIME(), NOW());

SELECT * FROM people;

-- -----------------------------------------------------------------------------------------

 
 
