-- DATABASE

-- List available databases
SHOW DATABASES; 

-- Create a database
CREATE DATABASE database_name; 
CREATE DATABASE soap_store; 

-- Drop a database
DROP DATABASE database_name; 
DROP DATABASE soap_store;

-- Use a database
USE database_name;
USE dog_walking_app;

-- Check if the above database is in use 
SELECT database();
-- ------------------------------------------------------------

-- TABLE
-- CRUD (Create, Read, Update, Delete)

-- Create a Table
CREATE TABLE pastries 
  (
    name VARCHAR(100),
    quantity INT
  );

-- Combine NOT NULL and DEFAULT:
CREATE TABLE cats
  (
    name VARCHAR(20) NOT NULL DEFAULT ‘unnamed’,
    age INT NOT NULL DEFAULT 99
  );
  
-- Use PRIMARY KEY & AUTO_INCREMENT  
CREATE TABLE unique_cats 
  (
    cat_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT
  );

-- List available tables
SHOW TABLES;

-- Describe a table 
DESC table_name;
SHOW COLUMNS FROM table_name;
 
-- Delete a table
DROP TABLE table_name;

-- Insert data into a table
INSERT INTO table_name(column_name, column_name) 
VALUES (value, value);

INSERT INTO cats(name, age) 
VALUES ('Jetson', 7);

INSERT INTO table_name (column_name, column_name) 
VALUES      (value, value), 
            (value, value), 
            (value, value);

-- Get a warning?
SHOW WARNINGS;
-- -----------------------------------------------------------------------

-- SELECT columns FROM table_name:
SELECT * FROM cats;  /* '*' means 'all' */
SELECT name FROM cats;
SELECT name, age, cat_id FROM cats;

-- WHERE (for a row)
SELECT * FROM cats WHERE age=4; 
SELECT * FROM cats WHERE name='Egg'; 
SELECT * FROM cats WHERE name='egG'; 
SELECT name, age FROM cats WHERE breed="Tabby";
SELECT cat_id, age FROM cats WHERE cat_id=age;

-- Labels (Aliases)
SELECT cat_id AS id, name FROM cats;
SELECT name AS 'cat name', breed AS 'cat breed' FROM cats;
DESC cats;  /* show table 'cats' still with all original column_names */
SELECT * FROM cats;  /* show table 'cats' with new label column_names */
-- ----------------------------------------------------------------------

-- UPDATE
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby'; 
UPDATE cats SET age=14 WHERE name='Misty'; 

-- DELETE
SELECT * FROM cats WHERE name='egg';
DELETE FROM cats WHERE name='egg';
 
SELECT * FROM cats;
DELETE FROM cats; /* Warning: this will delete all contents from TABLE cats */
-- ----------------------------------------------------------------------------

-- STRING FUNCTIONS --

-- CONCAT or CONCAT_WS
CONCAT(x,y,z); -- from slides
SELECT CONCAT(author_fname, ' ', author_lname) FROM books;
SELECT CONCAT(author_fname, ' ', author_lname) AS 'full name' FROM books;
 
SELECT author_fname AS first, author_lname AS last, CONCAT(author_fname, ' ', author_lname) AS full FROM books;
 
SELECT CONCAT(title, '-', author_fname, '-', author_lname) FROM books;
SELECT CONCAT_WS(' - ', title, author_fname, author_lname) FROM books;

-- SUBSTRING
SELECT SUBSTRING('Hello World', 1, 3);
SELECT SUBSTRING('Hello World', 3);
SELECT SUBSTRING('Hello World', -3); -- The last 3 character
 
SELECT SUBSTRING(title, 1, 10) FROM books;
SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;
 
SELECT CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title' FROM books;


-- REPLACE
SELECT REPLACE('Hello World', 'Hell', '%$#@');
SELECT REPLACE('Hello World', 'o', '*');
SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');
 
SELECT REPLACE(title, 'e ', '3') FROM books;
SELECT SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) AS 'weird string' FROM books;
 
-- REVERSE
SELECT REVERSE('Hello World');
SELECT REVERSE(author_fname) FROM books;
 
SELECT CONCAT('woof', REVERSE('woof'));
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

-- CHAR_LENGTH (gives length of a string)
SELECT CHAR_LENGTH('Hello World');
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

-- UPPER/LOWER
SELECT UPPER('Hello World');
SELECT LOWER('Hello World');

SELECT UPPER(title) FROM books;
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;

-- DISTINCT (combination of all the columns specified will be distinct)
SELECT DISTINCT author_fname, author_lname FROM books;
 
-- ORDER BY, DESC, ASC
SELECT author_lname FROM books ORDER BY author_lname;
SELECT author_lname FROM books ORDER BY author_lname DESC;
SELECT author_lname FROM books ORDER BY author_lname ASC;
 
SELECT title, released_year, pages FROM books ORDER BY released_year;
SELECT title, author_fname, author_lname FROM books ORDER BY 2;
SELECT title, author_fname, author_lname FROM books ORDER BY 1 DESC;
 
SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname;

-- LIMIT (first # of rows. Note: first row is #0.)
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5; /* first 5 rows */
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 0,5; /* start = row 0, then count 5 rows */
 
-- LIKE 
-- '%'= any # of character(s) includeing no character
-- '_'= exactly one character
-- '\%' = % sign
-- '\_' = _ sign
SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';
 
SELECT title FROM books WHERE  title LIKE '%the';
SELECT title FROM books WHERE title LIKE '%the%';
 
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '__';
 
SELECT title FROM books WHERE title LIKE '%\%%';
SELECT title FROM books WHERE title LIKE '%\_%';

-- ------------------------------------------------------------------------
-- AGGREGATE FUNCTIONS

-- GROUP BY  
-- GROUP BY aggregates identical data into single rows.
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname; /* COUNT(*) is for GROUP BY variable(s) */
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released') AS year FROM books GROUP BY released_year;


-- COUNT
-- Counts how many rows only. (different from SUM function)
SELECT COUNT(*) FROM books;  /* '*' means 'all' */
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';  /* count all where title has 'the' in it */
SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;

-- MAX/MIN
SELECT MIN(released_year) FROM books;
SELECT MAX(released_year) FROM books;

SELECT author_fname, author_lname, Min(released_year) FROM books GROUP BY author_lname, author_fname;
SELECT CONCAT(author_fname, ' ', author_lname) AS author, MAX(pages) AS 'longest book' FROM books GROUP BY author_lname, author_fname;

-- SUM
SELECT SUM(pages) FROM books;
SELECT author_fname, author_lname, Sum(pages) FROM books GROUP BY author_lname, author_fname;
 
-- AVG (average)
SELECT released_year, AVG(stock_quantity) FROM books GROUP BY released_year;
SELECT author_fname, author_lname, AVG(pages) FROM books GROUP BY author_lname, author_fname;

-- --------------------------------------------------------------------------------------------------------------------

-- DATA TYPES

CHAR vs. VARCHAR
DECIMAL(5,2)   -- 5 = # of total digits, 2 = # of digits after decimal point
FLOAT & DOUBLE

-- ----------------------------------------------------------------------------------

-- DATE
DATE: YYYY-MM-DD
TIME: HH:MM:SS
DATETIME: YYYY-MM-DD HH:MM:SS

-- CURDATE() - print out current date
SELECT CURDATE();

-- CURTIME() - print out current time
SELECT CURTIME();
 
-- NOW() - print out current datetime
SELECT NOW();

-- DAY() - print out date number
SELECT DAY(birthdt) FROM people;

-- MONTH() - print out month number
SELECT MONTH(birthdt) FROM people;

-- YEAR() - print out year number
SELECT YEAR(birthdt) FROM people;

-- HOUR() - print out hour
SELECT HOUR(birthdt) FROM people;

-- MINUTE() - print out minutes
SELECT MINUTE(birthdt) FROM people;

-------------------------------------------------------------------------------

-- DATE_FORMAT
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people;
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;


-- DATE ARITHMETIC (DATEDIFF,  +/- INTERVAL)
SELECT DATEDIFF(NOW(), birthdate) FROM people;
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;
 
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;
SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;


-- TIMESTAMP (a data type)
CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO comments (content) VALUES('lol what a funny article');
INSERT INTO comments (content) VALUES('I found this offensive');
INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');
SELECT * FROM comments ORDER BY created_at DESC;
 
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);
 
INSERT INTO comments2 (content) VALUES('dasdasdasd');
INSERT INTO comments2 (content) VALUES('lololololo');
INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');
UPDATE comments2 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';
 
SELECT * FROM comments2;
SELECT * FROM comments2 ORDER BY changed_at;

-- ----------------------------------------------------------------------------- 

-- LOGICAL OPERATORS

-- !=  
SELECT title, author_lname FROM books WHERE author_lname = 'Harris';
SELECT title, author_lname FROM books WHERE author_lname != 'Harris';

-- LIKE (NOT LIKE)
SELECT title FROM books WHERE title LIKE 'W%';
SELECT title FROM books WHERE title NOT LIKE 'W%';

-- >, >=, <. <=
SELECT title, released_year FROM books WHERE released_year > 2000 ORDER BY released_year;
SELECT title, released_year FROM books WHERE released_year >= 2000 ORDER BY released_year DESC;

-- && (AND)
SELECT * FROM books WHERE author_lname='Eggers' && released_year > 2010 && title LIKE '%novel%';

-- || (OR)
SELECT title, author_lname, released_year FROM books WHERE author_lname='Eggers' || released_year > 2010;
 
-- BETWEEN AND (NOT BETWEEN AND)
SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015; /* BETWEEN AND is inclusive of both end years */
SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015;


-- CAST(' ' AS )
SELECT CAST('2017-05-02' AS DATETIME);
SELECT name, birthdt FROM people WHERE birthdt BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);

-- IN (NOT IN)
SELECT title, author_lname FROM books WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
SELECT title, released_year FROM books WHERE released_year IN (2017, 1985);

SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016);
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 != 0;

-- CASE END
SELECT title, released_year,
       CASE 
         WHEN released_year >= 2000 THEN 'Modern Lit'
         ELSE '20th Century Lit'
       END AS GENRE
FROM books;
 
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;
 
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books; 
-- ----------------------------------------------------------------------------







