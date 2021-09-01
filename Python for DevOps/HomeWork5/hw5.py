import os
import sqlite3
from sys import argv

# Task: There is some SQLite database example.db. Create program that sets in database ports (ServerPorts.port_number) to 443 for all servers apache (ServerTypes.type_name is 'apache') in project 'Project3'.

# Input parameters: path

# Example: python hw5.py /home/usr/example.db

db_path = argv[1]

if os.path.isfile(db_path):
    port = 443
    params = list()
    params.append(port)
    print('\nConnecting...')
    db = os.path.join(db_path)
    sql_select_query = ''' 
                            SELECT ServerPorts.servers_id, ServerPorts.port_number, ServerTypes.type_name, Projects.proj_name FROM ServerPorts 
                            LEFT JOIN Servers ON Servers.id=ServerPorts.servers_id
                            LEFT JOIN ServerTypes ON ServerTypes.id=Servers.servertypes_id 
                            LEFT JOIN ServerProjects ON ServerProjects.servers_id=Servers.id
                            LEFT JOIN Projects ON Projects.id=ServerProjects.projects_id
                            WHERE ServerTypes.type_name='apache' AND Projects.proj_name='Project3';
                        '''
    sql_update_query = '''  
                            UPDATE ServerPorts
                            SET port_number=?
                            WHERE (servers_id,port_number) in (SELECT ServerPorts.servers_id, ServerPorts.port_number
                            FROM ServerPorts 
                            LEFT JOIN Servers ON Servers.id=ServerPorts.servers_id
                            LEFT JOIN ServerTypes ON ServerTypes.id=Servers.servertypes_id 
                            LEFT JOIN ServerProjects ON ServerProjects.servers_id=Servers.id
                            LEFT JOIN Projects ON Projects.id=ServerProjects.projects_id
                            WHERE ServerTypes.type_name='apache' AND Projects.proj_name='Project3');
                        '''
    conn = sqlite3.connect(db)
    print('Before:')
    result = conn.execute(sql_select_query).fetchall()
    print(result)
    result = conn.execute(sql_update_query, params).fetchall()
    print('After:')
    result = conn.execute(sql_select_query).fetchall()
    print(result)
    print('\nClosing...')
    conn.close
    print('Done.')
else:
    print('Incorect path.')
