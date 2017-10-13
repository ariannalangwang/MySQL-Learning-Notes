-- UPDATE Challenges Solution (Section 6, Lecture 93)
SELECT * FROM cats WHERE name='Jackson';
UPDATE cats SET name='Jack' WHERE name='Jackson';
SELECT * FROM cats WHERE name='Jackson';
SELECT * FROM cats WHERE name='Jack';
 
SELECT * FROM cats WHERE name='Ringo';
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';
SELECT * FROM cats WHERE name='Ringo';
 
SELECT * FROM cats WHERE breed='Maine Coon';
UPDATE cats SET age=12 WHERE breed='Maine Coon';
SELECT * FROM cats WHERE breed='Maine Coon';
-- --------------------------------------------------------------------------

-- STRING Function Challenges Solution (Section 7, Lecture 115)
SELECT REVERSE(UPPER('Why does my cat hate me?'));
SELECT REPLACE(title, " ", "->") AS title FROM books;
SELECT author_lname AS 'forwards', REVERSE(author_lname) AS 'backwards' FROM books;
SELECT CONCAT_WS(" ", UPPER(author_fname), UPPER(author_lname)) AS 'full name in caps' FROM books;
SELECT UPPER(CONCAT_WS(" ", author_fname, author_lname)) AS 'full name in caps' FROM books;
SELECT CONCAT_WS(" ", title, 'was released in', released_year) AS 'blurb' FROM books;
SELECT title, CHAR_LENGTH(title) AS 'character count' FROM books;

SELECT 
  CONCAT(SUBSTRING(title, 1,10), '...') AS 'short title', 
  CONCAT(author_lname, ',', author_fname) AS 'author', 
  CONCAT(stock_quantity, ' in stock') AS 'quantity' 
FROM books;
-- --------------------------------------------------------------------------

-- Refining Selections Exercises Solution (Section 8, Lecture 131)
SELECT title FROM books WHERE title LIKE '%stories%';
SELECT title, pages FROM books ORDER BY PAGES DESC LIMIT 1;
SELECT CONCAT(title, ' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';
SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity ASC LIMIT 3;
SELECT title, author_lname FROM books ORDER BY author_lname, title;
SELECT UPPER(CONCAT('my favorite author is ', author_fname, ' ', author_lname, '!')) AS 'yell' FROM books ORDER BY author_lname;
-- --------------------------------------------------------------------------------------------------



 