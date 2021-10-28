import pymssql

server = r"VALKOV\SQLEXPRESS"
dbname = r"BilLoKorm"
zaprosTablo = """
SELECT name FROM sys.objects 
WHERE type in (N'U') 
and  [name] LIKE '{sha}___'
"""
zaprosDropo = """
DROP TABLE dbo.{tbdrop}
"""
sha = 'L'

qvero = zaprosTablo.format(sha=sha)
conn = pymssql.connect(host=server, database=dbname)
cursor = conn.cursor()
cursor.execute(qvero)
for row in cursor.fetchall():
	tablo = row[0]
	droqve = zaprosDropo.format(tbdrop=tablo)
	cursor.execute(droqve)
	print("Tablo --- %s" % (tablo))

conn.commit()
cursor.close()
conn.close()
