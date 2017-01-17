function [dbc, dbname] = SQL_opendatabase(connSettings)
% Connect to the GODaily database on the nectar server
%-------------------------------------------------------------------------------

if isstruct(connSettings)
    hostname = connSettings.hostname; %'localhost:1234';
    dbname = connSettings.dbname; % 'GODaily';
    username = connSettings.username; % 'benfulcher';
    password = connSettings.password; % 'ben';
else
    error('input must be a structure with hostname, dbname, username, and password fields');
end

%-------------------------------------------------------------------------------
fprintf(1,'Using database %s\n',dbname)
fprintf(1,['Connecting to host ''%s'', database ''%s'', using username' ...
        ' ''%s'' and password ''%s''\n'],hostname,dbname,username,password)


%% Open database as dbc
dbc = mysql_dbopen(hostname,dbname,username,password);

if isempty(dbc)
	error('Failed to load SQL database');
end

mysql_dbexecute(dbc,['USE ' dbname]);

end
