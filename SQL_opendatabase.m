function [dbc, dbname] = SQL_opendatabase(connSettings,beVocal)
% SQL_opendatabase   Connect to a mySQL database
%
% Example: connect to the GODaily database on an external server through a
%           port-forward via port 1234
% connSettings = struct();
% connSettings.hostname = 'localhost:1234'
% connSettings.dbname = 'GODaily';
% connSettings.username = 'benfulcher';
% connSettings.password = 'myVeryInsecurePlainTextPassword'
% dbc = SQL_opendatabase(connSettings,true);
%-------------------------------------------------------------------------------

% Check Inputs:
if nargin < 1 || ~isstruct(connSettings)
    error('input must be a structure with hostname, dbname, username, and password fields');
end
if nargin < 2
    beVocal = false;
end

% Parse the input structure:
hostname = connSettings.hostname;
dbname = connSettings.dbname;
username = connSettings.username;
password = connSettings.password;

%-------------------------------------------------------------------------------
if beVocal
    fprintf(1,'Using database %s\n',dbname)
    fprintf(1,['Connecting to host ''%s'', database ''%s'', using username' ...
            ' ''%s'' and password ''%s''\n'],hostname,dbname,username,password)
end

%% Open database as dbc
dbc = mysql_dbopen(hostname,dbname,username,password);

if isempty(dbc)
	error('Failed to load SQL database');
end

mysql_dbexecute(dbc,['USE ' dbname]);

end
