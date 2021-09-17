import pymssql

server = r"VALKOV\SQLEXPRESS"
user = r"Vaso"
password = r"Sova2009"
dbname = r"OKP"

conn = pymssql.connect(host=server, database=dbname)
#conn = pymssql.connect(host=server, user=user, password=password,
#                       database=dbname)
cursor = conn.cursor()
cursor.execute("""
IF OBJECT_ID('persons2', 'U') IS NOT NULL
    DROP TABLE persons2
CREATE TABLE persons2 (
    id INT NOT NULL,
    name VARCHAR(100),
    salesrep VARCHAR(100),
    PRIMARY KEY(id)
)
""")
cursor.executemany(
    "INSERT INTO persons2 VALUES (%d, %s, %s)",
    [(1, 'John Smith', 'John Doe'),
     (2, 'Jane Doe', 'Joe Dog'),
     (3, 'Mike T.', 'Sarah H.')])
# you must call commit() to persist your data
# if you don't set autocommit to True
conn.commit()

cursor.execute('SELECT * FROM persons2 WHERE salesrep like %s', '%Do%')
row = cursor.fetchone()
while row:
    print("ID=%d, Name=%s" % (row[0], row[1]))
    row = cursor.fetchone()

conn.close()
