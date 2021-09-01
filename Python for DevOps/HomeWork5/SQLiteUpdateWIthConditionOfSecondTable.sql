-- SQLite
UPDATE ServerPorts
SET port_number=443
WHERE (servers_id,port_number) in (SELECT ServerPorts.servers_id, ServerPorts.port_number
FROM ServerPorts 
LEFT JOIN Servers ON Servers.id=ServerPorts.servers_id
LEFT JOIN ServerTypes ON ServerTypes.id=Servers.servertypes_id 
LEFT JOIN ServerProjects ON ServerProjects.servers_id=Servers.id
LEFT JOIN Projects ON Projects.id=ServerProjects.projects_id
WHERE ServerTypes.type_name='apache' AND Projects.proj_name='Project3');
SELECT *
FROM ServerPorts;