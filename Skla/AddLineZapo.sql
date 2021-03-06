USE [BigoLogo]
GO
/****** Object:  StoredProcedure [dbo].[AddLineZapo]    Script Date: 23.11.2021 17:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 23 ноября 2021
-- Description:	Вариант для вызова как через pymsql, так и из MS Studio
-- Избавился от вложенных транзакций
-- =============================================
ALTER PROCEDURE [dbo].[AddLineZapo]
	@Dibo varchar(50),		--Имя базы данных
	@dLogo datetime,		--ДатаВремя записи в логе
	@uIda int,				--ID Юзера в записи лога 
	@uNamo varchar(50),		--Имя Юзера
	@Compo varchar(50),		--Имя компьютера Юзера
	@Modulo varchar(100),	--Модуль (версия)
	@Tablo varchar(50),		--Таблица
	@Deystvo varchar(10),	--Выполняемое действие в смысле БД 
	@Messo varchar(2000),	--Сообщение описательное
	@Paramo varchar(4000),	--Изменяемые параметры и их значения
	@iLogo bit OUT,         --Требуется ли запись в Лог
	@idaLogo bigint OUT,    --ID записи Дубля 
	@tLogo varchar(100) OUT --Текст сообщения для лога    
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	DECLARE @NotaNew bit = 1, @TrOk bit = 0,
	@kDibo int,				--Имя базы данных
	@kdLogo bigint,			--ДатаВремя записи в логе
	@kuIda int,				--ID Юзера в записи лога 
	@kuNamo int,			--Имя Юзера
	@kCompo int,			--Имя компьютера Юзера
	@kModulo int,			--Модуль (версия)
	@kTablo int,			--Таблица
	@kDeystvo int,			--Выполняемое действие в смысле БД 
	@kMesso bigint,			--Сообщение описательное
	@kParamo bigint			--Изменяемые параметры и их значения

	DECLARE @Traa VARCHAR(20) = 'Zapo'
	DECLARE @TraQvo int
	SET @TraQvo = @@TRANCOUNT
	if @TraQvo > 0
		SAVE TRANSACTION @Traa
	ELSE
		begin tran
	SET @iLogo = 0
	
		--1-- ДатаВремя записи в логе
		SELECT @kdLogo = Id from dLogo where LogoTime = @dLogo
		if @kdLogo is Null begin
			insert into dLogo (LogoTime) values(@dLogo)
			SELECT @kdLogo = Id from dLogo where LogoTime = @dLogo
			SET @NotaNew = 0
		end

		--2-- ID Юзера в записи лога 
		SELECT @kuIda = Id from uIda where numer = @uIda
		if @kuIda is Null begin
			insert into uIda (numer) values(@uIda)
			SELECT @kuIda = Id from uIda where numer = @uIda
			SET @NotaNew = 0
		end

		--3-- Имя Юзера
		SELECT @kuNamo = Id from uNamo where namo = @uNamo
		if @kuNamo is Null begin
			insert into uNamo (namo) values(@uNamo)
			SELECT @kuNamo = Id from uNamo where namo = @uNamo
			SET @NotaNew = 0
		end

		--4-- Имя компьютера Юзера
		SELECT @kCompo = Id from Compo where namo = @Compo
		if @kCompo is Null begin
			insert into Compo (namo) values(@Compo)
			SELECT @kCompo = Id from Compo where namo = @Compo
			SET @NotaNew = 0
		end

		--5-- Модуль (версия)
		SELECT @kModulo = Id from Modulo where namo = @Modulo
		if @kModulo is Null begin
			insert into Modulo (namo) values(@Modulo)
			SELECT @kModulo = Id from Modulo where namo = @Modulo
			SET @NotaNew = 0
		end

		--6-- Таблица
		SELECT @kTablo = Id from Tablo where namo = @Tablo
		if @kTablo is Null begin
			insert into Tablo (namo) values(@Tablo)
			SELECT @kTablo = Id from Tablo where namo = @Tablo
			SET @NotaNew = 0
		end

		--7-- Выполняемое действие в смысле БД 
		SELECT @kDeystvo = Id from Deystvo where namo = @Deystvo
		if @kDeystvo is Null begin
			insert into Deystvo (namo) values(@Deystvo)
			SELECT @kDeystvo = Id from Deystvo where namo = @Deystvo
			SET @NotaNew = 0
		end

		--8-- Сообщение описательное
		SELECT @kMesso = Id from Messo where hesha = dbo.bzMhesha(left(@Messo,40)) AND lena = len(@Messo) AND namo = @Messo
		if @kMesso is Null begin
			insert into Messo (namo, lena, hesha) values(@Messo, len(@Messo), dbo.bzMhesha(left(@Messo,40)))
			SELECT @kMesso = Id from Messo where hesha = dbo.bzMhesha(left(@Messo,40)) AND lena = len(@Messo) AND namo = @Messo
			SET @NotaNew = 0
		end

		--9-- Изменяемые параметры и их значения
		SELECT @kParamo = Id from Paramo where hesha = dbo.bzHesha(left(@Paramo,80)) AND lena = len(@Paramo) AND texo = @Paramo
		if @kParamo is Null begin
			insert into Paramo (texo, lena, hesha) values(@Paramo, len(@Paramo), dbo.bzHesha(left(@Paramo,80)))
			SELECT @kParamo = Id from Paramo where hesha = dbo.bzHesha(left(@Paramo,80)) AND lena = len(@Paramo) AND texo = @Paramo
			SET @NotaNew = 0
		end

		if @Notanew = 1 begin
			DECLARE @zid bigint
			SELECT @kDibo = RDiBo, @zid = Id from Zapo 
			where RdLogo = @kdLogo AND RParamo = @kParamo AND RMesso = @kMesso
			AND RuIda = @kuIda	AND RuNamo = @kuNamo AND RCompo = @kCompo
			AND RModulo = @kModulo AND RTablo = @kTablo AND RDeystvo = @kDeystvo
			if @kDibo is NOT Null begin
				DECLARE @oldDiBo varchar(50)
				SELECT @oldDiBo = namo from dbNamo where Id=@kDibo
				SET @iLogo = 1
				SET @idaLogo = @zid
				if @oldDiBo = @Dibo SET @tLogo = 'Чистый повтор БД->' + @oldDiBo + ' Dato->' + convert(varchar(25), @dLogo, 121)
				else SET @tLogo = 'Уже было в БД->' + @oldDiBo + ' Dato->' + convert(varchar(25), @dLogo, 121) + ' и не будет в ' + @Dibo
				if @TraQvo > 0
					rollback tran @Traa 	
				else
					rollback tran
				return
			end
		end
		SELECT @kDibo = Id from dbNamo where namo = @Dibo
		if @kDibo is Null begin
			insert into dbNamo (namo) values(@Dibo)
			SELECT @kDibo = Id from dbNamo where namo = @Dibo
		end
		insert into Zapo (dTime, RDibo,  RdLogo,  RuIda,  RuNamo,  RCompo,  RModulo,  RTablo,  RDeystvo,  RMesso,  RParamo)
		values(       GETDATE(), @kDibo, @kdLogo, @kuIda, @kuNamo, @kCompo, @kModulo, @kTablo, @kDeystvo, @kMesso, @kParamo)
		if @TraQvo = 0
			commit tran
		return
END
