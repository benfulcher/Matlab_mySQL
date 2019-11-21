# Matlab mySQL

Some key functions to enable communication (reading/writing) between Matlab and a mySQL database.

__Example__: connect to the GODaily database on your local machine:

```matlab
% Establish a connection to the database, dbc
connSettings = struct();
connSettings.hostname = 'localhost';
connSettings.dbname = 'GODaily';
connSettings.username = 'root';
connSettings.password = 'pass1234';
dbc = SQL_opendatabase(connSettings);

% Run a query on the database:
selectText = sprintf('SELECT acc,name FROM term WHERE term_type LIKE ''%s''',whatFilter);
tableResults = mysql_dbquery(dbc,selectText);

% Close the connection:
SQL_closedatabase(dbc);
```
