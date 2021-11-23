import logging
import logging.config
import pymssql
import yaml

server = r"VALKOV\SQLEXPRESS"
dbnameGet = r"BilLoKorm"
dbnameZab = r"BigoLogo"
ConnPropy = """
SET ARITHABORT ON;
SET CONCAT_NULL_YIELDS_NULL ON;
SET ANSI_NULLS ON;
SET ANSI_NULL_DFLT_ON ON;
SET ANSI_PADDING ON;
SET ANSI_WARNINGS ON;
SET ANSI_NULL_DFLT_ON ON;
SET IMPLICIT_TRANSACTIONS OFF;
SET CURSOR_CLOSE_ON_COMMIT OFF;
SET QUOTED_IDENTIFIER ON;
SET TEXTSIZE 2147483647;
"""

def main():
    (sha, dibo, istart, iqvo) = getFromYaml()
    ii = 1
    listo = gettablolist(sha, istart)
    for z in listo:
        if ii > iqvo:
            break  
        ii += 1
        logger.debug(z)
        qvo = zabrosbazy(z, dibo)
        logger.debug(qvo)


def gettablolist(fletta: str, staro: int):
    zaprosTablo = """
    SELECT name FROM sys.objects 
    WHERE type in (N'U') 
    and  [name] LIKE '{sha}___'
    """
    reto = []
    qvero = zaprosTablo.format(sha=fletta)
    conn = pymssql.connect(host=server, database=dbnameGet)
    cursor = conn.cursor()
    cursor.execute(qvero)
    for row in cursor.fetchall():
        stro = row[0]
        ii = int(stro[1:])
        if ii >= staro:
            reto.append(stro)
    cursor.close()
    conn.close()
    return reto


def zabrosbazy(bname: str, dibo: str):
    zapros = """
    DECLARE @aDibo varchar(50) = '{dibo}'		--Имя базы данных
    
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
    FROM BilLoKorm.dbo.{bname}
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
		    @idaLogo bigint,		--ID записи Дубля в Лог
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
	                     @Deystvo = @aDeystvo, @Messo = @aMesso, @Paramo = @aParamo, @iLogo = @iLogo OUT, @idaLogo = @idaLogo OUT, @tLogo = @tLogo out
	    if @iLogo = 1
		    insert into MyLogo (dTime, Texo, dubleId) VALUES( GETDATE(), @tLogo, @idaLogo )
	    else
		    set @nzapo = @nzapo + 1
	    fetch next from mico into @adLogo, @auIda, @auNamo, @aCompo, @aModulo, @aTablo,	@aDeystvo, @aMesso, @aParamo
    END
    CLOSE mico
    DEALLOCATE mico
    SET @dendo = GETDATE()
    insert into AddoLogo (dTime, Baso, Kvo, Tablo, Minuto) VALUES( @dendo, @aDibo, @nzapo, '{bname}', DATEDIFF(minute, @dstarto, @dendo) )
    SELECT @nzapo
    """
    qvero = zapros.format(dibo=dibo, bname=bname)
    conn = pymssql.connect(host=server, database=dbnameZab, \
        appname='ZapuskSerii', conn_properties=ConnPropy)
    cursor = conn.cursor()
    cursor.execute(qvero)
    row=cursor.fetchall()
    reto = row[0][0]
    cursor.close()
    conn.commit()
    conn.close()
    return reto


def getFromYaml():
    with open('cfgZapSer.yaml') as fh:
        read_data = yaml.load(fh, Loader=yaml.FullLoader)
    return (read_data['LetterStart'], read_data['DataBaseForLogoWrite'], read_data['NumberStartTable'], read_data['QvoMaxLoadedTables'])


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('Rutto')
    logger.info("Begino")
    main()
    logger.info("Endo")