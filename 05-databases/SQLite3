```markdown
# SQLite Commands

## Open a Database
#Opens the SQLite3 shell for a specified database file, creating it if it doesn't exist.
```bash
sqlite3 database.db
```

## List All Tables
#Displays all tables in the current database.
```bash
.tables
```

## View Table Schema
#Shows the CREATE TABLE statement for a specific table to understand its structure.
```bash
.schema table_name
```

## List Databases
#Lists the main database and any attached databases.
```bash
.databases
```

## Select All Data from a Table
#Retrieves all rows and columns from a specified table.
```bash
SELECT * FROM table_name;
```

## List Column Names
#Shows column names, data types, and constraints for a table.
```bash
PRAGMA table_info(table_name);
```

## Set Output to Readable Format
#Formats query output in columns with headers for better readability.
```bash
.mode column
.headers on
```

## Count Rows in a Table
#Returns the number of rows in a specified table.
```bash
SELECT COUNT(*) FROM table_name;
```

## Search for Specific Data
#Finds rows where a column contains a specific keyword (case-insensitive).
```bash
SELECT * FROM table_name WHERE column_name LIKE '%keyword%';
```

## Dump Database to SQL File
#Exports the entire database to a SQL file for offline analysis.
```bash
.output dump.sql
.dump
.output stdout
```

## Execute SQL from Terminal
#Runs a SQL query directly from the terminal without entering the SQLite shell.
```bash
sqlite3 database.db "SELECT * FROM table_name;"
```

## Import CSV into a Table
#Imports data from a CSV file into a specified table.
```bash
.mode csv
.import file.csv table_name
```

## List Indexes
#Shows all indexes in the database.
```bash
.indexes
```

## Get Index Details
#Displays details about a specific index.
```bash
PRAGMA index_info(index_name);
```

## View Database Version
#Returns the SQLite version used by the database.
```bash
SELECT sqlite_version();
```

## Create a New Table
#Creates a new table with specified columns and data types.
```bash
CREATE TABLE users (id INTEGER PRIMARY KEY, username TEXT, password TEXT);
```

## Insert Data
#Adds a new row to a specified table.
```bash
INSERT INTO users (username, password) VALUES ('testuser', 'testpass');
```

## Update Data
#Modifies existing data in a table based on a condition.
```bash
UPDATE users SET password='newpass' WHERE username='testuser';
```

## Delete Data
#Removes rows from a table based on a condition.
```bash
DELETE FROM users WHERE username='testuser';
```

## Drop a Table
#Deletes a specified table from the database.
```bash
DROP TABLE table_name;
```

## List Foreign Keys
#Shows foreign key relationships for a specified table.
```bash
PRAGMA foreign_key_list(table_name);
```

## Enable Foreign Key Support
#Enforces foreign key constraints during operations.
```bash
PRAGMA foreign_keys = ON;
```

## Query Specific Columns
#Retrieves only specified columns from a table.
```bash
SELECT username, password FROM users;
```

## Order Results
#Sorts query results by a column in ascending or descending order.
```bash
SELECT * FROM users ORDER BY username ASC;
```

## Limit Results
#Restricts the number of rows returned by a query.
```bash
SELECT * FROM users LIMIT 10;
```

## Join Tables
#Combines data from two tables based on a common column.
```bash
SELECT users.username, roles.role FROM users JOIN roles ON users.role_id = roles.id;
```

## Check Database Integrity
#Verifies if the database file is corrupted.
```bash
PRAGMA integrity_check;
```

## Backup Database
#Creates a backup of the database to a new file.
```bash
.backup backup.db
```

## Attach Another Database
#Attaches another database file for cross-database queries.
```bash
ATTACH DATABASE 'other.db' AS other_db;
```

## Execute SQL from a File
#Runs SQL commands from a file in the terminal.
```bash
sqlite3 database.db < script.sql
```
```
