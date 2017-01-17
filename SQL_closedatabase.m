% ------------------------------------------------------------------------------
% SQL_closedatabase
% ------------------------------------------------------------------------------
% 
% Closes the connection to database, dbc
% 
% ------------------------------------------------------------------------------
% Copyright (C) 2013
% Ben D. Fulcher <ben.d.fulcher@gmail.com>, <http://www.benfulcher.com>
% 
% If you use this code for your research, please cite:
% B. D. Fulcher, M. A. Little, N. S. Jones, "Highly comparative time-series
% analysis: the empirical structure of time series and their methods",
% J. Roy. Soc. Interface 10(83) 20130048 (2010). DOI: 10.1098/rsif.2013.0048
% 
% This work is licensed under the Creative Commons
% Attribution-NonCommercial-ShareAlike 3.0 Unported License. To view a copy of
% this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/ or send
% a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View,
% California, 94041, USA.
% ------------------------------------------------------------------------------

function emsg = SQL_closedatabase(dbc)

try
   dbc.close();
catch emsg
	error('Error closing database\n%s',emsg)
end

clear dbc

end