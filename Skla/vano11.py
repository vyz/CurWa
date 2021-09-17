import pymssql

server = r"VALKOV\SQLEXPRESS"
#user = r"Vaso"
#password = r"Sova2009"
dbname = r"BilLoKorm"

conn = pymssql.connect(host=server, database=dbname)
#conn = pymssql.connect(host=server, user=user, password=password,
#                       database=dbname)
cursor = conn.cursor()
cursor.execute("""
CREATE TABLE T004(
	[LOGDateTime] [datetime] NULL,
	[UserID] [int] NULL,
	[UserName] [varchar](50) NULL,
	[CompName] [varchar](50) NULL,
	[Modul] [varchar](100) NULL,
	[TblName] [varchar](50) NULL,
	[Act] [varchar](10) NULL,
	[Mess] [varchar](2000) NULL,
	[Params] [varchar](4000) NULL
) ON [PRIMARY];

WITH crida AS (
    SELECT LOGDateTime, UserID, UserName, CompName, Modul, TblName, Act, Mess, Params, ( row_number() over (order by LOGDateTime) -1 )/100000 + 1 AS num
    FROM ITT_0825.dbo.OKP_bufLog
	--where LOGDateTime > convert(datetime, '2021-05-20 16:10:00', 121)
)

insert into T004
SELECT LOGDateTime, UserID, UserName, CompName, Modul, TblName, Act, Mess, Params from crida where num = 4

SELECT @@rowcount
""")
row = cursor.fetchone()
print("Qvo=%d" % (row[0]))
conn.commit()
cursor.close()
conn.close()
