-- Install MySQL on Cloud9
mysql-ctl start
mysql-ctl cli
mysql-ctl stop

-- Quit MySQL 
exit;
quit;
\q;
ctrl + c

-- Help
help;

-- Comments: 
highlight text, cmd + / (Mac) OR crtl + / (Win)

-- Auto-fill command: 
tab

-- Clear MySQL shell
ctrl + l

--Start the CLI
mysql-ctl cli; 
-- -------------------------------------------------------------------------

-- Running SQL files in the shell:
mysql-ctl cli
SHOW DATABASES; 
USE database_name;
SELECT database();

source file_name.sql;
source folder_name/file_name.sql;

-- ------------------------------------------------------------------------

