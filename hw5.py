import sys
import sqlite3

path = sys.argv[1]
conn = sqlite3.connect(path)
cur = conn.cursor()

cur.execute(
    '''UPDATE ServerPorts SET port_number = 443 WHERE servers_id IN (
    SELECT id FROM (SELECT id FROM Servers WHERE servertypes_id = (
    SELECT id FROM ServerTypes WHERE type_name = 'apache')) INNER JOIN(
    SELECT servers_id FROM ServerProjects WHERE projects_id = (
    SELECT id FROM Projects WHERE proj_name = 'Project3')))'''
)
conn.commit()
conn.close()