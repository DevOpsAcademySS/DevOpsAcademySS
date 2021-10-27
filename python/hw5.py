from sys import argv
import sqlite3

def db_port_ch(path):
    conn = sqlite3.connect(path)
    cursor = conn.cursor()
    cursor.execute('''
        UPDATE ServerPorts SET port_number = 443 WHERE servers_id IN 
        (SELECT id FROM (SELECT id FROM Servers WHERE servertypes_id = 
        (SELECT id FROM ServerTypes WHERE type_name = 'apache')) INNER JOIN 
        (SELECT servers_id FROM ServerProjects WHERE projects_id = 
        (SELECT id FROM Projects WHERE proj_name = 'Project3')))
    ''')
    conn.commit()
    conn.close()
if __name__=="__main__":
    db_port_ch(argv[1])