#! /usr/bin/env python3

import sqlite3
import sys

con = sqlite3.connect(sys.argv[1])
cur = con.cursor()

cur.execute(
    "UPDATE ServerPorts SET port_number = 443 WHERE servers_id IN ("
    "SELECT id FROM (SELECT id FROM Servers WHERE servertypes_id = ("
    "SELECT id FROM ServerTypes WHERE type_name = 'apache')) INNER JOIN ("
    "SELECT servers_id FROM ServerProjects WHERE projects_id = ("
    "SELECT id FROM Projects WHERE proj_name = 'Project3')))"
)

con.commit()
con.close()