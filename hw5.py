import sqlite3, sys

path = sys.argv[1]
con = sqlite3.connect(path)
cur = con.cursor()

cur.execute(
    "UPDATE ServerPorts SET port_number = 443 WHERE servers_id IN ("
    "SELECT id FROM (SELECT id FROM Servers WHERE servertypes_id = ("
    "SELECT id FROM ServerTypes WHERE type_name = 'apache')) INNER JOIN ("
    "SELECT servers_id FROM ServerProjects WHERE projects_id = ("
    "SELECT id FROM Projects WHERE proj_name = 'Project3')))"
)

# INNER JOIN servers in project 'Project3' and servers apache
# cur.execute("(SELECT id FROM (SELECT id FROM Servers WHERE servertypes_id = (SELECT id FROM ServerTypes WHERE type_name = 'apache')) INNER JOIN (SELECT servers_id FROM ServerProjects WHERE projects_id = (SELECT id FROM Projects WHERE proj_name = 'Project3')))")

# servers apache
# cur.execute("SELECT id FROM Servers WHERE servertypes_id = (SELECT id FROM ServerTypes WHERE type_name = 'apache')")

#project 'Project3'
# cur.execute("SELECT servers_id FROM ServerProjects WHERE projects_id = (SELECT id FROM Projects WHERE proj_name = 'Project3')")

con.commit()
con.close()
