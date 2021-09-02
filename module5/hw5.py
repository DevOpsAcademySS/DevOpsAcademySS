import sys
import sqlite3


conn = sqlite3.connect(sys.argv[1])
sql_update = '''
        UPDATE ServerPorts SET port_number = 443 WHERE servers_id in 
        (SELECT Servers.id FROM Servers 
        LEFT JOIN ServerTypes on Servers.servertypes_id = ServerTypes.id 
        LEFT JOIN ServerProjects ON Servers.id = ServerProjects.servers_id 
        LEFT JOIN Projects ON ServerProjects.projects_id = Projects.id 
        WHERE ServerTypes.type_name='apache' and Projects.proj_name='Project3');
'''
conn.execute(sql_update).fetchall()

conn.close()