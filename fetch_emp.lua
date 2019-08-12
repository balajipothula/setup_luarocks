--> getting home path.
local HOME = os.getenv("HOME")

--> setting odbc shared object path.
package.cpath = HOME .. "/.luarocks/lib/lua/5.1/?.so;;"    .. package.cpath

--> setting odbc lua library path.
package.path  = HOME .. "/.luarocks/share/lua/5.1/?.lua;;" .. package.path

--> initializing odbc library.
local odbc = require("odbc")

--> initializing odbc environment.
local env, err = odbc.environment()

--> microsoft sql server connection table.
local contable = {
                    { Driver   = "ODBC Driver 17 for SQL Server" },
                    { Server   = "factset.cgkaelgeb32b.ap-south-1.rds.amazonaws.com,1433" },
                    { Uid      = "admin" },
                    { Pwd      = "admin123" },
                    { Database = "office_db" },
                 }

--> microsoft sql server connection table.
local contable = require("contable")

--> getting microsoft sql server connection.
local con, err = env:driverconnect(contable)

print(con)

local emp = con:execute("SELECT no, name FROM emp_tab")

print(emp)

emp:foreach(function(no, name)
  print(no, name)
end)
