import pymssql

server = r"VALKOV\SQLEXPRESS"
dbname = r"BilLoKorm"
zapros = """
CREATE TABLE {nevt}(
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
    SELECT LOGDateTime, UserID, UserName, CompName, Modul, TblName, Act, Mess, Params, ( row_number() over (order by LOGDateTime) -1 )/{razm} + 1 AS num
    FROM {baso}.dbo.{tablo}
	--where LOGDateTime > convert(datetime, '2021-10-12 00:00:21.670', 121)
)

insert into {nevt}
SELECT LOGDateTime, UserID, UserName, CompName, Modul, TblName, Act, Mess, Params from crida where num = {ii}

SELECT @@rowcount
"""
razm = 25000
baso = 'Eb0601'
tablo = 'okp_logs'		#'okp_bufLog' 	'okp_logs' 
sha = 'L'
ii = 1

#print (zapros.format(nevt=nevt, baso=baso, tablo=tablo, ii=ii, razm=razm))

qvo = razm
conn = pymssql.connect(host=server, database=dbname)
cursor = conn.cursor()
while qvo == razm :
	nevt = sha + '{:03}'.format(ii)	
	qvero = zapros.format(nevt=nevt, baso=baso, tablo=tablo, ii=ii, razm=razm)
	cursor.execute(qvero)
	row = cursor.fetchone()
	qvo = row[0]
	print("Qvo=%d --- %s" % (qvo, nevt))
	ii = ii + 1

conn.commit()
cursor.close()
conn.close()
