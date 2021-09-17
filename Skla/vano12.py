import pymssql

server = r"VALKOV\SQLEXPRESS"
#user = r"Vaso"
#password = r"Sova2009"
dbname = r"BigoLogo"

conn = pymssql.connect(host=server, database=dbname)
#conn = pymssql.connect(host=server, user=user, password=password,
#                       database=dbname)
cursor = conn.cursor()
cursor.execute("""
DECLARE @aDibo varchar(50) = 'ITT_0825'		--Имя базы данных

DECLARE mico CURSOR FOR   
SELECT TOP (1000000) [LOGDateTime]
      ,[UserID]
      ,[UserName]
      ,[CompName]
      ,[Modul]
      ,[TblName]
      ,[Act]
      ,[Mess]
      ,[Params]
  FROM BilLoKorm.dbo.B002        --ЗАМЕНА
  order by [LOGDateTime] 

DECLARE	@adLogo datetime,		--ДатаВремя записи в логе
		@auIda int,				--ID Юзера в записи лога 
		@auNamo varchar(50),	--Имя Юзера
		@aCompo varchar(50),	--Имя компьютера Юзера
		@aModulo varchar(100),	--Модуль (версия)
		@aTablo varchar(50),	--Таблица
		@aDeystvo varchar(10),	--Выполняемое действие в смысле БД 
		@aMesso varchar(2000),	--Сообщение описательное
		@aParamo varchar(4000),	--Изменяемые параметры и их значения
		@iLogo bit,             --Требуется ли запись в Лог
		@tLogo varchar(100)     --Текст сообщения для лога    

Declare @nzapo int = 0
Declare @dstarto datetime = GETDATE()
Declare @dendo datetime

open mico

fetch next from mico into @adLogo, @auIda, @auNamo, @aCompo, @aModulo, @aTablo,	@aDeystvo, @aMesso, @aParamo

WHILE @@FETCH_STATUS = 0  
BEGIN  
	if @auIda is NULL SET @auIda = 0
	if @auNamo is NULL SET @auNamo = 'Nullo'
	if @aCompo is NULL SET @aCompo = 'Nullo'
	if @aModulo is NULL SET @aModulo = 'Nullo'
	if @aTablo is NULL SET @aTablo = 'Nullo'
	if @aDeystvo is NULL SET @aDeystvo = 'Nullo'
	if @aMesso is NULL SET @aMesso = 'Nullo'
	if @aParamo is NULL SET @aParamo = 'Nullo'

	exec AddLineZapo @Dibo=@aDibo, @dLogo = @adLogo, @uIda = @auIda, @uNamo = @auNamo, @Compo = @aCompo, @Modulo = @aModulo, @Tablo = @aTablo, 
	                 @Deystvo = @aDeystvo, @Messo = @aMesso, @Paramo = @aParamo, @iLogo = @iLogo OUT, @tLogo = @tLogo out
	if @iLogo = 1
		insert into MyLogo (dTime, Texo) VALUES( GETDATE(), @tLogo )
	else
		set @nzapo = @nzapo + 1
	fetch next from mico into @adLogo, @auIda, @auNamo, @aCompo, @aModulo, @aTablo,	@aDeystvo, @aMesso, @aParamo
END
CLOSE mico
DEALLOCATE mico
SET @dendo = GETDATE()
insert into AddoLogo (dTime, Baso, Kvo, Tablo, Minuto) VALUES( @dendo, @aDibo, @nzapo, 'B002', DATEDIFF(minute, @dstarto, @dendo) )
SELECT @nzapo
""")
row = cursor.fetchone()
print("Qvo=%d" % (row[0]))
conn.commit()
cursor.close()
conn.close()
