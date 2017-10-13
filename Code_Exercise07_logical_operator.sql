
-- Logical Operators Exercises Solution (Section 11, Lecture 192)

SELECT * FROM books WHERE released_year < 1980;
SELECT * FROM books WHERE author_lname IN ('Eggers', 'Chabon');
SELECT * FROM books WHERE author_lname = 'Lahiri' && released_year > 2000;
SELECT * FROM books WHERE pages BETWEEN 100 AND 200;
SELECT * FROM books WHERE author_lname LIKE 'C%'|| author_lname LIKE 'S%';
SELECT * FROM books WHERE SUBSTRING(author_lname, 1,1) IN ('C','S');

SELECT title, author_lname,
CASE
  WHEN title LIKE '%stories%' THEN 'Short Stories'
  WHEN title = 'Just Kids' || title LIKE 'A Heartbreaking Work%' THEN 'Memoir'
  ELSE 'Novel'
END AS 'type'
FROM books;

SELECT title, author_lname,    
CASE
  WHEN COUNT(title) = 1 THEN CONCAT(COUNT(title), ' book')
  ELSE  CONCAT(COUNT(title), ' books')
END AS 'COUNT'
FROM books GROUP BY author_lname, author_fname;