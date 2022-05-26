[script]

create table OKP_UNOM_REZERV (
  ID bigint not null identity(1, 1),
  SUB_ID bigint not null,
  SReserv_ID bigint not null,
  QTY float(53) not null,
  QTY_F float(53) null,
  QTY_A float(53) NULL,
  Fold_Q float(53) NULL,
  Fold_A float(53) NULL,
  Comment varchar(200) COLLATE DATABASE_DEFAULT null,
  CONSTRAINT PK_OKP_UNOM_REZERV PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица связи производственного резерва (OKP_SReserv) с номерными объектами (OKP_UNOM/OKP_UKIM)', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор записи', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор номерной карточки объекта на складе (OKP_WRH_SUBJECTS.ID)', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'SUB_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор резерва. Ссылка на OKP_SReserv.ID', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'SReserv_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Количество резервирования в системной ЕИЗ (EV_SYSEIZ.SYSIDN), соответствующей ЕИЗ планирования (OKP_NOM.UOM$$$EIZ) по обозначению номенклатурной позиции', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Выданное со склада количество в системной ЕИЗ (см. описание OKP_UNOM_REZERV.QTY).', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'QTY_F'
EXEC sp_addextendedproperty 'MS_Description', N'Аннулированное количество (снятое с резерва) в системной ЕИЗ (см. описание OKP_UNOM_REZERV.QTY)', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'QTY_A'
EXEC sp_addextendedproperty 'MS_Description', N'свёртка QTY_F', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'Fold_Q'
EXEC sp_addextendedproperty 'MS_Description', N'свёртка QTY_A', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'Fold_A'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'Comment'
GO

create table OKP_WRHFOLDData
(
  ID bigint not null identity(1, 1),
  FOLD_ID bigint not null,
  WRH_ID bigint not null,
  INV_ID bigint not null,
  QTY_S float(53) not null,
  QTY_I float(53) not null,
  QTY_O float(53) not null,
  DKD datetime not null,
  CONSTRAINT PK_WRHFOLDData PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица данных по свёртке', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на OKP_WRHFOLDS.ID', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData', N'column', N'FOLD_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на OKP_WRH.WRH_ID', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData', N'column', N'WRH_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на OKP_INV.INV_ID', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData', N'column', N'INV_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Количество ТМЦ в момент регистрации (по данным первоначального сальдо)', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData', N'column', N'QTY_S'
EXEC sp_addextendedproperty 'MS_Description', N'Количество прихода ТМЦ ко времени свёртки', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData', N'column', N'QTY_I'
EXEC sp_addextendedproperty 'MS_Description', N'Количество расхода ТМЦ ко времени свёртки', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData', N'column', N'QTY_O'
EXEC sp_addextendedproperty 'MS_Description', N'Дата свёртки', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData', N'column', N'DKD'
GO

create table OKP_PLODataPPA (
  ID bigint not null identity(1, 1),
  PLOData_ID bigint not null, 
  PPPNUM varchar(10) COLLATE Database_default, 
  QTY float(53),                     
  QTY_F float(53),
  QTY_W float(53),
  FIO varchar(100) COLLATE Database_default,
  D_Begin datetime,
  D_Final datetime,
  D_Fact datetime,
  D_Confirm datetime
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица данных по связанным плановым позициям (ПП), сданным в архив', N'schema', N'dbo', N'table', N'OKP_PLODataPPA'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на OKP_PLOData.ID', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'PLOData_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ПП', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Плановое количество выпуска (по ПП)', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Изготовлено', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'QTY_F'
EXEC sp_addextendedproperty 'MS_Description', N'Сдано на склад годных', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'QTY_W'
EXEC sp_addextendedproperty 'MS_Description', N'ФИО плановика', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'FIO'
EXEC sp_addextendedproperty 'MS_Description', N'Дата запуска плановая', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'D_Begin'
EXEC sp_addextendedproperty 'MS_Description', N'Дата завершения плановая', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'D_Final'
EXEC sp_addextendedproperty 'MS_Description', N'Дата завершения фактическая', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'D_Fact'
EXEC sp_addextendedproperty 'MS_Description', N'Дата подтверждения', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'D_Confirm'
GO

/*
  OKP_sysStatistics :
	  IDN - обозначение объекта статистики
	  StatTable - таблица статистики - хранилище стат. данных (см. "STC_-таблицы" далее)
	  Source - источник, используемый для заполнения статистической таблицы, источник может буть двух типов:
                   1) Запрос стат. данных - это может быть вьюшка, функция или текст запроса (должен быть заключён в круглые скобки).
                      Такой источник должен возвращать полные статистические данные, набор полей должен содержать все поля набора
                      полей статистической таблицы за исключением служебных полей
                   2) Специальные процедуры, требования к процедурам статистики:
                       2.1) набор полей возвращаемой таблицы должен совпадать с набором полей статистической таблицы за исключением служебных 
                            полей (т.е. и по составу и по очёредности)
                       2.2) процедура должна принимать на вход минимум один параметр:
                            - параметр, содержащий имя таблицы списка, либо текст SQL-запроса списка, заключённый в круглые скобки.
                              если список пуст (или не указан), то осуществляется возврат полных статистических данных
                       Пример 1:
                         p_stc_CPL_OVEREXPENDITURE (@List varchar(2000), @Typ int)
               
                       2.3) в таблице объектов статистики указывается след образом:
                            а) первым идёт ключевое слово EXECUTE
                            б) далее после пробела - имя процедуры
                            в) далее после пробела параметры (в соответствии с описанием процедуры):
                               - обязательные параметры (см п. 2) указываются лексеммами (параметр списка - :LIST)
                               - остальные параметры - константами
                       Пример 2:
                         EXECUTE p_stc_CPL_OVEREXPENDITURE :LIST 1
                           данный пример соответствует примеру №1, в котором соответственно указаны:
                           - @List = :LIST
                           - @Typ  = 1

	  ListField - имя поля для фильтрации статистической таблицы, способ связи фильтрующих данных зависит от типа источника (см. описание Source):
                        а) если в качестве источника используется запрос первого типа (см. Source - п.1), то ListField - имя поля для связи статистической 
                           таблицы со списком передаваемым в обработчик при вызове.
                        б) если в качестве источника используется запрос второго типа (см. Source - п.2), то ListField - имя поля для связи статистической 
                           таблицы с таблицей-результатом, возвращаемой процедурой-источником                     
                      Для обеспечения высокой скорости работы статистики необходимо чтобы это поле в StatTable было проиндексировано

	  UpdateIgnoreFields - список полей, которые при обновлении данных затрагивать не нужно (перечисление - через запятую)

  STC_-таблицы :
	обязательноые требования к структуре статистических таблиц:
	  - определить PRIMARY KEY и/или UNIQUE KEY 
	  - наличие поля TAG - служебное поле 
	  - желательно иметь индексы 
*/
create table OKP_sysStatistics (
  ID int not null identity(1, 1),
  IDN varchar(100) COLLATE Database_default not null,
  StatTable varchar(100) COLLATE Database_default not null,
  Source varchar(8000) COLLATE Database_default not null,
  ListField varchar(100) COLLATE Database_default not null,
  UpdateIgnoreFields varchar(1000) COLLATE Database_default,
  CONSTRAINT PK_OKP_sysStatistics PRIMARY KEY CLUSTERED (ID)
)
GO

/*
  Статистическая таблица функции dbo.f_OKP_ZKD(null)
*/
create table STC_ZKD (
  pCPL_ID	bigint,
  QTY_PC	float,
  PPP_ID	bigint,
  CPL_ID	bigint not null,
  PRT		varchar(50) COLLATE Database_default,
  P_QTY_F	float,
  QTY_P		float,
  QTY_A		float,
  QTY_BA	float,
  QTY_F		float,
  QTY_B		float,
  QTY_RM	float,
  QTY_IZ	float,
  QTY_B_RM	float,
  QTY_B_IZ	float,
  QTY_RK	float,
  QTY_K		float,
  QTY_C		float,
  K		float,
  TAG		int null,
  CONSTRAINT PK_STC_ZKD PRIMARY KEY CLUSTERED (CPL_ID)
)
GO

/*
  Статистическая таблица функции dbo.f_OKP_SUBZKD(null)
*/
create table STC_SUBZKD (
  PPP_ID	bigint,
  CPL_ID	bigint not null,
  PRT		varchar(50) COLLATE Database_default,
  SUB_ID	bigint,
  QTY_RM	float,
  QTY_IZ	float,
  QTY_B_RM	float,
  QTY_B_IZ	float,
  K		float,
  TAG		int null
)
GO

create table STC_CPL_OVEREXPENDITURE (
  CPL_ID bigint, 
  Self_ int, 
  Full_ int, 
  TAG int,
  CONSTRAINT PK_STC_CPL_OVEREXPENDITURE PRIMARY KEY CLUSTERED (CPL_ID)
)
GO

/*
** Архивная таблица для OKP_CPL
*/
CREATE TABLE dbo.ARH_CPL (
  DEP$$$DEP varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  ZPR int NULL,
  NUM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  PRT$$$NOM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  PRTPARNOM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  DTEPDZ datetime NULL,
  DTEPDV datetime NULL,
  QTYPQY float NULL,
  QTYTQY float NULL,
  DTEFDV datetime NULL,
  QTYFQY float NULL,
  QTYBRK float NULL,
  TPZ varchar(1) COLLATE DATABASE_DEFAULT NULL,
  STS int NULL,
  KNO varchar(1) COLLATE DATABASE_DEFAULT NULL,
  SEBPTZ float NULL,
  SEBPTF float NULL,
  SEBSTZ float NULL,
  PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  REM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  MET tinyint NULL,
  RSTS int NULL,
  QTYIQY float NULL,
  rwc int NULL,
  PlanType bit NULL,
  PartySize float NULL,
  DTEASH datetime NULL,
  QTY_PC float NOT NULL,
  RWC_PPP int NULL,
  M_DB bigint NOT NULL,
  M_DE bigint NOT NULL,
  QTYAQY float NULL,
  NMP$$$NAM varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  LastCDTE datetime NULL,
  QTYCQY float NULL,
  FOLD_I float NOT NULL,
  FOLD_K float NOT NULL,
  PARNUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  PAR_RWC int NULL,
  IsExternalNode int NOT NULL,
  ROUTE_ID int NULL,
  DELTADATE bigint NULL,
  OMP int NULL,
  NRP int NULL,
  QCYRAT float NULL,
  FOLD_B float NULL,
  QTY_BI float(53) NULL,
  QTY_BA float(53) NULL,
  SHELFLIFE_STS INT NULL,
  SIZES varchar(256) COLLATE DATABASE_DEFAULT NULL,
  SIZES_EIZ varchar(3) COLLATE DATABASE_DEFAULT NULL,
  QTYonNUM float NULL
 

)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архив "Производственные партии"', N'schema', N'dbo', N'table', N'ARH_CPL'
EXEC sp_addextendedproperty 'MS_Description', N'ID производственной партии', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор цеха', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'DEP$$$DEP'
EXEC sp_addextendedproperty 'MS_Description', N'Порядковый номер цехоперехода', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'ZPR'
EXEC sp_addextendedproperty 'MS_Description', N'Номер партии', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор предмета', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'PRT$$$NOM'
EXEC sp_addextendedproperty 'MS_Description', N'Индентификатор составляющего', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'PRTPARNOM'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая дата запуска заказа', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'DTEPDZ'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая дата выпуска заказа', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'DTEPDV'
EXEC sp_addextendedproperty 'MS_Description', N'Количество выпуска', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'Текущее количество заказа', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTYTQY'
EXEC sp_addextendedproperty 'MS_Description', N'Фактическая дата выпуска заказа', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'DTEFDV'
EXEC sp_addextendedproperty 'MS_Description', N'Фактическое количество годных', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTYFQY'
EXEC sp_addextendedproperty 'MS_Description', N'Фактическое количество брака', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTYBRK'
EXEC sp_addextendedproperty 'MS_Description', N'Тип заказа', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'TPZ'
EXEC sp_addextendedproperty 'MS_Description', N'Код состояния заказа', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'Метка просмотра', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'KNO'
EXEC sp_addextendedproperty 'MS_Description', N'Прямые трудовые затраты -норматив', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'SEBPTZ'
EXEC sp_addextendedproperty 'MS_Description', N'Прямые трудовые затраты - фактически', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'SEBPTF'
EXEC sp_addextendedproperty 'MS_Description', N'Трудовые затраты в браке', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'SEBSTZ'
EXEC sp_addextendedproperty 'MS_Description', N'Номер ПП', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'REM'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'ВСЕГО сдано на склад годной (небракованной) продукции (в составе узла + россыпью)', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTYIQY'
EXEC sp_addextendedproperty 'MS_Description', N'Тип планирования', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'Размер партии', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'PartySize'
EXEC sp_addextendedproperty 'MS_Description', N'Дата АвтоСдвига', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'DTEASH'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата начала', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'M_DB'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата окончания', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'M_DE'
EXEC sp_addextendedproperty 'MS_Description', N'Сдано на склад годной (небракованной) продукции в составе узла', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTYAQY'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'NMP$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последней отгрузки заказчику', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'LastCDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Отгруженное заказчику количество', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTYCQY'
EXEC sp_addextendedproperty 'MS_Description', N'СВЁРТКА количества, имеющегося на складе россыпью. В базовых ЕИЗ', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'FOLD_I'
EXEC sp_addextendedproperty 'MS_Description', N'СВЁРТКА количества изделий, представляющих собой комплект.  Указывается только для корневых партий (для ПП), остальные - 0.  В базовых ЕИЗ', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'FOLD_K'
EXEC sp_addextendedproperty 'MS_Description', N'Родительская производственная партия', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'PARNUM'
EXEC sp_addextendedproperty 'MS_Description', N'ID родительской производственной партии', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'PAR_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Является ли производственная партия новоприобретенной для родительской ПрП(0-родная,1-новоприобретенная)', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'IsExternalNode'
EXEC sp_addextendedproperty 'MS_Description', N'ID первоначального маршрута', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'ROUTE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Смешение даты запуска/выпуска в секундах относительно рассчитанной даты', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'DELTADATE'
EXEC sp_addextendedproperty 'MS_Description', N'Организация материального потока:  0- партионная, 1-подетальная', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'OMP'
EXEC sp_addextendedproperty 'MS_Description', N'Назначение размера партии  0-по рассчету  1-большее целое  2-меньшее целое', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'NRP'
EXEC sp_addextendedproperty 'MS_Description', N'Кратность запуска на момент постановки в план', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QCYRAT'
EXEC sp_addextendedproperty 'MS_Description', N'ВСЕГО сдано на склад бракованной продукции (в составе бракованного узла + россыпью)', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTY_BI'
EXEC sp_addextendedproperty 'MS_Description', N'Сдано на склад бракованной продукции в составе узла', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTY_BA'
EXEC sp_addextendedproperty 'MS_Description', N'СВЁРТКА количества брака, имеющегося на складе дефектовки россыпью. В базовых ЕИЗ', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'FOLD_B'
EXEC sp_addextendedproperty 'MS_Description', N'ID плановой позиции', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'RWC_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'Статус срока годности', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'SHELFLIFE_STS'
EXEC sp_addextendedproperty 'MS_Description', N'Размеры предмета', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'SIZES'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ размера предмета', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'SIZES_EIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Количество в номерной партии', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTYonNUM'
GO


/*
** Архивная таблица для OKP_ESKORTLIST
*/
CREATE TABLE dbo.ARH_ESKORTLIST (
  ID int NULL,
  DATECREATION datetime NULL,
  CREATOR varchar(100) COLLATE DATABASE_DEFAULT NULL,
  PPPNUM_ID int NULL,
  CPLNUM_ID int NULL,
  STATUS int NULL,
  DATENULLIFICATION datetime NULL,
  NULLIFICATOR varchar(100) COLLATE DATABASE_DEFAULT NULL
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Архив журнала сопроводительных листов', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST'
EXEC sp_addextendedproperty 'MS_Description', N'Иденификатор документа', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата создания', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST', N'column', N'DATECREATION'
EXEC sp_addextendedproperty 'MS_Description', N'Кем создано', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST', N'column', N'CREATOR'
EXEC sp_addextendedproperty 'MS_Description', N'RWC плановой позиции', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST', N'column', N'PPPNUM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'RWC CPL', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST', N'column', N'CPLNUM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Статус : 1-сформирован, 0 - аннулирован', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST', N'column', N'STATUS'
EXEC sp_addextendedproperty 'MS_Description', N'Дата аннулирования', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST', N'column', N'DATENULLIFICATION'
EXEC sp_addextendedproperty 'MS_Description', N'Кем аннулированно', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST', N'column', N'NULLIFICATOR'
GO

--
-- Definition for table ARH_OPLAN_DATA : 
--

CREATE TABLE dbo.ARH_OPLAN_DATA (
  ID int NULL,
  OPLAN_ID int NULL,
  TOZ_ID int NULL,
  ORDERNUM int NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'АРХИВ ДАННЫХ ЖУРНАЛА ПРОИЗВОДСТВЕННЫХ ПЛАНОВ', N'schema', N'dbo', N'table', N'ARH_OPLAN_DATA'
EXEC sp_addextendedproperty 'MS_Description', N'идентификатор записи журнала', N'schema', N'dbo', N'table', N'ARH_OPLAN_DATA', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'номер плана', N'schema', N'dbo', N'table', N'ARH_OPLAN_DATA', N'column', N'OPLAN_ID'
EXEC sp_addextendedproperty 'MS_Description', N'идентификатор операции', N'schema', N'dbo', N'table', N'ARH_OPLAN_DATA', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'порядковый номер в документе', N'schema', N'dbo', N'table', N'ARH_OPLAN_DATA', N'column', N'ORDERNUM'
GO


/*
** Архивная таблица для OKP_POT
*/
CREATE TABLE dbo.ARH_POT (
	RWC bigint NULL,
	CPLNUM varchar(50) COLLATE DATABASE_DEFAULT NULL,
	PRTIDN varchar(50) COLLATE DATABASE_DEFAULT NULL,
	DTE datetime NULL,
	QTYPOT float NULL,
	QTYTQY float NULL,
	ZPR int NULL,
	NOP int NULL,
	LLC int NULL,
	REF varchar(10) COLLATE DATABASE_DEFAULT NULL,
	QTYRQY float NULL,
	INR float NULL,
	VIN varchar(10) COLLATE DATABASE_DEFAULT NULL,
	EditDTE datetime NULL,
	MET bit NULL,
	ReplaceDocNum varchar(50) COLLATE DATABASE_DEFAULT NULL,
	ReplaceDocDTE datetime NULL,
	PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NULL,
	TM int NULL,
	RWC_PPP int NULL,
	Rwc_toz int NULL,
	NMP$$$NAM varchar(100) COLLATE DATABASE_DEFAULT NULL,
	TRN_ID bigint NULL,
	REJECT_ID int NULL
        
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архив потребности КиМ на производственную операцию', N'schema', N'dbo', N'table', N'ARH_POT'
EXEC sp_addextendedproperty 'MS_Description', N'Номер производственной патрии', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор материала', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'PRTIDN'
EXEC sp_addextendedproperty 'MS_Description', N'Дата потребности', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Количество потребности', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'QTYPOT'
EXEC sp_addextendedproperty 'MS_Description', N'Текущее количество потребности', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'QTYTQY'
EXEC sp_addextendedproperty 'MS_Description', N'Номер цехоперехода', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'ZPR'
EXEC sp_addextendedproperty 'MS_Description', N'Номер  операции сборки', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'Код низшего уровня', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'LLC'
EXEC sp_addextendedproperty 'MS_Description', N'Номер первичного источника', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'REF'
EXEC sp_addextendedproperty 'MS_Description', N'Расчетная пpименяемость компонента', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'QTYRQY'
EXEC sp_addextendedproperty 'MS_Description', N'Измененная норма расхода', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'INR'
EXEC sp_addextendedproperty 'MS_Description', N'ID причины отклонения', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'REJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Виновник', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'VIN'
EXEC sp_addextendedproperty 'MS_Description', N'Дата ввода данных', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'EditDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Статус (0 - обычный, 1 - замененный)', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Номер документа замены', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'ReplaceDocNum'
EXEC sp_addextendedproperty 'MS_Description', N'Дата документа замены', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'ReplaceDocDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Н', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'тип потребности:  0 - Основной  1 - вспомогательный  2 - заготовка  3 - комплектующие  4 - инструмент  5 - унифицированное  6 - основной материал по кооперации  7 - вспомогательный материал по кооперации  8 - заготовка по кооперации  9 - покупное по кооперации', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'TM'
EXEC sp_addextendedproperty 'MS_Description', N'Завязка на toz', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'Rwc_toz'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование материала', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'NMP$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'ID транзакции IR (okp_sreserv.ID)', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'TRN_ID'
GO


/*
** Архивная таблица для OKP_PPP
*/
CREATE TABLE dbo.ARH_PPP (
  PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NULL,
  PRT$$$NOM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  NMP$$$NAM varchar(100) COLLATE DATABASE_DEFAULT NULL,
  DTE datetime NULL,
  DTEZ datetime NULL,
  NPR varchar(50) COLLATE DATABASE_DEFAULT NULL,
  QCYPQY float NULL,
  PER varchar(1) COLLATE DATABASE_DEFAULT NULL,
  QCYFQY float NULL,
  WAR varchar(1) COLLATE DATABASE_DEFAULT NULL,
  FDTE datetime NULL,
  STS int NULL,
  REM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  MET int NULL,
  RSTS int NULL,
  AutoShift int NULL,
  Priority int NULL,
  USER_ID int NULL,
  DIRECTION smallint NULL,
  ZAKDTE datetime NULL,
  FPDTE datetime NULL,
  UseSklad tinyint NULL,
  rwc int NULL,
  M_DB bigint NULL,
  M_DE bigint NULL,
  Manual int NULL,
  CONFIRMBYUSER varchar(50) COLLATE DATABASE_DEFAULT NULL,
  CONFIRMDATE datetime NULL,
  IGNORECAPACITY int NULL,
  TPS_ID bigint NULL,
  TPS_N int NULL,
  TPS_N_DB bigint NULL,
  TPS_N_DE bigint NULL,
  ISENLARGED int NULL,
  RZP_MARK int NULL,
  SHELFLIFE_STS INT NULL,
  SHEDULEDBY varchar(50) COLLATE DATABASE_DEFAULT NULL,
  SHEDULED datetime NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архив плановых позиций', N'schema', N'dbo', N'table', N'ARH_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'ID плановой позиции', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Номер плановой позиции', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор предмета', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'PRT$$$NOM'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование предмета', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'NMP$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'Дата выпуска позиции', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Дата запуска заказа', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'DTEZ'
EXEC sp_addextendedproperty 'MS_Description', N'Направление реализации', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'NPR'
EXEC sp_addextendedproperty 'MS_Description', N'Плановое количество выпуска', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'QCYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'Тип планового периода', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'PER'
EXEC sp_addextendedproperty 'MS_Description', N'Фактически выполненное количество', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'QCYFQY'
EXEC sp_addextendedproperty 'MS_Description', N'Номер варианта ПП', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'WAR'
EXEC sp_addextendedproperty 'MS_Description', N'Фактическая дата выпуска', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'FDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Код статуса плановой позиции', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'REM'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'ID ответственного исполнителя', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Направление планирования: 0 - назад, -1 - вперед', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'DIRECTION'
EXEC sp_addextendedproperty 'MS_Description', N'Дата выполнения по заказу', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'ZAKDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Изначальная дата планирования', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'FPDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг использования данной позицией данных модуля Склад (0 - не использовать, 1 - использовать)', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'UseSklad'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая(директивная) дата начала', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'M_DB'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата окончания', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'M_DE'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг директивной позиции', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'Manual'
EXEC sp_addextendedproperty 'MS_Description', N'Кем подтверждено', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'CONFIRMBYUSER'
EXEC sp_addextendedproperty 'MS_Description', N'Дата подтверждения', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'CONFIRMDATE'
EXEC sp_addextendedproperty 'MS_Description', N'флаг игнорирования загрузки оборудования, 0 - не изгороровать, 1 - игнорировать', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'IGNORECAPACITY'
EXEC sp_addextendedproperty 'MS_Description', N'ссылка на ID используемого шаблона, ', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'TPS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Номер этапа в шаблоне', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'TPS_N'
EXEC sp_addextendedproperty 'MS_Description', N'Дата начала этапа', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'TPS_N_DB'
EXEC sp_addextendedproperty 'MS_Description', N'Дата ококнчания этапа', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'TPS_N_DE'
EXEC sp_addextendedproperty 'MS_Description', N'флаг укрупненная позиция', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'ISENLARGED'
EXEC sp_addextendedproperty 'MS_Description', N'Значение приоритета', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'PRIORITY'
EXEC sp_addextendedproperty 'MS_Description', N'Метка для снабжения - не обобщать', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'RZP_MARK'
EXEC sp_addextendedproperty 'MS_Description', N'Статус срока годности', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'SHELFLIFE_STS'
EXEC sp_addextendedproperty 'MS_Description', N'Статус ПП', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'RSTS'
EXEC sp_addextendedproperty 'MS_Description', N'Кем была запланирована ПП', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'SHEDULEDBY'
EXEC sp_addextendedproperty 'MS_Description', N'Дата планирования ПП', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'SHEDULED'

GO

--
-- Definition for table ARH_PPPDEP : 
--

CREATE TABLE dbo.ARH_PPPDEP (
  ID bigint NULL,
  RWC_PPP bigint NULL,
  RWC_DEP int NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архив связей ПлП с полдразделениями', N'schema', N'dbo', N'table', N'ARH_PPPDEP'
EXEC sp_addextendedproperty 'MS_Description', N'ID связи', 'schema', 'dbo', 'table', 'ARH_PPPDEP', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ид ПлП', 'schema', 'dbo', 'table', 'ARH_PPPDEP', 'column', 'RWC_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'Ид подразделения', 'schema', 'dbo', 'table', 'ARH_PPPDEP', 'column', 'RWC_DEP'
go

--
-- Definition for table ARH_RAM : 
--

CREATE TABLE dbo.ARH_RAM (
  DEP varchar(10) COLLATE DATABASE_DEFAULT NULL,
  PRTIDN varchar(50) COLLATE DATABASE_DEFAULT NULL,
  CPLNUM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  QTY float NULL,
  DTE datetime NULL,
  CPZ varchar(50) COLLATE DATABASE_DEFAULT NULL,
  QTYRQY float NULL,
  QTYINR float NULL,
  PRO varchar(50) COLLATE DATABASE_DEFAULT NULL,
  VIN varchar(50) COLLATE DATABASE_DEFAULT NULL,
  QTYPOL float NULL,
  MET int NULL,
  RWC bigint NULL,
  NOS int NULL
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Архив РАСХОДа КОМПОНЕНТ НА ПРОИЗВОДСТВО', N'schema', N'dbo', N'table', N'ARH_RAM'
EXEC sp_addextendedproperty 'MS_Description', N'Подразделение-изготовитель', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'DEP'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор компонента', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'PRTIDN'
EXEC sp_addextendedproperty 'MS_Description', N'Номеp наряда', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Сданное количество', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Дата pасхода', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Код пpоизводственных затpат', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'CPZ'
EXEC sp_addextendedproperty 'MS_Description', N'Расчетная пpименяемость компонента', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'QTYRQY'
EXEC sp_addextendedproperty 'MS_Description', N'Измененая пpименяемость компонента', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'QTYINR'
EXEC sp_addextendedproperty 'MS_Description', N'Код пpичины отклонения', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'PRO'
EXEC sp_addextendedproperty 'MS_Description', N'Код виновника отклонения', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'VIN'
EXEC sp_addextendedproperty 'MS_Description', N'Получено компонент на заказ', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'QTYPOL'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'НОМЕР СООБЩЕНИЯ (связь с OKP_UOP)', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'NOS'
GO


--
-- Definition for table ARH_TECHDOUBLES : 
--

CREATE TABLE dbo.ARH_TECHDOUBLES (
  RWC int NULL,
  PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NULL,
  NUM_ORIGIN varchar(50) COLLATE DATABASE_DEFAULT NULL,
  NUM_DEPENDINGS varchar(50) COLLATE DATABASE_DEFAULT NULL,
  RWC_PPP int NULL,
  RWC_CPL_ORIG int NULL,
  RWC_CPL_DEPEND int NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архив зависимостей партий ', N'schema', N'dbo', N'table', N'ARH_TECHDOUBLES'
EXEC sp_addextendedproperty 'MS_Description', N'Номер плановой позиции', N'schema', N'dbo', N'table', N'ARH_TECHDOUBLES', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'ПрП - оригинал', N'schema', N'dbo', N'table', N'ARH_TECHDOUBLES', N'column', N'NUM_ORIGIN'
EXEC sp_addextendedproperty 'MS_Description', N'Зависящие ПрП', N'schema', N'dbo', N'table', N'ARH_TECHDOUBLES', N'column', N'NUM_DEPENDINGS'
EXEC sp_addextendedproperty 'MS_Description', N'Ид ПлП', N'schema', N'dbo', N'table', N'ARH_TECHDOUBLES', N'column', N'RWC_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'Ид ПрП оригинала', N'schema', N'dbo', N'table', N'ARH_TECHDOUBLES', N'column', N'RWC_CPL_ORIG'
EXEC sp_addextendedproperty 'MS_Description', N'Ид зависящих ПрП', N'schema', N'dbo', N'table', N'ARH_TECHDOUBLES', N'column', N'RWC_CPL_DEPEND'
GO


/*
** Definition for table ARH_TOZ : 
*/
CREATE TABLE dbo.ARH_TOZ (
	PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NULL,
	NUM varchar(50) COLLATE DATABASE_DEFAULT NULL,
	PRT$$$MNF varchar(50) COLLATE DATABASE_DEFAULT NULL,
	DEP_ID int NULL,
	WCR$$$WCR varchar(12) COLLATE DATABASE_DEFAULT NULL,
	NOP int NULL,
	STS int NULL,
	PRI int NULL,
	DTEPDZ datetime NULL,
	DTEPDV datetime NULL,
	FCD datetime NULL,
	QTYPQY float NULL,
	QTYCQY float NULL,
	QTYGQY float NULL,
	QTYFSC float NULL,
	QTYPWO float NULL,
	PNK varchar(1) COLLATE DATABASE_DEFAULT NULL,
	PRP int NULL,
	QTYPZV float NULL,
	QTYEDV float NULL,
	REJECT_ID int NULL,
	VIN_DEP_ID int NULL,
	ENR int NULL,
	MET tinyint NULL,
	MOV float NULL,
	PlanType int NULL,
	Holidays bit NULL,
	QCY int NULL,
	TimeBegin datetime NULL,
	PSM float NULL,
	SRC int NULL,
	QCYFLX float NULL,
	RSTS int NULL,
	normTaskDate datetime NULL,
	ZPR_RWC bigint NULL,
	rwc int NULL,
	TOP$$$KTO varchar(4) COLLATE DATABASE_DEFAULT NULL,
	OOD int NULL,
	PZV float NULL,
	VP float NULL,
	TMO float NULL,
	TRO float NULL,
	RZO int NULL,
	PRF$$$PRF varchar(5) COLLATE DATABASE_DEFAULT NULL,
	TDDOC varchar(50) COLLATE DATABASE_DEFAULT NULL,
	TPN float NULL,
	PRODTYPE int NULL,
	TSK float NULL,
	SPLITPARTIES int NULL,
	RWC_PPP int NULL,
	RWC_CPL int NULL,
	M_DB bigint NULL,
	M_DE bigint NULL,
	DTETPNE bigint NULL,
	DTEMO bigint NULL,
	M_DB_NR bigint NULL,
	M_DE_NR bigint NULL,
	NR int NULL,
	WPLCOUNT int NULL,
	TU varchar(4000) COLLATE DATABASE_DEFAULT NULL,
	FILES_ID int NULL,
	QTYBRK float NULL,
	COMMENT varchar(250) COLLATE DATABASE_DEFAULT NULL,
	autouop BIT NULL,
	useKOID TINYINT NULL,
	verify_need BIT Null,
        SHELFLIFE float  NULL,
        SHELFLIFE_EIZID INT NULL,
        SHELFLIFE_STS INT NULL,
        SHT float NULL

)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Архив производственные операций', N'schema', N'dbo', N'table', N'ARH_TOZ'
EXEC sp_addextendedproperty 'MS_Description', N'Номер ПП', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Номер наряда', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор предмета', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PRT$$$MNF'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения-изготовителя', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор рабочего центра', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'WCR$$$WCR'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'Код состояния операции', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'Приоритет операции', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PRI'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая дата начала операции', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'DTEPDZ'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая дата выпуска операции', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'DTEPDV'
EXEC sp_addextendedproperty 'MS_Description', N'Фактич. дата выпуска операции', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'FCD'
EXEC sp_addextendedproperty 'MS_Description', N'Запланированное количество', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QTYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'Текущее количество на операции', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QTYCQY'
EXEC sp_addextendedproperty 'MS_Description', N'Завершенное количество на операции', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QTYGQY'
EXEC sp_addextendedproperty 'MS_Description', N'Фактич. количество брака допущенное на операции', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QTYFSC'
EXEC sp_addextendedproperty 'MS_Description', N'Время обработки в часах (округленно)', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QTYPWO'
EXEC sp_addextendedproperty 'MS_Description', N'Причина неукомплектованности', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PNK'
EXEC sp_addextendedproperty 'MS_Description', N'Признак операции 0,1,2,3', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PRP'
EXEC sp_addextendedproperty 'MS_Description', N'Подготов.-заключительное время на единицу', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QTYPZV'
EXEC sp_addextendedproperty 'MS_Description', N'Штучное время', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QTYEDV'
EXEC sp_addextendedproperty 'MS_Description', N'ID причины отклонения', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'REJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'VIN_DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Единица ноpмиpования', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'ENR'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Межоперационное время', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'MOV'
EXEC sp_addextendedproperty 'MS_Description', N'Тип планирования', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'Признак работы в выходные и праздничные дни', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'Holidays'
EXEC sp_addextendedproperty 'MS_Description', N'Количество единиц оборудования', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QCY'
EXEC sp_addextendedproperty 'MS_Description', N'Размер межоперационной передаточной партии', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QCYFLX'
EXEC sp_addextendedproperty 'MS_Description', N'Дата формирования нормированного задания', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'normTaskDate'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на соответствующий операции цехопереход', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'ZPR_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение технологической операци', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'TOP$$$KTO'
EXEC sp_addextendedproperty 'MS_Description', N'Число одновременно обрабатываемых', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'OOD'
EXEC sp_addextendedproperty 'MS_Description', N'Подготовительно-заключител.время', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PZV'
EXEC sp_addextendedproperty 'MS_Description', N'Объём партии', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'VP'
EXEC sp_addextendedproperty 'MS_Description', N'Машинное время обработки', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'TMO'
EXEC sp_addextendedproperty 'MS_Description', N'Рабочее время обработки', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'Разряд', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'Профессия', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PRF$$$PRF'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ТД', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'TDDOC'
EXEC sp_addextendedproperty 'MS_Description', N'время переналадки', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'TPN'
EXEC sp_addextendedproperty 'MS_Description', N'Тип производства 0-собственное ,  1-кооперация', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PRODTYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Штучно-калькуляционное время', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'TSK'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг возможности разделения на производственные партии Null,1 - можно, 0-нельзя', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'SPLITPARTIES'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата начала', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'M_DB'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата окончания', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'M_DE'
EXEC sp_addextendedproperty 'MS_Description', N'Время окончания времени переналадки', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'DTETPNE'
EXEC sp_addextendedproperty 'MS_Description', N'Время начала межоперационного промежутка', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'DTEMO'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата начала без контроля связей', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'M_DB_NR'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата окончания без контроля связей', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'M_DE_NR'
EXEC sp_addextendedproperty 'MS_Description', N'Признак отсутствия контроля связей 0-контроль, 1- контроля нет', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'NR'
EXEC sp_addextendedproperty 'MS_Description', N'Технологические указания', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'TU'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на эскиз', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'FILES_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Небольшой комментарии к операции маршрута', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'COMMENT'
EXEC sp_addextendedproperty 'MS_Description', N'Количество брака предудущих операций', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QTYBRK'
EXEC sp_addextendedproperty 'MS_Description', N'Операция автоучитываемая', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'autouop'
EXEC sp_addextendedproperty 'MS_Description', N'Учесть КОИД при расчёте калькуляции', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'useKOID'
EXEC sp_addextendedproperty 'MS_Description', N'Требует контроля ОТК', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'verify_need'
EXEC sp_addextendedproperty 'MS_Description', N'Срок годности', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'SHELFLIFE'
Exec sp_addextendedproperty 'MS_Description', N'ID ЕИЗ срока хранения', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'SHELFLIFE_EIZID'
EXEC sp_addextendedproperty 'MS_Description', N'Статус срока годности', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'SHELFLIFE_STS'
GO


--
-- Definition for table ARH_TRNDOC : 
--

CREATE TABLE dbo.ARH_TRNDOC (
  ID bigint IDENTITY(1, 1) NOT NULL,
  FOLD_ID int NOT NULL,
  WRH_ID int NOT NULL,
  GRP_ID int NULL,
  DOC varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  TSO varchar(2) COLLATE DATABASE_DEFAULT NOT NULL,
  DKD datetime NOT NULL,
  PRS varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  COUNTERPARTY varchar(100) COLLATE DATABASE_DEFAULT NULL,
  FACTUR varchar(20) COLLATE DATABASE_DEFAULT NULL,
  DTF datetime NULL,
  BILL varchar(50) COLLATE DATABASE_DEFAULT NULL,
  DTBILL datetime NULL,
  DOGOVOR varchar(50) COLLATE DATABASE_DEFAULT NULL,
  DDOGOVOR datetime NULL,
  DOCBase varchar(200) COLLATE DATABASE_DEFAULT NULL,
  DESCRIBE varchar(4000) COLLATE DATABASE_DEFAULT NULL,
  PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица документов складских журналов, сданных в архив', N'schema', N'dbo', N'table', N'ARH_TRNDOC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'ARH_TRNDOC', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на документ свёртки (OKP_WRHFOLDS.ID)', N'schema', N'dbo', N'table', N'ARH_TRNDOC', N'column', N'FOLD_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на склад (OKP_WRH.WRH_ID)', N'schema', N'dbo', N'table', N'ARH_TRNDOC', N'column', N'WRH_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Группа, к которой относится документ в архиве (ARH_TRNGRP.ID)', N'schema', N'dbo', N'table', N'ARH_TRNDOC', N'column', N'GRP_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Спецификация документа-основания', N'schema', N'dbo', N'table', N'ARH_TRNDOC', N'column', N'DOCBase'
GO

--
-- Definition for table ARH_TRNDOCData : 
--

CREATE TABLE dbo.ARH_TRNDOCData (
  ID bigint IDENTITY(1, 1) NOT NULL,
  DOC_ID bigint NULL,
  FOLD_ID int NOT NULL,
  WRH_ID int NULL,
  DOC varchar(50) COLLATE DATABASE_DEFAULT NULL,
  TSO varchar(2) COLLATE DATABASE_DEFAULT NULL,
  PRS varchar(100) COLLATE DATABASE_DEFAULT NULL,
  INV_ID int NULL,
  INV_IDN varchar(50) COLLATE DATABASE_DEFAULT NULL,
  LIN int NULL,
  DTE datetime NULL,
  PRC money NULL,
  PRC_D money null,
  QTY float NULL,
  EIZ varchar(10) COLLATE DATABASE_DEFAULT NULL,
  CNT float NULL,
  ART varchar(8) COLLATE DATABASE_DEFAULT NULL,
  NUM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  DOCBase varchar(200) COLLATE DATABASE_DEFAULT NULL,
  H_EIZH varchar(10) COLLATE DATABASE_DEFAULT NULL,
  H_PRC money NULL,
  H_QTY float NULL,
  COMMENT varchar(200) COLLATE DATABASE_DEFAULT NULL,
  MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
  UIDN varchar(50) COLLATE DATABASE_DEFAULT NULL,
  UObjectTypeID int NULL,
  PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Содержимое документов складских журналов, сданных в архив', N'schema', N'dbo', N'table', N'ARH_TRNDOCData'
GO

EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на складской документ в архиве (ARH_TRNDOC.ID)', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'DOC_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на документ свёртки (OKP_WRHFOLDS.ID)', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'FOLD_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на склад (OKP_WRH.WRH_ID)', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'WRH_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор первичного документа', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'DOC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Код типа транзакции (OKP_TSO.TSO_IDN)', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'TSO'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ответственное лицо', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'PRS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на предмет (OKP_INV.INV_ID)', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'INV_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор предмета (OKP_INV.PRTIDN)', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'INV_IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Порядковый номер записи (строка документа)', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'LIN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Фактическая дата создания записи в документе', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'DTE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Единичная цена предмета', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'PRC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Единичная цена предмета по документу', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'PRC_D'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Обработанное количество', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Единица измерения количества (ARH_TRNDOCData.QTY) в документе', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'EIZ'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Коэффициент пересчёта количества (OKP_TRN.QTY) из ЕИЗ транзакции (OKP_TRN.EIZ_RASH) в базовую ЕИЗ (в соответствии с основной ЕИЗ) предмета', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'CNT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Код бухг. учета', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'ART'
GO

EXEC sp_addextendedproperty 'MS_Description', N'№ заказа/договора из РРР', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'NUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Спецификация документа-основания', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'DOCBase'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Имя текущей базовой ЕИЗ (в соответствии с текущей основной ЕИЗ) предмета - имя ЕИЗ, в которой указаны h_prc, h_qty', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'H_EIZH'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Цена до проведения транзакции в текущей базовой ЕИЗ (в соответствии с текущей основной ЕИЗ) предмета ', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'H_PRC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Количество до проведения транзакции в текущей базовой ЕИЗ (в соответствии с текущей основной ЕИЗ) предмета ', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'H_QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Флаг записи. Отражает состояние записи (дополнительно см. описание OKP_TRN.MET)', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'MET'
GO

--
-- Definition for table ARH_WPDDOC : 
--
create table ARH_WPDDOC (
  ID bigint IDENTITY(1, 1) NOT NULL,
  FOLD_ID int NOT NULL, 
  WRH_ID int NOT NULL,
  DOC varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  DKD datetime NOT NULL,
  PRS varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  DESCRIBE varchar(4000) COLLATE DATABASE_DEFAULT NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица складских документов распределения, сданных в архив', N'schema', N'dbo', N'table', N'ARH_WPDDOC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'ARH_WPDDOC', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на документ свёртки (OKP_WRHFOLDS.ID)', N'schema', N'dbo', N'table', N'ARH_WPDDOC', N'column', N'FOLD_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на склад (OKP_WRH.WRH_ID)', N'schema', N'dbo', N'table', N'ARH_WPDDOC', N'column', N'WRH_ID'
GO

--
-- Definition for table ARH_WPDData : 
--
create table ARH_WPDData ( 
  ID bigint IDENTITY(1, 1) NOT NULL,
  DOC_ID bigint NULL,
  FOLD_ID int NOT NULL,
  WRH_ID int NULL,
  DOC varchar(50) COLLATE DATABASE_DEFAULT NULL,
  DOCBase varchar(200) COLLATE DATABASE_DEFAULT NULL,
  PRS varchar(100) COLLATE DATABASE_DEFAULT NULL,
  INV_ID int NULL,
  INV_IDN varchar(50) COLLATE DATABASE_DEFAULT NULL,
  LIN int NULL,
  QTY float NULL,
  EIZ varchar(10) COLLATE DATABASE_DEFAULT NULL,
  PRC money NULL,
  UIDN varchar(50) COLLATE DATABASE_DEFAULT NULL,
  UObjectTypeID int NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Содержимое складских документов распределения, сданных в архив', N'schema', N'dbo', N'table', N'ARH_WPDData'
GO

EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на складской документ в архиве (ARH_TRNDOC.ID)', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'DOC_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на документ свёртки (OKP_WRHFOLDS.ID)', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'FOLD_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на склад (OKP_WRH.WRH_ID)', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'WRH_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор первичного документа', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'DOC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Спецификация документа-основания', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'DOCBase'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ответственное лицо', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'PRS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на предмет (OKP_INV.INV_ID)', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'INV_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор предмета (OKP_INV.PRTIDN)', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'INV_IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Порядковый номер записи (строка документа)', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'LIN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Обработанное количество', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Единица измерения количества (ARH_WPDData.QTY) в документе', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'EIZ'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Единичная цена предмета', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'PRC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Серийный номер', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'UIDN'
GO

/*
** ARH_UBR : 
*/
CREATE TABLE dbo.ARH_UBR (
	NOS varchar(10) COLLATE DATABASE_DEFAULT NULL,
	N_Act int NULL,
	DTE datetime NULL,
	CPLNUM varchar(50) COLLATE DATABASE_DEFAULT NULL,
	DEPDOB varchar(10) COLLATE DATABASE_DEFAULT NULL,
	WCRWCT varchar(12) COLLATE DATABASE_DEFAULT NULL,
	ZPRZOB int NULL,
	NOPNOB varchar(50) COLLATE DATABASE_DEFAULT NULL,
	ZPRZOZ int NULL,
	NOPNOW varchar(50) COLLATE DATABASE_DEFAULT NULL,
	KBR char(10) COLLATE DATABASE_DEFAULT NULL,
	REJECT_ID int NULL,
	VINDEP varchar(10) COLLATE DATABASE_DEFAULT NULL,
	PRCSVN float NULL,
	SEBSVO float NULL,
	SEBZMT float NULL,
	SEBZZT float NULL,
	QTYBQY float NULL,
	RetDTE datetime NULL,
	ZATID int NULL,
	RETRIEVABLE tinyint NULL,
	NAMENOW varchar(50) COLLATE DATABASE_DEFAULT NULL,
	NAMENOB varchar(50) COLLATE DATABASE_DEFAULT NULL,
	SEBZMV float NULL,
	SEBZMK float NULL,
	SEBZZK float NULL,
	STS int NULL,
	Rwc_toz int NULL,
	rwc_cpl int NULL,
	TZ int NULL,
	Tab varchar(50) COLLATE DATABASE_DEFAULT NULL,
	FIO_K varchar(100) COLLATE DATABASE_DEFAULT NULL,
	SEBZI FLOAT(53) NULL,
	SEBZZT_v float(53) NULL,
	SEBZKOS float(53) NULL,
	eskiz_id INT NULL,
        REM varchar(50) COLLATE DATABASE_DEFAULT NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архив учета брака', N'schema', N'dbo', N'table', N'ARH_UBR'
EXEC sp_addextendedproperty 'MS_Description', N'Номер акта', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'NOS'
EXEC sp_addextendedproperty 'MS_Description', N'Дата составления акта о браке', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Номер наряда', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор подразделения-обнаружителя, nil -  внешний, например покупатель. ', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'DEPDOB'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор РЦ обнаружителя', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'WCRWCT'
EXEC sp_addextendedproperty 'MS_Description', N'Номер цехоперехода обнаружителя', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'ZPRZOB'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции обнаружителя', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'NOPNOB'
EXEC sp_addextendedproperty 'MS_Description', N'Номер цехоперехода возникновения', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'ZPRZOZ'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции возникновения', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'NOPNOW'
EXEC sp_addextendedproperty 'MS_Description', N'Код категории брака', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'KBR'
EXEC sp_addextendedproperty 'MS_Description', N'ID причины отклонения', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'REJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Код виновника брака', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'VINDEP'
EXEC sp_addextendedproperty 'MS_Description', N'Сумма, удержанная с виновника', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'PRCSVN'
EXEC sp_addextendedproperty 'MS_Description', N'Стоимость возмещения', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'SEBSVO'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты (основной материал)', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'SEBZMT'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты (зарплата)', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'SEBZZT'
EXEC sp_addextendedproperty 'MS_Description', N'Забракованное количество', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'QTYBQY'
EXEC sp_addextendedproperty 'MS_Description', N'Дата удержания суммы', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'RetDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Код производственных затрат', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'ZATID'
EXEC sp_addextendedproperty 'MS_Description', N'Вид брака 0-восстановимый, 1-невосстановимый', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'RETRIEVABLE'
EXEC sp_addextendedproperty 'MS_Description', N'наименование операции виновника', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'NAMENOW'
EXEC sp_addextendedproperty 'MS_Description', N'наименование операции обнаружителя', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'NAMENOB'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты на вспомогательный материал', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'SEBZMV'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты на материал по кооперации', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'SEBZMK'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты на услуги по кооперации', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'SEBZZK'
EXEC sp_addextendedproperty 'MS_Description', N'Код состояния операции: " " - активная запись, "3" - анулированная запись', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'Завязка на toz', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'Rwc_toz'
EXEC sp_addextendedproperty 'MS_Description', N'ссылка на cpl', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'rwc_cpl'
EXEC sp_addextendedproperty 'MS_Description', N'тип затрат', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'TZ'
EXEC sp_addextendedproperty 'MS_Description', N'Табельный	номер', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'Tab'
EXEC sp_addextendedproperty 'MS_Description', N'ФИО контролера', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'FIO_K'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты на инструменты', 'schema', 'dbo', 'table', 'ARH_UBR', 'column', 'SEBZI'
EXEC sp_addextendedproperty 'MS_Description', N'Трудовые затраты на операции виновника', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'SEBZZT_v'
EXEC sp_addextendedproperty 'MS_Description', N'Kосвенные затраты', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'SEBZKOS'
EXEC sp_addextendedproperty 'MS_Description', N'ID фото брака', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'eskiz_id'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'REM'
GO

--
-- Definition for table ARH_UBRDEP : 
--
CREATE TABLE ARH_UBRDEP (
  N_Act int, 
  NUM varchar(50) COLLATE Database_default,											
  SEBZMT float, 
  SEBZMV float, 
  SEBZMK float, 
  SEBZI  float, 
  SEBZZT float,
  SEBZZK float,
  SEBSVO float,
  DEP_ID int,
  SEBZKOS float	
  )
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архив учета брака по подразделениям', N'schema', N'dbo', N'table', N'ARH_UBRDEP'
EXEC sp_addextendedproperty 'MS_Description', N'ссылка на номер акта', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'N_Act'
EXEC sp_addextendedproperty 'MS_Description', N'Производственная партия', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты (основной материал)', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'SEBZMT'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты на вспомогательный материал', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'SEBZMV'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты на материал по кооперации', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'SEBZMK'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты на инструменты', 'schema', 'dbo', 'table', 'ARH_UBRDEP', 'column', 'SEBZI'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты (зарплата)', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'SEBZZT'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты на услуги по кооперации', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'SEBZZK'
EXEC sp_addextendedproperty 'MS_Description', N'Стоимость возмещения', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'SEBSVO'
EXEC sp_addextendedproperty 'MS_Description', N'ссылка на подразделение', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'DEP_Id'
EXEC sp_addextendedproperty 'MS_Description', N'Косвенные затраты', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'SEBZKOS'
GO

--
-- Definition for table ARH_UNOM : 
--

CREATE TABLE dbo.ARH_UNOM (
  ID bigint NULL,
  NOM_ID bigint NULL,
  IDN varchar(50) COLLATE DATABASE_DEFAULT NULL,
  EXT_IDN varchar(50) COLLATE DATABASE_DEFAULT NULL,
  CPL_ID bigint NULL,
  CERTIFICATE varchar(100) COLLATE DATABASE_DEFAULT NULL,
  DESCRIBE varchar(100) COLLATE DATABASE_DEFAULT NULL,
  EXTNOM_ID bigint NULL,
  PermDate datetime null
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Архив серийных номеров', N'schema', N'dbo', N'table', N'ARH_UNOM'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'ARH_UNOM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Классификационный ключ. Ссылка на OKP_NOM.RWC', N'schema', N'dbo', N'table', N'ARH_UNOM', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Серийный номер', N'schema', N'dbo', N'table', N'ARH_UNOM', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Внешний серийный номер', N'schema', N'dbo', N'table', N'ARH_UNOM', N'column', N'EXT_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Сертификат', N'schema', N'dbo', N'table', N'ARH_UNOM', N'column', N'CERTIFICATE'
EXEC sp_addextendedproperty 'MS_Description', N'Описание', N'schema', N'dbo', N'table', N'ARH_UNOM', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на OKP_CPL.RWC (указывает принадлежность к партии изготовления)', N'schema', N'dbo', N'table', N'ARH_UNOM', N'column', N'CPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата окончания срока годности', N'schema', N'dbo', N'table', N'ARH_UNOM', N'column', N'PermDate'
GO


/*
** архив таблицы okp_uop
*/
CREATE TABLE dbo.ARH_UOP (
  NOS int NULL,
  PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NULL,
  NUM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  PRT$$$MNF varchar(50) COLLATE DATABASE_DEFAULT NULL,
  DEP_ID int NULL,
  NOP int NULL,
  STS varchar(1) COLLATE DATABASE_DEFAULT NULL,
  QTYPQY float NULL,
  QTYGQY float NULL,
  QTYKOL float NULL,
  QTYPZV float NULL,
  QTYEDV float NULL,
  TAB varchar(50) COLLATE DATABASE_DEFAULT NULL,
  REJECT_ID int NULL,
  VIN_DEP_ID int NULL,
  DTE datetime NULL,
  PRP varchar(1) COLLATE DATABASE_DEFAULT NULL,
  ENR varchar(3) COLLATE DATABASE_DEFAULT NULL,
  MET tinyint NULL,
  ORDDTE datetime NULL,
  Order_Count int NULL,
  DTEREG datetime NULL,
  REJECT_ID_TSH int NULL,
  RZO varchar(3) COLLATE DATABASE_DEFAULT NULL,
  WCR$$$WCR varchar(12) COLLATE DATABASE_DEFAULT NULL,
  REJECT_ID_EDIT int NULL,
  DTECancel datetime NULL,
  CancelByUser varchar(50) COLLATE DATABASE_DEFAULT NULL,
  Prodtype int NULL,
  Top$$$kto varchar(4) COLLATE DATABASE_DEFAULT NULL,
  Rwc_toz int NULL,
  rwc_cpl int NULL,
  TRO float NULL,
  KU float NULL,
  GrUID uniqueidentifier NULL,
  REGBYUSER varchar(50) COLLATE DATABASE_DEFAULT NULL,
  OOD int NULL,
  PPP_ID int NULL,
  WPL_ID int NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архив учёта операций', N'schema', N'dbo', N'table', N'ARH_UOP'
EXEC sp_addextendedproperty 'MS_Description', N'ID учёта операции', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'NOS'
EXEC sp_addextendedproperty 'MS_Description', N'Номеp заказа', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор предмета', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'PRT$$$MNF'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения-изготовителя', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'Код состояния операции пусто - активная запись 2 - активная, неподлежащая анулированию 3 - анулированная запись', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'Запланированное количество', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'QTYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'Завеpшенное количество годных', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'QTYGQY'
EXEC sp_addextendedproperty 'MS_Description', N'Сданное количество', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'QTYKOL'
EXEC sp_addextendedproperty 'MS_Description', N'Подготов.-заключительное время', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'QTYPZV'
EXEC sp_addextendedproperty 'MS_Description', N'Тшк-зп (штучно-калькуляционное зарплатное)', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'QTYEDV'
EXEC sp_addextendedproperty 'MS_Description', N'Табельный номер', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'TAB'
EXEC sp_addextendedproperty 'MS_Description', N'ID причины отклонения по дате', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'REJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения виновника отклонения', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'VIN_DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата учета', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Признак операции 1 - завершена, 0 - нет', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'PRP'
EXEC sp_addextendedproperty 'MS_Description', N'Единица ноpмиpования', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'ENR'
EXEC sp_addextendedproperty 'MS_Description', N'Резервное поле ', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Дата составления наряда на оплату', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'ORDDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Резервное поле, актуально в OKP_Order ', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'Order_Count'
EXEC sp_addextendedproperty 'MS_Description', N'Дата регистрации(ввода)', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'DTEREG'
EXEC sp_addextendedproperty 'MS_Description', N'ID причины отклонения нормативов', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'REJECT_ID_TSH'
EXEC sp_addextendedproperty 'MS_Description', N'Разряд', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение рабочего центра', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'WCR$$$WCR'
EXEC sp_addextendedproperty 'MS_Description', N'ID причины редактирования учета', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'REJECT_ID_EDIT'
EXEC sp_addextendedproperty 'MS_Description', N'Дата анулирования\редактирования учета', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'DTECancel'
EXEC sp_addextendedproperty 'MS_Description', N'Кем анулировано\редактировано', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'CancelByUser'
EXEC sp_addextendedproperty 'MS_Description', N'Тип производства 0-собственное ,  1-кооперация', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'Prodtype'
EXEC sp_addextendedproperty 'MS_Description', N'код технологической операци', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'Top$$$kto'
EXEC sp_addextendedproperty 'MS_Description', N'ID производственной операции', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'Rwc_toz'
EXEC sp_addextendedproperty 'MS_Description', N'ID производственной партии', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'rwc_cpl'
EXEC sp_addextendedproperty 'MS_Description', N'Рабочее время обработки Тшк (штучно-калькуляционное)', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'Коэффициент участия в группе', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'KU'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный идентификатор группы учета', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'GrUID'
EXEC sp_addextendedproperty 'MS_Description', N'Кем проведен учет', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'REGBYUSER'
EXEC sp_addextendedproperty 'MS_Description', N'КОИД', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'OOD'
EXEC sp_addextendedproperty 'MS_Description', N'ID плановой позиции', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'PPP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID рабочего места', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'WPL_ID'
GO

--
-- Definition for table ARH_UOPKIMNUMS : 
--

CREATE TABLE dbo.ARH_UOPKIMNUMS (
  ID_ bigint NULL,
  IDN_ varchar(50) COLLATE DATABASE_DEFAULT NULL,
  EXT_IDN_ varchar(50) COLLATE DATABASE_DEFAULT NULL,
  NOM_ID_ bigint NULL,
  Typ int NULL,
  ID bigint NULL,
  UOP_GrUID uniqueidentifier NULL,
  WRHSUBJ_ID bigint NULL,
  QTY_USED float NULL,
  TK int NULL
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Архив связей учетов и внутренних идентификационных номеров КИМ', N'schema', N'dbo', N'table', N'ARH_UOPKIMNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на группу учета ', N'schema', N'dbo', N'table', N'ARH_UOPKIMNUMS', N'column', N'UOP_GrUID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на распределение объектов выдачи ', N'schema', N'dbo', N'table', N'ARH_UOPKIMNUMS', N'column', N'WRHSUBJ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Использованное кол-во в единицах измерения аналогичных ARH_POT.QTYPOT', N'schema', N'dbo', N'table', N'ARH_UOPKIMNUMS', N'column', N'QTY_USED'
EXEC sp_addextendedproperty 'MS_Description', N'Тип комплектации (0 со склада; 1 с производства)', N'schema', N'dbo', N'table', N'ARH_UOPKIMNUMS', N'column', N'TK'
GO


--
-- Definition for table ARH_UOPNUMS : 
--

CREATE TABLE dbo.ARH_UOPNUMS (
  ID bigint NULL,
  TOZ_ID int NULL,
  UNOM_ID bigint NULL,
  UOP_GrUID uniqueidentifier NULL,
  N_TYPE int NULL,
  QTY float NULL
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Архив связей учетов и внутренних идентификационных номеров изделий', N'schema', N'dbo', N'table', N'ARH_UOPNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'Ключ', N'schema', N'dbo', N'table', N'ARH_UOPNUMS', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на технологическую операцию OKP_TOZ.RWC', N'schema', N'dbo', N'table', N'ARH_UOPNUMS', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на внутренний идентификационный номер (OKP_UNOM.ID)', N'schema', N'dbo', N'table', N'ARH_UOPNUMS', N'column', N'UNOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на группу учета (OKP_UOP.GrIDN)', N'schema', N'dbo', N'table', N'ARH_UOPNUMS', N'column', N'UOP_GrUID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на тип номера (OKP_sysObjects.ID)', N'schema', N'dbo', N'table', N'ARH_UOPNUMS', N'column', N'N_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Количество в идентификационной партии', N'schema', N'dbo', N'table', N'ARH_UOPNUMS', N'column', N'QTY'
GO


--
-- Definition for table ARH_VELEM : 
--

CREATE TABLE dbo.ARH_VELEM (
  ID int NULL,
  P_ID int NULL,
  OID int NULL,
  NID int NULL,
  KOL float NULL,
  KOLpO float NULL,
  PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NULL,
  RegDB datetime NULL,
  RegDE datetime NULL,
  ST int NULL
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Архив элементов виртуальных планов', N'schema', N'dbo', N'table', N'ARH_VElem'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на родителя ARH_VElem.ID', N'schema', N'dbo', N'table', N'ARH_VElem', N'column', N'P_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на таблицу объектов OKP_VObj.ID', N'schema', N'dbo', N'table', N'ARH_VElem', N'column', N'OID'
EXEC sp_addextendedproperty 'MS_Description', N'Планируемое количество элемента', N'schema', N'dbo', N'table', N'ARH_VElem', N'column', N'KOL'
EXEC sp_addextendedproperty 'MS_Description', N'Количество элемента на единицу родителя', N'schema', N'dbo', N'table', N'ARH_VElem', N'column', N'KOLpO'
EXEC sp_addextendedproperty 'MS_Description', N'Номер ПП поставленной в настоящий план по данному элементу', N'schema', N'dbo', N'table', N'ARH_VElem', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Дата начала соответствующей ПП', N'schema', N'dbo', N'table', N'ARH_VElem', N'column', N'RegDB'
EXEC sp_addextendedproperty 'MS_Description', N'Дата окончания соответствующей ПП', N'schema', N'dbo', N'table', N'ARH_VElem', N'column', N'RegDE'
EXEC sp_addextendedproperty 'MS_Description', N'Статус элемента: 0-не поставлено в план; 1-поставленно', N'schema', N'dbo', N'table', N'ARH_VElem', N'column', N'ST'
GO


--
-- Definition for table ARH_VOPER : 
--

CREATE TABLE dbo.ARH_VOPER (
  ID int NULL,
  EID int NULL,
  OID int NULL,
  WCR varchar(20) COLLATE DATABASE_DEFAULT NULL,
  KTO varchar(4) COLLATE DATABASE_DEFAULT NULL,
  KTOName varchar(150) COLLATE DATABASE_DEFAULT NULL,
  N int NULL,
  TSH float NULL,
  TPN float NULL,
  TMO float NULL,
  EIZ_TSH int NULL,
  EIZ_TPN int NULL,
  EIZ_TMO int NULL,
  DB bigint NULL,
  DE bigint NULL,
  WCRName varchar(30) COLLATE DATABASE_DEFAULT NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архив операций виртуальных планов', N'schema', N'dbo', N'table', N'ARH_VOper'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на таблицу элементов OKP_VElem.ID', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'EID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на таблицу объектов OKP_VObj.ID (для ускорения выборок)', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'OID'
EXEC sp_addextendedproperty 'MS_Description', N'РЦ (см. таблицу OKP_WRC.WCR$$$IDN)', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'WCR'
EXEC sp_addextendedproperty 'MS_Description', N'Код операции', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'KTO'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование операции', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'KTOName'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'N'
EXEC sp_addextendedproperty 'MS_Description', N'Т штучное', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'TSH'
EXEC sp_addextendedproperty 'MS_Description', N'Т переналадки', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'TPN'
EXEC sp_addextendedproperty 'MS_Description', N'Т межоперационное', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'TMO'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ Т штучного', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'EIZ_TSH'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ Т переналадки', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'EIZ_TPN'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ Т межоперационного', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'EIZ_TMO'
EXEC sp_addextendedproperty 'MS_Description', N'Дата начала операции; значение указывается на целочисленной шкале дат (см. функцию TWTime_IntAsDateTime)', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'DB'
EXEC sp_addextendedproperty 'MS_Description', N'Дата окончания операции; значение указывается на целочисленной шкале дат (см. функцию TWTime_IntAsDateTime)', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'DE'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование РЦ (см. таблицу OKP_WCR.NMC$$$NAM)', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'WCRName'
GO


/* @BLOCK: Архивные таблицы
** @DESCR: Архив таблицы выполнения контроля операций
*/
CREATE TABLE arh_verify (
	id INT NOT NULL,
	uop_id INT NOT NULL,
	fio_id INT NULL,
	time_execute DATETIME NOT NULL,
	user_id INT NULL,
	time_create DATETIME NULL,	
	verifyParam_obj_id INT NOT NULL,
	result VARCHAR(255) COLLATE DATABASE_DEFAULT NOT NULL,
	snum_id_checked BIGINT NULL,
	count_checked FLOAT(53) NULL,
	snum_id_affected BIGINT NULL,
	count_verified FLOAT(53) NULL,
	count_defected FLOAT(53) NULL,
	state TINYINT NULL,
	work_control INT NULL,
	CONSTRAINT pk_arh_verify PRIMARY KEY CLUSTERED (ID) 
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архив контроля операций', N'schema', N'dbo', N'table', N'ARH_verify'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID учёта операции', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'uop_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID контроллёра', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'fio_id'
EXEC sp_addextendedproperty 'MS_Description', N'Дата выполнения контроля', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'time_execute'
EXEC sp_addextendedproperty 'MS_Description', N'ID пользователя, создавшего запись', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'user_id'
EXEC sp_addextendedproperty 'MS_Description', N'Время создания записи', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'time_create'
EXEC sp_addextendedproperty 'MS_Description', N'ID параметра контроля', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'verifyParam_obj_id'
EXEC sp_addextendedproperty 'MS_Description', N'Результат контроля', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'result'
EXEC sp_addextendedproperty 'MS_Description', N'ID серийного номера проверенной детали', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'snum_id_checked'
EXEC sp_addextendedproperty 'MS_Description', N'Количество проверенных', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'count_checked'
EXEC sp_addextendedproperty 'MS_Description', N'ID серийного номера детали, признанной годной', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'snum_id_affected'
EXEC sp_addextendedproperty 'MS_Description', N'Количество годных', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'count_verified'
EXEC sp_addextendedproperty 'MS_Description', N'Количество годных', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'count_defected'
EXEC sp_addextendedproperty 'MS_Description', N'Статус', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'state'
GO


/* @BLOCK: Архивные таблицы
** @DESCR: Архив количества годных деталей на операции
*/
CREATE TABLE arh_verify_snum (
	id INT NOT NULL,
	snum BIGINT NULL,
	uop_id INT NOT NULL,
	count_affected FLOAT(53) NOT NULL,
	pass bit, 
	CONSTRAINT pk_arh_verify_snum PRIMARY KEY CLUSTERED (ID) 
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архив количества годных деталей на операции', N'schema', N'dbo', N'table', N'ARH_verify_snum'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'ARH_verify_snum', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID серийного номера', N'schema', N'dbo', N'table', N'ARH_verify_snum', N'column', N'snum'
EXEC sp_addextendedproperty 'MS_Description', N'ID учёта операции', N'schema', N'dbo', N'table', N'ARH_verify_snum', N'column', N'uop_id'
EXEC sp_addextendedproperty 'MS_Description', N'Количество', N'schema', N'dbo', N'table', N'ARH_verify_snum', N'column', N'count_affected'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг "признано годными"', N'schema', N'dbo', N'table', N'ARH_verify_snum', N'column', N'pass'
GO


/* @BLOCK: Архивные таблицы
** @DESCR: Архив параметров контроля операции
*/
CREATE TABLE ARH_VerifyParam_OBJ (
	id INT,
	number INT NOT NULL,
	name VARCHAR(255) COLLATE DATABASE_DEFAULT NULL,
	sysobj_id INT,
	obj_id INT,
	volume VARCHAR(255) COLLATE DATABASE_DEFAULT NULL,
	tro FLOAT(53),
	eiz_id_tro INT,
	tvo FLOAT(53),
	eiz_id_tvo INT,
	gravity INT,
	auxiliary uniqueidentifier NULL,
	cert_id INT NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архив контролируемых параметров', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Номер', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'number'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование параметра контроля', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'ID системного объекта', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'sysobj_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID объекта', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'obj_id'
EXEC sp_addextendedproperty 'MS_Description', N'Объём/Периодичность контроля', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'volume'
EXEC sp_addextendedproperty 'MS_Description', N'Время основное', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'tro'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ времени основного', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'eiz_id_tro'
EXEC sp_addextendedproperty 'MS_Description', N'Время вспомогательное', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'tvo'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ времени вспомогательного', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'eiz_id_tvo'
EXEC sp_addextendedproperty 'MS_Description', N'Порядковый номер', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'gravity'
EXEC sp_addextendedproperty 'MS_Description', N'Вспомогательное поле', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'auxiliary'
EXEC sp_addextendedproperty 'MS_Description', N'ID сертификата качества', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'cert_id'
GO


--
-- Definition for table ARH_TOZ_VERIFYNOM : 
--
CREATE TABLE dbo.ARH_TOZ_VERIFYNOM (
  ID bigint ,
  NOM_ID int ,
  TOZ_ID int ,
  AMOUNT float ,
  EIZ_ID int ,
  VERIFYPARAM_OBJ_ID int 
)
go
EXEC sp_addextendedproperty 'MS_Description', N'Архив потребностей производственных КК', N'schema', N'dbo', N'table', N'ARH_TOZ_VERIFYNOM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор потребности производственной КК', N'schema', N'dbo', N'table', N'ARH_TOZ_VERIFYNOM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор номенклатуры-инструмента', N'schema', N'dbo', N'table', N'ARH_TOZ_VERIFYNOM', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор производстченной операции', N'schema', N'dbo', N'table', N'ARH_TOZ_VERIFYNOM', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Расход инструмента', N'schema', N'dbo', N'table', N'ARH_TOZ_VERIFYNOM', N'column', N'AMOUNT'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор единицы измерения', N'schema', N'dbo', N'table', N'ARH_TOZ_VERIFYNOM', N'column', N'EIZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на параметр контроля', N'schema', N'dbo', N'table', N'ARH_TOZ_VERIFYNOM', N'column', N'VERIFYPARAM_OBJ_ID'
GO



--
-- Definition for table OKP_BARCODES : 
--

CREATE TABLE dbo.OKP_BARCODES (
  ID bigint IDENTITY(1, 1) NOT NULL,
  ObjectID int NOT NULL,
  IDN varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  BarCode bigint NOT NULL,
  Met tinyint DEFAULT 1 NOT NULL,
  RFID bigint NULL,
  CONSTRAINT PK_OKP_BARCODES PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица штрихкодов объектов', N'schema', N'dbo', N'table', N'OKP_BARCODES'
EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'OKP_BARCODES', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор типа объекта (см. таблицу OKP_sysObjects)', N'schema', N'dbo', N'table', N'OKP_BARCODES', N'column', N'ObjectID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор объекта Представляет собой, в общем случае, список с разделителями <char(1)>.В списке перечислены значения полей объекта, входящих в уникальный ключ таблицы соответствующего объекта.Однако, для некоторых объектов в список включены не все ключевые поля', N'schema', N'dbo', N'table', N'OKP_BARCODES', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Числовое представление штрихкода', N'schema', N'dbo', N'table', N'OKP_BARCODES', N'column', N'BarCode'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг записи: 0 - штрихкод сгенерирован автоматически 1 - штрихкод указан пользователем', N'schema', N'dbo', N'table', N'OKP_BARCODES', N'column', N'Met'
EXEC sp_addextendedproperty 'MS_Description', N'RFID-метка', 'SCHEMA', N'dbo', 'TABLE', N'OKP_BARCODES', 'COLUMN', N'RFID'
GO

/*
** OKP_SysObjects
*/
CREATE TABLE dbo.OKP_sysObjects (
	ID int NOT NULL,
	IDN varchar(20) COLLATE DATABASE_DEFAULT NOT NULL,
	SOURCE varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	PARAMETERS varchar(255) COLLATE DATABASE_DEFAULT NOT NULL,
	LOCKEDINFOCOLUMNS varchar(255) COLLATE DATABASE_DEFAULT NULL,
	DESCRIBE varchar(255) COLLATE DATABASE_DEFAULT NOT NULL,
	LockMethod varchar(1500) COLLATE DATABASE_DEFAULT NULL,
	CheckLockMethod varchar(1500) COLLATE DATABASE_DEFAULT NULL,
	SelectLockedMethod varchar(1500) COLLATE DATABASE_DEFAULT NULL,
	GetLockedInfoMethod varchar(1500) COLLATE DATABASE_DEFAULT NULL,
	BCVIEW sysname NULL,
	BaseGrp_ID int NULL,
	IDN_fields varchar(255) COLLATE DATABASE_DEFAULT NULL,
	has_perm_base BIT CONSTRAINT df__okp_sysobjects__has_perm_base DEFAULT 0 NOT NULL,
	has_perm_group BIT CONSTRAINT df__okp_sysobjects__has_perm_group DEFAULT 0 NOT NULL,
	has_perm_dep BIT CONSTRAINT df__okp_sysobjects__has_perm_dep DEFAULT 0 NOT NULL,
	rparm_id INT NULL,
	CONSTRAINT PK_OKP_sysObjects PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Системные объекты', N'schema', N'dbo', N'table', N'OKP_sysObjects'
EXEC sp_addextendedproperty 'MS_Description', N'ID системного объекта', N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор объекта', N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Таблица-источник. Если используется представление, обязательно должно быть поле RWC, подобно identity в таблице.', N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'SOURCE'
EXEC sp_addextendedproperty 'MS_Description', N'Список ключевых полей, значения в списке разделяются ";"', N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'PARAMETERS'
EXEC sp_addextendedproperty 'MS_Description', N'Список визуальных наименований колонок в информационных записях. Используется при выдаче пользователю данных о заблокированных объектах - см. метод GetLockedInfoMethod. Значения в списке разделяются ";"', N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'LOCKEDINFOCOLUMNS'
EXEC sp_addextendedproperty 'MS_Description', N'ID базовой группы', 'schema', 'dbo', 'table', 'OKP_sysObjects', 'column', 'BaseGrp_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Процедура сбора визуальных данных для выдачи пользователю информации о блокировке запрошенного объекта', N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'GetLockedInfoMethod'
EXEC sp_addextendedproperty 'MS_Description', N'Процедура выбирает заблокированные по связям объекты из списка (#LO_Locks) - см. процедуру sp_SelectLockedByList',  N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'SelectLockedMethod'
EXEC sp_addextendedproperty 'MS_Description', N'Процедура проверяет блокировку по связям объектов из списка (#LO_Locks) - см. процедуру sp_CheckLinkLocks', N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'CheckLockMethod'
EXEC sp_addextendedproperty 'MS_Description', N'Название системного объекта', N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор объекта в отчетной системе', N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'IDN_fields' 
EXEC sp_addextendedproperty 'MS_Description', N'Наличие собственных прав доступа на объект', N'schema', N'dbo', N'table', N'okp_sysobjects', N'column', N'has_perm_base'
EXEC sp_addextendedproperty 'MS_Description', N'Наличие собственных прав доступа на группу', N'schema', N'dbo', N'table', N'okp_sysobjects', N'column', N'has_perm_group'
EXEC sp_addextendedproperty 'MS_Description', N'Наличие собственных прав доступа на объект в разрезе подразделений', N'schema', N'dbo', N'table', N'okp_sysobjects', N'column', N'has_perm_dep'
EXEC sp_addextendedproperty 'MS_Description', N'ID связанного параметра отчётной системы', N'schema', N'dbo', N'table', N'okp_sysobjects', N'column', N'rparm_id'
GO

/* @NAME:  OKP_PPP
** @DESCR: Плановая позици
*/
CREATE TABLE dbo.OKP_PPP (
	PPPNUM varchar(10) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_PPP_PPPNUM DEFAULT '' NOT NULL,
	PRT$$$NOM varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_PPP_PRT$$$NOM DEFAULT '' NOT NULL,
	NMP$$$NAM varchar(100) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_PPP_NMP$$$NAM DEFAULT '' NOT NULL,
	DTE datetime NULL,
	DTEZ datetime NULL,
	NPR varchar(50) COLLATE DATABASE_DEFAULT NULL,
	QCYPQY float CONSTRAINT DF_OKP_PPP_QCYPQY DEFAULT 1 NOT NULL,
	PER varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_PPP_PER DEFAULT 'D' NOT NULL,
	QCYFQY float CONSTRAINT DF_OKP_PPP_QCYFQY DEFAULT 0 NOT NULL,
	WAR varchar(1) COLLATE DATABASE_DEFAULT NULL,
	FDTE datetime NULL,
	STS int CONSTRAINT DF_OKP_PPP_STS DEFAULT 0 NOT NULL,
	REM varchar(50) COLLATE DATABASE_DEFAULT NULL,
	MET int NULL,
	RSTS int NULL,
	AutoShift int NULL,
	Priority int NULL,
	USER_ID int NULL,
	DIRECTION smallint DEFAULT 0 NOT NULL,
	ZAKDTE datetime NULL,
	FPDTE datetime NULL,
	UseSklad tinyint DEFAULT 1 NOT NULL,
	rwc int IDENTITY(1, 1) NOT NULL,
	M_DB bigint NOT NULL,
	M_DE bigint NOT NULL,
	Manual int DEFAULT 0 NOT NULL,
	CONFIRMBYUSER varchar(50) COLLATE DATABASE_DEFAULT NULL,
	CONFIRMDATE datetime NULL,
	IGNORECAPACITY int DEFAULT 0 NOT NULL,
	TPS_ID bigint NULL,
	TPS_N int NULL,
	TPS_N_DB bigint NULL,
	TPS_N_DE bigint NULL,
	ISENLARGED int DEFAULT 0 NOT NULL,
	RZP_MARK INT CONSTRAINT df__okp_ppp__rzp_mark DEFAULT 0 NULL,
        SHELFLIFE_STS INT CONSTRAINT DK_OKP_PPP_SHELFLIFE_STS DEFAULT 0 NOT NULL,
        SHEDULEDBY varchar(50) COLLATE DATABASE_DEFAULT NULL,
        SHEDULED datetime NULL,
	CONSTRAINT PK_OKP_PPP PRIMARY KEY CLUSTERED (PPPNUM)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Плановые позиции', N'schema', N'dbo', N'table', N'OKP_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'ID плановой позиции', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Номер плановой позиции', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор предмета', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'PRT$$$NOM'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование предмета', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'NMP$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'Дата выпуска позиции', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Дата запуска заказа', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'DTEZ'
EXEC sp_addextendedproperty 'MS_Description', N'Направление реализации', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'NPR'
EXEC sp_addextendedproperty 'MS_Description', N'Плановое количество выпуска', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'QCYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'Тип планового периода', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'PER'
EXEC sp_addextendedproperty 'MS_Description', N'Фактически выполненное количество', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'QCYFQY'
EXEC sp_addextendedproperty 'MS_Description', N'Номер варианта ПП', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'WAR'
EXEC sp_addextendedproperty 'MS_Description', N'Фактическая дата выпуска', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'FDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Код статуса плановой позиции', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'REM'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'ID ответственного исполнителя', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Направление планирования: 0 - назад, -1 - вперед', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'DIRECTION'
EXEC sp_addextendedproperty 'MS_Description', N'Дата выполнения по заказу', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'ZAKDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Изначальная дата планирования', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'FPDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг использования данной позицией данных модуля Склад (0 - не использовать, 1 - использовать)', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'UseSklad'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая(директивная) дата начала', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'M_DB'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата окончания', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'M_DE'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг директивной позиции', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'Manual'
EXEC sp_addextendedproperty 'MS_Description', N'Кем подтверждено', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'CONFIRMBYUSER'
EXEC sp_addextendedproperty 'MS_Description', N'Дата подтверждения', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'CONFIRMDATE'
EXEC sp_addextendedproperty 'MS_Description', N'флаг игнорирования загрузки оборудования, 0 - не изгороровать, 1 - игнорировать', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'IGNORECAPACITY'
EXEC sp_addextendedproperty 'MS_Description', N'ссылка на ID используемого шаблона, ', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'TPS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Номер этапа в шаблоне', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'TPS_N'
EXEC sp_addextendedproperty 'MS_Description', N'Дата начала этапа', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'TPS_N_DB'
EXEC sp_addextendedproperty 'MS_Description', N'Дата ококнчания этапа', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'TPS_N_DE'
EXEC sp_addextendedproperty 'MS_Description', N'флаг укрупненная позиция', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'ISENLARGED'
EXEC sp_addextendedproperty 'MS_Description', N'Значение приоритета', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'PRIORITY'
EXEC sp_addextendedproperty 'MS_Description', N'Метка для снабжения - не обобщать', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'RZP_MARK'
EXEC sp_addextendedproperty 'MS_Description', N'Статус срока годности', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'SHELFLIFE_STS'
EXEC sp_addextendedproperty 'MS_Description', N'Статус ПП', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'RSTS'
EXEC sp_addextendedproperty 'MS_Description', N'Кем была запланирована ПП', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'SHEDULEDBY'
EXEC sp_addextendedproperty 'MS_Description', N'Дата планирования ПП', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'SHEDULED'

GO

--
-- Definition for table OKP_CPL : 
--
CREATE TABLE dbo.OKP_CPL (
  DEP$$$DEP varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  ZPR int DEFAULT 10 NOT NULL,
  NUM varchar(50) COLLATE DATABASE_DEFAULT DEFAULT 1 NOT NULL,
  PRT$$$NOM varchar(50) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
  PRTPARNOM varchar(50) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
  DTEPDZ datetime NULL,
  DTEPDV datetime NULL,
  QTYPQY float DEFAULT 0 NOT NULL,
  QTYTQY float DEFAULT 0 NOT NULL,
  DTEFDV datetime NULL,
  QTYFQY float DEFAULT 0 NOT NULL,
  QTYBRK float DEFAULT 0 NOT NULL,
  TPZ varchar(1) COLLATE DATABASE_DEFAULT DEFAULT 'C' NOT NULL,
  STS int DEFAULT 0 NOT NULL,
  KNO varchar(1) COLLATE DATABASE_DEFAULT NULL,
  SEBPTZ float DEFAULT 0 NOT NULL,
  SEBPTF float DEFAULT 0 NOT NULL,
  SEBSTZ float DEFAULT 0 NOT NULL,
  PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  REM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  MET tinyint NULL,
  RSTS int NULL,
  QTYIQY float DEFAULT 0 NOT NULL,
  rwc int IDENTITY(1, 1) NOT NULL,
  PlanType bit NULL,
  PartySize float DEFAULT 0 NULL,
  DTEASH datetime NULL,
  QTY_PC float NOT NULL,
  RWC_PPP int NULL,
  M_DB bigint NOT NULL,
  M_DE bigint NOT NULL,
  QTYAQY FLOAT(53) DEFAULT 0 NOT NULL,
  NMP$$$NAM varchar(100) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
  LastCDTE datetime NULL,
  QTYCQY float DEFAULT 0 NOT NULL,
  FOLD_I float DEFAULT 0 NOT NULL,
  FOLD_K float DEFAULT 0 NOT NULL,
  PARNUM varchar(50) COLLATE DATABASE_DEFAULT DEFAULT '[*ROOT*]' NOT NULL,
  PAR_RWC int NULL,
  IsExternalNode int DEFAULT 0 NOT NULL,
  ROUTE_ID int NULL,
  DELTADATE bigint NULL,
  OMP int DEFAULT 0 NOT NULL,
  NRP int DEFAULT 0 NOT NULL,
  QCYRAT float DEFAULT 1 NOT NULL,
  QTY_BI float(53) not null default(0),
  QTY_BA float(53) not null default(0),
  FOLD_B float DEFAULT 0 NOT NULL,
  SHELFLIFE_STS INT DEFAULT 0 NOT NULL,
  SIZES varchar(256) COLLATE DATABASE_DEFAULT NULL,
  SIZES_EIZ varchar(3) COLLATE DATABASE_DEFAULT NULL,
  QTYonNUM float DEFAULT 1 NOT NULL,

  CONSTRAINT PK_OKP_CPL PRIMARY KEY CLUSTERED (NUM, PPPNUM, ZPR)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Производственные партии', N'schema', N'dbo', N'table', N'OKP_CPL'
EXEC sp_addextendedproperty 'MS_Description', N'ID производственной партии', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор цеха', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'DEP$$$DEP'
EXEC sp_addextendedproperty 'MS_Description', N'Порядковый номер цехоперехода', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'ZPR'
EXEC sp_addextendedproperty 'MS_Description', N'Номер партии', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор предмета', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'PRT$$$NOM'
EXEC sp_addextendedproperty 'MS_Description', N'Индентификатор составляющего', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'PRTPARNOM'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая дата запуска заказа', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'DTEPDZ'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая дата выпуска заказа', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'DTEPDV'
EXEC sp_addextendedproperty 'MS_Description', N'Количество выпуска', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'Текущее количество заказа', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTYTQY'
EXEC sp_addextendedproperty 'MS_Description', N'Фактическая дата выпуска заказа', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'DTEFDV'
EXEC sp_addextendedproperty 'MS_Description', N'Фактическое количество годных', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTYFQY'
EXEC sp_addextendedproperty 'MS_Description', N'Фактическое количество брака', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTYBRK'
EXEC sp_addextendedproperty 'MS_Description', N'Тип заказа', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'TPZ'
EXEC sp_addextendedproperty 'MS_Description', N'Код состояния заказа', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'Метка просмотра', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'KNO'
EXEC sp_addextendedproperty 'MS_Description', N'Прямые трудовые затраты -норматив', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'SEBPTZ'
EXEC sp_addextendedproperty 'MS_Description', N'Прямые трудовые затраты - фактически', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'SEBPTF'
EXEC sp_addextendedproperty 'MS_Description', N'Трудовые затраты в браке', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'SEBSTZ'
EXEC sp_addextendedproperty 'MS_Description', N'Номер ПП', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'REM'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'ВСЕГО сдано на склад годной (небракованной) продукции (в составе узла + россыпью)', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTYIQY'
EXEC sp_addextendedproperty 'MS_Description', N'Тип планирования', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'Размер партии', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'PartySize'
EXEC sp_addextendedproperty 'MS_Description', N'Дата АвтоСдвига', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'DTEASH'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата начала', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'M_DB'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата окончания', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'M_DE'
EXEC sp_addextendedproperty 'MS_Description', N'Сдано на склад годной (небракованной) продукции в составе узла', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTYAQY'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'NMP$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последней отгрузки заказчику', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'LastCDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Отгруженное заказчику количество', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTYCQY'
EXEC sp_addextendedproperty 'MS_Description', N'СВЁРТКА количества, имеющегося на складе россыпью. В базовых ЕИЗ', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'FOLD_I'
EXEC sp_addextendedproperty 'MS_Description', N'СВЁРТКА количества изделий, представляющих собой комплект. Указывается только для корневых партий (для ПП), остальные - 0.  В базовых ЕИЗ', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'FOLD_K'
EXEC sp_addextendedproperty 'MS_Description', N'Родительская производственная партия', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'PARNUM'
EXEC sp_addextendedproperty 'MS_Description', N'ID родительской производственной партии', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'PAR_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Является ли производственная партия новоприобретенной для родительской ПрП(0-родная,1-новоприобретенная)', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'IsExternalNode'
EXEC sp_addextendedproperty 'MS_Description', N'ID первоначального маршрута', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'ROUTE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Смешение даты запуска/выпуска в секундах относительно рассчитанной даты', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'DELTADATE'
EXEC sp_addextendedproperty 'MS_Description', N'Организация материального потока:  0- партионная, 1-подетальная', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'OMP'
EXEC sp_addextendedproperty 'MS_Description', N'Назначение размера партии   0-по рассчету   1-большее целое   2-меньшее целое', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'NRP'
EXEC sp_addextendedproperty 'MS_Description', N'Кратность запуска на момент постановки в план', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QCYRAT'
EXEC sp_addextendedproperty 'MS_Description', N'ВСЕГО сдано на склад бракованной продукции (в составе бракованного узла + россыпью)', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTY_BI'
EXEC sp_addextendedproperty 'MS_Description', N'Сдано на склад бракованной продукции в составе узла', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTY_BA'
EXEC sp_addextendedproperty 'MS_Description', N'СВЁРТКА количества брака, имеющегося на складе дефектовки россыпью. В базовых ЕИЗ', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'FOLD_B'
EXEC sp_addextendedproperty 'MS_Description', N'ID плановой позиции', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'RWC_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'Статус срока годности', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'SHELFLIFE_STS'
EXEC sp_addextendedproperty 'MS_Description', N'Размеры предмета', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'SIZES'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ размера предмета', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'SIZES_EIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Количество в номерной партии', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTYonNUM'
GO


--
-- Definition for table OKP_POT : 
--
CREATE TABLE dbo.OKP_POT (
	RWC bigint IDENTITY(1, 1) NOT NULL,
	CPLNUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	PRTIDN varchar(50) COLLATE DATABASE_DEFAULT NULL,
	DTE datetime NOT NULL,
	QTYPOT float NULL,
	QTYTQY float DEFAULT 0 NULL,
	ZPR int NULL,
	NOP int NULL,
	LLC int NULL,
	REF varchar(10) COLLATE DATABASE_DEFAULT NULL,
	QTYRQY float NULL,
	INR float NULL,
	VIN varchar(10) COLLATE DATABASE_DEFAULT NULL,
	EditDTE datetime DEFAULT getdate(),
	MET bit DEFAULT 0,
	ReplaceDocNum varchar(50) COLLATE DATABASE_DEFAULT DEFAULT '' NULL,
	ReplaceDocDTE datetime NULL,
	PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	TM int DEFAULT 0 NOT NULL,
	RWC_PPP int NULL,
	Rwc_toz int NULL,
	NMP$$$NAM varchar(100) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
	TRN_ID bigint NULL,
	REJECT_ID int NULL,
	CONSTRAINT PK_OKP_POT PRIMARY KEY CLUSTERED (RWC)
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Потребности КиМ на производственную операцию', N'schema', N'dbo', N'table', N'OKP_POT'
EXEC sp_addextendedproperty 'MS_Description', N'Номер производственной патрии', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор материала', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'PRTIDN'
EXEC sp_addextendedproperty 'MS_Description', N'Дата потребности', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Количество потребности', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'QTYPOT'
EXEC sp_addextendedproperty 'MS_Description', N'Текущее количество потребности', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'QTYTQY'
EXEC sp_addextendedproperty 'MS_Description', N'Номер цехоперехода', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'ZPR'
EXEC sp_addextendedproperty 'MS_Description', N'Номер  операции сборки', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'Код низшего уровня', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'LLC'
EXEC sp_addextendedproperty 'MS_Description', N'Номер первичного источника', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'REF'
EXEC sp_addextendedproperty 'MS_Description', N'Расчетная пpименяемость компонента', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'QTYRQY'
EXEC sp_addextendedproperty 'MS_Description', N'Измененная норма расхода', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'INR'
EXEC sp_addextendedproperty 'MS_Description', N'ID причины отклонения', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'REJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Виновник', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'VIN'
EXEC sp_addextendedproperty 'MS_Description', N'Дата ввода данных', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'EditDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Статус (0 - обычный, 1 - замененный)', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Номер документа замены', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'ReplaceDocNum'
EXEC sp_addextendedproperty 'MS_Description', N'Дата документа замены', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'ReplaceDocDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Н', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'тип потребности:  0 - Основной  1 - вспомогательный  2 - заготовка  3 - комплектующие  4 - инструмент  5 - унифицированное  6 - основной материал по кооперации  7 - вспомогательный материал по кооперации  8 - заготовка по кооперации  9 - покупное по кооперации', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'TM'
EXEC sp_addextendedproperty 'MS_Description', N'Завязка на toz', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'Rwc_toz'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование материала', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'NMP$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'ID транзакции IR (okp_sreserv.ID)', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'TRN_ID'
GO

--
-- Definition for table OKP_NOMLOG : 
--

CREATE TABLE dbo.OKP_NOMLOG (
  ID bigint IDENTITY(1, 1) NOT NULL,
  NOM_ID int NOT NULL,
  CHANGEDATE datetime DEFAULT getdate() NOT NULL,
  SET_MET tinyint NOT NULL,
  UserName varchar(50) COLLATE DATABASE_DEFAULT NULL,
  Comment varchar(20) COLLATE DATABASE_DEFAULT NULL,
  PRTIDN varchar(50) COLLATE DATABASE_DEFAULT NULL,
  HostName nchar(256) COLLATE DATABASE_DEFAULT NULL,
  MODUL varchar(1) COLLATE DATABASE_DEFAULT NULL,
  PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'RWC номенклатуры', N'schema', N'dbo', N'table', N'OKP_NOMLOG', N'column', N'NOM_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата изменения', N'schema', N'dbo', N'table', N'OKP_NOMLOG', N'column', N'CHANGEDATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Новое значение статуса номенклатуры', N'schema', N'dbo', N'table', N'OKP_NOMLOG', N'column', N'SET_MET'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Имя пользователя', N'schema', N'dbo', N'table', N'OKP_NOMLOG', N'column', N'UserName'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'OKP_NOMLOG', N'column', N'Comment'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Обозначение предмета', N'schema', N'dbo', N'table', N'OKP_NOMLOG', N'column', N'PRTIDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Имя компьютера', N'schema', N'dbo', N'table', N'OKP_NOMLOG', N'column', N'HostName'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Модуль', N'schema', N'dbo', N'table', N'OKP_NOMLOG', N'column', N'MODUL'
GO

--
-- Definition for table OKP_NOMALT : 
--

CREATE TABLE dbo.OKP_NOMALT (
  RWC bigint IDENTITY(1, 1) NOT NULL,
  REPLACED_RWC int NOT NULL,
  SUBSTITUDE_RWC int NOT NULL,
  PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица рекомендуемых альтернативных материалов', N'schema', N'dbo', N'table', N'OKP_NOMALT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'УИД замещаемого', N'schema', N'dbo', N'table', N'OKP_NOMALT', N'column', N'REPLACED_RWC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'УИД заменителя(суррогата)', N'schema', N'dbo', N'table', N'OKP_NOMALT', N'column', N'SUBSTITUDE_RWC'
GO

--
-- Definition for table Okp_MatKompl : 
--

CREATE TABLE dbo.Okp_MatKompl (
  PPPNum varchar(10) COLLATE DATABASE_DEFAULT NULL,
  Cplnum varchar(50) COLLATE DATABASE_DEFAULT NULL,
  Prtnom varchar(100) COLLATE DATABASE_DEFAULT NULL,
  Matidn varchar(50) COLLATE DATABASE_DEFAULT NULL,
  Matname varchar(100) COLLATE DATABASE_DEFAULT NULL,
  Qtypot float NULL,
  Naenam varchar(10) COLLATE DATABASE_DEFAULT NULL,
  Prc money NULL,
  SumPrc money NULL,
  Num_ID int IDENTITY(1, 1) NOT NULL,
  TM int CONSTRAINT DF_OKP_matkompl_TM DEFAULT 0 NOT NULL,
  CalcIdn varchar(15) COLLATE DATABASE_DEFAULT NULL,
  Dep_Id varchar(10) COLLATE DATABASE_DEFAULT NULL,
  Nom_id int,  
  CONSTRAINT PK_OKP_MatKompl PRIMARY KEY CLUSTERED (Num_ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица хранения КИМЗ калькуляций', N'schema', N'dbo', N'table', N'OKP_MatKompl'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Плановая позиция', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'PPPNum'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Производственная партия', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Cplnum'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение предмета', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Prtnom'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение КиМ', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Matidn'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Наименование КиМ', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Matname'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Потребность', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Qtypot'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Наименование ЕИЗ', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Naenam'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Цена', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'PRC'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Стоимость', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'SumPRC'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на ID производственной партии (OKP_CPL.RWC)', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Num_id'
GO
EXEC sp_addextendedproperty 'MS_Description', N'тип КиМ:   0 - Основной  1 - вспомогательный  2 - заготовка  3 - комплектующие  4 - инструмент', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'TM'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'Номер калькуляции', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'CalcIdn'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'ссылка на подразделение (OKP_DEP.RWC)', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Dep_Id'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'id ДСЕ на которой КИМЗ (OKP_NOM.RWC)', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Nom_Id'
GO


--
-- Definition for table OKP_labour : 
--
CREATE TABLE dbo.OKP_labour (
  PPPNum varchar(10) COLLATE DATABASE_DEFAULT NULL,
  Num varchar(50) COLLATE DATABASE_DEFAULT NULL,
  Nop int NOT NULL,
  KodOper varchar(4) COLLATE DATABASE_DEFAULT NULL,
  KodWcr varchar(12) COLLATE DATABASE_DEFAULT NULL,
  KodPrf varchar(5) COLLATE DATABASE_DEFAULT NULL,
  Rzo varchar(3) COLLATE DATABASE_DEFAULT NULL,
  Vid_Oplat varchar(50) COLLATE DATABASE_DEFAULT NULL,
  data_id int NULL,
  GradRate float NULL,
  TimeSum float NULL,
  OsnZ float NULL,
  rwc int IDENTITY(1, 1) NOT NULL,
  PRTPAR varchar(50) COLLATE DATABASE_DEFAULT NULL,
  CalcIdn varchar(15) COLLATE DATABASE_DEFAULT NULL,
  typ varchar(1) COLLATE DATABASE_DEFAULT NOT NULL,
  Dep_id varchar(10) COLLATE DATABASE_DEFAULT NULL,
  Nmdnam varchar(100) COLLATE DATABASE_DEFAULT NULL,
  NameOper varchar(150) COLLATE DATABASE_DEFAULT NULL,
  NameWCR varchar(30) COLLATE DATABASE_DEFAULT NULL,
  NamePRF varchar(150) COLLATE DATABASE_DEFAULT NULL,
  KODRES varchar(10) COLLATE DATABASE_DEFAULT NULL,
  NAMERES varchar(30) COLLATE DATABASE_DEFAULT NULL,
  Nom_id int NULL,
  OsnZ_1 float NULL, 
  CONSTRAINT OKP_labour_pk PRIMARY KEY CLUSTERED (rwc)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица хранения трудоёмкости калькуляций', N'schema', N'dbo', N'table', N'OKP_labour'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая позиция', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'PPPNum'
EXEC sp_addextendedproperty 'MS_Description', N'Партия', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'Num'
EXEC sp_addextendedproperty 'MS_Description', N'Операция (Код + Наименование)', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'KodOper'
EXEC sp_addextendedproperty 'MS_Description', N'Рабочий центр (Код + Наименование)', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'KodWcr'
EXEC sp_addextendedproperty 'MS_Description', N'Профессия (Код + Наименование)', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'KodPrf'
EXEC sp_addextendedproperty 'MS_Description', N'разряд', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'Rzo'
EXEC sp_addextendedproperty 'MS_Description', N'вид оплаты', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'Vid_Oplat'
EXEC sp_addextendedproperty 'MS_Description', N'Тариф', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'data_id'
EXEC sp_addextendedproperty 'MS_Description', N'Расценка, руб.', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'GradRate'
EXEC sp_addextendedproperty 'MS_Description', N'Время Тшт.', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'TimeSum'
EXEC sp_addextendedproperty 'MS_Description', N'Основная зарплата', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'OsnZ'
EXEC sp_addextendedproperty 'MS_Description', N'служебное поле', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'rwc'
EXEC sp_addextendedproperty 'MS_Description', N'верхний уровень', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'PRTPAR'
EXEC sp_addextendedproperty 'MS_Description', N'Номер калькуляции', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'CalcIdn'
EXEC sp_addextendedproperty 'MS_Description', N'тип принадлежности производства', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'typ'
EXEC sp_addextendedproperty 'MS_Description', N'код подразделения', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'Dep_id'
EXEC sp_addextendedproperty 'MS_Description', N'наименование подразделения', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'Nmdnam'
EXEC sp_addextendedproperty 'MS_Description', N'наименование операции', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'NameOper'
EXEC sp_addextendedproperty 'MS_Description', N'наименование рабочего центра', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'NameWCR'
EXEC sp_addextendedproperty 'MS_Description', N'наименование профессии', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'NamePRF'
EXEC sp_addextendedproperty 'MS_Description', N'Код ресурса', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'KODRES'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование ресурса', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'NAMERES'
EXEC sp_addextendedproperty 'MS_Description', N'id предмета', N'schema', N'dbo', N'table', N'okp_labour', N'column', N'Nom_Id'
EXEC sp_addextendedproperty 'MS_Description', N'Трудовые затраты за единицу продукции', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'OsnZ_1'
GO

/*
** Калькуляции по статьям
*/
CREATE TABLE dbo.OKP_NKL (
	CPLNUM varchar(50) COLLATE DATABASE_DEFAULT NULL,
	DEP varchar(10) COLLATE DATABASE_DEFAULT NULL,
	Tst varchar(1) COLLATE DATABASE_DEFAULT NULL,
	SEBNUM int NOT NULL,
	SEBVAL float CONSTRAINT DF_OKP_NKL_SEBVAL DEFAULT 0 NULL,
	SEBVAL_st float NULL,
	rwc int IDENTITY(1, 1) NOT NULL,
	LNUM int NULL,
	STKBAS int NULL,
	nkl_list_id INT NOT NULL,
	CONSTRAINT PQ_OKP_NKL PRIMARY KEY CLUSTERED (rwc)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Калькуляции', N'schema', N'dbo', N'table', N'OKP_NKL'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение производственной партии', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор подразделения', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'DEP'
EXEC sp_addextendedproperty 'MS_Description', N'Тип статьи', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'Tst'
EXEC sp_addextendedproperty 'MS_Description', N'ID статьи калькуляции', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'SEBNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Сумма затрат', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'SEBVAL'
EXEC sp_addextendedproperty 'MS_Description', N'Сумма затрат на сторону', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'SEBVAL_st'
EXEC sp_addextendedproperty 'MS_Description', N'Позиция статьи', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'LNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Код базы распределения', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'STKBAS'
EXEC sp_addextendedproperty 'MS_Description', N'ID калькуляции', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'nkl_list_id'
GO

/*
** Definition for table OKP_LIM : 
*/
CREATE TABLE dbo.OKP_LIM (
	RWC bigint IDENTITY(1, 1) NOT NULL,
	PRTIDN varchar(50) NOT NULL,
	PER varchar(1) NOT NULL,
	DTE datetime NOT NULL,
	QTYFQY FLOAT DEFAULT 0 NULL,
	QTYLIM FLOAT DEFAULT 0 NULL,
	QTYVQY FLOAT DEFAULT 0 NULL,
	QTYIQY FLOAT DEFAULT 0 NULL,
	QTYOST FLOAT DEFAULT 0 NULL,
	MET varchar(1) NULL,
	RD datetime DEFAULT getdate() NULL,
	CD datetime DEFAULT getdate() NULL,
	R_FIO varchar(100) COLLATE DATABASE_DEFAULT NULL,
	C_FIO varchar(100) COLLATE DATABASE_DEFAULT NULL,
	CPLNUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	DEP_ID int NOT NULL,
	CONSTRAINT PK_OKP_LIM PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Лимиты подразделений', N'schema', N'dbo', N'table', N'OKP_LIM'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный номер записи', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор материала', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'PRTIDN'
EXEC sp_addextendedproperty 'MS_Description', N'Тип периода 0-неделя; 1-месяц; 2-кавртал; 3-год', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'PER'
EXEC sp_addextendedproperty 'MS_Description', N'Дата конца периода', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Израсходовано в производстве', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'QTYFQY'
EXEC sp_addextendedproperty 'MS_Description', N'Лимит', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'QTYLIM'
EXEC sp_addextendedproperty 'MS_Description', N'Выданное количество по лимиту', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'QTYVQY'
EXEC sp_addextendedproperty 'MS_Description', N'Возвратное количество по лимиту', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'QTYIQY'
EXEC sp_addextendedproperty 'MS_Description', N'Остаток лимита', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'QTYOST'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи( код состояния)', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Дата создания', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'RD'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последнего изменения', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'CD'
EXEC sp_addextendedproperty 'MS_Description', N'Кто создал', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'R_FIO'
EXEC sp_addextendedproperty 'MS_Description', N'Кто последний раз изменял', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'C_FIO'
EXEC sp_addextendedproperty 'MS_Description', N'Номер партии', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'CPLNUM'
GO

/*
** Настроечные параметры
*/
CREATE TABLE dbo.OKP_SystemProperties (
	id int DEFAULT 0 NOT NULL,
	Enterprise varchar(255) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
	ChiefName varchar(255) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
	ChiefEconomistName varchar(255) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
	ChiefAccountantName varchar(255) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
	ControlOperCalcOrder int DEFAULT 1 NOT NULL,
	UseStoreModule int DEFAULT 1 NOT NULL,
	BaseEIZQuantity varchar(3) COLLATE DATABASE_DEFAULT NOT NULL,
	BaseEIZWeight varchar(3) COLLATE DATABASE_DEFAULT NOT NULL,
	UpdatePeriod int DEFAULT 120 NOT NULL,
	BaseEIZSize varchar(3) COLLATE DATABASE_DEFAULT NOT NULL,
	BaseEIZTime varchar(3) COLLATE DATABASE_DEFAULT NOT NULL,
	LastBaseVersionChange datetime NULL,
	ChiefKladName varchar(255) COLLATE DATABASE_DEFAULT NULL,
	AdmissibleDeparture int DEFAULT 0 NOT NULL,
	ManufactureType int DEFAULT 0 NULL,
	Calc_Digit tinyint DEFAULT 7 NOT NULL,
	LogType tinyint DEFAULT 0 NOT NULL,
	LogArchTerm smallint DEFAULT 30 NOT NULL,
	LogEraseBufPeriod smallint DEFAULT 90 NOT NULL,
	LogEraseDate datetime DEFAULT getdate() NOT NULL,
	BaseEIZSquare varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	Adres varchar(250) COLLATE DATABASE_DEFAULT NULL,
	UseBarCodes int DEFAULT 1 NULL,
	BaseEIZPlanQuantity varchar(3) COLLATE DATABASE_DEFAULT NOT NULL,
	BaseEIZPlanTime varchar(3) COLLATE DATABASE_DEFAULT NOT NULL,
	UseCenterWRH int DEFAULT 1 NULL,
	UseAlienWRH int DEFAULT 1 NULL,
	ImControl int DEFAULT 1 NULL,
	BaseEIZVolume varchar(3) COLLATE DATABASE_DEFAULT NULL,
	TimeShow_Digit int DEFAULT 4 NULL,
	CalcShow_Digit int DEFAULT 3 NULL,
	PlanType int NULL,
	ServerPort int NULL,
	ClientTimeOut int NULL,
  ExtClientTimeOut int NULL,
	ServerHost varchar(260) COLLATE DATABASE_DEFAULT NULL,
	SPDirectory varchar(260) COLLATE DATABASE_DEFAULT NULL,
	HTTPProxy varchar(260) COLLATE DATABASE_DEFAULT NULL,
	HTTPPort int NULL,
	MailHost varchar(260) COLLATE DATABASE_DEFAULT NULL,
	MailPort int NULL,
	MailTo varchar(260) COLLATE DATABASE_DEFAULT NULL,
	MailFrom varchar(260) COLLATE DATABASE_DEFAULT NULL,
	MailUser varchar(100) COLLATE DATABASE_DEFAULT NULL,
	MailUserPssw varchar(100) COLLATE DATABASE_DEFAULT NULL,
	SPSource varchar(260) COLLATE DATABASE_DEFAULT NULL,
	SPQueryTime datetime NULL,
	SPEnable int NULL,
	ForwardDelta int NULL,
	ControlStructure int DEFAULT 1 NOT NULL,
	CommandTimeout int DEFAULT 120 NULL,
	BaseSkladRegOnly int DEFAULT 1 NOT NULL,
	SPShowLogins int DEFAULT 1 NOT NULL,
	SPCertFile int DEFAULT 0 NOT NULL,
	JobsLogPeriod int NULL,
	JobsLogEraseDate datetime NULL,
	UseToolsReserve int DEFAULT 0 NOT NULL,
	UseKIMOutPriority int DEFAULT 0 NOT NULL,
	SEPARATE_UOP_UNIONCPL int DEFAULT 0 NOT NULL,
	Files_id int NULL,
	UseAutoCalc int NULL,
	sZagControll int DEFAULT 1 NOT NULL,
	CanUseExistingLogin int DEFAULT 1 NOT NULL,
	DeviationForvardLimitDate int DEFAULT -1 NOT NULL,
    DeviationBackLimitDate int DEFAULT -1 NOT NULL,
	KIM_OutType int DEFAULT 0 NOT NULL,
	KIM_UseParties int DEFAULT 0 NOT NULL,
	EventTimeOut int NOT NULL,
	Terminal_LogoutAfter int DEFAULT 0 NULL,
	QCYRATControll int DEFAULT 0 NOT NULL,
	UseSList int DEFAULT 0 NOT NULL,
	EnablePRCManualChange int null,
	VID varchar(15) NULL,
	EventHandlerTimeOut int NULL,
    RoundToolsDemand int DEFAULT 0 NOT NULL,
    DoxPack int DEFAULT 50 NOT NULL,
	CONSTRAINT PK_OKP_SystemProperties PRIMARY KEY CLUSTERED (id)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Настройки системы', N'schema', N'dbo', N'table', N'OKP_SystemProperties'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование предприятия', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'Enterprise'
EXEC sp_addextendedproperty 'MS_Description', N'Ф.И.О. руководителя', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'ChiefName'
EXEC sp_addextendedproperty 'MS_Description', N'Ф.И.О. главного экономиста', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'ChiefEconomistName'
EXEC sp_addextendedproperty 'MS_Description', N'Ф.И.О. главного бухгалтера', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'ChiefAccountantName'
EXEC sp_addextendedproperty 'MS_Description', N'Контролировать порядок учёта операций: да=1, нет=0', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'ControlOperCalcOrder'
EXEC sp_addextendedproperty 'MS_Description', N'Использовать модуль "Склад": да=1, нет=0', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'UseStoreModule'
EXEC sp_addextendedproperty 'MS_Description', N'Базовая ЕИЗ количества', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'BaseEIZQuantity'
EXEC sp_addextendedproperty 'MS_Description', N'Базовая ЕИЗ веса', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'BaseEIZWeight'
EXEC sp_addextendedproperty 'MS_Description', N'Интервал опроса базы  данных, сек.', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'UpdatePeriod'
EXEC sp_addextendedproperty 'MS_Description', N'Базовая EIZ размера', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'BaseEIZSize'
EXEC sp_addextendedproperty 'MS_Description', N'Базовая EIZ времени', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'BaseEIZTime'
EXEC sp_addextendedproperty 'MS_Description', N'Дата и время последнего изменения версии', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'LastBaseVersionChange'
EXEC sp_addextendedproperty 'MS_Description', N'Ф.И.О. кладовщика', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'ChiefKladName'
EXEC sp_addextendedproperty 'MS_Description', N'Допустимое отклонение в днях', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'AdmissibleDeparture'
EXEC sp_addextendedproperty 'MS_Description', N'Тип производства', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'ManufactureType'
EXEC sp_addextendedproperty 'MS_Description', N'Точность расчетов', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'Calc_Digit'
EXEC sp_addextendedproperty 'MS_Description', N'Тип протоколирования событий в БД: 0 - обычный; 1 - расширенный; 2 - полный ', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'LogType'
EXEC sp_addextendedproperty 'MS_Description', N'Срок хранения данных в журнале (OKP_LOGS). Значение указывается в днях', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'LogArchTerm'
EXEC sp_addextendedproperty 'MS_Description', N'Период запуска процедуры очистки архива журнала (OKP_BUFLOG). Значение указывается в днях', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'LogEraseBufPeriod'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последнего запуска процедуры очистки архива журнала (OKP_BUFLOG).', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'LogEraseDate'
EXEC sp_addextendedproperty 'MS_Description', N'Базовая ЕИЗ площади', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'BaseEIZSquare'
EXEC sp_addextendedproperty 'MS_Description', N'адрес', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'Adres'
EXEC sp_addextendedproperty 'MS_Description', N'Использовать штрихкоды: да=1, нет=0', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'UseBarCodes'
EXEC sp_addextendedproperty 'MS_Description', N'Базовая ЕИЗ планирования количества', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'BaseEIZPlanQuantity'
EXEC sp_addextendedproperty 'MS_Description', N'Базовая ЕИЗ планирования времени', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'BaseEIZPlanTime'
EXEC sp_addextendedproperty 'MS_Description', N'Использовать централизованные склады', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'UseCenterWRH'
EXEC sp_addextendedproperty 'MS_Description', N'Использовать склады других подразделений', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'UseAlienWRH'
EXEC sp_addextendedproperty 'MS_Description', N'Контроль отпуска КиМ при учете выполнения операции', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'ImControl'
EXEC sp_addextendedproperty 'MS_Description', N'Базовая ЕИЗ объема', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'BaseEIZVolume'
EXEC sp_addextendedproperty 'MS_Description', N'Точность показа  времени', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'TimeShow_Digit'
EXEC sp_addextendedproperty 'MS_Description', N'Точность сравнения/ввода/отображения/расчёта', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'CalcShow_Digit'
EXEC sp_addextendedproperty 'MS_Description', N'Контроль готовности составных частей при учете операций', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'ControlStructure'
EXEC sp_addextendedproperty 'MS_Description', N'Признак отображения групп и пользователей в окне логина 1 - отображать, 0 - не отображать', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'SPShowLogins'
EXEC sp_addextendedproperty 'MS_Description', N'id файла в OKP_FILES, хранит сертификат X.509 и приватный ключ пользователя в кодировке Base-64', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'SPCertFile'
EXEC sp_addextendedproperty 'MS_Description', N'Резервирование на складах инструмента, 1 - резервировать, 0 - не резервировать', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'UseToolsReserve'
EXEC sp_addextendedproperty 'MS_Description', N'При учете операции разделять учет по объединенным ПП', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'SEPARATE_UOP_UNIONCPL'
EXEC sp_addextendedproperty 'MS_Description', N'Cсылка на логотип', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'Files_id'
EXEC sp_addextendedproperty 'MS_Description', N'Автоматическая калькуляция при сдаче на склад: да = 1, нет = 0', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'UseAutoCalc'
EXEC sp_addextendedproperty 'MS_Description', N'Контроль заполнения поля "Размер заготовки" ', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'sZagControll'
EXEC sp_addextendedproperty 'MS_Description', N'Предельное отклонение вперед даты учета от текущей даты, сут.', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'DeviationForvardLimitDate'
EXEC sp_addextendedproperty 'MS_Description', N'Предельное отклонение назад даты учета от текущей даты, сут.', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'DeviationBackLimitDate'
EXEC sp_addextendedproperty 'MS_Description', N'Выдача партии по хронологии (параметр модуля "Склад"):   0 - не учитывать партии, цена - средняя   1 - FIFO - приоритет у ранней партии, цена = цене партии   2 - LIFO - приоритет у последней партии, цена = цене партии   3 - FEFO - приоритет у партии, у которой раньше истекает срок годности', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'KIM_OutType'
EXEC sp_addextendedproperty 'MS_Description', N'Вести партионный учёт поставок (параметр модуля "Склад")', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'KIM_UseParties'
EXEC sp_addextendedproperty 'MS_Description', N'Контроль кратности запуска при постановке в план:   0 - не учитывать   1 - количество при постановке в план должно быть кратно параметру "Кратность запуска"', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'QCYRATControll'
EXEC sp_addextendedproperty 'MS_Description', N'Формировать сопроводительные листы завершенных партий: да = 1, нет = 0', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'UseSList'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг разрешения изменения складской цены ТМЦ вручную (редактирование цены в бланке ТМЦ, редактирование цены в записях бланка документов)',     N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'EnablePRCManualChange'
EXEC sp_addextendedproperty 'MS_Description', N'Округление потребности в инструменте к ближайшему большему  целому. 1-округлять, 0- не округлять. По умолчанию -0', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'RoundToolsDemand'
EXEC sp_addextendedproperty 'MS_Description', N'Максимальное количество закладок для отчетов', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'DoxPack'
GO

--
-- Definition for table OKP_TGRP : 
--

CREATE TABLE OKP_TGRP (
  ID bigint IDENTITY,
  IDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  NAM varchar(100)  COLLATE DATABASE_DEFAULT NOT NULL,
  DTE_REG datetime NOT NULL DEFAULT GETDATE(),
  RWC_FIO_MANAGER INT NOT NULL,
  CONSTRAINT PK_OKP_TGRP_ID PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty N'MS_Description', N'Группы работников (Бригады)',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TGRP'
EXEC sp_addextendedproperty N'MS_Description', N'ID', 'SCHEMA', N'dbo', 'TABLE', N'OKP_TGRP', 'COLUMN', N'ID'
EXEC sp_addextendedproperty N'MS_Description', N'Обозначение', 'SCHEMA', N'dbo', 'TABLE', N'OKP_TGRP', 'COLUMN', N'IDN'
EXEC sp_addextendedproperty N'MS_Description', N'Наименование', 'SCHEMA', N'dbo', 'TABLE', N'OKP_TGRP', 'COLUMN', N'NAM'
EXEC sp_addextendedproperty N'MS_Description', N'Руководитель группы', 'SCHEMA', N'dbo', 'TABLE', N'OKP_TGRP', 'COLUMN', N'RWC_FIO_MANAGER'
EXEC sp_addextendedproperty N'MS_Description', N'Дата формирования', 'SCHEMA' ,N'dbo', 'TABLE', N'OKP_TGRP', 'COLUMN' ,N'DTE_REG'
GO

--
-- Definition for table OKP_TGRP_DATA : 
--

CREATE TABLE OKP_TGRP_DATA (
  ID bigint IDENTITY,
  ID_TGRP bigint NOT NULL,
  RWC_FIO int NOT NULL,
  DTE_REG datetime NOT NULL,
  K float NOT NULL,
  CONSTRAINT PK_OKP_TGRP_DATA_ID PRIMARY KEY CLUSTERED (ID)
  )
GO

EXEC sp_addextendedproperty N'MS_Description', N'Состав бригады',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TGRP_DATA'
EXEC sp_addextendedproperty N'MS_Description', N'ID', N'SCHEMA', N'dbo', N'TABLE', N'OKP_TGRP_DATA', N'COLUMN', N'ID'
EXEC sp_addextendedproperty N'MS_Description', N'Идентификатор группы', N'SCHEMA', N'dbo', N'TABLE', N'OKP_TGRP_DATA', N'COLUMN', N'ID_TGRP'
EXEC sp_addextendedproperty N'MS_Description', N'Исполнитель', 'SCHEMA', N'dbo', N'TABLE', N'OKP_TGRP_DATA', N'COLUMN', N'RWC_FIO'
EXEC sp_addextendedproperty N'MS_Description', N'Дата включения в группу', N'SCHEMA', N'dbo', N'TABLE', N'OKP_TGRP_DATA', N'COLUMN', N'DTE_REG'
EXEC sp_addextendedproperty N'MS_Description', N'Коэффициент участия', N'SCHEMA', N'dbo', N'TABLE', N'OKP_TGRP_DATA', N'COLUMN', N'K'
GO

--
-- Definition for table OKP_FILES : 
--

CREATE TABLE dbo.OKP_FILES (
  ID int IDENTITY(1, 1) NOT NULL,
  FileName varchar(500) COLLATE DATABASE_DEFAULT NULL,
  Data image NULL,
  UID uniqueidentifier NULL,
  Pict int NULL,
  CONSTRAINT PK_FILES PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Файлы/Эскизы', N'schema', N'dbo', N'table', N'OKP_FILES'
EXEC sp_addextendedproperty 'MS_Description', N'ID файла', N'schema', N'dbo', N'table', N'OKP_FILES', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Имя файла', N'schema', N'dbo', N'table', N'OKP_FILES', N'column', N'FileName'
EXEC sp_addextendedproperty 'MS_Description', N'Содержимое файла', N'schema', N'dbo', N'table', N'OKP_FILES', N'column', N'Data'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный идентификатор (guid)', N'schema', N'dbo', N'table', N'OKP_FILES', N'column', N'UID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификация рисунка: 3 - Узел, 4 - Деталь, 5 - Покупное, 6 - Заготовка, 7 - Материал, 8 - Специнструмент ', N'schema', N'dbo', N'table', N'OKP_FILES', N'column', N'Pict'
GO

/*
** Definition for table OKP_WPL : 
*/
CREATE TABLE dbo.OKP_WPL (
	ID int identity(1,1),
	WCR varchar(12) COLLATE DATABASE_DEFAULT NOT NULL,
	INVNUM varchar(30) COLLATE DATABASE_DEFAULT NOT NULL,
	MIDN INT CONSTRAINT DF_OKP_WPL_MIDN DEFAULT 0 NOT NULL,
	CheckPlan bit CONSTRAINT DF_OKP_WPL_CheckPlan DEFAULT 1 NOT NULL,
	BalCost FLOAT CONSTRAINT df__okp_wpl__balcost DEFAULT 0 NOT NULL,
	RelDate datetime NULL,
	MachName varchar(100) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
	WorkNum int CONSTRAINT DF_OKP_WPL_WorkNum DEFAULT 1 NULL,
	WorkCond int DEFAULT 1 NULL,
	YearFond float NULL,
	CONSTRAINT PK_OKP_WPL PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Рабочие места', N'schema', N'dbo', N'table', N'OKP_WPL'
EXEC sp_addextendedproperty 'MS_Description', N'ID РМ', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Инвентарный номер РМ', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'INVNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование РМ', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'MachName'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение РЦ', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'WCR'
EXEC sp_addextendedproperty 'MS_Description', N'Порядковый номер в РЦ', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'MIDN'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг учета при планировании (да/нет)', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'CheckPlan'
EXEC sp_addextendedproperty 'MS_Description', N'Балансовая стоимость', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'BalCost'
EXEC sp_addextendedproperty 'MS_Description', N'Дата выпуска', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'RelDate'
EXEC sp_addextendedproperty 'MS_Description', N'Кол-во станочников', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'WorkNum'
EXEC sp_addextendedproperty 'MS_Description', N'Условия работы', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'WorkCond'
EXEC sp_addextendedproperty 'MS_Description', N'Эффективный рабочий фонд', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'YearFond'
GO

--
-- Definition for table OKP_ZATR : 
--

CREATE TABLE dbo.OKP_ZATR (
  TYPE int NOT NULL,
  DEP_ID varchar(10) COLLATE DATABASE_DEFAULT NULL,
  CPLNUM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  DAT money NULL,
  OTC float NULL,
  PNO int NULL,
  DEPKOL float NULL,
  Qtygqy float NULL,
  KOL float NULL,
  Calc_Code int NOT NULL,
  PRTIDN varchar(50) COLLATE DATABASE_DEFAULT NULL,
  QtyZ float NULL,
  QtyPot float NULL,
  RWC int IDENTITY(1, 1) NOT NULL,
  PRC money NULL,
  DB datetime NULL,
  DE datetime NULL,
  rwc_cpl int NULL,
  NORM money NULL,
  CONSTRAINT PK_OKP_ZATR PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица хранения данных после расчета затрат', N'schema', N'dbo', N'table', N'OKP_ZATR'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Тип записи 1 - Затраты на основные материалы для собственного производства 2 - Затраты на вспомогательные материалы для собственного производства 3 - Покупные затраты 4 - Затраты на материалы по кооперации 5 - Брак в производстве 7 - Прямые трудовые затраты 8 - Косвенные затраты 9 - Прямые трудовые затраты по кооперации 17 - Инструменты НЗП 18 - Инструменты НЗП без текущего периода 19 - Основные материалы НЗП  22 - Основные материалы НЗП без текущего периода 23 - Вспомогательные материалы НЗП 24 - Вспомогательные материалы НЗП без текущего периода 25 - Материалы по кооперации НЗП 26 - Материалы по кооперации НЗП без текущего периода 27 - Покупные НЗП 28 - Покупные НЗП без текущего периода 29 - Основная зарплата собственого НЗП 30 - Основная зарплата собственого НЗП без текущего периода 31 - Oсновная зарплата по кооперации НЗП 32 - Oсновная зарплата по кооперации НЗП без текущего периода 33 - Затраты на инструменты', 'SCHEMA', N'dbo', 'TABLE', N'OKP_ZATR', 'COLUMN', N'TYPE'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор подразделения', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'DEP_ID'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'Номер заказа', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'CPLNUM'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'затраты на дату решения', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'DAT'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'затраты отклонения на дату решения', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'OTC'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'Последняя незавершенная операция подразделения', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'PNO'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'Количество в цехе', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'DEPKOL'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'количество годных деталей', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'Qtygqy'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'Незавершенное количество', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'KOL'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'Код для демонстрации', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'Calc_Code'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор предмета', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'PRTIDN'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'Фактическое количество потребности в МЗ или сданное количество сверхплана в ТЗ', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'QtyZ'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'№ плановое количество потребности', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'QtyPot'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'актуальная цена', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'PRC'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'ссылка на производственную партию (OKP_CPL.RWC)', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'rwc_cpl'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Затраты по нормативам', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'NORM'
GO


/*
** Definition for table OKP_UOP : 
*/
CREATE TABLE dbo.OKP_UOP (
	NOS int IDENTITY(1, 1) NOT NULL,
	PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	NUM varchar(50) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
	PRT$$$MNF varchar(50) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
	DEP_ID int NOT NULL,
	NOP int DEFAULT 0 NOT NULL,
	STS varchar(1) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
	QTYPQY float DEFAULT 0 NOT NULL,
	QTYGQY float DEFAULT 0 NOT NULL,
	QTYKOL float DEFAULT 0 NOT NULL,
	QTYPZV float DEFAULT 0 NOT NULL,
	QTYEDV float DEFAULT 0 NOT NULL,
	TAB varchar(50) COLLATE DATABASE_DEFAULT DEFAULT 0 NOT NULL,
	REJECT_ID int NULL,
	VIN_DEP_ID int NULL,
	DTE datetime NOT NULL,
	PRP varchar(1) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
	ENR varchar(3) COLLATE DATABASE_DEFAULT DEFAULT '068' NOT NULL,
	MET tinyint NULL,
	ORDDTE datetime NULL,
	Order_Count int NULL,
	DTEREG DATETIME CONSTRAINT df__okp_uop__dtereg DEFAULT getdate() NULL,
	REJECT_ID_TSH int NULL,
	RZO varchar(3) COLLATE DATABASE_DEFAULT DEFAULT '3' NOT NULL,
	WCR$$$WCR varchar(12) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
	REJECT_ID_EDIT int NULL,
	DTECancel datetime NULL,
	CancelByUser varchar(50) COLLATE DATABASE_DEFAULT NULL,
	Prodtype int NULL,
	Top$$$kto varchar(4) COLLATE DATABASE_DEFAULT NULL,
	Rwc_toz int NULL,
	rwc_cpl int NULL,
	TRO float NULL,
	KU FLOAT DEFAULT 1 NOT NULL,
	GrUID uniqueidentifier DEFAULT newid() NOT NULL,
	REGBYUSER varchar(50) COLLATE DATABASE_DEFAULT NULL,
	OOD INT DEFAULT 1 NOT NULL,
	PPP_ID int NOT NULL DEFAULT 0,
	WPL_ID INT NULL,
	CONSTRAINT PK_OKP_UOP PRIMARY KEY CLUSTERED (NOS)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Учёт операции', N'schema', N'dbo', N'table', N'OKP_UOP'
EXEC sp_addextendedproperty 'MS_Description', N'ID учёта операции', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'NOS'
EXEC sp_addextendedproperty 'MS_Description', N'Номеp заказа', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор предмета', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'PRT$$$MNF'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения-изготовителя', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'Код состояния операции ПУСТО - активная запись 2 - активная, неподлежащая анулированию 3 - анулированная запись', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'Запланированное количество', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'QTYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'Завеpшенное количество годных', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'QTYGQY'
EXEC sp_addextendedproperty 'MS_Description', N'Сданное количество', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'QTYKOL'
EXEC sp_addextendedproperty 'MS_Description', N'Подготов.-заключительное время', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'QTYPZV'
EXEC sp_addextendedproperty 'MS_Description', N'Тшк-зп (штучно-калькуляционное зарплатное)', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'QTYEDV'
EXEC sp_addextendedproperty 'MS_Description', N'Табельный номер', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'TAB'
EXEC sp_addextendedproperty 'MS_Description', N'ID причины отклонения по дате', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'REJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения виновника отклонения', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'VIN_DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата учета', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Признак операции 1 - завершена, 0 - нет', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'PRP'
EXEC sp_addextendedproperty 'MS_Description', N'Единица ноpмиpования', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'ENR'
EXEC sp_addextendedproperty 'MS_Description', N'Резервное поле ', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Дата составления наряда на оплату', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'ORDDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Резервное поле, актуально в OKP_Order ', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'Order_Count'
EXEC sp_addextendedproperty 'MS_Description', N'Дата регистрации(ввода)', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'DTEREG'
EXEC sp_addextendedproperty 'MS_Description', N'ID причины отклонения нормативов', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'REJECT_ID_TSH'
EXEC sp_addextendedproperty 'MS_Description', N'Разряд', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение рабочего центра', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'WCR$$$WCR'
EXEC sp_addextendedproperty 'MS_Description', N'ID причины редактирования учета', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'REJECT_ID_EDIT'
EXEC sp_addextendedproperty 'MS_Description', N'Дата анулирования\редактирования учета', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'DTECancel'
EXEC sp_addextendedproperty 'MS_Description', N'Кем анулировано\редактировано', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'CancelByUser'
EXEC sp_addextendedproperty 'MS_Description', N'Тип производства 0-собственное ,  1-кооперация', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'Prodtype'
EXEC sp_addextendedproperty 'MS_Description', N'код технологической операци', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'Top$$$kto'
EXEC sp_addextendedproperty 'MS_Description', N'ID производственной операции', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'Rwc_toz'
EXEC sp_addextendedproperty 'MS_Description', N'ID производственной партии', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'rwc_cpl'
EXEC sp_addextendedproperty 'MS_Description', N'Рабочее время обработки Тшк (штучно-калькуляционное)', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'Коэффициент участия в группе', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'KU'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный идентификатор группы учета', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'GrUID'
EXEC sp_addextendedproperty 'MS_Description', N'Кем проведен учет', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'REGBYUSER'
EXEC sp_addextendedproperty 'MS_Description', N'КОИД', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'OOD'
EXEC sp_addextendedproperty 'MS_Description', N'ID плановой позиции', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'PPP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID рабочего места', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'WPL_ID'
GO

/*
** Definition for table OKP_TOZ : 
*/
CREATE TABLE dbo.OKP_TOZ (
	PPPNUM varchar(10) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_TOZ_PPPNUM DEFAULT '' NOT NULL,
	NUM varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_TOZ_NUM DEFAULT '' NOT NULL,
	PRT$$$MNF varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_TOZ_PRT$$$MNF DEFAULT '' NOT NULL,
	DEP_ID int NOT NULL,
	WCR$$$WCR varchar(12) COLLATE DATABASE_DEFAULT NOT NULL,
	NOP int CONSTRAINT DF_OKP_TOZ_NOP DEFAULT 0 NOT NULL,
	STS int CONSTRAINT DF_OKP_TOZ_STS DEFAULT 0 NOT NULL,
	PRI int CONSTRAINT DF_OKP_TOZ_PRI DEFAULT 0 NOT NULL,
	DTEPDZ datetime NULL,
	DTEPDV datetime NULL,
	FCD datetime NULL,
	QTYPQY float CONSTRAINT DF_OKP_TOZ_QTYPQY DEFAULT 0 NOT NULL,
	QTYCQY float CONSTRAINT DF_OKP_TOZ_QTYCQY DEFAULT 0 NOT NULL,
	QTYGQY float CONSTRAINT DF_OKP_TOZ_QTYGQY DEFAULT 0 NOT NULL,
	QTYFSC float CONSTRAINT DF_OKP_TOZ_QTYFSC DEFAULT 0 NOT NULL,
	QTYPWO float CONSTRAINT DF_OKP_TOZ_QTYPWO DEFAULT 0 NOT NULL,
	PNK varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_TOZ_PNK DEFAULT '' NULL,
	PRP int CONSTRAINT DF_OKP_TOZ_PRP DEFAULT 0 NOT NULL,
	QTYPZV float CONSTRAINT DF_OKP_TOZ_QTYPZV DEFAULT 0 NOT NULL,
	QTYEDV float CONSTRAINT DF_OKP_TOZ_QTYEDV DEFAULT 0 NOT NULL,
	REJECT_ID int NULL,
	VIN_DEP_ID int NULL,
	ENR int NULL,
	MET tinyint NULL,
	MOV float CONSTRAINT DF_OKP_TOZ_MOV DEFAULT 0 NOT NULL,
	PlanType int NULL,
	Holidays bit NOT NULL,
	QCY int NOT NULL,
	TimeBegin datetime NOT NULL,
	PSM float NOT NULL,
	SRC int NOT NULL,
	QCYFLX float NULL,
	RSTS int NULL,
	normTaskDate datetime CONSTRAINT DF_OKP_TOZ_normTaskDate DEFAULT null NULL,
	ZPR_RWC bigint NULL,
	rwc int IDENTITY(1, 1) NOT NULL,
	TOP$$$KTO varchar(4) COLLATE DATABASE_DEFAULT NOT NULL,
	OOD int CONSTRAINT DF_TOZ_OOD DEFAULT 1 NOT NULL,
	PZV float CONSTRAINT DF_TOZ_PZV DEFAULT 0 NOT NULL,
	VP float CONSTRAINT DF_TOZ_VP DEFAULT 1 NOT NULL,
	TMO float CONSTRAINT DF_TOZ_TMO DEFAULT 0 NOT NULL,
	TRO float CONSTRAINT DF_TOZ_TRO DEFAULT 0 NOT NULL,
	RZO int CONSTRAINT DF_TOZ_RZO DEFAULT 3 NOT NULL,
	PRF$$$PRF varchar(5) COLLATE DATABASE_DEFAULT CONSTRAINT DF_TOZ_PRF$$$PRF DEFAULT '' NOT NULL,
	TDDOC varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_TOZ_TDDOC DEFAULT '' NOT NULL,
	TPN FLOAT CONSTRAINT df__okp_toz__tpn DEFAULT 0 NOT NULL,
	PRODTYPE INT CONSTRAINT df__okp_toz__prodtype DEFAULT 0 NOT NULL,
	TSK FLOAT CONSTRAINT df__okp_toz__tsk DEFAULT 0 NULL,
	SPLITPARTIES INT CONSTRAINT df__okp_toz__splitparties DEFAULT 1 NOT NULL,
	RWC_PPP int NULL,
	RWC_CPL int NULL,
	M_DB bigint NOT NULL,
	M_DE bigint NOT NULL,
	DTETPNE bigint NULL,
	DTEMO bigint NULL,
	M_DB_NR bigint NOT NULL,
	M_DE_NR bigint NOT NULL,
	NR INT CONSTRAINT df__okp_toz__nr DEFAULT 0 NOT NULL,
	WPLCOUNT int CONSTRAINT DF_TOZ_WPLCOUNT DEFAULT 1 NOT NULL,
	TU varchar(4000) COLLATE DATABASE_DEFAULT NULL,
	FILES_ID int NULL,
	QTYBRK FLOAT CONSTRAINT df__okp_toz__qtybrk DEFAULT 0 NOT NULL,
	COMMENT varchar(250) COLLATE DATABASE_DEFAULT NULL,	
	autouop BIT CONSTRAINT df_okp_toz_autouop DEFAULT 0 NOT NULL,
	useKOID TINYINT CONSTRAINT DK_OKP_TOZ_USEKOID DEFAULT 1 NOT NULL,
	verify_need bit CONSTRAINT DK_OKP_TOZ_VERIFY_NEED DEFAULT 0 NOT NULL,
    SHELFLIFE float CONSTRAINT DK_OKP_TOZ_SHELFLIFE DEFAULT 0 NOT NULL,
    SHELFLIFE_EIZID INT CONSTRAINT DK_OKP_TOZ_SHELFLIFE_EIZID DEFAULT 9 NOT NULL,
    SHELFLIFE_STS INT CONSTRAINT DK_OKP_TOZ_SHELFLIFE_STS DEFAULT 0 NOT NULL,
    SHT float CONSTRAINT DF_TOZ_SHT DEFAULT 0 NOT NULL,
	CONSTRAINT PK_OKP_TOZ PRIMARY KEY CLUSTERED (rwc)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Производственные операции', N'schema', N'dbo', N'table', N'OKP_TOZ'
EXEC sp_addextendedproperty 'MS_Description', N'Номер ПП', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Номер наряда', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор предмета', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PRT$$$MNF'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения-изготовителя', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор рабочего центра', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'WCR$$$WCR'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'Код состояния операции', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'Приоритет операции', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PRI'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая дата начала операции', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'DTEPDZ'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая дата выпуска операции', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'DTEPDV'
EXEC sp_addextendedproperty 'MS_Description', N'Фактич. дата выпуска операции', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'FCD'
EXEC sp_addextendedproperty 'MS_Description', N'Запланированное количество', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QTYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'Текущее количество на операции', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QTYCQY'
EXEC sp_addextendedproperty 'MS_Description', N'Завершенное количество на операции', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QTYGQY'
EXEC sp_addextendedproperty 'MS_Description', N'Фактич. количество брака допущенное на операции', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QTYFSC'
EXEC sp_addextendedproperty 'MS_Description', N'Время обработки в часах (округленно)', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QTYPWO'
EXEC sp_addextendedproperty 'MS_Description', N'Причина неукомплектованности', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PNK'
EXEC sp_addextendedproperty 'MS_Description', N'Признак операции 0,1,2,3', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PRP'
EXEC sp_addextendedproperty 'MS_Description', N'Подготов.-заключительное время на единицу', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QTYPZV'
EXEC sp_addextendedproperty 'MS_Description', N'Штучное время', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QTYEDV'
EXEC sp_addextendedproperty 'MS_Description', N'ID причины отклонения', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'REJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'VIN_DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Единица ноpмиpования', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'ENR'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Межоперационное время', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'MOV'
EXEC sp_addextendedproperty 'MS_Description', N'Тип планирования', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'Признак работы в выходные и праздничные дни', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'Holidays'
EXEC sp_addextendedproperty 'MS_Description', N'Количество единиц оборудования', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QCY'
EXEC sp_addextendedproperty 'MS_Description', N'Размер межоперационной передаточной партии', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QCYFLX'
EXEC sp_addextendedproperty 'MS_Description', N'Дата формирования нормированного задания', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'normTaskDate'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на соответствующий операции цехопереход', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'ZPR_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение технологической операци', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'TOP$$$KTO'
EXEC sp_addextendedproperty 'MS_Description', N'Число одновременно обрабатываемых', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'OOD'
EXEC sp_addextendedproperty 'MS_Description', N'Время подготовительно - заключительное (Тпз)', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PZV'
EXEC sp_addextendedproperty 'MS_Description', N'Объём партии', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'VP'
EXEC sp_addextendedproperty 'MS_Description', N'Машинное время обработки', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'TMO'
EXEC sp_addextendedproperty 'MS_Description', N'Время штучно - калькуляционное (Тшк)', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'Разряд', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'Профессия', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PRF$$$PRF'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ТД', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'TDDOC'
EXEC sp_addextendedproperty 'MS_Description', N'время переналадки', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'TPN'
EXEC sp_addextendedproperty 'MS_Description', N'Тип производства 0-собственное ,  1-кооперация', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PRODTYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Время штучно - калькуляционное зарплатное (Тшк-зп)', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'TSK'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг возможности разделения на производственные партии Null,1 - можно, 0-нельзя', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'SPLITPARTIES'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата начала', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'M_DB'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата окончания', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'M_DE'
EXEC sp_addextendedproperty 'MS_Description', N'Время окончания времени переналадки', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'DTETPNE'
EXEC sp_addextendedproperty 'MS_Description', N'Время начала межоперационного промежутка', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'DTEMO'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата начала без контроля связей', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'M_DB_NR'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата окончания без контроля связей', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'M_DE_NR'
EXEC sp_addextendedproperty 'MS_Description', N'Признак отсутствия контроля связей 0-контроль, 1- контроля нет', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'NR'
EXEC sp_addextendedproperty 'MS_Description', N'Технологические указания', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'TU'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на эскиз', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'FILES_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Небольшой комментарии к операции маршрута', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'COMMENT'
EXEC sp_addextendedproperty 'MS_Description', N'Количество брака предудущих операций', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QTYBRK'
EXEC sp_addextendedproperty 'MS_Description', N'Операция автоучитываемая', N'schema', N'dbo', N'table', N'okp_toz', N'column', N'autouop'
EXEC sp_addextendedproperty 'MS_Description', N'Учесть КОИД при расчёте калькуляции', N'schema', N'dbo', N'table', N'okp_toz', N'column', N'useKOID'
EXEC sp_addextendedproperty 'MS_Description', N'Требует контроля ОТК', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'verify_need'
EXEC sp_addextendedproperty 'MS_Description', N'Срок годности', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'SHELFLIFE'
Exec sp_addextendedproperty 'MS_Description', N'ID ЕИЗ срока хранения', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'SHELFLIFE_EIZID'
EXEC sp_addextendedproperty 'MS_Description', N'Статус срока годности', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'SHELFLIFE_STS'
EXEC sp_addextendedproperty 'MS_Description', N'Время штучное (Тшт)', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'SHT'
GO

/* @NAME:  OKP_WCRCapacity
** @DESCR: Привязка конкретной операции к конкретному РМ в конкретное время
*/
CREATE TABLE dbo.OKP_WCRCapacity (
	WCR varchar(12) COLLATE DATABASE_DEFAULT NOT NULL,
	PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	CPLNUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	NOP int NOT NULL,
	DateBegin datetime NOT NULL,
	DateEnd datetime NOT NULL,
	RWC bigint IDENTITY(1, 1) NOT NULL,
	WPL_ID int NOT NULL,
  CONSTRAINT PK_OKP_WCRCapacity PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Загрузка оборудования', N'schema', N'dbo', N'table', N'OKP_WCRCapacity'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение РЦ', N'schema', N'dbo', N'table', N'OKP_WCRCapacity', N'column', N'WCR'
EXEC sp_addextendedproperty 'MS_Description', N'Номер ПП', N'schema', N'dbo', N'table', N'OKP_WCRCapacity', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Номер ПрП', N'schema', N'dbo', N'table', N'OKP_WCRCapacity', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции', N'schema', N'dbo', N'table', N'OKP_WCRCapacity', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'Дата начала', N'schema', N'dbo', N'table', N'OKP_WCRCapacity', N'column', N'DateBegin'
EXEC sp_addextendedproperty 'MS_Description', N'Дата завершения', N'schema', N'dbo', N'table', N'OKP_WCRCapacity', N'column', N'DateEnd'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'OKP_WCRCapacity', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'ID РМ', N'schema', N'dbo', N'table', N'OKP_WCRCapacity', N'column', N'WPL_ID'
GO

/*
** Definition for table OKP_KTO : 
*/
CREATE TABLE dbo.OKP_KTO (
	ID INT NOT NULL identity(1,1), 	
	THO_ID int NOT NULL,
	WCR VARCHAR(12) COLLATE DATABASE_DEFAULT NOT NULL,
	PRF varchar(5) COLLATE DATABASE_DEFAULT NOT NULL,
	RZO VARCHAR(3) COLLATE DATABASE_DEFAULT CONSTRAINT df__okp_kto__rzo DEFAULT 3 NOT NULL,
	PZV float CONSTRAINT df__okp_kto__pzv DEFAULT 0 NOT NULL,
	UOMPZVEIZ varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT df__okp_kto__UOMPZVEIZ DEFAULT '356' NOT NULL,
	TMO float CONSTRAINT df__okp_kto__tmo DEFAULT 0 NOT NULL,
	UOMTMOEIZ varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT df__okp_kto__UOMTMOEIZ DEFAULT '356' NOT NULL,
	TRO float CONSTRAINT df__okp_kto__tro DEFAULT 0 NOT NULL,
	UOMTROEIZ varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT df__okp_kto__UOMTROEIZ DEFAULT '356' NOT NULL,
	VCP FLOAT CONSTRAINT df__okp_kto__vcp DEFAULT 0 NOT NULL,
	VP FLOAT CONSTRAINT df__okp_kto__vp DEFAULT 0 NOT NULL,
	SHT FLOAT CONSTRAINT df__okp_kto__sht DEFAULT 0 NOT NULL,
	UOMSHTEIZ VARCHAR(3) COLLATE DATABASE_DEFAULT CONSTRAINT df__okp_kto__UOMSHTEIZ DEFAULT '356' NOT NULL,
	TPN FLOAT CONSTRAINT df__okp_kto__tpn DEFAULT 0 NOT NULL,
	UOMTPNEIZ VARCHAR(3) COLLATE DATABASE_DEFAULT CONSTRAINT df__okp_kto__UOMTPNEIZ DEFAULT '356' NOT NULL,
	MOV FLOAT CONSTRAINT df__okp_kto__mov DEFAULT 0 NOT NULL,
	UOMMOVEIZ VARCHAR(3) COLLATE DATABASE_DEFAULT CONSTRAINT df__okp_kto__UOMMOVEIZ DEFAULT '356' NOT NULL,
	TSK FLOAT CONSTRAINT df__okp_kto__tsk DEFAULT 0 NOT NULL,
	UOMTSKEIZ VARCHAR(3) COLLATE DATABASE_DEFAULT CONSTRAINT df__okp_kto__uomtskeiz DEFAULT '356' NOT NULL,  
	FIL VARCHAR(30) COLLATE DATABASE_DEFAULT NULL,
	MET VARCHAR(1) COLLATE DATABASE_DEFAULT NULL,
	PlanType int CONSTRAINT df__okp_kto__plantype DEFAULT 0 NOT NULL,
	SPLITPARTIES int CONSTRAINT df__okp_kto__splitparties DEFAULT 1 NOT NULL,
	AUTOUOP int CONSTRAINT df__okp_kto__autouop DEFAULT 0 NOT NULL,
	DESCR VARCHAR(250) COLLATE DATABASE_DEFAULT NULL,
	COMM VARCHAR(250) COLLATE DATABASE_DEFAULT NULL,
	verify_need BIT CONSTRAINT df__kto__verify_need DEFAULT 0 NOT NULL,
	shelflife FLOAT(53) CONSTRAINT df__okp_kto__shelflife DEFAULT 0 NOT NULL,
	shelflife_eizid INT CONSTRAINT df__okp_kto__shelflife_eizid DEFAULT 9 NOT NULL,
	CONSTRAINT PK_OKP_KTO PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Шаблоны операций', N'schema', N'dbo', N'table', N'OKP_KTO'
EXEC sp_addextendedproperty 'MS_Description', N'ID шаблона операции', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID технологической операции', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'THO_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение РЦ', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'WCR'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение профессии', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'PRF'
EXEC sp_addextendedproperty 'MS_Description', N'Разряд', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'Время подготовительно - заключительное (Тпз)', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'PZV'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ Тпз', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'UOMPZVEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Время основное (То)', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'TMO'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ То', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'UOMTMOEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Время штучно - калькуляционное (Тшк)', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ Тшк', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'UOMTROEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Время вспомогательное (Тв)', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'VCP'
EXEC sp_addextendedproperty 'MS_Description', N'Размер технологической партии', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'VP'
EXEC sp_addextendedproperty 'MS_Description', N'Время штучное (Тшт)', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'SHT'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ Тшт', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'UOMSHTEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Время переналадки (Тпн)', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'TPN'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ Тпн', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'UOMTPNEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Время межоперационного пролеживания (Тмо)', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'MOV'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ Тмо', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'UOMMOVEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Время штучно - калькуляционное зарплатное (Тшк-зп)', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'TSK'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ Тшк-зп', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'UOMTSKEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Идент.документа справочной информации', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'FIL'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг разрешения параллельного размещения передаточных партий по рабочим местам; Null,0 - можно; 1-нельзя', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг возможности разделения на производственные партии Null,1 - можно, 0-нельзя', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'SPLITPARTIES'
EXEC sp_addextendedproperty 'MS_Description', N'Автоматически учитываемая операция', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'AUTOUOP'
EXEC sp_addextendedproperty 'MS_Description', N'Технические указания', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'DESCR'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'COMM'
EXEC sp_addextendedproperty 'MS_Description', N'Требует контроля ОТК', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'verify_need'
EXEC sp_addextendedproperty 'MS_Description', N'Срок годности', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'shelflife'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ срока годности', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'shelflife_eizid'
GO

--
-- Definition for table OKP_NOM_KTO : 
--
CREATE TABLE OKP_NOM_KTO (
	ID int NOT NULL identity(1,1),
	KTO_ID int NOT NULL,
	NOM_ID int NOT NULL,
	EIZ varchar(3) COLLATE DATABASE_DEFAULT NOT NULL,
	MET varchar(1) COLLATE DATABASE_DEFAULT ,
	QTY float NOT NULL,
	PRIMARY KEY CLUSTERED (ID)
)
GO 

EXEC sp_addextendedproperty 'MS_Description', N'ID эталонной связи', 'schema', 'dbo', 'table', 'OKP_NOM_KTO', 'column', 'ID';
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID типовой операции', 'schema', 'dbo', 'table', 'OKP_NOM_KTO', 'column', 'KTO_ID';
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID материала', 'schema', 'dbo', 'table', 'OKP_NOM_KTO', 'column', 'NOM_ID';
GO

EXEC sp_addextendedproperty 'MS_Description', N'Единица измерения', 'schema', 'dbo', 'table', 'OKP_NOM_KTO', 'column', 'EIZ';
GO

EXEC sp_addextendedproperty 'MS_Description', N'Метка', 'schema', 'dbo', 'table', 'OKP_NOM_KTO', 'column', 'MET';
GO

EXEC sp_addextendedproperty 'MS_Description', N'Расход материала', 'schema', 'dbo', 'table', 'OKP_NOM_KTO', 'column', 'QTY';
GO

/*
** Definition for table OKP_WCR : 
*/
CREATE TABLE dbo.OKP_WCR (
	ID int identity(1,1),	
	WCR$$$IDN varchar(12) COLLATE DATABASE_DEFAULT NOT NULL,
	NMC$$$NAM varchar(30) COLLATE DATABASE_DEFAULT NOT NULL,
	DEP_ID int NOT NULL,
	PRF$$$PRF varchar(5) COLLATE DATABASE_DEFAULT NOT NULL, 
	VOB float CONSTRAINT DF_OKP_WCR_VOB DEFAULT 0 NULL,
	TIN varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_WCR_TIN DEFAULT 'Y' NULL,
	TRC varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_WCR_TRC DEFAULT 'D' NULL,
	SRC int CONSTRAINT DF_OKP_WCR_SRC DEFAULT 1 NOT NULL,
	PSM float CONSTRAINT DF_OKP_WCR_PSM DEFAULT 8 NOT NULL,
	OZD int CONSTRAINT DF_OKP_WCR_OZD DEFAULT 0 NULL,
	MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
	RES$$$IDN varchar(10) COLLATE DATABASE_DEFAULT NULL,
	Holidays BIT CONSTRAINT df__okp_wcr__holidays DEFAULT 0 NOT NULL,
	TimeBegin DATETIME DEFAULT 0.33333333333333333333333333 NOT NULL,
	CheckPlane bit CONSTRAINT DF_OKP_WCR_CheckPlane DEFAULT 1 NOT NULL,  
	COMMENT varchar(250) COLLATE DATABASE_DEFAULT NULL,
	CONSTRAINT PK_OKP_WCR PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Рабочие центры', N'schema', N'dbo', N'table', N'OKP_WCR'
EXEC sp_addextendedproperty 'MS_Description', N'ID РЦ', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение РЦ', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'WCR$$$IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование РЦ', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'NMC$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение профессии', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'PRF$$$PRF'
EXEC sp_addextendedproperty 'MS_Description', N'Среднее время обработки партии на РЦ', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'VOB'
EXEC sp_addextendedproperty 'MS_Description', N'Код наблюдаемости РЦ:  YN', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'TIN'
EXEC sp_addextendedproperty 'MS_Description', N'Tип рабочего центра:  DPS', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'TRC'
EXEC sp_addextendedproperty 'MS_Description', N'Количество смен', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'SRC'
EXEC sp_addextendedproperty 'MS_Description', N'Продолжительность смены', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'PSM'
EXEC sp_addextendedproperty 'MS_Description', N'Число случаев отсутствия заданий', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'OZD'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния): M = изменен, надо пересчитать план', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'True = РАБОТАЕТ в выходные/праздники', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'Holidays'
EXEC sp_addextendedproperty 'MS_Description', N'Время начала рабочего дня', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'TimeBegin'
EXEC sp_addextendedproperty 'MS_Description', N'Учитывать при планировании', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'CheckPlane'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ресурса', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'RES$$$IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'COMMENT'
GO

/*
** Definition for table OKP_ROUTES : 
*/
CREATE TABLE dbo.OKP_ROUTES (
	ID int IDENTITY(1, 1) NOT NULL,
	NOM_RWC int NOT NULL,
	IDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
	MAINROUTE BIT CONSTRAINT df_okp_routes_mainroute DEFAULT 0 NOT NULL,
	ACTIVE BIT CONSTRAINT df_okp_routes_active DEFAULT 0 NOT NULL,
	BUREAU varchar(30) COLLATE DATABASE_DEFAULT NULL,
	STARTPERIOD datetime NULL,
	ENDPERIOD datetime NULL,
	ACTIVATEBY_FIO varchar(100) COLLATE DATABASE_DEFAULT NULL,
	ACTIVATEDATE datetime NULL,
	COMMENT varchar(999) COLLATE DATABASE_DEFAULT NULL,
	CONSTRAINT PK_OKP_ROUTES PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Технологические маршруты', N'schema', N'dbo', N'table', N'OKP_ROUTES'
EXEC sp_addextendedproperty 'MS_Description', N'ID номенклатуры', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'NOM_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение маршрута', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование маршрута', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Маршрут основной', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'MAINROUTE'
EXEC sp_addextendedproperty 'MS_Description', N'Маршрут активный', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'ACTIVE'
EXEC sp_addextendedproperty 'MS_Description', N'Ответственное бюро', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'BUREAU'
EXEC sp_addextendedproperty 'MS_Description', N'Дата начала периода действия', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'STARTPERIOD'
EXEC sp_addextendedproperty 'MS_Description', N'Дата окончания периода действия', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'ENDPERIOD'
EXEC sp_addextendedproperty 'MS_Description', N'Персона активировавшая ТП (OKP_users.FIO)', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'ACTIVATEBY_FIO'
EXEC sp_addextendedproperty 'MS_Description', N'Дата активации', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'ACTIVATEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий к маршруту', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'COMMENT'
GO

--
-- Definition for table OKP_PRF : 
--
CREATE TABLE OKP_PRF (
	id int NOT NULL identity(1,1),
	PRFIDN varchar(5) COLLATE DATABASE_DEFAULT NOT NULL,
	NMFNAM varchar(150) COLLATE DATABASE_DEFAULT NOT NULL,
	L_NMFNAM varchar(250) COLLATE DATABASE_DEFAULT NOT NULL,
	MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
	GRP_ID int NULL,
	TRMIN int NULL,
	TRMAX int NULL,
	ETKS int NULL,
	OKZ int NULL,
	CONSTRAINT PK_OKP_PRF PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Профессии', N'schema', N'dbo', N'table', N'OKP_PRF'
EXEC sp_addextendedproperty 'MS_Description', N'ID профессии', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'ID';
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор профессии', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'PRFIDN';
EXEC sp_addextendedproperty 'MS_Description', N'Наименование профессии', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'NMFNAM';
EXEC sp_addextendedproperty 'MS_Description', N'Полное наименование профессии', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'L_NMFNAM';
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'MET';
EXEC sp_addextendedproperty 'MS_Description', N'Группа', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'GRP_ID';
EXEC sp_addextendedproperty 'MS_Description', N'Мин. разряд профессии', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'TRMIN';
EXEC sp_addextendedproperty 'MS_Description', N'Макс. разряд профессии', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'TRMAX';
EXEC sp_addextendedproperty 'MS_Description', N'ЕТКС профессии', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'ETKS';
EXEC sp_addextendedproperty 'MS_Description', N'ОКЗ профессии', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'OKZ';
GO

/*
** Операции технологических маршрутов
*/
CREATE TABLE dbo.OKP_RUT (
	ID int identity(1,1) NOT NULL,
	NOP int CONSTRAINT DF_RUT_NOP DEFAULT 5 NOT NULL,
	WCR$$$WCR varchar(12) COLLATE DATABASE_DEFAULT NOT NULL,
	TOP$$$KTO varchar(4) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_RUT_TOP$$$KTO DEFAULT '' NOT NULL,
	OOD int CONSTRAINT DF_RUT_OOD DEFAULT 1 NOT NULL,
	NOR varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_RUT_NOR DEFAULT 'E' NULL,
	PZV float CONSTRAINT DF_RUT_PZV DEFAULT 0 NOT NULL,
	VP float NULL,
	FLX float NULL,
	UOMPZVEIZ varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_RUT_UOMPZVEIZ DEFAULT '356' NOT NULL,
	TMO float CONSTRAINT DF_RUT_TMO DEFAULT 0 NOT NULL,
	UOMTMOEIZ varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_RUT_UOMTMOEIZ DEFAULT '356' NOT NULL,
	TRO float CONSTRAINT DF_RUT_TRO DEFAULT 0 NOT NULL,
	UOMTROEIZ varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_RUT_UOMTROEIZ DEFAULT '356' NOT NULL,
	MOV float CONSTRAINT DF_RUT_MOV DEFAULT 0 NOT NULL,
	UOMMOVEIZ varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_RUT_UOMMOVEIZ DEFAULT '356' NOT NULL,
	TIN varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_RUT_TIN DEFAULT 'Y' NOT NULL,
	DEP_ID int NOT NULL,
	PRF_ID int NOT NULL,
	RZO varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT DF_RUT_RZO DEFAULT 3 NOT NULL,
	TDDOC varchar(50) COLLATE DATABASE_DEFAULT NULL,
	MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
	PlanType int NULL,
	TPN float CONSTRAINT df__okp_rut__tpn DEFAULT 0 NOT NULL,
	UOMTPNEIZ VARCHAR(3) COLLATE DATABASE_DEFAULT CONSTRAINT df__okp_rut__uomtpneiz DEFAULT '356' NOT NULL,
	TSK float CONSTRAINT df__okp_rut__tsk DEFAULT 0 NOT NULL,
	SPLITPARTIES INT CONSTRAINT df__okp_rut__splitparties DEFAULT 1 NOT NULL,
	VCP float CONSTRAINT df__okp_rut__vcp DEFAULT 0 NOT NULL,
	SHT float CONSTRAINT df__okp_rut__sht DEFAULT 0 NOT NULL,
	UOMSHTEIZ varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT df__okp_rut__uomshteiz DEFAULT '356' NOT NULL,
	TU varchar(4000) COLLATE DATABASE_DEFAULT NULL,
	ROUTES_ID int NOT NULL,
	FILES_ID int NULL,
	COMMENT varchar(250) COLLATE DATABASE_DEFAULT NULL,
	autouop BIT CONSTRAINT df_okp_rut_autouop DEFAULT 0 NOT NULL,
	useKOID TINYINT CONSTRAINT DK_OKP_RUT_USEKOID DEFAULT 1 NOT NULL,	
	verify_need BIT CONSTRAINT df__rut__verify_need DEFAULT 0 NOT NULL,
	shelflife FLOAT(53) CONSTRAINT df__okp_rut__shelflife DEFAULT 0 NOT NULL,
	shelflife_eizid INT CONSTRAINT df__okp_rut__shelflife_eizid DEFAULT 9 NOT NULL,
	CONSTRAINT PK_OKP_RUT PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Операции технологического маршрута', N'schema', N'dbo', N'table', N'OKP_RUT'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный идентификатор', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение РЦ', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'WCR$$$WCR'
EXEC sp_addextendedproperty 'MS_Description', N'Код технологической операции', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'TOP$$$KTO'
EXEC sp_addextendedproperty 'MS_Description', N'Количество одновременно обрабатываемых деталей', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'OOD'
EXEC sp_addextendedproperty 'MS_Description', N'Код вида нормирования', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'NOR'
EXEC sp_addextendedproperty 'MS_Description', N'Время подготовительно - заключительное (Тпз)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'PZV'
EXEC sp_addextendedproperty 'MS_Description', N'Размер партии переналадки', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'VP'
EXEC sp_addextendedproperty 'MS_Description', N'Размер передаточной партии с операции', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'FLX'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ Тпз', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'UOMPZVEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Время основное (То)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'TMO'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ То и Тв', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'UOMTMOEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Время штучно - калькуляционное (Тшк)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ Тшк и Тшк-зп', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'UOMTROEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Межоперационное время (Тмо)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'MOV'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ Тмо', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'UOMMOVEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Признак контролируемости:  YN', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'TIN'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID профессии', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'PRF_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Разряд', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ТД', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'TDDOC'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Исполнение на одном РМ 0-нет, 1-да', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'Время переналадки (Тпн)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'TPN'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ Тпн', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'UOMTPNEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Время штучно - калькуляционное зарплатное (Тшк-зп)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'TSK'
EXEC sp_addextendedproperty 'MS_Description', N'Разделение на передаточные партии (0-Выкл., 1-Вкл)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'SPLITPARTIES'
EXEC sp_addextendedproperty 'MS_Description', N'Вспомогательное время (Тв)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'VCP'
EXEC sp_addextendedproperty 'MS_Description', N'Время штучное (Тшт)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'SHT'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ Тшт', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'UOMSHTEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Технологические указания', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'TU'
EXEC sp_addextendedproperty 'MS_Description', N'ID технологического машрута', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'ROUTES_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на эскиз', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'FILES_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Небольшой комментарии к операции маршрута', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'COMMENT'
EXEC sp_addextendedproperty 'MS_Description', N'Операция автоучитываемая', N'schema', N'dbo', N'table', N'okp_rut', N'column', N'autouop'
EXEC sp_addextendedproperty 'MS_Description', N'Учёт КОИД при расчёте калькуляции', N'schema', N'dbo', N'table', N'okp_rut', N'column', N'useKOID'
EXEC sp_addextendedproperty 'MS_Description', N'Требует контроля ОТК', 'schema', 'dbo', 'table', 'OKP_RUT', 'column', 'verify_need'
EXEC sp_addextendedproperty 'MS_Description', N'Срок годности', 'schema', 'dbo', 'table', 'OKP_RUT', 'column', 'shelflife'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ срока годности', 'schema', 'dbo', 'table', 'OKP_RUT', 'column', 'shelflife_eizid'
GO

--
-- Таблица связей между РМ и операцией технологического марщрута
--
CREATE TABLE dbo.OKP_RUT_WPL (
  ID int identity(1,1) NOT NULL,
  RUT_ID int NOT NULL,
  WPL_ID int NOT NULL,
  CONSTRAINT PK_OKP_RUT_WPL PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Привязки операций технологического маршрута к рабочим местам', N'schema', N'dbo', N'table', N'OKP_RUT_WPL'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_RUT_WPL', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор операции технологического маршрута', N'schema', N'dbo', N'table', N'OKP_RUT_WPL', N'column', N'RUT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор рабочего места', N'schema', N'dbo', N'table', N'OKP_RUT_WPL', N'column', N'WPL_ID'
GO

--
-- Таблица связей между РМ и производственной операцией
--
CREATE TABLE dbo.OKP_TOZ_WPL (
  ID int identity(1,1) NOT NULL,
  TOZ_ID int NOT NULL,
  WPL_ID int NOT NULL,
  CONSTRAINT PK_OKP_TOZ_WPL PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Привязки производственных операций к рабочим местам', N'schema', N'dbo', N'table', N'OKP_TOZ_WPL'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_TOZ_WPL', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор операции технологического маршрута', N'schema', N'dbo', N'table', N'OKP_TOZ_WPL', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор рабочего места', N'schema', N'dbo', N'table', N'OKP_TOZ_WPL', N'column', N'WPL_ID'
GO

/*
** Альтернативы основных материалов
*/
CREATE TABLE dbo.OKP_ENGALT (
	RWC int IDENTITY(1, 1) NOT NULL,
	PRTNOM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	SUBSTITUDE_RWC int NOT NULL,
	DateBegin datetime NULL,
	DateEnd datetime NULL,
	amount FLOAT(53) NOT NULL,
	eiz_id int NOT NULL,
	sizes VARCHAR(256) NULL,
	value_weight FLOAT(53) NULL,
	eiz_weight INT NULL,
	kim FLOAT(53) NULL,
	CONSTRAINT PK_OKP_ENGALT PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Альтернативы основным материалам', N'schema', N'dbo', N'table', N'OKP_ENGALT'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение номенклатуры', N'schema', N'dbo', N'table', N'OKP_ENGALT', N'column', N'PRTNOM'
EXEC sp_addextendedproperty 'MS_Description', N'ID альтернативной номенклатуры', N'schema', N'dbo', N'table', N'OKP_ENGALT', N'column', N'SUBSTITUDE_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Дата начала периода замены', N'schema', N'dbo', N'table', N'OKP_ENGALT', N'column', N'DateBegin'
EXEC sp_addextendedproperty 'MS_Description', N'Дата окончания периода замены', N'schema', N'dbo', N'table', N'OKP_ENGALT', N'column', N'DateEnd'
EXEC sp_addextendedproperty 'MS_Description', N'Норма расхода', 'schema', 'dbo', 'table', 'okp_engalt', 'column', 'amount'
EXEC sp_addextendedproperty 'MS_Description', N'ID ЕИЗ расхода', 'schema', 'dbo', 'table', 'okp_engalt', 'column', 'eiz_id'
EXEC sp_addextendedproperty 'MS_Description', N'Размеры заготовки', N'schema', N'dbo', N'table', N'okp_engalt', N'column', N'sizes'
EXEC sp_addextendedproperty 'MS_Description', N'Масса заготовки', N'schema', N'dbo', N'table', N'okp_engalt', N'column', N'value_weight'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ массы заготовки', N'schema', N'dbo', N'table', N'okp_engalt', N'column', N'eiz_weight'
EXEC sp_addextendedproperty 'MS_Description', N'Коэффициент использования материала', N'schema', N'dbo', N'table', N'okp_engalt', N'column', N'kim'
GO

/*
** Инженерные данные 
*/
CREATE TABLE dbo.OKP_ENG (
	DRW varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_ENG_DRW DEFAULT '' NOT NULL,
	PRTNOM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	OBO1 varchar(255) COLLATE DATABASE_DEFAULT NULL,
	OBO2 varchar(255) COLLATE DATABASE_DEFAULT NULL,
	OBO3 varchar(255) COLLATE DATABASE_DEFAULT NULL,
	OBO4 varchar(255) COLLATE DATABASE_DEFAULT NULL,
	UOMUMWEIZ varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_ENG_UOMUMWEIZ DEFAULT '166' NOT NULL,
	UOMUMREIZ varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_ENG_UOMUMREIZ DEFAULT '003' NOT NULL,
	PRTMATNOM varchar(50) COLLATE DATABASE_DEFAULT NULL,
	MET varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_ENG_MET DEFAULT '' NOT NULL,
	KIM float NULL,
	FILES_ID int NULL,
	ZAGLGH float NULL,
	ZAGDMR float NULL,
	ZAGHGH float NULL,
	ZAGM float NULL,
	ID INT IDENTITY(1,1) NOT NULL,
	size_length FLOAT(53) CONSTRAINT DF_OKP_ENG_SIZE_LENGTH DEFAULT 0 NOT NULL,
	size_width FLOAT(53) CONSTRAINT DF_OKP_ENG_SIZE_WIDTH DEFAULT 0 NOT NULL,
	size_height FLOAT(53) CONSTRAINT DF_OKP_ENG_SIZE_HEIGHT DEFAULT 0 NOT NULL,
	sizes VARCHAR(256) CONSTRAINT DF_OKP_ENG_SIZE_SIZES DEFAULT '' NOT NULL,
	amount_required FLOAT(53) CONSTRAINT df_okp_eng_amount_required DEFAULT 0 NOT NULL,
	value_weight FLOAT(53) CONSTRAINT df_okp_eng_value_weight DEFAULT 0 NOT NULL,
	CONSTRAINT PK_OKP_ENG PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Инженерные данные', N'schema', N'dbo', N'table', N'OKP_ENG'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Чертежный номер', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'DRW'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение номенклатуры', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'PRTNOM'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение - строка 1', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'OBO1'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение - строка 2', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'OBO2'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение - строка 3', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'OBO3'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение - строка 4', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'OBO4'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ массы', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'UOMUMWEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ размеров', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'UOMUMREIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение основного материала', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'PRTMATNOM'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Коэффициент использования материалов', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'KIM'
EXEC sp_addextendedproperty 'MS_Description', N'Длина заготовки', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'ZAGLGH'
EXEC sp_addextendedproperty 'MS_Description', N'Диаметр\ширина заготовки', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'ZAGDMR'
EXEC sp_addextendedproperty 'MS_Description', N'Высота заготовки', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'ZAGHGH'
EXEC sp_addextendedproperty 'MS_Description', N'Масса заготовки', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'ZAGM'
EXEC sp_addextendedproperty 'MS_Description', N'Длина предмета', 'schema', 'dbo', 'table', 'okp_eng', 'column', 'size_length'
EXEC sp_addextendedproperty 'MS_Description', N'Ширина (диаметр) предмета', 'schema', 'dbo', 'table', 'okp_eng', 'column', 'size_width'
EXEC sp_addextendedproperty 'MS_Description', N'Ширина (диаметр) предмета', 'schema', 'dbo', 'table', 'okp_eng', 'column', 'size_height'
EXEC sp_addextendedproperty 'MS_Description', N'Размеры заготовки', 'schema', 'dbo', 'table', 'okp_eng', 'column', 'sizes'
EXEC sp_addextendedproperty 'MS_Description', N'Норма расхода', 'schema', 'dbo', 'table', 'okp_eng', 'column', 'amount_required'
EXEC sp_addextendedproperty 'MS_Description', N'Масса предмета', 'schema', 'dbo', 'table', 'okp_eng', 'column', 'value_weight'
EXEC sp_addextendedproperty 'MS_Description', N'ID файла', 'schema', 'dbo', 'table', 'okp_eng', 'column', 'FILES_ID'
GO

/*
** Ресурсы работ
*/
CREATE TABLE dbo.OKP_RES (
  ID int NOT NULL identity(1,1),
  RES$$$IDN varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  NMR$$$NAM varchar(30) COLLATE DATABASE_DEFAULT NOT NULL,
  UOM$$$EIZ varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_RES_UOM$$$EIZ DEFAULT '796' NOT NULL,
  MINNPERC int CONSTRAINT DF_OKP_RES_MINNPERC DEFAULT 80 NOT NULL,
  MAXNPERC int CONSTRAINT DF_OKP_RES_MAXNPERC DEFAULT 105 NOT NULL,
  PRC money CONSTRAINT DF_OKP_RES_PRC DEFAULT 0 NOT NULL,
  MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
  DEP_ID int NOT NULL,
  CONSTRAINT PK_OKP_RES PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ресурсы оборудования', N'schema', N'dbo', N'table', N'OKP_RES'
EXEC sp_addextendedproperty 'MS_Description', N'ID ресурса', 'schema', 'dbo', 'table', 'OKP_RES', 'column', 'ID';
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_RES', N'column', N'RES$$$IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'OKP_RES', N'column', N'NMR$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение единицы измерения', N'schema', N'dbo', N'table', N'OKP_RES', N'column', N'UOM$$$EIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Стоимость единицы ресурса', N'schema', N'dbo', N'table', N'OKP_RES', N'column', N'PRC'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'OKP_RES', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения', N'schema', N'dbo', N'table', N'OKP_RES', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Мин % загруженности', N'schema', N'dbo', N'table', N'OKP_RES', N'column', N'MINNPERC'
EXEC sp_addextendedproperty 'MS_Description', N'Макс % загруженности', N'schema', N'dbo', N'table', N'OKP_RES', N'column', N'MAXNPERC'
GO

/*
** Единицы измерения
*/
CREATE TABLE dbo.OKP_EIZ (
	UOMIDN varchar(3) COLLATE DATABASE_DEFAULT NOT NULL,
	NAENAM varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	RWC int IDENTITY(1, 1) NOT NULL,
	BASE int NULL,
	GRP_ID int NULL,
	KOEF FLOAT CONSTRAINT df__okp_eiz__koef DEFAULT 1 NOT NULL,
	DESCRIBE varchar(255) COLLATE DATABASE_DEFAULT NULL,
	CONSTRAINT PK_OKP_EIZ PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Единицы измерения', N'schema', N'dbo', N'table', N'OKP_EIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Код единицы измерения', N'schema', N'dbo', N'table', N'OKP_EIZ', N'column', N'UOMIDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование единицы измерения', N'schema', N'dbo', N'table', N'OKP_EIZ', N'column', N'NAENAM'
EXEC sp_addextendedproperty 'MS_Description', N'ID строки', N'schema', N'dbo', N'table', N'OKP_EIZ', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Базовая ЕИЗ (все ЕИЗ сгруппированы по группам, внутри групп коэффициенты преобразования ЕИЗ известны)', N'schema', N'dbo', N'table', N'OKP_EIZ', N'column', N'BASE'
EXEC sp_addextendedproperty 'MS_Description', N'Коэффициент преобразования в базовую ЕИЗ', N'schema', N'dbo', N'table', N'OKP_EIZ', N'column', N'KOEF'
EXEC sp_addextendedproperty 'MS_Description', N'Описание', N'schema', N'dbo', N'table', N'OKP_EIZ', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы', N'schema', N'dbo', N'table', N'OKP_EIZ',  N'column', N'GRP_ID'
GO

--
-- Definition for table OKP_TRN : 
--

CREATE TABLE dbo.OKP_TRN (
  TRN_ID bigint IDENTITY(1, 1) NOT NULL,
  WRH_IDN varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  WRH_NAM varchar(50) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
  PRS varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  TRN_TSO varchar(2) COLLATE DATABASE_DEFAULT NOT NULL,
  NUM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  PRT_INV varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  DOC varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  DKD datetime NOT NULL,
  DTA datetime null,
  DTR varchar(2) COLLATE DATABASE_DEFAULT NULL,
  LIN int NOT NULL,
  FACTUR varchar(20) COLLATE DATABASE_DEFAULT NULL,
  DTF datetime NULL,
  DTE datetime NOT NULL,
  CCC varchar(10) NULL,
  CCC_NAM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  PDR_NAM varchar(100) COLLATE DATABASE_DEFAULT NULL,
  PRC float NOT NULL,
  PRC_D float NOT NULL,
  QTY float NULL,
  ART varchar(8) COLLATE DATABASE_DEFAULT NULL,
  INV varchar(1) COLLATE DATABASE_DEFAULT NOT NULL,
  UPD varchar(1) COLLATE DATABASE_DEFAULT NOT NULL,
  ACC varchar(1) COLLATE DATABASE_DEFAULT NOT NULL,
  EIZ_RASH varchar(10) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_TRN_EIZ_RASH DEFAULT '166' NOT NULL,
  PRR varchar(1) COLLATE DATABASE_DEFAULT NOT NULL,
  MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
  STS int NULL,
  CNT float NULL,
  H_EIZH varchar(10) COLLATE DATABASE_DEFAULT NULL,
  H_PRC money NULL,
  H_QTY float NULL,
  QTY_F float(53) NULL,
  Fold_Q float(53) NULL,
  COMMENT varchar(200) COLLATE DATABASE_DEFAULT NULL,
  SUMPRC float NULL,
  BILL varchar(50) COLLATE DATABASE_DEFAULT NULL,
  DTBILL datetime NULL,
  INV_ID int DEFAULT 0 NOT NULL,
  DOC_ID bigint NULL,
  NDS float DEFAULT 0 NOT NULL,
  NDS_Included int CONSTRAINT DF_OKP_TRN_NDS_Included DEFAULT 0 NOT NULL,
  SUB_ID bigint NULL,
  CONSTRAINT PK_OKP_TRN PRIMARY KEY CLUSTERED (TRN_ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архив склада (складские операции)', N'schema', N'dbo', N'table', N'OKP_TRN'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор записи', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'TRN_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор склада', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'WRH_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Ответственное лицо', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'PRS'
EXEC sp_addextendedproperty 'MS_Description', N'Код типа транзакции  (из TSO)', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'TRN_TSO'
EXEC sp_addextendedproperty 'MS_Description', N'№ заказа/договора из РРР', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор предмета из INV', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'PRT_INV'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор первичного документа', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'DOC'
EXEC sp_addextendedproperty 'MS_Description', N'дата первичного документа', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'DKD'
EXEC sp_addextendedproperty 'MS_Description', N'Дата утверждения', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'DTA'
EXEC sp_addextendedproperty 'MS_Description', N'Код комплекта', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'DTR'
EXEC sp_addextendedproperty 'MS_Description', N'Порядковый номер строки документа', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'LIN'
EXEC sp_addextendedproperty 'MS_Description', N'№ фактуры', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'FACTUR'
EXEC sp_addextendedproperty 'MS_Description', N'Дата фактуры', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'DTF'
EXEC sp_addextendedproperty 'MS_Description', N'Дата транзакции', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Код хозяйственной операции', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'CCC'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование хозяйственной операции', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'CCC_NAM'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование  подразделения, клиента\поставщика', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'PDR_NAM'
EXEC sp_addextendedproperty 'MS_Description', N'Складская цена ТМЦ по документу (без учёта НДС). В документах "Приёмка поставки" в значение этого поля включена стоимость доставки.', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'PRC'
EXEC sp_addextendedproperty 'MS_Description', N'Цена по документу. Для большинства документов склада (кроме "Приемка поставки") PRC = PRC_D.В документах поставки, как правило, указывается НДС, а в цене учитывется его объём.Так же в документах на поставку может отдельно указываться цена доставки.Исходя из этого в системе принято следующее соотношение складской цены (PRC) и цены по документу (PRC_D):  - если в качестве основания указан документ "Накладная поставки" модуля Снабжение, то    PRC = OKP_RZP_TRN_DATA.PRC_RECALC  - если документ-основание не указан и НДС учитывается, то в зависимости от флага OKP_TRN.NDS_Included:      * 0 (НДС не включён в цену PRC_D) -> PRC = PRC_D      * 1 (НДС включён в цену PRC_D) -> PRC = PRC_D / (1 + НДС)  - если документ-основание не указан и НДС не учитывается, то PRC = PRC_D', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'PRC_D'
EXEC sp_addextendedproperty 'MS_Description', N'Обработанное количество', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Код бухг. учета', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'ART'
EXEC sp_addextendedproperty 'MS_Description', N'Признак вкл. в файл учета запасов', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'INV'
EXEC sp_addextendedproperty 'MS_Description', N'Признак вкл. в файл учета планов', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'UPD'
EXEC sp_addextendedproperty 'MS_Description', N'Признак вкл. в файл для бухгалтерии', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'ACC'
EXEC sp_addextendedproperty 'MS_Description', N'Единица измерения расхода', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'EIZ_RASH'
EXEC sp_addextendedproperty 'MS_Description', N'Признак выполнения заказа', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'PRR'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг записи. Отражает состояние записи в зависимости от значения поля TRN_TSO:  - TRN_TSO = "IN" (транзакция инвентаризации)   1) isNull(met, 0) <> 1 - ТМЦ снят с инвентаризации    2) 1 - ТМЦ поставлен на инвентаризацию  - TRN_TSO = "IR" (транзакция оформления заказа на выдачу в производство)   1) 0 - партии нет (ничего выдавать не надо)   2) isNull(met, 1) <> 0 - заказ активен', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Коэффициент пересчёта количества (OKP_TRN.QTY) из ЕИЗ транзакции (OKP_TRN.EIZ_RASH) в системную ЕИЗ расхода предмета (см. описание OKP_INV.QTY)', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'CNT'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ, в которой указаны h_prc, h_qty', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'H_EIZH'
EXEC sp_addextendedproperty 'MS_Description', N'если запись является ведущей (с ней связаны записи других документов - "ведомые документы"), то поле содержит итоговое "закрытое" количество  (суммированное количество по всем связанным записям ведомых документов) в системной ЕИЗ расхода предмета (см. описание OKP_INV.QTY)', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'QTY_F'
EXEC sp_addextendedproperty 'MS_Description', N'свёртка QTY_F', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'Fold_Q'
EXEC sp_addextendedproperty 'MS_Description', N'Цена до момента утверждения документа (копия OKP_INV.PRC)', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'H_PRC'
EXEC sp_addextendedproperty 'MS_Description', N'Количество до момента утверждения документа (копия OKP_INV.QTY)', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'H_QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Размер НДС (в %)', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'NDS'
EXEC sp_addextendedproperty 'MS_Description', N'НДС включен в цену: 0 - Итоговая сумма складывается из суммы ТМЦ плюс НДС 1 - НДС не влияет на итоговую сумму', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'NDS_Included'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на таблицу распределения объектов по складам (OKP_WRH_SUBJECTS.ID)', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'SUB_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Свёртка статуса строки:  - null, 0 - строка НЕ распределена  - 1 - строка полностью распределена (всё её количество учтено документами распределения)',   N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'STS'
GO

--
-- Definition for table OKP_TRNDOC : 
--

CREATE TABLE dbo.OKP_TRNDOC (
  ID bigint IDENTITY(1, 1) NOT NULL,
  GRP int NULL,
  DOC varchar(50) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
  TSO varchar(2) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
  WRH varchar(10) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
  Mode int null,
  MasterLink int CONSTRAINT DF_OKP_TRNDoc_MasterLink DEFAULT 0 not null,
  Status int not null default(0),
  DKD datetime DEFAULT getdate() NOT NULL,
  DTA datetime null,
  PRS varchar(100) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
  COUNTERPARTY varchar(100) COLLATE DATABASE_DEFAULT NULL,
  FACTUR varchar(20) COLLATE DATABASE_DEFAULT NULL,
  DTF datetime NULL,
  BILL varchar(50) COLLATE DATABASE_DEFAULT NULL,
  DTBILL datetime NULL,
  DESCRIBE varchar(4000) COLLATE DATABASE_DEFAULT NULL,
  CONTRACT_ID bigint NULL,
  UseNDS int DEFAULT 0 NOT NULL,
  OwnerFIO varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Флаг использования НДС', N'schema', N'dbo', N'table', N'OKP_TRNDOC', N'column', N'UseNDS'
EXEC sp_addextendedproperty 'MS_Description', N'Владелец документа (тот, кто создал документ)', N'schema', N'dbo', N'table', N'OKP_TRNDOC', N'column', N'OwnerFIO'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг статуса документа:  0 - не утверждён - документ является "черновиком", т.е. он в системе "не существует" и не                     оказывает вляния на её работу (за исключением подсистемы "Места хранения")  10 - утверждён',  'schema', 'dbo', 'table', 'OKP_TRNDOC', 'column', 'Status'
EXEC sp_addextendedproperty 'MS_Description', N'Модификатор документа:  NULL или 0 - стандартный документ  <> 0 - модифицированный документ ',   N'schema', N'dbo', N'table', N'OKP_TRNDOC', N'column', N'Mode'
EXEC sp_addextendedproperty 'MS_Description', N'Тип ведущего документа:0 - ведущего документа нет> 0 - см. OKP_sysObjects.ID', N'schema', N'dbo', N'table', N'OKP_TRNDoc', N'column', N'MasterLink'
EXEC sp_addextendedproperty 'MS_Description', N'Дата утверждения', N'schema', N'dbo', N'table', N'OKP_TRNDOC', N'column', N'DTA'
GO
--
-- Definition for table OKP_WRH : 
--
CREATE TABLE dbo.OKP_WRH (
  WRH_ID int IDENTITY(1, 1) NOT NULL,
  WRH_IDN varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  NAM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  KTP_KTP tinyint NULL,
  PIN varchar(5) COLLATE DATABASE_DEFAULT NULL,
  PLK varchar(1) COLLATE DATABASE_DEFAULT NULL,
  REX varchar(1) COLLATE DATABASE_DEFAULT NULL,
  DDD varchar(1) COLLATE DATABASE_DEFAULT NULL,
  NPW varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_WRH_NPW DEFAULT '0000000000' NULL,
  DTW datetime NULL,
  NNN varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_WRH_NNN DEFAULT '0000000000' NULL,
  DTR datetime NULL,
  NPF varchar(20) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_WRH_NPF DEFAULT '0000000000' NULL,
  DTF datetime NULL,
  DTE datetime NULL,
  MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
  PREF_DOC varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_WRH_PREF_DOC DEFAULT '' NOT NULL,
  DISEDITDATE datetime NULL,
  PLANPERIOD varchar(1) COLLATE DATABASE_DEFAULT DEFAULT 'M' NOT NULL,
  WPTemplate varchar(100)  COLLATE DATABASE_DEFAULT null,
  WPSeparator varchar(1)  COLLATE DATABASE_DEFAULT null,
  WPType int not null default(0),
  COMMENT varchar(200) COLLATE DATABASE_DEFAULT NULL,
  AutoUOPDOC int CONSTRAINT DF_OKP_WRH_AutoUOPDOC DEFAULT 0 NOT NULL,
  isForDefective int NULL,
  RPType int not null default(0),
  IMType int,
  IMOverReserv int CONSTRAINT DF__OKP_WRH__IMOverReserv DEFAULT 0 NOT NULL,
  DocSTS varchar(1000) COLLATE DATABASE_DEFAULT null,
  SPLFacturType int CONSTRAINT DF__OKP_WRH__SPLFacturType DEFAULT 0 not null,
  SPLBillType int CONSTRAINT DF__OKP_WRH__SPLBillType DEFAULT 0 not null,
  AutoDistribObj int CONSTRAINT DF__OKP_WRH__AutoDistribObj DEFAULT 0 NOT NULL,
  RMOverrunEnable int CONSTRAINT DF__OKP_WRH__RMOverrunEnable DEFAULT 1 NOT NULL,
  RMPermControl int CONSTRAINT DF__OKP_WRH__RMPermControl DEFAULT 0 NOT NULL,
  CONSTRAINT PK_OKP_WRH PRIMARY KEY CLUSTERED (WRH_ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Склады', N'schema', N'dbo', N'table', N'OKP_WRH'
EXEC sp_addextendedproperty 'MS_Description', N'ID склада', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'WRH_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор склада', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'WRH_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование склада', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'NAM'
EXEC sp_addextendedproperty 'MS_Description', N'Вид (тип) склада: gpmspscspx', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'KTP_KTP'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор входного пункта склада', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'PIN'
EXEC sp_addextendedproperty 'MS_Description', N'Признак учета при планировании: Y,N', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'PLK'
EXEC sp_addextendedproperty 'MS_Description', N'Режим эксплуатации модуля "Склад" LMN', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'REX'
EXEC sp_addextendedproperty 'MS_Description', N'Признак актулизации', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'DDD'
EXEC sp_addextendedproperty 'MS_Description', N'Номер последней инвентаризац. ведомости', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'NPW'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последней инвентаризац. ведомости', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'DTW'
EXEC sp_addextendedproperty 'MS_Description', N'Номер последнего складского документа (см. OKP_TRN.DOC)', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'NNN'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последнего складского документа (см. OKP_TRN.DKD)', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'DTR'
EXEC sp_addextendedproperty 'MS_Description', N'Номер последней фактуры', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'NPF'
EXEC sp_addextendedproperty 'MS_Description', N'Дата  последней фактуры', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'DTF'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последнего сальдо', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Префикс документа', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'PREF_DOC'
EXEC sp_addextendedproperty 'MS_Description', N'Дата запрета редактирования складских документов', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'DISEDITDATE'
EXEC sp_addextendedproperty 'MS_Description', N'Код планового периода - год, месяц и т.д. YBQMWDG', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'PLANPERIOD'
EXEC sp_addextendedproperty 'MS_Description', N'Шаблон адресов мест хранения. Структура:  - разделитель блоков - char(1)  - первый блок - служебный - две цифры:    -- первая цифра - флаг иерархии:     0 - первый значащий блок - старший (например, "СТЕЛЛАЖ-полка-ячейка")     1 - первый значащий блок - младший (например, "ЯЧЕЙКА-полка-стеллаж")     -- вторая цифра - флаг добавления обозначения склада в полное обозначение места хранения (v_WPlaces.FullAddr):     0 - не добавлять     1 - добавлять в соответствии с иерархией (см. пред. флаг):         0 - обозначение склада указывается первым блоком         1 - обозначение склада указывается последним блоком  - второй и последующие блоки - значащие:    -- каждый блок состоит из 4-х подблоков (например, "Я::Ячейка:2"):      1 - префикс      2 - суффикс      3 - имя блока      4 - разрядность  пример обозначения в соответствии с указанным выше шаблоном - "Я01" ',   'schema', 'dbo', 'table', 'OKP_WRH', 'column', 'WPTemplate'
EXEC sp_addextendedproperty 'MS_Description', N'Разделитель элементов адреса мест хранения. Если не указан, то "."',   'schema', 'dbo', 'table', 'OKP_WRH', 'column', 'WPSeparator'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг использования подсистемы "Места хранения":  0 - не использовать - статус "Утвержден" устанавливается автоматически при создании; подсистема                         "Места хранения" не доступна  1 - справочно -       статус "Утвержден" устанавливается автоматически при создании; подсистема                        "Места хранения" доступна  2 - использовать -    статус "Утвержден" устанавливается автоматически для полностью распределённого                         документа; подсистема "Места хранения" доступна ',    'schema', 'dbo', 'table', 'OKP_WRH', 'column', 'WPType'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий к складу', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'COMMENT'    
EXEC sp_addextendedproperty 'MS_Description', N'Разрешено автоматическое формирование документов выдачи КиМ при учете операций', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'AutoUOPDOC'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг "Склад дефектовки": 0, null - не является складом дефектовки;1 - является складом дефектовки.', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'isForDefective'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг использования документа-основания при приёмке поставки:  - 2 - ПО ДОКУМЕНТАМ - документы типа "Приёмка поставки" могут быть созданы только на основании      документов учёта поставки, проведённых в модуле "Снабжение"  - 1 - БЕЗ ДОКУМЕНТОВ - документы типа "Приёмка поставки" могут быть созданы только если      основание не задано  - 0 - СМЕШАННЫЙ РЕЖИМ - документы типа "Приёмка поставки" могут быть созданы как с указанием      основания, так и без него',    'schema', 'dbo', 'table', 'OKP_WRH', 'column', 'RPType'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг разрешения модификатора IM-документа (см. OKP_TRNDOC.Mode):  0 - модификатор запрещён - только стандартный документ  1 - модификатор разрешён - документ может быть создан после учёта в производстве (по факту), а не до (как стандартный)',   N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'IMType'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг документа "Выдача для производства по заказу", регулирующего разрешение на отпуск большего количества чем указано в документе резерва',   N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'IMOverReserv'
EXEC sp_addextendedproperty 'MS_Description', N'Настройки управления статусами документов',   N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'DocSTS'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг использования номера счёт-фактуры поставки:  - 0 - НЕ ИСПОЛЬЗОВАТЬ - счёт-фактура не требуется; соответствующее поле в документе поставки не доступно   - 1 - СПРАВОЧНО - счёт-фактура не требуется; соответствующее поле в документе поставки доступно   - 2 - ИСПОЛЬЗОВАТЬ - в документах поставки счёт-фактура должна быть указана; соответствующее поле в документе поставки доступно', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'SPLFacturType'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг использования номера внешней накладной поставки:  - 0 - НЕ ИСПОЛЬЗОВАТЬ - внешняя накладная не требуется; соответствующее поле в документе поставки не доступно   - 1 - СПРАВОЧНО - внешняя накладная не требуется; соответствующее поле в документе поставки доступно   - 2 - ИСПОЛЬЗОВАТЬ - в документах поставки внешняя накладная должна быть указана; соответствующее поле в документе поставки доступно', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'SPLBillType'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг автораспределения серийных номеров и номерных партий при добавлении ТМЦ в документ', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'AutoDistribObj'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг документа "Приёмка от производства", регулирующего разрешение на приём партий с перерасходом:  - ДА - разрешение включено (разрешено принимать партии с перерасходом)  - НЕТ - разрешение выключено (принимать партии с перерасходом нельзя)',   N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'RMOverrunEnable'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг документов выдачи в производство, регулирующий контроль срока годности:   - ДА - контроль включен, при выдаче осуществляется контроль остаточного срока годности  - НЕТ - контроль отключен',   N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'RMPermControl'
GO

--
-- Definition for table OKP_USERS : 
--
CREATE TABLE dbo.OKP_USERS (
  USERNAME varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  USERFIO varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  USERPSSW varbinary(50) NOT NULL,
  PERMISSIONS varbinary(50) NULL,
  User_ID int IDENTITY(1, 1) NOT NULL,
  GroupID int CONSTRAINT DF_OKP_USERS_GroupID DEFAULT 0 NOT NULL,
  Domain varchar(250) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
  ServerAUTH int DEFAULT 1 NOT NULL,
  FirstName varchar(250) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
  LastName varchar(250) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
  SurName varchar(250) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
  Description varchar(1000) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
  Files_ID int DEFAULT 0 NOT NULL,
  IsRole bit CONSTRAINT DF_OKP_USERS_ISROLE DEFAULT 0 NOT NULL,
  CONSTRAINT PK_OKP_USERS PRIMARY KEY CLUSTERED (USERNAME)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Пользователи', N'schema', N'dbo', N'table', N'OKP_USERS'
EXEC sp_addextendedproperty 'MS_Description', N'Логин', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Имя пользователя', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'USERNAME'
EXEC sp_addextendedproperty 'MS_Description', N'ФИО пользователя', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'USERFIO'
EXEC sp_addextendedproperty 'MS_Description', N'Пароль', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'USERPSSW'
EXEC sp_addextendedproperty 'MS_Description', N'Уровень доступа', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'PERMISSIONS'
EXEC sp_addextendedproperty 'MS_Description', N'Имя домена Active Directory пользователя', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'Domain'
EXEC sp_addextendedproperty 'MS_Description', N'Проверка подлинности на сервере, где 1 - проверка Windows, а 0 - проверка SQL', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'ServerAUTH'
EXEC sp_addextendedproperty 'MS_Description', N'Просто ИМЯ самого пользователя', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'FirstName'
EXEC sp_addextendedproperty 'MS_Description', N'Отчество пользователя', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'LastName'
EXEC sp_addextendedproperty 'MS_Description', N'Фамилия пользователя', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'SurName'
EXEC sp_addextendedproperty 'MS_Description', N'Описание пользователя (комментарии к пользователю)', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'Description'
EXEC sp_addextendedproperty 'MS_Description', N'ID файла в базе OKP_Files, для хранения фото сотрудников', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'Files_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Запись - роль?', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'IsRole'
GO

--
-- Definition for table OKP_WRHU : 
--

CREATE TABLE dbo.OKP_WRHU (
  USER_ID int NOT NULL,
  WRH_WRH int NOT NULL,
  MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_OKP_WRHU PRIMARY KEY CLUSTERED (USER_ID, WRH_WRH)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Пользователи складов', N'schema', N'dbo', N'table', N'OKP_WRHU'
EXEC sp_addextendedproperty 'MS_Description', N'ID пользователя', N'schema', N'dbo', N'table', N'OKP_WRHU', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор склада OKP_WRH.WRH_ID', N'schema', N'dbo', N'table', N'OKP_WRHU', N'column', N'WRH_WRH'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи', N'schema', N'dbo', N'table', N'OKP_WRHU', N'column', N'MET'
GO

/*
** Definition for table OKP_INV : 
*/
CREATE TABLE dbo.OKP_INV (
	INV_ID bigint IDENTITY(1, 1) NOT NULL,
	WRH_WRH int NOT NULL,
	USER_ID int NOT NULL,
	PRTIDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	NM1 varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
	NM2 varchar(255) COLLATE DATABASE_DEFAULT NOT NULL,
	UOMPEIZ varchar(3) COLLATE DATABASE_DEFAULT NOT NULL,
	UOMHEIZ varchar(3) COLLATE DATABASE_DEFAULT NOT NULL,
	CNT float CONSTRAINT DF_OKP_INV_CNT DEFAULT 1 NOT NULL,
	PRC float NOT NULL,
	ART varchar(8) null,
	SZP float CONSTRAINT DF_OKP_INV_SZP DEFAULT 0 NOT NULL,
	KTX varchar(4) COLLATE DATABASE_DEFAULT NULL,
	PRG varchar(4) COLLATE DATABASE_DEFAULT NULL,
	ADP varchar(1) COLLATE DATABASE_DEFAULT NOT NULL,
	LNG varchar(10) COLLATE DATABASE_DEFAULT NULL,
	DEV real CONSTRAINT DF_OKP_INV_DEV DEFAULT 0 NULL,
	DAD real CONSTRAINT DF_OKP_INV_DAD DEFAULT 0 NULL,
	KNA varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_INV_KNA DEFAULT 0 NOT NULL,
	LLL varchar(1) COLLATE DATABASE_DEFAULT NULL,
	QTY FLOAT CONSTRAINT df__okp_inv__qty DEFAULT 0 NOT NULL,
	SAL float CONSTRAINT DF_OKP_INV_SAL DEFAULT 0 NOT NULL,
	QTYMFC float CONSTRAINT DF_OKP_INV_QTYMFC DEFAULT 0 NOT NULL,
	BGY float NULL,
	REY float NULL,
	ISY float NULL,
	ADY float NULL,
	BEG float NULL,
	REC float NULL,
	ISS float NULL,
	ADJ float NULL,
	DIS datetime NULL,
	MAD varchar(1) NULL,
	DTA datetime NULL,
	ADQ float CONSTRAINT DF_OKP_INV_ADQ DEFAULT 0 NOT NULL,
	DTE_NOR datetime NULL,
	OTV float CONSTRAINT DF_OKP_INV_OTV DEFAULT 0 NOT NULL,
	OMP varchar(1) COLLATE DATABASE_DEFAULT NULL,
	MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
	GRP_ID int NULL,
	TYP varchar(1) COLLATE DATABASE_DEFAULT DEFAULT 'D' NOT NULL,
	DATESALDO datetime DEFAULT getdate() NOT NULL,
	CEY float NULL,
	CEJ float NULL,
	COMMENT varchar(200) COLLATE DATABASE_DEFAULT NULL,
	HCNT float CONSTRAINT df__okp_inv__hcnt DEFAULT 1 NOT NULL,
	REGDATE datetime DEFAULT getdate() NOT NULL,
	REGFIO varchar(100) COLLATE DATABASE_DEFAULT NULL,
	ISACTIVE int DEFAULT 1 NOT NULL,
	CELL varchar(50)  COLLATE DATABASE_DEFAULT null,
	ESKIZ_ID int null,
	TAG int NULL,
	FS_BEG float CONSTRAINT DF__OKP_INV__FS_BEG DEFAULT 0 NOT NULL,
	FS_REC float CONSTRAINT DF__OKP_INV__FS_REC DEFAULT 0 NOT NULL,
	FS_ISS float CONSTRAINT DF__OKP_INV__FS_ISS DEFAULT 0 NOT NULL,
	FS_BGY float CONSTRAINT DF__OKP_INV__FS_BGY DEFAULT 0 NOT NULL,
	FS_REY float CONSTRAINT DF__OKP_INV__FS_REY DEFAULT 0 NOT NULL,
	FS_ISY float CONSTRAINT DF__OKP_INV__FS_ISY DEFAULT 0 NOT NULL,
	FS_DKD datetime DEFAULT getdate() NOT NULL,
	FOLD_ID bigint null,
	FOLD_DKD datetime null,
	CONSTRAINT PK_OKP_INV PRIMARY KEY CLUSTERED (INV_ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Номенклатура на складах', N'schema', N'dbo', N'table', N'OKP_INV'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный идентификатор запаса', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'INV_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор склада', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'WRH_WRH'
EXEC sp_addextendedproperty 'MS_Description', N'Код материально ответственного лица', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор предмета', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'PRTIDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование предмета (сокращенное)', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'NM1'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование предмета (полное)', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'NM2'
EXEC sp_addextendedproperty 'MS_Description', N'Единица измерения расхода/выдачи = OKP_NOM.UOM$$$EIZ - единица, в которой позиция расходуется в производстве', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'UOMPEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Единица измерения запасов', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'UOMHEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Коэффициент перевода единиц запасов (UOMHEIZ) в единицы расхода (UOMPEIZ)', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'CNT'
EXEC sp_addextendedproperty 'MS_Description', N'Цена единицы предмета в системной ЕИЗ расхода', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'PRC'
EXEC sp_addextendedproperty 'MS_Description', N'Код бухгалтерского  учета', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'ART'
EXEC sp_addextendedproperty 'MS_Description', N'Размер страхового запаса', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'SZP'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор инструкции хранения предмета', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'KTX'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор программы поиска места хранения', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'PRG'
EXEC sp_addextendedproperty 'MS_Description', N'Код периода инвентаризации - год, месяц и т.д. YBQMWDG', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'ADP'
EXEC sp_addextendedproperty 'MS_Description', N'Длина периода пользователя', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'LNG'
EXEC sp_addextendedproperty 'MS_Description', N'Допустимое отклонение при инвентаризации (%)', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'DEV'
EXEC sp_addextendedproperty 'MS_Description', N'Допустимое отклонение при инвентаризации (деньги)', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'DAD'
EXEC sp_addextendedproperty 'MS_Description', N'Код особого наблюдения: 01234', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'KNA'
EXEC sp_addextendedproperty 'MS_Description', N'Признак лимитирования', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'LLL'
EXEC sp_addextendedproperty 'MS_Description', N'Текущее наличное количество. Количество указано в системной ЕИЗ расхода.Например, UOMPEIZ = тонна (обычно для тонны системной является килограмм), тогда QTY указана в килограммах.Примечание: системные ЕИЗ и коэффициенты их преобразования возвращает EV_SYSEIZ ', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Резервир. количество для отгрузки', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'SAL'
EXEC sp_addextendedproperty 'MS_Description', N'Резервир. количество для производства', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'QTYMFC'
EXEC sp_addextendedproperty 'MS_Description', N'Количество в начале года', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'BGY'
EXEC sp_addextendedproperty 'MS_Description', N'Поступления с начала года', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'REY'
EXEC sp_addextendedproperty 'MS_Description', N'Расход с начала года', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'ISY'
EXEC sp_addextendedproperty 'MS_Description', N'Корректировка с начала года', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'ADY'
EXEC sp_addextendedproperty 'MS_Description', N'Количество в начале периода', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'BEG'
EXEC sp_addextendedproperty 'MS_Description', N'Поступления с начала периода', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'REC'
EXEC sp_addextendedproperty 'MS_Description', N'Расход с начала периода', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'ISS'
EXEC sp_addextendedproperty 'MS_Description', N'Корректировки с начала периода', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'ADJ'
EXEC sp_addextendedproperty 'MS_Description', N'Первоначальное сальдо: количество в начале периода', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FS_BEG'	
EXEC sp_addextendedproperty 'MS_Description', N'Первоначальное сальдо: поступления с начала периода', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FS_REC'	
EXEC sp_addextendedproperty 'MS_Description', N'Первоначальное сальдо: расход с начала периода', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FS_ISS'	
EXEC sp_addextendedproperty 'MS_Description', N'Первоначальное сальдо: количество в начале года', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FS_BGY'	
EXEC sp_addextendedproperty 'MS_Description', N'Первоначальное сальдо: поступления с начала года', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FS_REY'	
EXEC sp_addextendedproperty 'MS_Description', N'Первоначальное сальдо: расход с начала года', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FS_ISY'	
EXEC sp_addextendedproperty 'MS_Description', N'Первоначальное сальдо: дата первоначального сальдо', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FS_DKD'	
EXEC sp_addextendedproperty 'MS_Description', N'Дата последнего расхода', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'DIS'
EXEC sp_addextendedproperty 'MS_Description', N'Метка инвентаризации', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'MAD'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последней инвентаризации', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'DTA'
EXEC sp_addextendedproperty 'MS_Description', N'Количество при последней инвентаризации', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'ADQ'
EXEC sp_addextendedproperty 'MS_Description', N'Дата и время последней обработки', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'DTE_NOR'
EXEC sp_addextendedproperty 'MS_Description', N'Количество на ответственном хранении', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'OTV'
EXEC sp_addextendedproperty 'MS_Description', N'Способ организации мат. потока: PD', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'OMP'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг состояния записи: "1" - на инвентаризации', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Служебный флаг записи', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'TAG'
EXEC sp_addextendedproperty 'MS_Description', N'Индекс группы', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'GRP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Вид(тип) предмета: деталь(D)\изделие(I)\узел(U)\заготовка(B)\покупное(S)\материал(M)', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'TYP'
EXEC sp_addextendedproperty 'MS_Description', N'Дата проведения сальдо', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'DATESALDO'
EXEC sp_addextendedproperty 'MS_Description', N'Стоимость запаса на начало года', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'CEY'
EXEC sp_addextendedproperty 'MS_Description', N'Стоимость запаса на начало периода', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'CEJ'
EXEC sp_addextendedproperty 'MS_Description', N'Коэффициент пересчёта количества из системной ЕИЗ расхода (см. описание QTY) в ЕИЗ хранения (UOMHEIZ)', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'HCNT'
EXEC sp_addextendedproperty 'MS_Description', N'Признак актуальности: 1-действующий, 0- не действующий', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'ISACTIVE'
EXEC sp_addextendedproperty 'MS_Description', N'Ячейка?', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'CELL'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'COMMENT'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на крайнюю свёртку ТМЦ OKP_WRHFOLDS.ID', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FOLD_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата крайней свёртки ТМЦ', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FOLD_DKD'
GO

--
-- Definition for table OKP_sysLogins : 
--

CREATE TABLE dbo.OKP_sysLogins (
  ID smallint NOT NULL,
  Modul varchar(100) COLLATE DATABASE_DEFAULT NULL,
  UserName varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  LogDateTime datetime NOT NULL,
  HostName char(128) COLLATE DATABASE_DEFAULT NOT NULL,
  CONSTRAINT PK_OKP_sysLogins PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Системная таблица зарегистрированных пользователей', N'schema', N'dbo', N'table', N'OKP_sysLogins'
go
--
-- Definition for table OKP_PLN : 
--

CREATE TABLE dbo.OKP_PLN (
  ID int NOT NULL identity(1,1),  
  PRT$$$NOM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  USERFIO varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,  QCYOPR int NULL,
  QCYFLX float NOT NULL,
  QCYMIN int NULL,
  QCYMAX int NULL,
  QCYRAT float DEFAULT 1 NULL,
  QCYDMN int NULL,
  RTM smallint DEFAULT 1 NULL,
  ABC char(1) COLLATE DATABASE_DEFAULT NULL,
  QCYSZP int NULL,
  PMK char(1) COLLATE DATABASE_DEFAULT NULL,
  OBD char(1) COLLATE DATABASE_DEFAULT NULL,
  KMU char(1) COLLATE DATABASE_DEFAULT DEFAULT 'P' NULL,
  LTM datetime NULL,
  PRI smallint NULL,
  CMP char(1) COLLATE DATABASE_DEFAULT NULL,
  PlanType int NOT NULL,
  OJD datetime NULL,
  NAL datetime NULL,
  OBR datetime NULL,
  FOB float NULL,
  GOD int NULL,
  OMP char(1) COLLATE DATABASE_DEFAULT NULL,
  TIN char(1) COLLATE DATABASE_DEFAULT NULL,
  MET char(1) COLLATE DATABASE_DEFAULT NULL,
  EditDate datetime CONSTRAINT DF_OKP_PLN_EditDate DEFAULT getdate() NULL,
  NRP int DEFAULT 0 NOT NULL,
  VI int DEFAULT 0, 
  GRP_ID int NULL,
  QTYonNUM float DEFAULT 1 NOT NULL,
  CONSTRAINT PK_OKP_PLN PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Данные о планировании', N'schema', N'dbo', N'table', N'OKP_PLN'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', 'schema', 'dbo', 'table', 'OKP_PLN', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение номенклатуры', 'schema', 'dbo', 'table', 'OKP_PLN', 'column', 'PRT$$$NOM'
EXEC sp_addextendedproperty 'MS_Description', N'Ответственный исполнитель', 'schema', 'dbo', 'table', 'OKP_PLN', 'column', 'USERFIO'
EXEC sp_addextendedproperty 'MS_Description', N'Фиксированный размер партии', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'QCYFLX'
EXEC sp_addextendedproperty 'MS_Description', N'Минимальный размер партии', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'QCYMIN'
EXEC sp_addextendedproperty 'MS_Description', N'Максимальный размер партии', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'QCYMAX'
EXEC sp_addextendedproperty 'MS_Description', N'Кратность размера заказа', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'QCYRAT'
EXEC sp_addextendedproperty 'MS_Description', N'Среднедневной выпуск предмета', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'QCYDMN'
EXEC sp_addextendedproperty 'MS_Description', N'Ритм выпуска предмета в днях      =1', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'RTM'
EXEC sp_addextendedproperty 'MS_Description', N'Классификационный код', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'ABC'
EXEC sp_addextendedproperty 'MS_Description', N'Размер страхового запаса', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'QCYSZP'
EXEC sp_addextendedproperty 'MS_Description', N'Способ обеспечения', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'PMK'
EXEC sp_addextendedproperty 'MS_Description', N'Признак разметки потребностей: YN', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'OBD'
EXEC sp_addextendedproperty 'MS_Description', N'Метод планирования (Р-по потребностям, Z-по уровню запасов)', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'KMU'
EXEC sp_addextendedproperty 'MS_Description', N'Цикл обеспечения', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'LTM'
EXEC sp_addextendedproperty 'MS_Description', N'Приоритет предмета', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'PRI'
EXEC sp_addextendedproperty 'MS_Description', N'Oпределениe партии:  FPLG  ', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'CMP'
EXEC sp_addextendedproperty 'MS_Description', N'Тип планирования', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'Время ожидания до обработки (дни)', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'OJD'
EXEC sp_addextendedproperty 'MS_Description', N'Общее наладочное время', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'NAL'
EXEC sp_addextendedproperty 'MS_Description', N'Общее время обработки - технол.цикл', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'OBR'
EXEC sp_addextendedproperty 'MS_Description', N'Фактор приведения времени в дни', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'FOB'
EXEC sp_addextendedproperty 'MS_Description', N'Процент стат.годных предметов', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'GOD'
EXEC sp_addextendedproperty 'MS_Description', N'Организация материального потока', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'OMP'
EXEC sp_addextendedproperty 'MS_Description', N'Признак фондируемости:  YN', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'TIN'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Дата редактирования', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'EditDate'
EXEC sp_addextendedproperty 'MS_Description', N'Назначение размера партии (0-по расчету, 1-большее целое, 2-меньшее целое)', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'NRP'
EXEC sp_addextendedproperty N'MS_Description', 'Выпускаемое изделие','SCHEMA',N'dbo','TABLE',N'OKP_PLN','COLUMN',N'VI'
EXEC sp_addextendedproperty N'MS_Description', 'ID группы','SCHEMA',N'dbo','TABLE',N'OKP_PLN','COLUMN',N'GRP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Количество в номерной партии', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'QTYonNUM'
GO

--
-- Definition for table OKP_MNF : 
--

CREATE TABLE dbo.OKP_MNF (
  DEP varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  PRTIDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  TOZ tinyint NULL,
  OMP tinyint NULL,
  OPN tinyint NULL,
  UPR tinyint NULL,
  PAK tinyint NULL,
  RWC bigint IDENTITY(1, 1) NOT NULL,
  CONSTRAINT PK_OKP_MNF PRIMARY KEY CLUSTERED (RWC)
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Данные о производстве номенклатуры', N'schema', N'dbo', N'table', N'OKP_MNF'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор подразделения', N'schema', N'dbo', N'table', N'OKP_MNF', N'column', N'DEP'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор предмета', N'schema', N'dbo', N'table', N'OKP_MNF', N'column', N'PRTIDN'
EXEC sp_addextendedproperty 'MS_Description', N'Способ задания операции заказа', N'schema', N'dbo', N'table', N'OKP_MNF', N'column', N'TOZ'
EXEC sp_addextendedproperty 'MS_Description', N'Организация материального потока', N'schema', N'dbo', N'table', N'OKP_MNF', N'column', N'OMP'
EXEC sp_addextendedproperty 'MS_Description', N'Способ проверки укомплектованности', N'schema', N'dbo', N'table', N'OKP_MNF', N'column', N'OPN'
EXEC sp_addextendedproperty 'MS_Description', N'Группировка операции', N'schema', N'dbo', N'table', N'OKP_MNF', N'column', N'UPR'
EXEC sp_addextendedproperty 'MS_Description', N'Признак партионной комплектации (1=Парт, 2 = Непарт) ', N'schema', N'dbo', N'table', N'OKP_MNF', N'column', N'PAK'
GO

/* @NAME:  OKP_NOM
** @DESCR: Номенклатура
*/
CREATE TABLE OKP_NOM (
	PRT$$$IDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	NMP$$$NAM varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
	UOM$$$EIZ varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_NOM_UOM$$$EIZ DEFAULT '796' NOT NULL,
	PRC float CONSTRAINT DF_NOM_PRC DEFAULT 0 NOT NULL,
	TYP varchar(1) COLLATE DATABASE_DEFAULT NOT NULL,
	LLC varchar(1) COLLATE DATABASE_DEFAULT NULL,
	PermControl int CONSTRAINT df_okp_nom_PermControl DEFAULT 0 not null,
	PermPeriod float CONSTRAINT df_okp_nom_PermPeriod DEFAULT 0 not null,
	PRTFSTNOM varchar(50) COLLATE DATABASE_DEFAULT NULL,
	TDDOC varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_NOM_TDDOC DEFAULT '' NOT NULL,
	ROUTE varchar(300) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_NOM_ROUTE DEFAULT '' NOT NULL,
	DEP$$$DEP varchar(10) COLLATE DATABASE_DEFAULT NULL,
	SUMTSHK float CONSTRAINT df__okp_nom__sumtro DEFAULT 0 NULL,
	SUMMOV float CONSTRAINT DF_OKP_NOM_SUMMOV DEFAULT 0 NULL,
	RELWEIGHT float NULL,
	WRH_IDN varchar(10) COLLATE DATABASE_DEFAULT NULL,
	ConfirmDate datetime CONSTRAINT DF_OKP_NOM_ConfirmDate DEFAULT getdate() NULL,
	RWC int IDENTITY(1, 1) NOT NULL,
	SUMTPN float CONSTRAINT df__okp_nom__sumbom DEFAULT 0 NOT NULL,
	BYUSER varchar(50) COLLATE DATABASE_DEFAULT NULL,
	NDS float DEFAULT 0 NOT NULL,
	SUMBOM_TRO float CONSTRAINT df__okp_nom__sumbom_tro DEFAULT 0 NOT NULL,
	PRC_VO float NULL,
	PRC_st float NULL,
	EIZ_S varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_NOM_EIZ_S DEFAULT '796' NULL,
	GRP_ID int null,
	K float DEFAULT 1 NOT NULL,
	RV timestamp NOT NULL,
	COMMENT varchar(255) COLLATE DATABASE_DEFAULT NULL,
	CREATE_USER int NULL,
	CREATE_DATE datetime CONSTRAINT DF__OKP_NOM__CREATE_DATE DEFAULT getdate() NULL,
	CHANGE_USER int NULL,
	CHANGE_DATE datetime NULL,
	ESKIZ_ID int NULL,
	IS_VALID bit CONSTRAINT DF__OKP_NOM__IS_VALID DEFAULT 1 NOT NULL,
	tmz_type_id INT NULL,
	status INT CONSTRAINT df__okp_nom__status DEFAULT 0 NOT NULL,
	CONSTRAINT PK_OKP_NOM PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Номенклатура', N'schema', N'dbo', N'table', N'OKP_NOM'
EXEC sp_addextendedproperty 'MS_Description', N'ID предмета', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение предмета', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'PRT$$$IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование предмета', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'NMP$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ планирования', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'UOM$$$EIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Цена единицы предмета', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'PRC'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение типа предмета', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'TYP'
EXEC sp_addextendedproperty 'MS_Description', N'Код низшего уровня в структуре', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'LLC'
EXEC sp_addextendedproperty 'MS_Description', N'Допустимый остаточный период годности. Значение указано в сутках. Определяет за сколько до окончания срока годности предприятие может использовать материал в производстве своей продукции.', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'PermPeriod'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг контроля по сроку годности, может принимать два значения: 0 - НЕТ, 1 - ДА', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'PermControl'
EXEC sp_addextendedproperty 'MS_Description', N'Идентиф.изделия первого применения', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'PRTFSTNOM'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ТД', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'TDDOC'
EXEC sp_addextendedproperty 'MS_Description', N'Маршрут', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'ROUTE'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение подразделения-получателя', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'DEP$$$DEP'
EXEC sp_addextendedproperty 'MS_Description', N'Суммарная Тшк (час)', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'SUMTSHK'
EXEC sp_addextendedproperty 'MS_Description', N'Суммарное Тмо (час)', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'SUMMOV'
EXEC sp_addextendedproperty 'MS_Description', N'Удельный вес предмета', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'RELWEIGHT'
EXEC sp_addextendedproperty 'MS_Description', N'Основной склад хранения', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'WRH_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Дата подтверждения/утверждения', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'ConfirmDate'
EXEC sp_addextendedproperty 'MS_Description', N'Суммарная Тпн (час)', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'SUMTPN'
EXEC sp_addextendedproperty 'MS_Description', N'Кем подтверждено', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'BYUSER'
EXEC sp_addextendedproperty 'MS_Description', N'Размер НДС (в %)', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'NDS'
EXEC sp_addextendedproperty 'MS_Description', N'Не используется', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'SUMBOM_TRO'
EXEC sp_addextendedproperty 'MS_Description', N'Цена возвратного отхода материала', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'PRC_VO'
EXEC sp_addextendedproperty 'MS_Description', N'Цена единицы предмета на сторону', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'PRC_st'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ хранения', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'EIZ_S'
EXEC sp_addextendedproperty 'MS_Description', N'Коэффициент конвертации из ЕИЗ планирования в ЕИЗ хранения', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'K'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий к номенклатуре', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'COMMENT'
EXEC sp_addextendedproperty 'MS_Description', N'Кем создано', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'CREATE_USER'
EXEC sp_addextendedproperty 'MS_Description', N'Дата создания', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'CREATE_DATE'
EXEC sp_addextendedproperty 'MS_Description', N'Кем изменено', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'CHANGE_USER'
EXEC sp_addextendedproperty 'MS_Description', N'Дата изменения', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'CHANGE_DATE'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы номенклатуры', 'schema', 'dbo', 'table', 'OKP_NOM', 'column', 'GRP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID эскиза', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'ESKIZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Предмет действителен', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'IS_VALID'
EXEC sp_addextendedproperty 'MS_Description', N'ID вида ТМЗ', N'schema', N'dbo', N'table', N'okp_nom', N'column', N'tmz_type_id'
EXEC sp_addextendedproperty 'MS_Description', N'Код статуса', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'status'
GO

--
-- Definition for table OKP_ZPR : 
--

CREATE TABLE dbo.OKP_ZPR (
	PRTIDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	ZPR int NOT NULL,
	DEP varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	OBR FLOAT CONSTRAINT df__okp_zpr__obr DEFAULT 0 NOT NULL,
	VPP float CONSTRAINT df__okp_zpr__vpp DEFAULT 0 NOT NULL,
	PRK varchar(50) COLLATE DATABASE_DEFAULT NULL,
	QТY_RP float NULL,
	QТY_PN float NULL,
	QТY_ON float NULL,
	QТY_RK float NULL,
	SCR float NULL,
	QТY_BN float NULL,
	DTEOBN datetime CONSTRAINT DF_OKP_ZPR_DTEOBN DEFAULT getdate() NULL,
	QTY_NK float NULL,
	QTY_KK float NULL,
	PRP int NULL,
	RWC bigint IDENTITY(1, 1) NOT NULL,
	CONSTRAINT PK_OKP_ZPR PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Цехопереходы', N'schema', N'dbo', N'table', N'OKP_ZPR'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор предмета', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'PRTIDN'
EXEC sp_addextendedproperty 'MS_Description', N'Номер цеоперехода', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'ZPR'
EXEC sp_addextendedproperty 'MS_Description', N'Время обработки', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'OBR'
EXEC sp_addextendedproperty 'MS_Description', N'Время пребывания в подразделении', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'VPP'
EXEC sp_addextendedproperty 'MS_Description', N'Расход предмета с начала периода', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'QТY_RP'
EXEC sp_addextendedproperty 'MS_Description', N'Поступление с начала периода', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'QТY_PN'
EXEC sp_addextendedproperty 'MS_Description', N'Остаток в начале периода', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'QТY_ON'
EXEC sp_addextendedproperty 'MS_Description', N'Расход на момент корректировки', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'QТY_RK'
EXEC sp_addextendedproperty 'MS_Description', N'Процент нормативного брака', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'SCR'
EXEC sp_addextendedproperty 'MS_Description', N'Брак с начала периода', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'QТY_BN'
EXEC sp_addextendedproperty 'MS_Description', N'Дата обновления', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'DTEOBN'
EXEC sp_addextendedproperty 'MS_Description', N'Признак цехоперехода', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'PRP'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный автоинкрементный ключ', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'RWC'
GO

/* @NAME: okp_cost_item
** @DESCR: Статьи затрат, которые включаются в калькуляции по принципу ManyToMany
*/
CREATE TABLE okp_cost_item (
	id INT IDENTITY(1, 1) NOT NULL,
	idn INT NULL,
	name VARCHAR(60) COLLATE DATABASE_DEFAULT NOT NULL,
	typ INT NULL,
	grp_id INT NULL,
	descr VARCHAR(250) COLLATE DATABASE_DEFAULT NULL,
	formula VARCHAR(1000) COLLATE DATABASE_DEFAULT NULL,
	system BIT CONSTRAINT df__okp_cosint_item__system DEFAULT 0 NOT NULL,
	CONSTRAINT pk__okp_cost_item PRIMARY KEY CLUSTERED (id)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Статьи затрат', N'schema', N'dbo', N'table', N'okp_cost_item'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'okp_cost_item', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'Код', N'schema', N'dbo', N'table', N'okp_cost_item', N'column', N'idn'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'okp_cost_item', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'Тип', N'schema', N'dbo', N'table', N'okp_cost_item', N'column', N'Typ'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы', 'schema', 'dbo', 'table', 'okp_cost_item', 'column', 'grp_id'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', 'schema', 'dbo', 'table', 'okp_cost_item', 'column', 'descr'
EXEC sp_addextendedproperty 'MS_Description', N'Формула для расчётной статьи', 'schema', 'dbo', 'table', 'okp_cost_item', 'column', 'formula'
EXEC sp_addextendedproperty 'MS_Description', N'Системная', 'schema', 'dbo', 'table', 'okp_cost_item', 'column', 'system'
GO

/*
** Definition for table OKP_STK : 
*/
CREATE TABLE dbo.OKP_STK (
  STKIDN int NOT NULL,
  STKBAS int NOT NULL,
  STV varchar(2) COLLATE DATABASE_DEFAULT NULL,
  NRM float NULL,
  SNV float NULL,
  MET int NULL,
  AFlag int NULL,
  LNUM int NULL,
  RWC int IDENTITY(1, 1) NOT NULL,
  TZ int NULL,
  DEP_ID INT NULL,
  CONSTRAINT PK_OKP_STK PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Статьи калькуляции', N'schema', N'dbo', N'table', N'OKP_STK'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Код статьи калькуляции ', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'STKIDN'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Код базы распределения', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'STKBAS'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Статья калькуляции', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'STV'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Процент расчета', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'NRM'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Стоимость по постоянной статье', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'SNV'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'MET'
GO
EXEC sp_addextendedproperty 'MS_Description', N'0-внутр, 1-на сторону', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'AFlag'
GO
EXEC sp_addextendedproperty 'MS_Description', N'тип затрат', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'TZ'
GO
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'DEP_ID'
GO

--
-- Definition for table OKP_ZatBase : 
--

CREATE TABLE dbo.OKP_ZatBase (
  ZBaseCode int IDENTITY(1, 1) NOT NULL,
  ZBaseName varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  CONSTRAINT PK_OKP_ZatBase PRIMARY KEY CLUSTERED (ZBaseCode)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Базы распределения затрат', N'schema', N'dbo', N'table', N'OKP_ZatBase'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Код базы распределения затрат', N'schema', N'dbo', N'table', N'OKP_ZatBase', N'column', N'ZBaseCode'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Название базы распределения затрат', N'schema', N'dbo', N'table', N'OKP_ZatBase', N'column', N'ZBaseName'
GO

--
-- Definition for table OKP_ZatCodes : 
--

CREATE TABLE dbo.OKP_ZatCodes (
  ZatCode int NOT NULL,
  ZatName varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  CONSTRAINT PK_OKP_ZatCodes PRIMARY KEY CLUSTERED (ZatCode)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Статьи затрат', N'schema', N'dbo', N'table', N'OKP_ZatCodes'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Код статьи затрат', N'schema', N'dbo', N'table', N'OKP_ZatCodes', N'column', N'ZatCode'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Наименование статьи затрат', N'schema', N'dbo', N'table', N'OKP_ZatCodes', N'column', N'ZatName'
GO

/*
** Definition for table OKP_UBR : 
*/
CREATE TABLE dbo.OKP_UBR (
  NOS varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  N_Act int IDENTITY(1, 1) NOT NULL,
  DTE datetime CONSTRAINT DF_OKP_UBR_DTE DEFAULT getdate() NOT NULL,
  CPLNUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  DEPDOB varchar(10) COLLATE DATABASE_DEFAULT NULL,
  WCRWCT varchar(12) COLLATE DATABASE_DEFAULT NULL,
  ZPRZOB int NULL,
  NOPNOB varchar(50) COLLATE DATABASE_DEFAULT NULL,
  ZPRZOZ int NULL,
  NOPNOW varchar(50) COLLATE DATABASE_DEFAULT NULL,
  KBR char(10) COLLATE DATABASE_DEFAULT NULL,
  REJECT_ID int NOT NULL,
  VINDEP varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  PRCSVN float CONSTRAINT DF_OKP_UBR_PRCSVN DEFAULT 0 NULL,
  SEBSVO float CONSTRAINT DF_OKP_UBR_SEBSVO DEFAULT 0 NULL,
  SEBZMT float CONSTRAINT DF_OKP_UBR_SEBZMT DEFAULT 0 NULL,
  SEBZZT float CONSTRAINT DF_OKP_UBR_SEBZZT DEFAULT 0 NULL,
  QTYBQY float CONSTRAINT DF_OKP_UBR_QTYBQY DEFAULT 0 NOT NULL,
  RetDTE datetime NULL,
  ZATID int NULL,
  RETRIEVABLE tinyint DEFAULT 0 NOT NULL,
  NAMENOW varchar(50) COLLATE DATABASE_DEFAULT NULL,
  NAMENOB varchar(50) COLLATE DATABASE_DEFAULT NULL,
  SEBZMV float NULL,
  SEBZMK float NULL,
  SEBZZK float NULL,
  STS int NULL,
  Rwc_toz int NULL,
  rwc_cpl int NULL,
  TZ int NULL,
  Tab varchar(50) COLLATE DATABASE_DEFAULT NULL,
  FIO_K varchar(100) COLLATE DATABASE_DEFAULT NULL,
  SEBZI FLOAT(53) NULL,
  SEBZZT_v float(53) NULL,
  SEBZKOS float(53) NULL,
  eskiz_id INT NULL,
  REM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_OKP_UBR PRIMARY KEY CLUSTERED (N_Act)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Учет брака', N'schema', N'dbo', N'table', N'OKP_UBR'
EXEC sp_addextendedproperty 'MS_Description', N'Номер акта', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'NOS'
EXEC sp_addextendedproperty 'MS_Description', N'Дата составления акта о браке', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Номер наряда', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор подразделения-обнаружителя, nil -  внешний, например покупатель. ', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'DEPDOB'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор РЦ обнаружителя', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'WCRWCT'
EXEC sp_addextendedproperty 'MS_Description', N'Номер цехоперехода обнаружителя', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'ZPRZOB'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции обнаружителя', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'NOPNOB'
EXEC sp_addextendedproperty 'MS_Description', N'Номер цехоперехода возникновения', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'ZPRZOZ'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции возникновения', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'NOPNOW'
EXEC sp_addextendedproperty 'MS_Description', N'Код категории брака', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'KBR'
EXEC sp_addextendedproperty 'MS_Description', N'ID причины отклонения', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'REJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Код виновника брака', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'VINDEP'
EXEC sp_addextendedproperty 'MS_Description', N'Сумма, удержанная с виновника', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'PRCSVN'
EXEC sp_addextendedproperty 'MS_Description', N'Стоимость возмещения', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'SEBSVO'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты (основной материал)', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'SEBZMT'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты (зарплата)', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'SEBZZT'
EXEC sp_addextendedproperty 'MS_Description', N'Забракованное количество', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'QTYBQY'
EXEC sp_addextendedproperty 'MS_Description', N'Дата удержания суммы', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'RetDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Код производственных затрат', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'ZATID'
EXEC sp_addextendedproperty 'MS_Description', N'Вид брака 0-восстановимый, 1-невосстановимый', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'RETRIEVABLE'
EXEC sp_addextendedproperty 'MS_Description', N'наименование операции виновника', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'NAMENOW'
EXEC sp_addextendedproperty 'MS_Description', N'наименование операции обнаружителя', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'NAMENOB'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты на вспомогательный материал', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'SEBZMV'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты на материал по кооперации', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'SEBZMK'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты на услуги по кооперации', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'SEBZZK'
EXEC sp_addextendedproperty 'MS_Description', N'Код состояния операции: Пусто - активная запись, 3 - анулированная запись', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'Завязка на toz', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'Rwc_toz'
EXEC sp_addextendedproperty 'MS_Description', N'ссылка на cpl', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'rwc_cpl'
EXEC sp_addextendedproperty 'MS_Description', N'тип затрат', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'TZ'
EXEC sp_addextendedproperty 'MS_Description', N'Табельный	номер', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'Tab'
EXEC sp_addextendedproperty 'MS_Description', N'ФИО контролера', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'FIO_K'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты на инструменты', 'schema', 'dbo', 'table', 'OKP_UBR', 'column', 'SEBZI'
EXEC sp_addextendedproperty 'MS_Description', N'Трудовые затраты на операции виновника', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'SEBZZT_v'
EXEC sp_addextendedproperty 'MS_Description', N'Kосвенные затраты', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'SEBZKOS'
EXEC sp_addextendedproperty 'MS_Description', N'ID фото брака', N'schema', N'dbo', N'table', N'okp_ubr', N'column', N'eskiz_id'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'okp_ubr', N'column', N'REM'
GO

/*
** Definition for table OKP_UBRDEP : 
*/
CREATE TABLE OKP_UBRDEP (        
	id int identity(1,1), 
	N_Act int, 
	NUM varchar(50) COLLATE Database_default,											
	SEBZMT float, 
	SEBZMV float, 
	SEBZMK float, 
	SEBZI  float, 
	SEBZZT float,
	SEBZZK float,
	SEBSVO float,
	DEP_ID int,
        SEBZKOS float,
	CONSTRAINT PK_OKP_UBRDEP PRIMARY KEY CLUSTERED (id)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Учет брака по подразделениям', N'schema', N'dbo', N'table', N'OKP_UBRDEP'
EXEC sp_addextendedproperty 'MS_Description', N'счетчик', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'ссылка на номер акта', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'N_Act'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты (основной материал)', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'SEBZMT'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты на вспомогательный материал', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'SEBZMV'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты на материал по кооперации', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'SEBZMK'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты на инструменты', 'schema', 'dbo', 'table', 'OKP_UBRDEP', 'column', 'SEBZI'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты (зарплата)', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'SEBZZT'
EXEC sp_addextendedproperty 'MS_Description', N'Затраты на услуги по кооперации', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'SEBZZK'
EXEC sp_addextendedproperty 'MS_Description', N'Стоимость возмещения', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'SEBSVO'
EXEC sp_addextendedproperty 'MS_Description', N'ссылка на подразделение', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'DEP_Id'
EXEC sp_addextendedproperty 'MS_Description', N'Косвенные затраты', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'SEBZKOS'
GO

--
-- Definition for table OKP_WRH_DEP : 
--

CREATE TABLE dbo.OKP_WRH_DEP (
  ID int IDENTITY(1, 1) NOT NULL,
  WRH_ID int NOT NULL,
  DEP_ID int NOT NULL,
  CONSTRAINT PK_WRH_DEP PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица связей подразделений со складами', N'schema', N'dbo', N'table', N'OKP_WRH_DEP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ключ', N'schema', N'dbo', N'table', N'OKP_WRH_DEP', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на склад OKP_WRH.WRH_ID', N'schema', N'dbo', N'table', N'OKP_WRH_DEP', N'column', N'WRH_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на подразделение (OKP_DEP.RWC)', N'schema', N'dbo', N'table', N'OKP_WRH_DEP', N'column', N'DEP_ID'
GO

--
-- Definition for table OKP_RAM : 
--

CREATE TABLE dbo.OKP_RAM (
  DEP varchar(10) COLLATE DATABASE_DEFAULT NULL,
  PRTIDN varchar(50) COLLATE DATABASE_DEFAULT NULL,
  CPLNUM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  QTY float NULL,
  DTE datetime CONSTRAINT DF_OKP_RAM_DTE DEFAULT getdate() NULL,
  CPZ varchar(50) COLLATE DATABASE_DEFAULT NULL,
  QTYRQY float NULL,
  QTYINR float NULL,
  PRO varchar(50) COLLATE DATABASE_DEFAULT NULL,
  VIN varchar(50) COLLATE DATABASE_DEFAULT NULL,
  QTYPOL float NULL,
  MET int NULL,
  RWC bigint IDENTITY(1, 1) NOT NULL,
  NOS int NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'РАСХОД КОМПОНЕНТ НА ПРОИЗВОДСТВО', N'schema', N'dbo', N'table', N'OKP_RAM'
EXEC sp_addextendedproperty 'MS_Description', N'Подразделение-изготовитель', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'DEP'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор компонента', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'PRTIDN'
EXEC sp_addextendedproperty 'MS_Description', N'Номеp наряда', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Сданное количество', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Дата pасхода', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Код пpоизводственных затpат', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'CPZ'
EXEC sp_addextendedproperty 'MS_Description', N'Расчетная пpименяемость компонента', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'QTYRQY'
EXEC sp_addextendedproperty 'MS_Description', N'Измененая пpименяемость компонента', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'QTYINR'
EXEC sp_addextendedproperty 'MS_Description', N'Код пpичины отклонения', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'PRO'
EXEC sp_addextendedproperty 'MS_Description', N'Код виновника отклонения', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'VIN'
EXEC sp_addextendedproperty 'MS_Description', N'Получено компонент на заказ', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'QTYPOL'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'НОМЕР СООБЩЕНИЯ (связь с OKP_UOP)', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'NOS'
GO

/*
** Definition for table OKP_Order : 
*/
CREATE TABLE dbo.OKP_Order (
	Order_Count int NULL,
	Met tinyint NULL,
	dte datetime NULL,
	prt$$$nom varchar(50) COLLATE DATABASE_DEFAULT NULL,
	nmp$$$nam varchar(100) COLLATE DATABASE_DEFAULT NULL,
	rzo varchar(3) COLLATE DATABASE_DEFAULT NULL,
	Nop int NULL,
	tro float NULL,
	gradrate float NULL,
	qtygqy float NULL,
	Tottime float NULL,
	TotSum float NULL,
	num varchar(50) COLLATE DATABASE_DEFAULT NULL,
	RWC int IDENTITY(1, 1) NOT NULL,
	Nos int NULL,
	DEP_ID int NOT NULL,
	CONSTRAINT PK_OKP_Order PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Наряды на оплату (элементы)', N'schema', N'dbo', N'table', N'OKP_Order'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Номер наряда на оплату (итоги)', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'Order_Count'
EXEC sp_addextendedproperty 'MS_Description', N'Дата', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение номенклатуры', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'PRT$$$NOM'
EXEC sp_addextendedproperty 'MS_Description', N'Разряд операции', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'Тзп', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'Тарифная ставка, н/ч', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'GRADRATE'
EXEC sp_addextendedproperty 'MS_Description', N'Количество', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'QTYGQY'
EXEC sp_addextendedproperty 'MS_Description', N'Выработка, н/ч', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'TOTTIME'
EXEC sp_addextendedproperty 'MS_Description', N'Сумма, руб.', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'TOTSUM'
EXEC sp_addextendedproperty 'MS_Description', N'ID учёта операции', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'NOS'
EXEC sp_addextendedproperty 'MS_Description', N'Номер партии', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения', N'schema', N'dbo', N'table', N'OKP_ORDER', N'column', N'DEP_ID'
GO

--
-- Definition for table OKP_NZP : 
--

CREATE TABLE dbo.OKP_NZP (
  DEP varchar(10) COLLATE DATABASE_DEFAULT NULL,
  TYP varchar(2) COLLATE DATABASE_DEFAULT NULL,
  ZPR int NOT NULL,
  CPLNUM varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  CQY float NULL,
  VID char(10) COLLATE DATABASE_DEFAULT NULL,
  SEB char(10) COLLATE DATABASE_DEFAULT NULL,
  CPZ char(10) COLLATE DATABASE_DEFAULT NULL,
  VQY float NULL,
  DTE datetime DEFAULT getdate() NOT NULL,
  CONSTRAINT PK_OKP_NZP PRIMARY KEY CLUSTERED (CPLNUM, ZPR)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'НЕЗАВЕРШЕННОЕ ПРОИЗВОДСТВО', N'schema', N'dbo', N'table', N'OKP_NZP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор подразделения', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'DEP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Тип записи 11122122', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'TYP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Порядковый номер цехоперехода', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'ZPR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Номер партии', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'CPLNUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Размер заказа', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'CQY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Вид затрат 1-14', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'VID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Величина затрат', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'SEB'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Код производственных затрат', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'CPZ'
GO

EXEC sp_addextendedproperty 'MS_Description', N'величина заказа', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'VQY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'дата составления документа', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'DTE'
GO

/*
** Definition for table OKP_OrderSum : 
*/
CREATE TABLE dbo.OKP_OrderSum (
	Order_Count int IDENTITY(1, 1) NOT NULL,
	Date_form datetime NULL,
	Date_begin datetime NULL,
	Date_end datetime NULL,
	TotSum float NULL,
	Order_S varchar(15) COLLATE DATABASE_DEFAULT NULL,
	UserId int NULL,
	fio_id INT NOT NULL,
	CONSTRAINT PK_OKP_OrderSum PRIMARY KEY CLUSTERED (Order_Count)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Наряды на оплату (итоги)', N'schema', N'dbo', N'table', N'OKP_OrderSum'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'OKP_OrderSum', N'column', N'Order_Count'
EXEC sp_addextendedproperty 'MS_Description', N'Дата формирования', N'schema', N'dbo', N'table', N'OKP_OrderSum', N'column', N'Date_form'
EXEC sp_addextendedproperty 'MS_Description', N'Дата начала периода', N'schema', N'dbo', N'table', N'OKP_OrderSum', N'column', N'Date_begin'
EXEC sp_addextendedproperty 'MS_Description', N'Дата окончания периода', N'schema', N'dbo', N'table', N'OKP_OrderSum', N'column', N'Date_end'
EXEC sp_addextendedproperty 'MS_Description', N'Сумма наряда', N'schema', N'dbo', N'table', N'OKP_OrderSum', N'column', N'TotSum'
EXEC sp_addextendedproperty 'MS_Description', N'Номер наряда', N'schema', N'dbo', N'table', N'OKP_OrderSum', N'column', N'Order_S'
EXEC sp_addextendedproperty 'MS_Description', N'ID пользователя', N'schema', N'dbo', N'table', N'OKP_OrderSum', N'column', N'UserId'
EXEC sp_addextendedproperty 'MS_Description', N'ID сотрудника', N'schema', N'dbo', N'table', N'OKP_OrderSum', N'column', N'fio_id'
GO

/*
** Сотрудники предприятия
*/
CREATE TABLE dbo.OKP_FIO (
	TBLIDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	NMFNAM varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
	PRFIDN varchar(5) COLLATE DATABASE_DEFAULT NOT NULL,
	RZO varchar(3) COLLATE DATABASE_DEFAULT NOT NULL,
	RWC int IDENTITY(1, 1) NOT NULL,
	Dis_Date datetime NULL,
	ID_PHOTO int NULL,
	DTE_HIRING datetime NULL,
	ID_DOC_HIRING bigint NULL,
	ID_DOC_DIS bigint NULL,
	INN varchar(12) COLLATE DATABASE_DEFAULT NULL,
	DTE_ISSUED datetime NULL,
	PASS_ISSUED varchar(250) COLLATE DATABASE_DEFAULT NULL,
	PASS_NUM varchar(6) COLLATE DATABASE_DEFAULT NULL,
	PASS_SERIES varchar(4) COLLATE DATABASE_DEFAULT NULL,
	REG_ADDRESS varchar(250) COLLATE DATABASE_DEFAULT NULL,
	PLACE_OF_BURN varchar(250) COLLATE DATABASE_DEFAULT NULL,
	DTE_BURN datetime NULL,
	PASS varchar(4) COLLATE DATABASE_DEFAULT NULL,
	WORK_BY_SDT INT CONSTRAINT df__okp_fio__work_by_sdt DEFAULT 0 NULL,
	TRUSTED INT CONSTRAINT df__okp_fio__trusted DEFAULT 0 NULL,
	DEP_ID INT NOT NULL,
	PASS_KP varchar(7) COLLATE DATABASE_DEFAULT NULL,
    AUTOGIVE INT CONSTRAINT df__okp_fio__autogive DEFAULT 0 NULL,
	self_control INT CONSTRAINT df__okp_fio__self_control DEFAULT 0 NULL,
	CONSTRAINT PK_OKP_FIO PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Персонал', N'schema', N'dbo', N'table', N'OKP_FIO'
EXEC sp_addextendedproperty 'MS_Description', N'Табельный номер', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'TBLIDN'
EXEC sp_addextendedproperty 'MS_Description', N'ФИО сотрудника', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'NMFNAM'
EXEC sp_addextendedproperty 'MS_Description', N'Код профессии', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'PRFIDN'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Разряд', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Дата увольнения', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'Dis_Date'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на фотографию в OKP_FILES', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'ID_PHOTO'
EXEC sp_addextendedproperty 'MS_Description', N'Дата трудоустройства', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'DTE_HIRING'
EXEC sp_addextendedproperty 'MS_Description', N'Приказ о трудоустройстве (Ссылка на OKP_DOC.ID)', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'ID_DOC_HIRING'
EXEC sp_addextendedproperty 'MS_Description', N'Приказ об увольнении (Ссылка на OKP_DOC.ID)', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'ID_DOC_DIS'
EXEC sp_addextendedproperty 'MS_Description', N'ИНН', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'INN'
EXEC sp_addextendedproperty 'MS_Description', N'Дата выдачи паспорта', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'DTE_ISSUED'
EXEC sp_addextendedproperty 'MS_Description', N'Паспорт выдан', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'PASS_ISSUED'
EXEC sp_addextendedproperty 'MS_Description', N'Номер паспорта', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'PASS_NUM'
EXEC sp_addextendedproperty 'MS_Description', N'Серия паспорта', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'PASS_SERIES'
EXEC sp_addextendedproperty 'MS_Description', N'Код подразделения, выдавшего паспорт', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'PASS_KP'
EXEC sp_addextendedproperty 'MS_Description', N'Адрес прописки', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'REG_ADDRESS'
EXEC sp_addextendedproperty 'MS_Description', N'Место рождения', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'PLACE_OF_BURN'
EXEC sp_addextendedproperty 'MS_Description', N'Дата рождения', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'DTE_BURN'
EXEC sp_addextendedproperty 'MS_Description', N'Пароль', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'PASS'
EXEC sp_addextendedproperty 'MS_Description', N'0 - работа по очереди, 1 - по сменно-суточному заданию', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'WORK_BY_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор (OKP_FIO.RWC) доверенного лица имеющего право закрывать работу ', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'TRUSTED'
EXEC sp_addextendedproperty 'MS_Description', N'Разрешение на учет операций на терминалах с правами автовыдачи со склада', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'AUTOGIVE'
EXEC sp_addextendedproperty 'MS_Description', N'Разрешение на учёт без ОТК (самоконтроль)', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'self_control'
GO

/*
** Definition for table OKP_DEP : 
*/
CREATE TABLE dbo.OKP_DEP (
	DEP varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	NMDNAM varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
	PER varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_DEP_PER DEFAULT 'M' NOT NULL,
	PRODTYPE int CONSTRAINT DF_OKP_DEP_PRODTYPE DEFAULT 0 NOT NULL,
	MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
	RWC int IDENTITY(1, 1) NOT NULL,
	DESCRIBE varchar(200) COLLATE DATABASE_DEFAULT NULL,
	GRP_ID int NULL,
	CONSTRAINT PK_OKP_DEP PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Подразделения', N'schema', N'dbo', N'table', N'OKP_DEP'
EXEC sp_addextendedproperty 'MS_Description', N'ID', N'schema', N'dbo', N'table', N'OKP_DEP', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение подразделения', N'schema', N'dbo', N'table', N'OKP_DEP', N'column', N'DEP'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование подразделения', N'schema', N'dbo', N'table', N'OKP_DEP', N'column', N'NMDNAM'
EXEC sp_addextendedproperty 'MS_Description', N'Период планирования', N'schema', N'dbo', N'table', N'OKP_DEP', N'column', N'PER'
EXEC sp_addextendedproperty 'MS_Description', N'Тип производства', N'schema', N'dbo', N'table', N'OKP_DEP', N'column', N'PRODTYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'OKP_DEP', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Описание', N'schema', N'dbo', N'table', N'OKP_DEP', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы', N'schema', N'dbo', N'table', N'OKP_DEP', N'column', N'GRP_ID'
GO

/* @NAME:  OKP_PRF_DEP
** @DESCR: Профессии в подразделениях
*/
CREATE TABLE OKP_PRF_DEP (
	ID int NOT NULL identity(1,1),
	DEP_ID int NOT NULL,
	PRF_ID int NOT NULL,
	CONSTRAINT PK_OKP_PRF_DEP PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Профессии в подразделениях', N'schema', N'dbo', N'table', N'OKP_PRF_DEP'
EXEC sp_addextendedproperty 'MS_Description', N'ID связи', 'schema', 'dbo', 'table', 'OKP_PRF_DEP', 'column', 'ID';
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения', 'schema', 'dbo', 'table', 'OKP_PRF_DEP', 'column', 'DEP_ID';
EXEC sp_addextendedproperty 'MS_Description', N'ID профессии', 'schema', 'dbo', 'table', 'OKP_PRF_DEP', 'column', 'PRF_ID';
GO

/*
** Definition for table OKP_BOM : 
*/
CREATE TABLE dbo.OKP_BOM (
	ID int IDENTITY(1,1) NOT NULL,
	PRTPARNOM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	PRTCHLNOM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	QTY_PC float CONSTRAINT DF_BOM_QTY_PC DEFAULT 1 NOT NULL,
	UOMCHLEIZ varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_BOM_UOMCHLEIZ DEFAULT '796' NOT NULL,
	KSP float CONSTRAINT DF_BOM_KSP DEFAULT 1 NOT NULL,
	PRTALTNOM varchar(50) COLLATE DATABASE_DEFAULT NULL,
	QTYFAC float CONSTRAINT DF_BOM_QTYFAC DEFAULT 1 NOT NULL,
	RAZ varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_BOM_RAZ DEFAULT 'D' NOT NULL,
	DEP$$$IDN varchar(10) COLLATE DATABASE_DEFAULT NULL,
	COMMENT varchar(250) COLLATE DATABASE_DEFAULT,
	form VARCHAR(2) COLLATE DATABASE_DEFAULT NULL,
	area VARCHAR(2) COLLATE DATABASE_DEFAULT NULL,
	position INT NULL,
	CONSTRAINT PK_OKP_BOM PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Состав изделия', N'schema', N'dbo', N'table', N'OKP_BOM'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение предмета составляющего', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'PRTPARNOM'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение предмета компонента', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'PRTCHLNOM'
EXEC sp_addextendedproperty 'MS_Description', N'Применяемость компонента', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'QTY_PC'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ЕИЗ компонента', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'UOMCHLEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Коэффициент перевода', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'KSP'
EXEC sp_addextendedproperty 'MS_Description', N'Альтернативный компонент', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'PRTALTNOM'
EXEC sp_addextendedproperty 'MS_Description', N'Коэффициент перевода применяемости', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'QTYFAC'
EXEC sp_addextendedproperty 'MS_Description', N'Тип компонента (Раздел спецификации)', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'RAZ'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение подразделения-исполнителя', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'DEP$$$IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Примечание', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'COMMENT'
EXEC sp_addextendedproperty 'MS_Description', N'Формат', N'schema', N'dbo', N'table', N'okp_bom', N'column', N'form'
EXEC sp_addextendedproperty 'MS_Description', N'Зона', N'schema', N'dbo', N'table', N'okp_bom', N'column', N'area'
EXEC sp_addextendedproperty 'MS_Description', N'Позиция', N'schema', N'dbo', N'table', N'okp_bom', N'column', N'position'
GO

--
-- Definition for table OKP_BufLog : 
--

CREATE TABLE dbo.OKP_BufLog (
  LOGDateTime datetime NULL,
  UserID int NULL,
  UserName varchar(50) COLLATE DATABASE_DEFAULT NULL,
  CompName varchar(50) COLLATE DATABASE_DEFAULT NULL,
  Modul varchar(100) COLLATE DATABASE_DEFAULT NULL,
  TblName varchar(50) COLLATE DATABASE_DEFAULT NULL,
  Act varchar(10) COLLATE DATABASE_DEFAULT NULL,
  Mess varchar(2000) COLLATE DATABASE_DEFAULT NULL,
  Params varchar(4000) COLLATE DATABASE_DEFAULT NULL
)
GO


EXEC sp_addextendedproperty 'MS_Description', N'Архив журнала событий в системе', N'schema', N'dbo', N'table', N'OKP_BufLog'
EXEC sp_addextendedproperty 'MS_Description', N'Дата и время внесения записи в журнал', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'LOGDateTime'
EXEC sp_addextendedproperty 'MS_Description', N'SQL-идентификатор пользователя', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'UserID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор пользователя', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'UserName'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор компьютера', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'CompName'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение модуля: T - технолог A - админ P - плановик D - диспетчер R - отчет S - склад M - руководитель E - Экономист C - UpdateStatuses (утилита на сервере) B - RecalcBalans (утилита на сервере) ', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'Modul'
EXEC sp_addextendedproperty 'MS_Description', N'Имя таблицы', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'TblName'
EXEC sp_addextendedproperty 'MS_Description', N'Протоколируемое действие: Update - обновление указанной таблицы Delete - удаление из указанной таблицы Insert - вставка в указанную таблицу ', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'Act'
EXEC sp_addextendedproperty 'MS_Description', N'Описание протоколируемого действия', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'Mess'
EXEC sp_addextendedproperty 'MS_Description', N'Параметры протоколируемого действия (имена и значения колонок, идентификаторов записей)', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'Params'
GO

--
-- Definition for table OKP_CFREE : 
--

CREATE TABLE dbo.OKP_CFREE (
  FREEDATE datetime NOT NULL,
  MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_OKP_CFREE PRIMARY KEY CLUSTERED (FREEDATE)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Список праздничных дней', N'schema', N'dbo', N'table', N'OKP_CFREE'
EXEC sp_addextendedproperty 'MS_Description', N'Праздничный день', N'schema', N'dbo', N'table', N'OKP_CFREE', N'column', N'FREEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'OKP_CFREE', N'column', N'MET'
GO

--
-- Definition for table OKP_CGM : 
--

CREATE TABLE dbo.OKP_CGM (
  ID bigint IDENTITY(1, 1) NOT NULL,
  NOM_ID bigint NOT NULL,
  IDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  QTYMin float NOT NULL,
  QTYMax float NOT NULL,
  STATE int NOT NULL,
  Describe varchar(200) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_CGM PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица циклограмм', N'schema', N'dbo', N'table', N'OKP_CGM'
EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'OKP_CGM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на номенклатуру (OKP_NOM.RWC)', N'schema', N'dbo', N'table', N'OKP_CGM', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор циклограммы', N'schema', N'dbo', N'table', N'OKP_CGM', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Нижняя граница количества применения циклограммы', N'schema', N'dbo', N'table', N'OKP_CGM', N'column', N'QTYMin'
EXEC sp_addextendedproperty 'MS_Description', N'Верхняя граница количества применения циклограммы', N'schema', N'dbo', N'table', N'OKP_CGM', N'column', N'QTYMax'
EXEC sp_addextendedproperty 'MS_Description', N'Состояние циклограммы   0 - не расчитана   1 - расчитана ', N'schema', N'dbo', N'table', N'OKP_CGM', N'column', N'STATE'
EXEC sp_addextendedproperty 'MS_Description', N'Описание циклограммы (например, назначение)', N'schema', N'dbo', N'table', N'OKP_CGM', N'column', N'Describe'
GO

--
-- Definition for table OKP_CGMData : 
--

CREATE TABLE dbo.OKP_CGMData (
  ID bigint IDENTITY(1, 1) NOT NULL,
  IDP bigint NULL,
  CGM_ID bigint NOT NULL,
  NOM_ID bigint NOT NULL,
  NOM_IDX varchar(211) COLLATE DATABASE_DEFAULT NULL,
  SHIFT int NOT NULL,
  DB bigint NOT NULL,
  DE bigint NOT NULL,
  ROUTE_ID int NULL,
  QTY_PC float NULL,
  QTY_PCO float NULL,
  PlanType bit NULL,
  PartySize float NULL,
  USER_ID int NOT NULL,
  DEC bigint NOT NULL,
  CONSTRAINT PK_CGMData PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица состава циклограмм', N'schema', N'dbo', N'table', N'OKP_CGMData'
EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на "родительскую" запись (OKP_CGMData.ID)', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'IDP'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на заголовок циклограммы', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'CGM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на номенклатуру (OKP_NOM.RWC)', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'"путь" верхнего родителя', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'NOM_IDX'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг состояния: 0 - запись входит в состав циклограммы1 - запись исключена из состава и переведена в потребность2 - запись исключена из состава и переведена в дубль3 - запись исключена из состава', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'SHIFT'
EXEC sp_addextendedproperty 'MS_Description', N'Начало изготовления номенклатуры NOM_ID', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'DB'
EXEC sp_addextendedproperty 'MS_Description', N'Окончание изготовления номенклатуры NOM_ID', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'DE'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор маршрута (OKP_ROUTES.ID)', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'ROUTE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Количество на единицу "родителя" текущее', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'QTY_PC'
EXEC sp_addextendedproperty 'MS_Description', N'Количество на единицу "родителя" базовое', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'QTY_PCO'
EXEC sp_addextendedproperty 'MS_Description', N'Тип планирования', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'Размер передаточной партии', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'PartySize'
EXEC sp_addextendedproperty 'MS_Description', N'Пользователь, создавший/изменивший запись (OKP_USERS.USER_ID)', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Расчётная дата окончания', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'DEC'
GO

--
-- Definition for table OKP_CGMSteps : 
--

CREATE TABLE dbo.OKP_CGMSteps (
  ID bigint IDENTITY(1, 1) NOT NULL,
  CGM_ID bigint NOT NULL,
  DB bigint NOT NULL,
  DE bigint NOT NULL,
  CONSTRAINT PK_CGMSteps PRIMARY KEY CLUSTERED (ID)
)
GO

--
-- Definition for table OKP_CONTACT : 
--

CREATE TABLE dbo.OKP_CONTACT (
  ID bigint IDENTITY(1, 1) NOT NULL,
  PERSON_ID bigint NOT NULL,
  NAME varchar(200) COLLATE DATABASE_DEFAULT NOT NULL,
  TYP int NOT NULL,
  VALUE varchar(1000) COLLATE DATABASE_DEFAULT NULL,
  IsBase int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_CONTACT PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица контактов контактных лиц', N'schema', N'dbo', N'table', N'OKP_CONTACT'
EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'OKP_CONTACT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на контактное лицо (OKP_PERSON.ID)', N'schema', N'dbo', N'table', N'OKP_CONTACT', N'column', N'PERSON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование контакта. Например, "мобильный телефон", "рабочий телефон", "рабочая почта", "личная почта" и т .д.', N'schema', N'dbo', N'table', N'OKP_CONTACT', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Тип контакта:  1 - телефон,  2 - адрес,  3 - E-mail', N'schema', N'dbo', N'table', N'OKP_CONTACT', N'column', N'TYP'
EXEC sp_addextendedproperty 'MS_Description', N'Представление (значение) контакта. Например, телефонный номер и т.п.', N'schema', N'dbo', N'table', N'OKP_CONTACT', N'column', N'VALUE'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг: 1 - основной контакт, 0 - дополнительный', N'schema', N'dbo', N'table', N'OKP_CONTACT', N'column', N'IsBase'
GO

/*
** @DESCR: Договора
** @Comm:  1. Поле CTR_CONTRACT_ID возникло вследствие удаления таблицы OKP_CTR_CONTRACT, чтобы сохранить работу API
**            Поле имеет значение, если была соответствующая связь между CTR и CONTRACT на момент удаления OKP_CTR_CONTRACT
**            Именно это значение и возвращается в API. Для новых записей в OKP_CONTRACT возвращаться будет ID.
**            Таким образом, можно однозначно утверждать, что работа API не изменится
*/
CREATE TABLE dbo.OKP_CONTRACT (
	ID bigint IDENTITY(1, 1) NOT NULL,
	USER_ID int NOT NULL,
	GRP_ID int NULL,
	IDN varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(100) COLLATE DATABASE_DEFAULT NULL,
	TPD int NOT NULL,
	OPL int NOT NULL,
	DTE_CT datetime NOT NULL,
	DTE_FN datetime NULL,
	DTE_CR datetime DEFAULT getdate() NOT NULL,
	DESCRIBE varchar(2000) COLLATE DATABASE_DEFAULT NULL,
	IsBase bit DEFAULT 0 NOT NULL,
	CTR_ID int,
	CTR_CONTRACT_ID int NULL,
	CURRENCY_ID int NULL,
	CONSTRAINT PK_CONTRACT PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Договора', N'schema', N'dbo', N'table', N'OKP_CONTRACT'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ответственного исполнителя', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'GRP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Тип', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'TPD'
EXEC sp_addextendedproperty 'MS_Description', N'Вид оплаты', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'OPL'
EXEC sp_addextendedproperty 'MS_Description', N'Дата договора', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'DTE_CT'
EXEC sp_addextendedproperty 'MS_Description', N'Конечная дата договора', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'DTE_FN'
EXEC sp_addextendedproperty 'MS_Description', N'Дата создания записи', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'DTE_CR'
EXEC sp_addextendedproperty 'MS_Description', N'Текст пояснения к договору', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'Договор основной', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'IsBase'
EXEC sp_addextendedproperty 'MS_Description', N'ID контрагента', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'CTR_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID связи контрагента и договора', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'CTR_CONTRACT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатр валюты', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'CURRENCY_ID'
GO

--
-- Definition for table OKP_CONTRACT_FILES : 
--

CREATE TABLE dbo.OKP_CONTRACT_FILES (
  ID bigint IDENTITY(1, 1) NOT NULL,
  CONTRACT_ID bigint NOT NULL,
  FILE_ID bigint NOT NULL,
  CONSTRAINT PK_CONTRACT_FILES PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылки договоров на файлы', N'schema', N'dbo', N'table', N'OKP_CONTRACT_FILES'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID файла (OKP_FILES.ID)', N'schema', N'dbo', N'table', N'OKP_CONTRACT_FILES', N'column', N'FILE_ID'
GO

--
-- Definition for table OKP_CPLEXTRACTED : 
--

CREATE TABLE dbo.OKP_CPLEXTRACTED (
  ID bigint IDENTITY(1, 1) NOT NULL,
  CPL_ID int NOT NULL,
  CPLPARENT_ID int NOT NULL,
  PPP_ID int NOT NULL,
  PPPParent_ID int NOT NULL,
  NUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  NUMPARENT varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  PPPNUMParent varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  EXTR_DATE datetime DEFAULT getdate() NOT NULL,
  EXTR_BY varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  POT_ID bigint Null,
  PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица истории выделения ПрП в отдельные ПП', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор записи', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор выделенной ПрП', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'CPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор ПрП откуда проведено выделение', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'CPLPARENT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор новой ПП', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'PPP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор ПП откуда произведено выделение', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'PPPParent_ID'
EXEC sp_addextendedproperty 'MS_Description', N'номер выделенной ПрП', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'номер ПрП откуда проведено выделение', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'NUMPARENT'
EXEC sp_addextendedproperty 'MS_Description', N'Номер новой ПП', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'номер ПП откуда проведено выделение', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'PPPNUMParent'
EXEC sp_addextendedproperty 'MS_Description', N'Когда выделено', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'EXTR_DATE'
EXEC sp_addextendedproperty 'MS_Description', N'Кем проведено выделение', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'EXTR_BY'
EXEC sp_addextendedproperty 'MS_Description', N'Указатель на связанный OKP_POT.RWC', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'POT_ID'
GO

--
-- Definition for table OKP_CPLLOG : 
--

CREATE TABLE dbo.OKP_CPLLOG (
  ID bigint IDENTITY(1, 1) NOT NULL,
  CPL_ID int NOT NULL,
  PPP_ID int NOT NULL,
  CHANGEDATE datetime DEFAULT getdate() NOT NULL,
  NUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  UserName varchar(50) COLLATE DATABASE_DEFAULT NULL,
  Comment varchar(200) COLLATE DATABASE_DEFAULT NULL,
  HostName nchar(256) COLLATE DATABASE_DEFAULT NULL,
  MODUL varchar(1) COLLATE DATABASE_DEFAULT NULL,
  PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Журнал событий ПрП', N'schema', N'dbo', N'table', N'OKP_CPLLOG'
EXEC sp_addextendedproperty 'MS_Description', N'RWC ПрП', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'CPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'RWC ПП', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'PPP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата изменения', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'CHANGEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'IDN ПрП', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'IDN ПП', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Имя пользователя', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'UserName'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'Comment'
EXEC sp_addextendedproperty 'MS_Description', N'Имя компьютера', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'HostName'
EXEC sp_addextendedproperty 'MS_Description', N'Модуль', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'MODUL'
GO

/* @NAME:  OKP_CTR
** @DESCR: Контрагенты
*/
CREATE TABLE dbo.OKP_CTR (
	ID int IDENTITY(1, 1) NOT NULL,
	IDN varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	NAM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	DESCRIBE varchar(255) COLLATE DATABASE_DEFAULT NULL,
	KIND tinyint NOT NULL,
	GRP_ID int NULL,
	ADDR varchar(100) COLLATE DATABASE_DEFAULT NULL,
	PHONE varchar(20) COLLATE DATABASE_DEFAULT NULL,
	MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
	INN varchar(12) COLLATE DATABASE_DEFAULT NULL,
	KPP varchar(10) COLLATE DATABASE_DEFAULT NULL,
	OKPO varchar(12) COLLATE DATABASE_DEFAULT NULL,
	RS varchar(20) COLLATE DATABASE_DEFAULT NULL,
	BASEContract_ID bigint NULL,
	DTE datetime DEFAULT getdate() NOT NULL,
	OWNER_ID int NULL,
	IsConsignee bit CONSTRAINT DF_OKP_ISCONSIGNEE DEFAULT 0 NOT NULL,
	OGRN varchar(30) COLLATE DATABASE_DEFAULT NULL,
	CONSTRAINT PK_OKP_CTR PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Контрагенты', N'schema', N'dbo', N'table', N'OKP_CTR'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'NAM'
EXEC sp_addextendedproperty 'MS_Description', N'Описание', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'Вид (0 - не определено, 1 - юридическое лицо, 2 - физическое лицо)', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'KIND'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'GRP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Адрес', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'ADDR'
EXEC sp_addextendedproperty 'MS_Description', N'Телефон', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'PHONE'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния) бит 0 - блокирование', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Дата и время регистрации', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'ID ответственного исполнителя', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'OWNER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Признак грузополучателя', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'IsConsignee'
EXEC sp_addextendedproperty 'MS_Description', N'ОГРН', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'OGRN'
GO

--
-- Definition for table OKP_CWORK : 
--

CREATE TABLE dbo.OKP_CWORK (
  WORKDATE datetime NOT NULL,
  MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_OKP_CWORK PRIMARY KEY CLUSTERED (WORKDATE)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Список дней, приходящихся на субботу или воскресенье, но объявленных рабочими', N'schema', N'dbo', N'table', N'OKP_CWORK'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Рабочий день, приходящийся на суб/вос', N'schema', N'dbo', N'table', N'OKP_CWORK', N'column', N'WORKDATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'OKP_CWORK', N'column', N'MET'
GO

/*
** OKP_DataExport
*/
CREATE TABLE dbo.OKP_DataExport (
	UID uniqueidentifier CONSTRAINT df__okp_dataexport__uid DEFAULT newid() NOT NULL,
	Name varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	Comment varchar(255) COLLATE DATABASE_DEFAULT NULL,
	Query text COLLATE DATABASE_DEFAULT CONSTRAINT df__okp_dataexport__query DEFAULT '' NOT NULL,
	RepUID uniqueidentifier NULL,
	RWC bigint IDENTITY(1, 1) NOT NULL,
	IMAGE_ID int NULL,
	CONSTRAINT PK_OKP_DataExport PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Список вариантов экспорта данных', N'schema', N'dbo', N'table', N'OKP_DataExport'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный идентификатор ', N'schema', N'dbo', N'table', N'OKP_DataExport', N'column', N'UID'
EXEC sp_addextendedproperty 'MS_Description', N'Имя варианта экспорта', N'schema', N'dbo', N'table', N'OKP_DataExport', N'column', N'Name'
EXEC sp_addextendedproperty 'MS_Description', N'Коментарий к варианту', N'schema', N'dbo', N'table', N'OKP_DataExport', N'column', N'Comment'
EXEC sp_addextendedproperty 'MS_Description', N'SQL команда варианта', N'schema', N'dbo', N'table', N'OKP_DataExport', N'column', N'Query'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор ведущего отчета', N'schema', N'dbo', N'table', N'OKP_DataExport', N'column', N'RepUID'
GO

--
-- Definition for table OKP_DataExportParameters : 
--

CREATE TABLE dbo.OKP_DataExportParameters (
  DataExpUID uniqueidentifier NOT NULL,
  ParamType int NOT NULL,
  ParamAdditional varchar(255) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_OKP_DataExportParameters PRIMARY KEY CLUSTERED (DataExpUID, ParamType)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Параметры вариантов экспорта данных', N'schema', N'dbo', N'table', N'OKP_DataExportParameters'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор варианта экспорта', N'schema', N'dbo', N'table', N'OKP_DataExportParameters', N'column', N'DataExpUID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор параметра', N'schema', N'dbo', N'table', N'OKP_DataExportParameters', N'column', N'ParamType'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Расширенный параметр', N'schema', N'dbo', N'table', N'OKP_DataExportParameters', N'column', N'ParamAdditional'
GO

--
-- Definition for table OKP_Directories : 
--

CREATE TABLE dbo.OKP_Directories (
    ID int NOT NULL,
    Name varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
    Comment varchar(255) COLLATE DATABASE_DEFAULT NULL,
    ImageID bigint NULL,
    UID uniqueidentifier NOT NULL,
    GetIDNCommand varchar(4000) COLLATE DATABASE_DEFAULT NULL,
    SYSOBJ_ID int NOT NULL,
    HINT_TITLE varchar(50) COLLATE DATABASE_DEFAULT NULL,
    CONSTRAINT PK_Directories PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'SQL-комманда для получения пользовательского представления (IDN) строки справочника   Например,     select UOMIDN+"-"+NAENAM from OKP_EIZ where RWC = [ID], где  [ID] - параметр запроса,обозначающий уникальный идентификатор строки справочника  ', N'schema', N'dbo', N'table', N'OKP_Directories', N'column', N'GetIDNCommand'
EXEC sp_addextendedproperty 'MS_Description', N'OKP_SYSOBJECTS.ID', N'schema', N'dbo', N'table', N'OKP_DIRECTORIES',  N'column', N'SYSOBJ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор редактора справочника (соответствует настройке редактора в исходном коде системы)', N'SCHEMA', N'dbo', N'TABLE', N'OKP_Directories', N'COLUMN', N'UID'
EXEC sp_addextendedproperty 'MS_Description', N'Текст подсказки', N'schema', N'dbo', N'table', N'OKP_DIRECTORIES',  N'column', N'HINT_TITLE'
GO

--
-- Definition for table OKP_DOC : 
--

CREATE TABLE dbo.OKP_DOC (
  IDN$$$DOC varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  NAMDOC varchar(255) COLLATE DATABASE_DEFAULT NULL,
  MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
  FILES_ID int NULL,
  ID int IDENTITY(1, 1) NOT NULL,
  GRP_ID int NULL,
  CONSTRAINT PK_OKP_DOC PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Документы', N'schema', N'dbo', N'table', N'OKP_DOC'
GO
EXEC sp_addextendedproperty 'MS_Description', N'идентификационный код документа', N'schema', N'dbo', N'table', N'OKP_DOC', N'column', N'ID'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор документа', 'schema', 'dbo', 'table', 'OKP_DOC', 'column', 'IDN$$$DOC';
GO
EXEC sp_addextendedproperty 'MS_Description', N'Наименование документа', 'schema', 'dbo', 'table', 'OKP_DOC', 'column', 'NAMDOC';
GO
EXEC sp_addextendedproperty 'MS_Description', N'ID группы', 'schema', 'dbo', 'table', 'OKP_DOC', 'column', 'GRP_ID';
GO

--
-- Definition for table OKP_DOCs : 
--

CREATE TABLE dbo.OKP_DOCs (
  ID bigint IDENTITY(1, 1) NOT NULL,
  IDN varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  DTE_CR datetime DEFAULT getdate() NOT NULL,
  DTE_DR datetime NOT NULL,
  USER_ID int NOT NULL,
  GRP_ID int NULL,
  ObjectTypeID int NOT NULL,
  MET int CONSTRAINT DF_LIM_MET DEFAULT 0 NOT NULL,
  CONSTRAINT PK_DOCs PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Журнал документов системы', N'schema', N'dbo', N'table', N'OKP_DOCs'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID документа', N'schema', N'dbo', N'table', N'OKP_DOCs', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Номер документа', N'schema', N'dbo', N'table', N'OKP_DOCs', N'column', N'IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата создания (автоматическая)', N'schema', N'dbo', N'table', N'OKP_DOCs', N'column', N'DTE_CR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата создания (ручная)', N'schema', N'dbo', N'table', N'OKP_DOCs', N'column', N'DTE_DR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID пользователя (OKP_USERS.USER_ID)', N'schema', N'dbo', N'table', N'OKP_DOCs', N'column', N'USER_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID группы  (OKP_GROUPS.ID)', N'schema', N'dbo', N'table', N'OKP_DOCs', N'column', N'GRP_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор типа объекта (см. таблицу OKP_sysObjects)', N'schema', N'dbo', N'table', N'OKP_DOCs', N'column', N'ObjectTypeID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Метка записи (код состояния)', N'schema', N'dbo', N'table', N'OKP_DOCs', N'column', N'MET'
GO

--
-- Definition for table OKP_DST : 
--

CREATE TABLE dbo.OKP_DST (
  ID bigint IDENTITY(1, 1) NOT NULL,
  DT bigint NOT NULL,
  DSTNUM varchar(25) COLLATE DATABASE_DEFAULT NOT NULL,
  DEP_SENDER varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  WRH_RECEIVER varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  CREATEBY varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  CREATEDATE bigint NOT NULL,
  INTNUM int NOT NULL,
  STATE int DEFAULT 0 NOT NULL,
  STATE1DATE bigint NULL,
  STATE2DATE bigint NULL,
  STATE1BY varchar(100) COLLATE DATABASE_DEFAULT NULL,
  STATE2BY varchar(100) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_OKP_DST PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Журнал цехоскладских передач (DepartmentStock Transfer)', N'schema', N'dbo', N'table', N'OKP_DST'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор DST', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата (IntFormat)', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'DT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Номер накладной ХХХ/MM-ГГ-WRH_IDN', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'DSTNUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Подразделение - отправитель', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'DEP_SENDER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Склад - получатель (WRH_IDN)', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'WRH_RECEIVER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кем создано', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'CREATEBY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата создания', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'CREATEDATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'порядковый номер за месяц', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'INTNUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'0-новая, 1-отправлена, 2-принята', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'STATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата установки статуса "1 Отправлена"', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'STATE1DATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата установки статуса "2 Принята"', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'STATE2DATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кем установлен статус "1 Отправлена"', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'STATE1BY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кем установлен статус "2 Принята"', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'STATE2BY'
GO

--
-- Definition for table OKP_DST_ELEM : 
--

CREATE TABLE dbo.OKP_DST_ELEM (
  ID bigint IDENTITY(1, 1) NOT NULL,
  DST_ID bigint NOT NULL,
  QTY float NOT NULL,
  TOZ_RWC_SENDER int NOT NULL,
  CREATEBY varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  CREATEDATE bigint NOT NULL,
  QTY_R float NULL,
  RECEIVEBY varchar(100) COLLATE DATABASE_DEFAULT NULL,
  RECEIVEDATA bigint NULL,
  UID uniqueidentifier,
  Fold_I float NULL,
  Fold_D bigint NULL,
  Fold_U varchar(100) NULL,
  CONSTRAINT PK_OKP_DST_ELEM PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Элементы документа "цеховая передача на склад"', N'schema', N'dbo', N'table', N'OKP_DST_ELEM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ИД', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на Документ DST', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'DST_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Количество для передачи', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор операции-источника', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'TOZ_RWC_SENDER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кем сформировано', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'CREATEBY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Когда сформировано', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'CREATEDATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Итоговое переданное на склад количество по текущей строке накладной', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'QTY_R'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кто выполнил последнюю приёмку на склад', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'RECEIVEBY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата последней приёмки на склад', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'RECEIVEDATA'
GO

EXEC sp_addextendedproperty N'MS_Description', N'Вспомогательное поле идентификации', 'schema', 'dbo', 'table', 'OKP_DST_ELEM', 'column', 'UID'
go

EXEC sp_addextendedproperty 'MS_Description', N'Свёртка QTY_R', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'Fold_I'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Свёртка RECEIVEDATA', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'Fold_D'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Свёртка RECEIVEBY', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'Fold_U'
GO

--
-- Definition for table OKP_EskizList : 
--

CREATE TABLE dbo.OKP_EskizList (
  ID int IDENTITY(1, 1) NOT NULL,
  Filename varchar(500) COLLATE DATABASE_DEFAULT NULL,
  Data image NULL,
  RWC_toz int NULL,
  Flag int NULL,
  Puth varchar(999) COLLATE DATABASE_DEFAULT NULL,
  UserId int NULL,
  CONSTRAINT PK_OKP_ESKIZLIST PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Эскизы для номированных заданий', N'schema', N'dbo', N'table', N'OKP_EskizList'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID счетчик', N'schema', N'dbo', N'table', N'OKP_EskizList', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'имя файла (эскиза)', N'schema', N'dbo', N'table', N'OKP_EskizList', N'column', N'Filename'
GO

EXEC sp_addextendedproperty 'MS_Description', N'содержимое файла', N'schema', N'dbo', N'table', N'OKP_EskizList', N'column', N'Data'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ссылка на операцию нормирования', N'schema', N'dbo', N'table', N'OKP_EskizList', N'column', N'RWC_toz'
GO

EXEC sp_addextendedproperty 'MS_Description', N'состояние эскиза', N'schema', N'dbo', N'table', N'OKP_EskizList', N'column', N'Flag'
GO

EXEC sp_addextendedproperty 'MS_Description', N'место эскиза на жестком диске', N'schema', N'dbo', N'table', N'OKP_EskizList', N'column', N'Puth'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID пользователя', N'schema', N'dbo', N'table', N'OKP_EskizList', N'column', N'UserId'
GO

--
-- Definition for table OKP_ESKORTLIST : 
--

CREATE TABLE dbo.OKP_ESKORTLIST (
  ID int IDENTITY(1, 1) NOT NULL,
  DATECREATION datetime NOT NULL,
  CREATOR varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  PPPNUM_ID int NOT NULL,
  CPLNUM_ID int NOT NULL,
  STATUS int NOT NULL,
  DATENULLIFICATION datetime NULL,
  NULLIFICATOR varchar(100) COLLATE DATABASE_DEFAULT NULL,
  PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Журнал сопроводительных листов', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Иденификатор документа', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата создания', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST', N'column', N'DATECREATION'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кем создано', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST', N'column', N'CREATOR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'RWC плановой позиции', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST', N'column', N'PPPNUM_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'RWC CPL', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST', N'column', N'CPLNUM_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Статус : 1-сформирован, 0 - аннулирован', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST', N'column', N'STATUS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата аннулирования', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST', N'column', N'DATENULLIFICATION'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кем аннулированно', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST', N'column', N'NULLIFICATOR'
GO

--
-- Definition for table OKP_FILTERS : 
--

CREATE TABLE dbo.OKP_FILTERS (
  ID int IDENTITY(1, 1) NOT NULL,
  PLACE_UID uniqueidentifier NOT NULL,
  user_ID int NULL,
  FILTERNAME varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  LASTUSEDATE datetime NULL,
  FILTERBODY varchar(max) COLLATE DATABASE_DEFAULT NOT NULL,
  PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица именованных фильтров', N'schema', N'dbo', N'table', N'OKP_FILTERS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID фильтра', N'schema', N'dbo', N'table', N'OKP_FILTERS', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'уникальный идентификатор места применения фильтра', N'schema', N'dbo', N'table', N'OKP_FILTERS', N'column', N'PLACE_UID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID пользователя-хозяина фильтра, Null - фильтр общего назначения', N'schema', N'dbo', N'table', N'OKP_FILTERS', N'column', N'user_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Неуникальное имя фильтра', N'schema', N'dbo', N'table', N'OKP_FILTERS', N'column', N'FILTERNAME'
GO

EXEC sp_addextendedproperty 'MS_Description', N'дата последнего использования фильтра', N'schema', N'dbo', N'table', N'OKP_FILTERS', N'column', N'LASTUSEDATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'тело фильтра', N'schema', N'dbo', N'table', N'OKP_FILTERS', N'column', N'FILTERBODY'
GO

--
-- Definition for table OKP_FIO_CONTACTS : 
--

CREATE TABLE dbo.OKP_FIO_CONTACTS (
  ID int IDENTITY(1, 1) NOT NULL,
  ID_FIO int NOT NULL,
  NAME varchar(200) COLLATE DATABASE_DEFAULT NOT NULL,
  TYP int NOT NULL,
  VALUE varchar(1000) COLLATE DATABASE_DEFAULT NULL,
  IsBase int NOT NULL,
  CONSTRAINT PK_OKP_FIO_CONTACTS PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Контактные данные сотрудников', N'schema', N'dbo', N'table', N'OKP_FIO_CONTACTS'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор сотрудника', N'schema', N'dbo', N'table', N'OKP_FIO_CONTACTS', N'column', N'ID_FIO'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование контакта. Например, "мобильный телефон", "рабочий телефон", "рабочая почта", "личная почта" и т .д.', N'schema', N'dbo', N'table', N'OKP_FIO_CONTACTS', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Тип контакта:   1 - телефон,   2 - адрес,   3 - E-mail,   4 - ICQ   5 - Skype    6 - Соц. сеть   7 - Другое', N'schema', N'dbo', N'table', N'OKP_FIO_CONTACTS', N'column', N'TYP'
EXEC sp_addextendedproperty 'MS_Description', N'Значение', N'schema', N'dbo', N'table', N'OKP_FIO_CONTACTS', N'column', N'VALUE'
EXEC sp_addextendedproperty 'MS_Description', N'Основной', N'schema', N'dbo', N'table', N'OKP_FIO_CONTACTS', N'column', N'IsBase'
GO

/*
** Definition for table OKP_GROUPS : 
*/
CREATE TABLE dbo.OKP_GROUPS (
	ID int IDENTITY(1, 1) NOT NULL,
	P_GROUPS_ID int NULL,
	NAME varchar(75) COLLATE DATABASE_DEFAULT NOT NULL,
	INFO varchar(100) COLLATE DATABASE_DEFAULT NULL,
	SYSOBJECTS_ID int NOT NULL,
	DESCRIBE varchar(500) COLLATE DATABASE_DEFAULT NULL,
	FILES_ID int NULL,
	IsSystem bit DEFAULT 0 NULL,
	CONSTRAINT PK_OKP_GROUPS PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Группы объектов', N'schema', N'dbo', N'table', N'OKP_GROUPS'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'OKP_GROUPS', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Родительская группа', N'schema', N'dbo', N'table', N'OKP_GROUPS', N'column', N'P_GROUPS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование группы', N'schema', N'dbo', N'table', N'OKP_GROUPS', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Дополнительная информация', N'schema', N'dbo', N'table', N'OKP_GROUPS', N'column', N'INFO'
EXEC sp_addextendedproperty 'MS_Description', N'Системный объект', N'schema', N'dbo', N'table', N'OKP_GROUPS', N'column', N'SYSOBJECTS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Описание', N'schema', N'dbo', N'table', N'OKP_GROUPS', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на список файлов', N'schema', N'dbo', N'table', N'OKP_GROUPS', N'column', N'FILES_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Группа системная', N'schema', N'dbo', N'table', N'OKP_GROUPS', N'column', N'IsSystem'
GO

--
-- Definition for table OKP_InventoryData : 
--

CREATE TABLE dbo.OKP_InventoryData (
  ID bigint IDENTITY(1, 1) NOT NULL,
  INVENTORY_ID bigint NOT NULL,
  INV_ID bigint NOT NULL,
  SUB_ID bigint NULL,
  QTY float NOT NULL,
  QTY_OLD float NOT NULL,
  PRC float NULL,
  State int NOT NULL,
  CONSTRAINT PK_InventoryData PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица данных по инвентаризации', N'schema', N'dbo', N'table', N'OKP_InventoryData'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на документ инвентаризации (OKP_TRNDOC.ID) ', N'schema', N'dbo', N'table', N'OKP_InventoryData', N'column', N'INVENTORY_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на ТМЦ (OKP_INV.ID) ', N'schema', N'dbo', N'table', N'OKP_InventoryData', N'column', N'INV_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на складскую карточку (OKP_WRH_SUBJECTS.ID) ', N'schema', N'dbo', N'table', N'OKP_InventoryData', N'column', N'SUB_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Количество по факту. Количество указано в системной ЕИЗ расхода (см. описание OKP_INV.QTY) ', N'schema', N'dbo', N'table', N'OKP_InventoryData', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Количество по учёту. Количество указано в системной ЕИЗ расхода (см. описание OKP_INV.QTY) ', N'schema', N'dbo', N'table', N'OKP_InventoryData', N'column', N'QTY_OLD'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Цена единицы в системной ЕИЗ расхода (см. описание OKP_INV.PRC) ', N'schema', N'dbo', N'table', N'OKP_InventoryData', N'column', N'PRC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Флаг состояния: 0 - снято с инвентаризации, 1 - поставлено на инвентаризацию ', N'schema', N'dbo', N'table', N'OKP_InventoryData', N'column', N'State'
GO

/*
** OKP_INVGRP
*/
CREATE TABLE dbo.OKP_INVGRP (
	GRP_ID int IDENTITY(1, 1) NOT NULL,
	WRH_WRH int NOT NULL,
	PARNT_GRP_ID int NULL,
	GRP_NAME varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT df__okp_invgrp__grp_name DEFAULT 'Новая группа' NOT NULL,
	PRIMARY KEY CLUSTERED (GRP_ID)
)
GO

/*
** Definition for table OKP_IPT : 
*/
CREATE TABLE dbo.OKP_IPT (
	ID bigint IDENTITY(1, 1) NOT NULL,
	DT bigint NOT NULL,
	IPTNUM varchar(25) COLLATE DATABASE_DEFAULT NOT NULL,
	INTNUM int NOT NULL,
	CREATEBY varchar(100) COLLATE DATABASE_DEFAULT NULL,
	CREATEDATE bigint NOT NULL,
	STATE int DEFAULT 0 NOT NULL,
	STATE1DATE bigint NULL,
	STATE2DATE bigint NULL,
	STATE1BY varchar(100) COLLATE DATABASE_DEFAULT NULL,
	STATE2BY varchar(100) COLLATE DATABASE_DEFAULT NULL,
	dep_id_sender INT NOT NULL,
	dep_id_receiver INT NOT NULL,
	CONSTRAINT PK_OKP_IPT PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Журнал межцеховых передач (InterPlant Transfer)', N'schema', N'dbo', N'table', N'OKP_IPT'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор IPT', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата (IntFormat)', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'DT'
EXEC sp_addextendedproperty 'MS_Description', N'Номер накладной ХХХ/MM-ГГ-DEP', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'IPTNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Порядковый номер документа за месяц', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'INTNUM'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения-отправителя', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'DEP_ID_SENDER'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения-получателя', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'DEP_ID_RECEIVER'
EXEC sp_addextendedproperty 'MS_Description', N'Кем создано', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'CREATEBY'
EXEC sp_addextendedproperty 'MS_Description', N'Дата создания', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'CREATEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'0-новая, 1-отправлена, 2-принята', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'STATE'
EXEC sp_addextendedproperty 'MS_Description', N'Дата установки статуса "1 Отправлена"', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'STATE1DATE'
EXEC sp_addextendedproperty 'MS_Description', N'Дата установки статуса "2 Принята"', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'STATE2DATE'
EXEC sp_addextendedproperty 'MS_Description', N'Кем установлен статус "1 Отправлена"', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'STATE1BY'
EXEC sp_addextendedproperty 'MS_Description', N'Кем установлен статус "2 Принята"', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'STATE2BY'
GO

--
-- Definition for table OKP_IPT_ELEM : 
--

CREATE TABLE dbo.OKP_IPT_ELEM (
  ID bigint IDENTITY(1, 1) NOT NULL,
  IPT_ID bigint NOT NULL,
  QTY float NOT NULL,
  TOZ_RWC_SENDER int NOT NULL,
  TOZ_RWC_RECEIVER int NULL,
  CREATEBY varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  CREATEDATE bigint NOT NULL,
  STATE int DEFAULT 0 NOT NULL,
  QTY_CLOSED float NULL,
  UID uniqueidentifier,
  CONSTRAINT PK_OKP_IPT_ELEM PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Элементы документа "межцеховая передача"', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM'
EXEC sp_addextendedproperty 'MS_Description', N'ИД', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на Документ IPT', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'IPT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Количество для передачи', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор операции-источника', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'TOZ_RWC_SENDER'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор операции-приемника', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'TOZ_RWC_RECEIVER'
EXEC sp_addextendedproperty 'MS_Description', N'Кем сформировано', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'CREATEBY'
EXEC sp_addextendedproperty 'MS_Description', N'Когда сформировано', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'CREATEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'Текущий статус 0- сформирован 1- частично принят 2- полностью принят', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'STATE'
EXEC sp_addextendedproperty 'MS_Description', N'Подтвержденное принятое количество после перехода в статус "Принято"', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'QTY_CLOSED'
EXEC sp_addextendedproperty N'MS_Description', N'Вспомогательное поле идентификации', 'schema', 'dbo', 'table', 'OKP_IPT_ELEM', 'column', 'UID'
GO

--
-- Definition for table OKP_IPT_RECEIVE : 
--

CREATE TABLE dbo.OKP_IPT_RECEIVE (
  ID bigint IDENTITY(1, 1) NOT NULL,
  IPT_ELEM_ID bigint NOT NULL,
  QCY_RECEIVE float NOT NULL,
  RECEIVEBY varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  RECEIVEDATA bigint NOT NULL,
  UID uniqueidentifier,
  CONSTRAINT PK_OKP_IPT_RECEIVE PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица учетов закрытия межцеховых передач', N'schema', N'dbo', N'table', N'OKP_IPT_RECEIVE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ИД', N'schema', N'dbo', N'table', N'OKP_IPT_RECEIVE', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор элемента документа межцеховой передачи', N'schema', N'dbo', N'table', N'OKP_IPT_RECEIVE', N'column', N'IPT_ELEM_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'количество подтвержденного приема', N'schema', N'dbo', N'table', N'OKP_IPT_RECEIVE', N'column', N'QCY_RECEIVE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кем принято', N'schema', N'dbo', N'table', N'OKP_IPT_RECEIVE', N'column', N'RECEIVEBY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'когда принято', N'schema', N'dbo', N'table', N'OKP_IPT_RECEIVE', N'column', N'RECEIVEDATA'
GO

EXEC sp_addextendedproperty N'MS_Description', N'Вспомогательное поле идентификации', 'schema', 'dbo', 'table', 'OKP_IPT_RECEIVE', 'column', 'UID'  
GO

/*
** Definition for table OKP_IPTDEPS : 
*/
CREATE TABLE dbo.OKP_IPTDEPS (
	ID int IDENTITY(1, 1) NOT NULL,  
	CREATEBY varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
	CREATEDATE bigint NOT NULL,
	dep_id_sender INT NOT NULL,
	dep_id_receiver INT NOT NULL,  
	can_use_wrh INT CONSTRAINT df__okp_iptdeps__can_use_wrh DEFAULT (0) NOT NULL,
	CONSTRAINT PK_OKP_IPTDDEPS PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Список контролируемых цехопереходов', N'schema', N'dbo', N'table', N'OKP_IPTDEPS'
EXEC sp_addextendedproperty 'MS_Description', N'ИД', N'schema', N'dbo', N'table', N'OKP_IPTDEPS', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения-отправителя', N'schema', N'dbo', N'table', N'OKP_IPTDEPS', N'column', N'DEP_ID_SENDER'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения-получателя', N'schema', N'dbo', N'table', N'OKP_IPTDEPS', N'column', N'DEP_ID_RECEIVER'
EXEC sp_addextendedproperty 'MS_Description', N'Дата создания', N'schema', N'dbo', N'table', N'OKP_IPTDEPS', N'column', N'CREATEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'Передача через склад', N'schema', N'dbo', N'table', N'OKP_IPTDEPS', N'column', N'can_use_wrh'
GO

--
-- Definition for table OKP_KIM : 
--

CREATE TABLE dbo.OKP_KIM (
  PRTIDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  DEP varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  PRC money NOT NULL,
  Date_KIM datetime NOT NULL,
  RWC bigint IDENTITY(1, 1) NOT NULL,
  CONSTRAINT OKP_KIM_uq2 PRIMARY KEY CLUSTERED (PRTIDN, Date_KIM, DEP)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'КиМ исполнителей', N'schema', N'dbo', N'table', N'OKP_KIM'
GO  
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение КиМ', N'schema', N'dbo', N'table', N'OKP_KIM', N'column', N'PRTIDN'
GO  
EXEC sp_addextendedproperty 'MS_Description', N'подразделение', N'schema', N'dbo', N'table', N'OKP_KIM', N'column', N'DEP'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Цена KиМ', N'schema', N'dbo', N'table', N'OKP_KIM', N'column', N'PRC'
GO
EXEC sp_addextendedproperty 'MS_Description', N'Дата редактирования КиМ', N'schema', N'dbo', N'table', N'OKP_KIM', N'column', N'Date_KIM'
GO
EXEC sp_addextendedproperty 'MS_Description', N'служебное поле-счетчик', N'schema', N'dbo', N'table', N'OKP_KIM', N'column', N'RWC'
GO


--
-- Definition for table OKP_Logs : 
--

CREATE TABLE dbo.OKP_Logs (
  LOGDateTime datetime NULL,
  UserID int NULL,
  UserName varchar(50) COLLATE DATABASE_DEFAULT NULL,
  CompName varchar(50) COLLATE DATABASE_DEFAULT NULL,
  Modul varchar(100) COLLATE DATABASE_DEFAULT NULL,
  TblName varchar(50) COLLATE DATABASE_DEFAULT NULL,
  Act varchar(10) COLLATE DATABASE_DEFAULT NULL,
  Mess varchar(2000) COLLATE DATABASE_DEFAULT NULL,
  Params varchar(4000) COLLATE DATABASE_DEFAULT NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Журнал событий в системе', N'schema', N'dbo', N'table', N'OKP_Logs'
EXEC sp_addextendedproperty 'MS_Description', N'Дата и время внесения записи в журнал', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'LOGDateTime'
EXEC sp_addextendedproperty 'MS_Description', N'SQL-идентификатор пользователя', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'UserID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор пользователя', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'UserName'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор компьютера', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'CompName'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение модуля:T - технолог A - админ P - плановик D - диспетчер R - отчет S - склад M - руководитель E - Экономист C - UpdateStatuses (утилита на сервере) B - RecalcBalans (утилита на сервере) I - Модуль импорта', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'Modul'
EXEC sp_addextendedproperty 'MS_Description', N'Имя таблицы', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'TblName'
EXEC sp_addextendedproperty 'MS_Description', N'Тип протоколируемого действия: Update - обновление указанной таблицы Delete - удаление из указанной таблицы Insert - вставка в указанную таблицу ', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'Act'
EXEC sp_addextendedproperty 'MS_Description', N'Описание протоколируемого действия', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'Mess'
EXEC sp_addextendedproperty 'MS_Description', N'Параметры протоколируемого действия (имена и значения колонок, идентификаторов записей)', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'Params'
GO

--
-- Definition for table OKP_Messages : 
--

CREATE TABLE dbo.OKP_Messages (
  ID int IDENTITY(1, 1) NOT NULL,
  IDN varchar(6) COLLATE DATABASE_DEFAULT NOT NULL,
  Mess varchar(4000) COLLATE DATABASE_DEFAULT NOT NULL,
  MessExt varchar(4000) COLLATE DATABASE_DEFAULT NOT NULL,
  PARAMS varchar(3500) COLLATE DATABASE_DEFAULT NULL,
  Recommendation varchar(4000) COLLATE DATABASE_DEFAULT null,
  HelpContext bigint not null default(0),
  CONSTRAINT PK_OKP_MESSAGES PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Журнал пользовательских сообщений', N'schema', N'dbo', N'table', N'OKP_Messages'
EXEC sp_addextendedproperty 'MS_Description', N'Счетчик', N'schema', N'dbo', N'table', N'OKP_Messages', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный идентификатор сообщения. Формат состоит из двух частей:  <000-00>  1) группа сообщения (3 знака)  2) номер сообщения в группе (2 знака) Пример: 001-01', N'schema', N'dbo', N'table', N'OKP_Messages', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Основной текст сообщения. Применяется для вывода сообщения о наборе записей с указанием данных (параметров), общих для всех записей, в тексте сообщения. Параметр выделяется квадратными скобками и состоит из трех частей:  1) имя параметра (только из списка, представленного в поле PARAMS)  2) управляющий знак двоеточие (":")  3) флаг: 1 = в тексте указать только имя параметра           2 = в тексте указать только значение параметра           3 = в тексте указать и имя и значение параметра Пример: "первая часть сообщения [TMC:2] вторая часть сообщения [Nal:3]" ', 'schema', 'dbo', 'table', 'OKP_Messages', 'column', 'Mess'
EXEC sp_addextendedproperty 'MS_Description', N'Расширенный текст сообщения. Применяется для вывода сообщения о единичной записи с указанием её ключевых данных (параметров) в тексте сообщения.Параметр выделяется квадратными скобками и состоит из трех частей:  1) имя параметра (только из списка, представленного в поле PARAMS)  2) управляющий знак двоеточие (":")  3) флаг: 1 = в тексте указать только имя параметра           2 = в тексте указать только значение параметра           3 = в тексте указать и имя и значение параметра Пример: "первая часть сообщения [TMC:2] вторая часть сообщения [Nal:3]" ', 'schema', 'dbo', 'table', 'OKP_Messages', 'column', 'MessExt'
EXEC sp_addextendedproperty 'MS_Description', N'Параметры сообщения. Параметры перечисляются через точку с запятой (";"). Каждый параметр состоит из трех частей разделяемых двоеточием (":"):  1) имя параметра  2) описание параметра  3) переключатель видимости параметра в общем списке (0 - не показывать; 1 - показывать)Пример: TMC:Товарно-материальная ценность:0;Nal:В наличии:1', N'schema', N'dbo', N'table', N'OKP_Messages', N'column', N'PARAMS'
EXEC sp_addextendedproperty 'MS_Description', N'Текст рекомендаций по устранению ошибки', 'schema', 'dbo', 'table', 'OKP_Messages', 'column', 'Recommendation'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на раздел в справочнике', 'schema', 'dbo', 'table', 'OKP_Messages', 'column', 'HelpContext'
GO

/* @BLOCK: Рабочие таблицы
** @DESCR: Ставки НДС
*/
CREATE TABLE dbo.OKP_NDS (
	id int IDENTITY(1, 1) NOT NULL,
	NAM varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	NDS FLOAT CONSTRAINT df__okp_nds__nds DEFAULT 0 NOT NULL,
	INCLUDED bit CONSTRAINT df__okp_nds__included DEFAULT 0,
	NUM int NULL,
	GRP_ID int NULL,
	CONSTRAINT PK_OKP_NDS PRIMARY KEY CLUSTERED (id)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ставки НДС', N'schema', N'dbo', N'table', N'OKP_NDS'
EXEC sp_addextendedproperty 'MS_Description', N'Описание', N'schema', N'dbo', N'table', N'OKP_NDS', N'column', N'NAM'
EXEC sp_addextendedproperty 'MS_Description', N'Значение', N'schema', N'dbo', N'table', N'OKP_NDS', N'column', N'NDS'
EXEC sp_addextendedproperty 'MS_Description', N'Цена включает НДС', N'schema', N'dbo', N'table', N'OKP_NDS', N'column', N'INCLUDED'
EXEC sp_addextendedproperty 'MS_Description', N'Порядок для сортировки', N'schema', N'dbo', N'table', N'OKP_NDS', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы', N'schema', N'dbo', N'table', N'OKP_NDS', N'column', N'GRP_ID'
GO

/* @NAME:  OKP_NKL_LIST
** @DESCR: Калькуляции
*/
CREATE TABLE dbo.OKP_NKL_LIST (
	RWC int IDENTITY(1, 1) NOT NULL,
	creator varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
	UserFIO varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
	SUMPrice float NULL,
	SUMPrice_st float NULL,
	TZ_n int NULL,
	dte varchar(10) COLLATE DATABASE_DEFAULT NULL,
	calctype int NOT NULL,
	qtywgh float NULL,
	qtypqy float NULL,
	calcidn varchar(15) COLLATE DATABASE_DEFAULT NOT NULL,
	zakaz varchar(100) COLLATE DATABASE_DEFAULT NULL,
	Doc varchar(50) COLLATE DATABASE_DEFAULT NULL,
	Main varchar(3) COLLATE DATABASE_DEFAULT NULL,
	RWC_PPP int NULL,
	nom_id int NOT NULL,
	modified_tabs VARCHAR(32) COLLATE DATABASE_DEFAULT NULL,
	create_date DATETIME NULL, 
	SD_PPP float(53),
	grp_id INT NULL,
        RWC_CPL INT NULL,
        SysObject_ID INT NOT NULL,
	CONSTRAINT PK_OKP_NKL_LIST PRIMARY KEY CLUSTERED (rwc)	
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Калькуляции', N'schema', N'dbo', N'table', N'OKP_NKL_LIST'
EXEC sp_addextendedproperty 'MS_Description', N'ID калькуляции', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Автор калькуляции', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'creator'
EXEC sp_addextendedproperty 'MS_Description', N'Пользователь, изменивший калькуляцию', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'UserFIO'
EXEC sp_addextendedproperty 'MS_Description', N'Цена внутренняя', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'SUMPrice'
EXEC sp_addextendedproperty 'MS_Description', N'Цена внешняя', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'SUMPrice_st'
EXEC sp_addextendedproperty 'MS_Description', N'Код типа затрат', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'TZ_n'
EXEC sp_addextendedproperty 'MS_Description', N'Дата редактирования калькуляции', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'dte'
EXEC sp_addextendedproperty 'MS_Description', N'Код вида калькуляции', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'calctype'
EXEC sp_addextendedproperty 'MS_Description', N'Масса заготовки', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'qtywgh'
EXEC sp_addextendedproperty 'MS_Description', N'Плановое количество в ПП', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'qtypqy'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение калькуляции', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'calcidn'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение заказа', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'zakaz'
EXEC sp_addextendedproperty 'MS_Description', N'Документ склада связанный с автоматической калькуляцией', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'Doc'
EXEC sp_addextendedproperty 'MS_Description', N'Признак контролируемой калькуляции', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'Main'
EXEC sp_addextendedproperty 'MS_Description', N'ID плановой позиции', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'RWC_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'ID номенклатуры', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата создания калькуляции', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'create_date'
EXEC sp_addextendedproperty 'MS_Description', N'Cданное количество плановой позиции при расчете калькуляции', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'SD_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'grp_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID производственной партии', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'RWC_CPL'
EXEC sp_addextendedproperty 'MS_Description', N'объект 86 - номенклатура ДСЕ, 5 - ПП, 7 - партия', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'SysObject_ID'
GO

--
-- Definition for table OKP_NNUM : 
--

CREATE TABLE dbo.OKP_NNUM (
  BCOUNT bigint IDENTITY(1, 10) NOT NULL,
  PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  NUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  NEWNUM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_OKP_NNUM PRIMARY KEY CLUSTERED (BCOUNT)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Уникальный номер', N'schema', N'dbo', N'table', N'OKP_NNUM', N'column', N'BCOUNT'
GO

--
-- Definition for table OKP_OBJLINKS : 
--

CREATE TABLE dbo.OKP_OBJLINKS (
  ID bigint IDENTITY(1, 1) NOT NULL,
  M_ID bigint NOT NULL,
  M_Type int NOT NULL,
  S_ID bigint NOT NULL,
  S_Type int NOT NULL,
  isAuto int CONSTRAINT DF_OBJLINKS_isAuto DEFAULT 0 NOT NULL,
  LinkLevel int CONSTRAINT DF_OBJLINKS_LinkLevel DEFAULT 0 NOT NULL,
  CONSTRAINT PK_OBJLINKS PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица связей объектов', N'schema', N'dbo', N'table', N'OKP_OBJLINKS'
EXEC sp_addextendedproperty 'MS_Description', N'ID ведущего документа', N'schema', N'dbo', N'table', N'OKP_OBJLINKS', N'column', N'M_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Тип ведущего документа. Типы документов - см. OKP_SYSOBJECTS, например:  1	(таблица OKP_NOM) - карточки "Общей номенклатуры"  2	(таблица OKP_INV) - карточки "Складской номенклатуры"  ...  5	(таблица OKP_PPP) - документы "Плановых позиций"  6	(таблица OKP_TRN) - документы "Журналов склада"и т.д.', N'schema', N'dbo', N'table', N'OKP_OBJLINKS', N'column', N'M_Type'
EXEC sp_addextendedproperty 'MS_Description', N'ID ведомого документа', N'schema', N'dbo', N'table', N'OKP_OBJLINKS', N'column', N'S_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Тип ведомого документа. Типы документов - см. таблицу OKP_SYSOBJECTS, например:  1	(таблица OKP_NOM) - карточки "Общей номенклатуры"  2	(таблица OKP_INV) - карточки "Складской номенклатуры"  ...  5	(таблица OKP_PPP) - документы "Плановых позиций"  6	(таблица OKP_TRN) - документы "Журналов склада"и т.д.', N'schema', N'dbo', N'table', N'OKP_OBJLINKS', N'column', N'S_Type'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг автоматически созданного документа:  0 - ведомый создан отдельно  1 - ведомый создан автоматически одновременно с ведущим', N'schema', N'dbo', N'table', N'OKP_OBJLINKS', N'column', N'isAuto'
EXEC sp_addextendedproperty 'MS_Description', N'Уровень связи:  0 - связь построчная  1 - связь по заголовкам', N'schema', N'dbo', N'table', N'OKP_OBJLINKS', N'column', N'LinkLevel'
GO

--
-- Definition for table OKP_OBSP : 
--

CREATE TABLE dbo.OKP_OBSP (
  id bigint IDENTITY(1, 1) NOT NULL,
  RWC_NOM int NOT NULL,
  WRH_ID int NULL,
  EIZ varchar(10) COLLATE DATABASE_DEFAULT NULL,
  QTY_SZP float NULL,
  QTY_WRH float NULL,
  QTY_TI float NULL,
  QTY_MFC float NULL,
  QTY_INVALID float NULL,
  QTY_OTV float NULL,
  QTY_DEFICIT float NULL,
  PRC float NULL,
  ON_INV int DEFAULT 0 NULL,
  QTY_PLAN_POT float NULL,
  QTY_PLAN_POT_MINUS_STOPED float NULL,
  QTY_RESERV float NULL,
  QTY_TOTAL_RESERV float NULL,
  QTY_TOTAL_MFC float NULL,
  QTY_TOTAL_SZP float NULL,
  QTY_TOTAL_WRH float NULL,
  QTY_TOTAL_TI float NULL,
  QTY_TOTAL_INVALID float NULL,
  QTY_FROM_RZP float NULL,
  QTY_CONFIRMED float NULL,
  QTY_UNCONFIRMED float NULL,
  QTY_UNSHIPPED float NULL,
  QTY_DELIVERED float NULL,
  QTY_UNDELIVERED float NULL,
  QTY_INPTH float NULL,
  QTY_OMTS float NULL,
  QTY_REAL_POT float NULL,
  QTY_TOTAL_DEFICIT float NULL,
  LAST_PRC float NULL,
  ISACTIVE int DEFAULT 1 NULL
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Обеспеченность',N'SCHEMA',N'dbo','TABLE',N'OKP_OBSP'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'Предмет Ссылка на OKP_NOM.RWC', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'RWC_NOM'
EXEC sp_addextendedproperty 'MS_Description', N'Склад OKP_WRH.WRH_ID', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'WRH_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'EIZ'
EXEC sp_addextendedproperty 'MS_Description', N'Страховой запас', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_SZP'
EXEC sp_addextendedproperty 'MS_Description', N'Запас на складе', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_WRH'
EXEC sp_addextendedproperty 'MS_Description', N'Для перемещения', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_TI'
EXEC sp_addextendedproperty 'MS_Description', N'Остаток по резерву', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_MFC'
EXEC sp_addextendedproperty 'MS_Description', N'Неликвид', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_INVALID'
EXEC sp_addextendedproperty 'MS_Description', N'На ответхранении', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_OTV'
EXEC sp_addextendedproperty 'MS_Description', N'Дефицит по складу', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_DEFICIT'
EXEC sp_addextendedproperty 'MS_Description', N'Цена за ЕИЗ', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'PRC'
EXEC sp_addextendedproperty 'MS_Description', N'1 - На инвентаризации; 0 - Нет', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'ON_INV'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая потребность', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_PLAN_POT'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая потребность за исключением остановленных ПрП', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_PLAN_POT_MINUS_STOPED'
EXEC sp_addextendedproperty 'MS_Description', N'Производственный резерв по складу', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_RESERV'
EXEC sp_addextendedproperty 'MS_Description', N'Производственный резерв общий', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_TOTAL_RESERV'
EXEC sp_addextendedproperty 'MS_Description', N'Остаток по резерву общий', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_TOTAL_MFC'
EXEC sp_addextendedproperty 'MS_Description', N'Страховой запас общий', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_TOTAL_SZP'
EXEC sp_addextendedproperty 'MS_Description', N'Количество на складах', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_TOTAL_WRH'
EXEC sp_addextendedproperty 'MS_Description', N'Для перемещения всего', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_TOTAL_TI'
EXEC sp_addextendedproperty 'MS_Description', N'Общее количество неликвида', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_TOTAL_INVALID'
EXEC sp_addextendedproperty 'MS_Description', N'Всего заявлено (Подтвержденные + Неподтвержденные) (За исключением замороженных)', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_FROM_RZP'
EXEC sp_addextendedproperty 'MS_Description', N'Подтверждено заявками', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_CONFIRMED'
EXEC sp_addextendedproperty 'MS_Description', N'Неподтверждено', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_UNCONFIRMED'
EXEC sp_addextendedproperty 'MS_Description', N'Неотгружено (по подтвержденным заявкам)', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_UNSHIPPED'
EXEC sp_addextendedproperty 'MS_Description', N'Доставлено всего (по всем заявкам)', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_DELIVERED'
EXEC sp_addextendedproperty 'MS_Description', N'Недоставлено (по подтвержденным заявкам)', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_UNDELIVERED'
EXEC sp_addextendedproperty 'MS_Description', N'В пути', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_INPTH'
EXEC sp_addextendedproperty 'MS_Description', N'Потребность по ОМТС (Общая)', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_OMTS'
EXEC sp_addextendedproperty 'MS_Description', N'Реальная потребность (с учётом всех заявок и пр.)', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_REAL_POT'
EXEC sp_addextendedproperty 'MS_Description', N'Дефицит общий (по всем складам)', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_TOTAL_DEFICIT'
EXEC sp_addextendedproperty 'MS_Description', N'Последняя цена прихода', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'LAST_PRC'
GO

--
-- Definition for table OKP_OPLAN : 
--

CREATE TABLE dbo.OKP_OPLAN (
  ID int IDENTITY(1, 1) NOT NULL,
  DEP_ID int NOT NULL,
  PNAME varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  DATECREATION datetime NOT NULL,
  CREATOR varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  DATEMODIFICATION datetime NOT NULL,
  MODIFICATOR varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  L_LIM datetime NOT NULL,
  R_LIM datetime NOT NULL,
  STATUS int NOT NULL,
  DATENULLIFICATION datetime NULL,
  NULLIFICATOR varchar(100) COLLATE DATABASE_DEFAULT NULL,
  NR int DEFAULT 0 NOT NULL,
  PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Журнал производственных планов', N'schema', N'dbo', N'table', N'OKP_OPLAN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Иденификатор документа', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID цеха-владелеца', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'DEP_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'PNAME'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата создания', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'DATECREATION'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кем создано', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'CREATOR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата последнего изменения', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'DATEMODIFICATION'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кем изменено', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'MODIFICATOR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Левая граница диапазона', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'L_LIM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Правая граница диапазона', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'R_LIM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Статус : 1-действующий, 0 - аннулированый', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'STATUS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата аннулирования', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'DATENULLIFICATION'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кем аннулированно', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'NULLIFICATOR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Признак отсутствия контроля связей 0-контроль, 1- контроля нет', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'NR'
GO

--
-- Definition for table OKP_OPLAN_DATA : 
--

CREATE TABLE dbo.OKP_OPLAN_DATA (
  ID int IDENTITY(1, 1) NOT NULL,
  OPLAN_ID int NOT NULL,
  TOZ_ID int NOT NULL,
  ORDERNUM int NOT NULL,
  PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'ДАННЫЕ ЖУРНАЛА ПРОИЗВОДСТВЕННЫХ ПЛАНОВ', N'schema', N'dbo', N'table', N'OKP_OPLAN_DATA'
EXEC sp_addextendedproperty 'MS_Description', N'идентификатор записи журнала', N'schema', N'dbo', N'table', N'OKP_OPLAN_DATA', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'номер плана', N'schema', N'dbo', N'table', N'OKP_OPLAN_DATA', N'column', N'OPLAN_ID'
EXEC sp_addextendedproperty 'MS_Description', N'идентификатор операции', N'schema', N'dbo', N'table', N'OKP_OPLAN_DATA', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'порядковый номер в документе', N'schema', N'dbo', N'table', N'OKP_OPLAN_DATA', N'column', N'ORDERNUM'
GO

--
-- Definition for table OKP_PaspList : 
--

CREATE TABLE dbo.OKP_PaspList (
  RWC int IDENTITY(1, 1) NOT NULL,
  PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NULL,
  NPR varchar(50) COLLATE DATABASE_DEFAULT NULL,
  DTZ datetime NULL,
  DTV datetime NULL,
  PRT varchar(50) COLLATE DATABASE_DEFAULT NULL,
  NMP varchar(100) COLLATE DATABASE_DEFAULT NULL,
  QCYPQY float NULL,
  QCYFQY float NULL,
  ConfirmDate datetime NULL,
  FPDTE datetime NULL,
  DTEU datetime NULL,
  Zakaz varchar(100) COLLATE DATABASE_DEFAULT NULL,
  dateEsc datetime NULL,
  dtes datetime NULL,
  INR varchar(3) COLLATE DATABASE_DEFAULT NULL,
  ReplaceDocNum varchar(3) COLLATE DATABASE_DEFAULT NULL,
  Protsh varchar(3) COLLATE DATABASE_DEFAULT NULL,
  UBR varchar(3) COLLATE DATABASE_DEFAULT NULL,
  FIO_UPR varchar(50) COLLATE DATABASE_DEFAULT NULL,
  FIO_PPP varchar(100) COLLATE DATABASE_DEFAULT NULL,
  FIO_UPP varchar(50) COLLATE DATABASE_DEFAULT NULL,
  FIO_DISP varchar(100) COLLATE DATABASE_DEFAULT NULL,
  PRS varchar(100) COLLATE DATABASE_DEFAULT NULL,
  NUM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  Status int NULL,
  CREATOR varchar(100) COLLATE DATABASE_DEFAULT NULL,
  DateCreation datetime NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица - журнал паспорта', N'schema', N'dbo', N'table', N'OKP_PaspList'
GO

EXEC sp_addextendedproperty 'MS_Description', N'служебное поле-счетчик', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'RWC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'плановая позиция ', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'PPPNUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'направление реализации', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'NPR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'плановая дата запуска ', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'DTZ'
GO

EXEC sp_addextendedproperty 'MS_Description', N'плановая дата выпуска ', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'DTV'
GO

EXEC sp_addextendedproperty 'MS_Description', N'обозначение плановой позиции', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'PRT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'наименование плановой позиции', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'NMP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'плановое количество', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'QCYPQY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'фактическое количество', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'QCYFQY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'дата утв. предмета в технологической базе', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'ConfirmDate'
GO

EXEC sp_addextendedproperty 'MS_Description', N'дата планирования плановой позиции', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'FPDTE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'дата утв. плановой позиции', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'DTEU'
GO

EXEC sp_addextendedproperty 'MS_Description', N'заказ', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'Zakaz'
GO

EXEC sp_addextendedproperty 'MS_Description', N'дата формирования сопроводительного листа', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'dateEsc'
GO

EXEC sp_addextendedproperty 'MS_Description', N'дата сдачи на склад', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'dtes'
GO

EXEC sp_addextendedproperty 'MS_Description', N'наличие изменений в нормах и потребностях', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'INR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'наличие замен СиМ и ПКИ', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'ReplaceDocNum'
GO

EXEC sp_addextendedproperty 'MS_Description', N'наличие изменений в маршрутах', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'Protsh'
GO

EXEC sp_addextendedproperty 'MS_Description', N'наличие данных о браке', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'UBR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ФИО утв. технолога', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'FIO_UPR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ФИО плановика', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'FIO_PPP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ФИО плановика', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'FIO_UPP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ФИО диспетчера', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'FIO_DISP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'МОЛ склада', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'PRS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'партия верхнего уровня', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'NUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'статус актуальности', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'Status'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кто создал паспорт', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'CREATOR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата создания', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'DateCreation'
GO

/*
** Definition for table OKP_PERSON : 
*/
CREATE TABLE dbo.OKP_PERSON (
	ID int IDENTITY(1, 1) NOT NULL,
	FIO varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
	EXTENTION varchar(100) COLLATE DATABASE_DEFAULT NULL,
	STATE int DEFAULT 1 NOT NULL,
	CTR_ID bigint NULL,
	DESCRIBE varchar(1000) COLLATE DATABASE_DEFAULT NULL,
	job_id INT NULL,
	CONSTRAINT PK_OKP_PERSON PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Контактные лица', N'schema', N'dbo', N'table', N'OKP_PERSON'
EXEC sp_addextendedproperty 'MS_Description', N'ID контакта', N'schema', N'dbo', N'table', N'OKP_PERSON', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ФИО', N'schema', N'dbo', N'table', N'OKP_PERSON', N'column', N'FIO'
EXEC sp_addextendedproperty 'MS_Description', N'Дополнительная информация', N'schema', N'dbo', N'table', N'OKP_PERSON', N'column', N'EXTENTION'
EXEC sp_addextendedproperty 'MS_Description', N'Работает', N'schema', N'dbo', N'table', N'OKP_PERSON', N'column', N'STATE'
EXEC sp_addextendedproperty 'MS_Description', N'ID контрагента', N'schema', N'dbo', N'table', N'OKP_PERSON', N'column', N'CTR_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'OKP_PERSON', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'ID должности', N'schema', N'dbo', N'table', N'OKP_PERSON', N'column', N'job_id'
GO

--
-- Definition for table OKP_PLO : 
--

CREATE TABLE dbo.OKP_PLO (
  ID bigint IDENTITY(1, 1) NOT NULL,
  DOC_ID bigint NOT NULL,
  VID int CONSTRAINT DF_PLO_VID DEFAULT 1 NOT NULL,
  TYP int CONSTRAINT DF_PLO_TYP DEFAULT 0 NOT NULL,
  PRI int CONSTRAINT DF_PLO_PRI DEFAULT 50 NOT NULL,
  STS int CONSTRAINT DF_OKP_PLO_STS DEFAULT 0 NOT NULL,
  DTE_Z datetime NULL,
  DTE_V datetime NULL,
  DESCRIBE varchar(100) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_PLO PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Справочник заказов ("СБЫТ")', N'schema', N'dbo', N'table', N'OKP_PLO'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи в журнале (OKP_DOCs.ID)', N'schema', N'dbo', N'table', N'OKP_PLO', N'column', N'DOC_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Вид заказа: 1 - производственный заказ 2 - заказ на покупку 3 - заказ на кооперацию ', N'schema', N'dbo', N'table', N'OKP_PLO', N'column', N'VID'
EXEC sp_addextendedproperty 'MS_Description', N'Тип заказа: 0 - обычный 1 - госзаказ', N'schema', N'dbo', N'table', N'OKP_PLO', N'column', N'TYP'
EXEC sp_addextendedproperty 'MS_Description', N'Приоритет документа "Заказ" - от 1 до 100.   1 -   высший   100 - самый низкий', N'schema', N'dbo', N'table', N'OKP_PLO', N'column', N'PRI'
EXEC sp_addextendedproperty 'MS_Description', N'Статус заказа: 0 - неактивен (по заказу нет ни одной плановой позиции) 1 - в работе - хотя бы одна из плановых позиций заказа находятся в одном из следующих состояний (см. OKP_PPP.STS):      0 - поставлена в план (не подтверждена)      1 - подтверждена      2 - в производстве      5 - остановлена ("заморожена")    и НЕ выполнено условие "просрочен" (см. ниже)2 - просрочен - хотя бы одна из плановых позиций заказа находится в одном из следующих состояний (см. OKP_PPP.STS):      6 - просрочена (не подтверждена)      3 - в производстве и просрочена3 - завершён - ВСЕ имеющиеся плановые позиции заказа находятся в одном из следующих состояний (см. OKP_PPP.STS):      4 - завершена      8 - сдана на склад4 - в архиве - ВСЕ позиции заказа ПОЛНОСТЬЮ сданы в архивПримечание:   - на значение статуса заказа НЕ влияют записи БЕЗ плановых позиций (за исключением статуса 0)', N'schema', N'dbo', N'table', N'OKP_PLO', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'Планируемая дата запуска заказа', N'schema', N'dbo', N'table', N'OKP_PLO', N'column', N'DTE_Z'
EXEC sp_addextendedproperty 'MS_Description', N'Планируемая дата выпуска заказа', N'schema', N'dbo', N'table', N'OKP_PLO', N'column', N'DTE_V'
EXEC sp_addextendedproperty 'MS_Description', N'Описание', N'schema', N'dbo', N'table', N'OKP_PLO', N'column', N'DESCRIBE'
GO

--
-- Definition for table OKP_PLOData : 
--

CREATE TABLE dbo.OKP_PLOData (
  ID bigint IDENTITY(1, 1) NOT NULL,
  PLO_ID bigint NOT NULL,
  REQData_ID bigint NULL,
  NOMDATA_ID bigint NOT NULL,
  LIN int NOT NULL,
  USER_ID int NOT NULL,
  DTE_CR datetime DEFAULT getdate() NOT NULL,
  QTY_P float NOT NULL,
  PRI int CONSTRAINT DF_PLOData_PRI DEFAULT 50 NOT NULL,
  STZ int DEFAULT 0 NOT NULL,
  FOLD float DEFAULT 0 NOT NULL,
  CONSTRAINT PK_PLOData PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Данные документов-заказов ("СБЫТ")', N'schema', N'dbo', N'table', N'OKP_PLOData'
EXEC sp_addextendedproperty 'MS_Description', N'ID документа (заказа) (OKP_PLO.ID)', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'PLO_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID элемента заявки (OKP_REQDATA.ID)', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'REQData_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID номенклатурной позиции (OKP_NOMDATA.ID)', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'NOMDATA_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Номер позиции в документе', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'LIN'
EXEC sp_addextendedproperty 'MS_Description', N'ID пользователя создавшего/изменившего запись (OKP_USERS.USER_ID)', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата создания записи (автоматическая)', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'DTE_CR'
EXEC sp_addextendedproperty 'MS_Description', N'Плановое количество выпуска', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'QTY_P'
EXEC sp_addextendedproperty 'MS_Description', N'Приоритет позиции заказа (приоритет постановки в план) - от 1 до 100.   1 -   высший   100 - самый низкий', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'PRI'
EXEC sp_addextendedproperty 'MS_Description', N'Код сотояния позиции заказа:   0 - принята (факт создания записи в БД)   1 - подтверждена (может стать позицией в производственном плане)', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'STZ'
EXEC sp_addextendedproperty 'MS_Description', N'Готовых в архивных ПП', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'FOLD'
GO


/* OKP_PPPDEP
** Таблица показывает подразделения, через которые прошла PPP в своих TOZ
** В коде будет заменена на f_PppCanSee, но удаляться не будет - пока её будущее туманное
*/
CREATE TABLE dbo.OKP_PPPDEP (
  ID bigint IDENTITY(1, 1) NOT NULL,
  RWC_PPP bigint NOT NULL,
  RWC_DEP int NOT NULL
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Связь ПлП с полдразделениями', N'schema', N'dbo', N'table', N'OKP_PPPDEP'
EXEC sp_addextendedproperty 'MS_Description', N'ID связи', 'schema', 'dbo', 'table', 'OKP_PPPDEP', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ид ПлП', 'schema', 'dbo', 'table', 'OKP_PPPDEP', 'column', 'RWC_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'Ид подразделения', 'schema', 'dbo', 'table', 'OKP_PPPDEP', 'column', 'RWC_DEP'
go

/*
** Definition for table OKP_PPR : 
*/
CREATE TABLE dbo.OKP_PPR (
    ID int IDENTITY(1, 1) NOT NULL,
    DateBegin bigint NOT NULL,
    DateEnd bigint NOT NULL,
	wpl_id INT NOT NULL,
    CONSTRAINT PK_OKP_PPR PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Планово-предупредительный ремонт', N'schema', N'dbo', N'table', N'OKP_PPR'
EXEC sp_addextendedproperty 'MS_Description', N'ID ППР', 'schema', 'dbo', 'table', 'OKP_PPR', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Время начала', 'schema', 'dbo', 'table', 'OKP_PPR', 'column', 'DateBegin'
EXEC sp_addextendedproperty 'MS_Description', N'Время завершения', 'schema', 'dbo', 'table', 'OKP_PPR', 'column', 'DateEnd'
EXEC sp_addextendedproperty 'MS_Description', N'ID РМ', 'schema', 'dbo', 'table', 'OKP_PPR', 'column', 'wpl_id'
GO

--
-- Definition for table OKP_PRZ : 
--

CREATE TABLE dbo.OKP_PRZ (
  ID bigint IDENTITY(1, 1) NOT NULL,
  DOC_ID bigint NOT NULL,
  DTE_1 datetime NOT NULL,
  DTE_2 datetime NOT NULL,
  PRD int CONSTRAINT DF_PRZ_PRD DEFAULT 0 NOT NULL,
  CONSTRAINT PK_PRZ PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Справочник прогнозов сбыта', N'schema', N'dbo', N'table', N'OKP_PRZ'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи в журнале (OKP_DOCs.ID)', N'schema', N'dbo', N'table', N'OKP_PRZ', N'column', N'DOC_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Начальная дата прогноза', N'schema', N'dbo', N'table', N'OKP_PRZ', N'column', N'DTE_1'
EXEC sp_addextendedproperty 'MS_Description', N'Конечная дата прогноза', N'schema', N'dbo', N'table', N'OKP_PRZ', N'column', N'DTE_2'
EXEC sp_addextendedproperty 'MS_Description', N'Размер периода прогноза. Код периода: 0 - год 1 - квартал 2 - месяц 3 - декада 4 - неделя 5 - день.', N'schema', N'dbo', N'table', N'OKP_PRZ', N'column', N'PRD'
GO

--
-- Definition for table OKP_PRZData : 
--

CREATE TABLE dbo.OKP_PRZData (
  ID int IDENTITY(1, 1) NOT NULL,
  PRZ_ID bigint NOT NULL,
  NOMDATA_ID bigint NOT NULL,
  LIN int NOT NULL,
  QTY float CONSTRAINT DF_PRZData_QTY DEFAULT 0 NOT NULL,
  PRC money CONSTRAINT DF_PRZData_PRC DEFAULT 0 NOT NULL,
  CONSTRAINT PK_PRZData PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Состав прогноза', N'schema', N'dbo', N'table', N'OKP_PRZData'
EXEC sp_addextendedproperty 'MS_Description', N'ID документа прогноза (OKP_PRZ.ID)', N'schema', N'dbo', N'table', N'OKP_PRZData', N'column', N'PRZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID номенклатурной позиции (OKP_NOMDATA.ID)', N'schema', N'dbo', N'table', N'OKP_PRZData', N'column', N'NOMDATA_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Номер строки в документе', N'schema', N'dbo', N'table', N'OKP_PRZData', N'column', N'LIN'
EXEC sp_addextendedproperty 'MS_Description', N'Количество прогноза', N'schema', N'dbo', N'table', N'OKP_PRZData', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Оптовая цена ТМЦ за единицу', N'schema', N'dbo', N'table', N'OKP_PRZData', N'column', N'PRC'
GO

/*
** Предметы поставки
*/
CREATE TABLE dbo.OKP_PUR (
	ID bigint IDENTITY(1, 1) NOT NULL,
	NOM_ID int NOT NULL,
	USR varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	SDDCLE float DEFAULT 0 NOT NULL,
	SDDCPC float DEFAULT 0 NOT NULL,
	SDDORG float DEFAULT 0 NOT NULL,
	SDDTME float DEFAULT 0 NOT NULL,
	INS varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_PUR_INS DEFAULT 'N' NOT NULL,
	GODPRC float CONSTRAINT df__okp_pur__godprc DEFAULT 0 NOT NULL,
	GODDEV float CONSTRAINT DF_OKP_PUR_GODDEV DEFAULT 0 NOT NULL,
	FLLIDN varchar(50) COLLATE DATABASE_DEFAULT NULL,
	GODGOD float CONSTRAINT DF_OKP_PUR_GODGOD DEFAULT 100 NOT NULL,
	QTYRAB float DEFAULT 0 NULL,
	Comment varchar(255) COLLATE DATABASE_DEFAULT NULL,
	MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
	CONSTRAINT PK_OKP_PUR PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Данные о поставке предметов', N'schema', N'dbo', N'table', N'OKP_PUR'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор предмета', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор ответственного снабженца', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'USR'
EXEC sp_addextendedproperty 'MS_Description', N'Стандартный цикл поставки (дни)', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'SDDCLE'
EXEC sp_addextendedproperty 'MS_Description', N'Период специфицирования (дни)', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'SDDCPC'
EXEC sp_addextendedproperty 'MS_Description', N'Цикл организации закупки (дни)', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'SDDORG'
EXEC sp_addextendedproperty 'MS_Description', N'Цикл проверки годности (дни)', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'SDDTME'
EXEC sp_addextendedproperty 'MS_Description', N'Способ испекции качества (N, P, C): N - не проверятся; P - проверяется часть количества; C - проверяется всё количество', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'INS'
EXEC sp_addextendedproperty 'MS_Description', N'Процент проверяемого количества (если INS=P)', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'GODPRC'
EXEC sp_addextendedproperty 'MS_Description', N'Процент отклонения количества от заявки', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'GODDEV'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор инструкции инспекции качества', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'FLLIDN'
EXEC sp_addextendedproperty 'MS_Description', N'Процент годных для принятия партии', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'GODGOD'
EXEC sp_addextendedproperty 'MS_Description', N'Рабочее поле', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'QTYRAB'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'Comment'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'MET'
GO

--
-- Definition for table OKP_RAS : 
--

CREATE TABLE dbo.OKP_RAS (
  ID int IDENTITY(1, 1) NOT NULL,
  TRS_ID int NOT NULL,
  EIZ_ID int NOT NULL,
  GOG varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  NFL varchar(10) COLLATE DATABASE_DEFAULT NULL,
  DTE_ARR datetime NOT NULL,
  QTY_D real NOT NULL,
  CONSTRAINT PK_RAS PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Данные расписания доставки', N'schema', N'dbo', N'table', N'OKP_RAS'
EXEC sp_addextendedproperty 'MS_Description', N'ID транспорта (OKP_TRS.ID)', N'schema', N'dbo', N'table', N'OKP_RAS', N'column', N'TRS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID единицы времени доставки (OKP_EIZ.ID)', N'schema', N'dbo', N'table', N'OKP_RAS', N'column', N'EIZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Пункт доставки', N'schema', N'dbo', N'table', N'OKP_RAS', N'column', N'GOG'
EXEC sp_addextendedproperty 'MS_Description', N'Номер рейса (если есть)', N'schema', N'dbo', N'table', N'OKP_RAS', N'column', N'NFL'
EXEC sp_addextendedproperty 'MS_Description', N'Дата прибытия', N'schema', N'dbo', N'table', N'OKP_RAS', N'column', N'DTE_ARR'
EXEC sp_addextendedproperty 'MS_Description', N'Период доставки (указано в единицах EIZID)', N'schema', N'dbo', N'table', N'OKP_RAS', N'column', N'QTY_D'
GO

/*
** Параметры, привязанные к отчёту
*/
CREATE TABLE dbo.OKP_ReportParameters (
	ID int NOT NULL,
	paramType int NOT NULL,
	paramAdditional varchar(255) COLLATE DATABASE_DEFAULT NULL,
	Gravity int NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Список параметров для отчетов', N'schema', N'dbo', N'table', N'OKP_ReportParameters'
EXEC sp_addextendedproperty 'MS_Description', N'ссылка на id отчета (OKP_Reports.ID)', N'schema', N'dbo', N'table', N'OKP_ReportParameters', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'id параметра', N'schema', N'dbo', N'table', N'OKP_ReportParameters', N'column', N'paramType'
EXEC sp_addextendedproperty 'MS_Description', N'Дополнительно (Сообщение при осутствии данных выборки)', N'schema', N'dbo', N'table', N'OKP_ReportParameters', N'column', N'paramAdditional'
EXEC sp_addextendedproperty 'MS_Description', N'Порядок отображения параметров отчета', N'schema', N'dbo', N'table', N'OKP_ReportParameters', N'column', N'Gravity'
GO

/*
** Отчёты
*/
CREATE TABLE dbo.OKP_Reports (
	ID int IDENTITY(1, 1) NOT NULL,
	Name varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
	scriptFileName varchar(255) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_Reports_spxFileName DEFAULT '' NOT NULL,
	Comment varchar(255) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_Reports_Comment DEFAULT '' NOT NULL,
	query text COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_Reports_query DEFAULT '' NOT NULL,
	UID uniqueidentifier DEFAULT newid() NOT NULL,
	Description varchar(250) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
	File_ID int DEFAULT 1 NOT NULL,
	DTE datetime CONSTRAINT df__okp_reports__dte DEFAULT getdate() NOT NULL, 	
	CONSTRAINT PK_OKP_Reports PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Список зарегистрированных отчетов', N'schema', N'dbo', N'table', N'OKP_Reports'
EXEC sp_addextendedproperty 'MS_Description', N'Индентификатор отчёта', N'schema', N'dbo', N'table', N'OKP_Reports', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Имя отчёта', N'schema', N'dbo', N'table', N'OKP_Reports', N'column', N'Name'
EXEC sp_addextendedproperty 'MS_Description', N'Имя скрипта', N'schema', N'dbo', N'table', N'OKP_Reports', N'column', N'scriptFileName'
EXEC sp_addextendedproperty 'MS_Description', N'Запрос отчёта', N'schema', N'dbo', N'table', N'OKP_Reports', N'column', N'query'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный идентификатор отчета', N'schema', N'dbo', N'table', N'OKP_Reports', N'column', N'UID'
EXEC sp_addextendedproperty 'MS_Description', N'Описание отчета', N'schema', N'dbo', N'table', N'OKP_Reports', N'column', N'Description'
EXEC sp_addextendedproperty 'MS_Description', N'ID файла в таблице OKP_FILES - хранение превьюшки отчета', N'schema', N'dbo', N'table', N'OKP_Reports', N'column', N'File_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата редактирования отчета', N'schema', N'dbo', N'table', N'OKP_Reports', N'column', N'DTE'
GO

--
-- Definition for table OKP_ReportsBlanks : 
--
CREATE TABLE dbo.OKP_ReportsBlanks (
  ID int NOT NULL,
  FileData image NOT NULL,
  CONSTRAINT PK_OKP_ReportsBlanks PRIMARY KEY CLUSTERED (ID)
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Файлы бланков отчетов', N'schema', N'dbo', N'table', N'OKP_ReportsBlanks'
EXEC sp_addextendedproperty 'MS_Description', N'Индентификатор файла', N'schema', N'dbo', N'table', N'OKP_ReportsBlanks', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Бинарный файл бланка отчета', N'schema', N'dbo', N'table', N'OKP_ReportsBlanks', N'column', N'FileData'
Go

--
-- Definition for table OKP_ReportsBlanksNames : 
--
CREATE TABLE dbo.OKP_ReportsBlanksNames (
  ReportID int NOT NULL,
  BlankID int NOT NULL,
  Number int CONSTRAINT DF_OKP_ReportsBlanksNames_Number DEFAULT 0 NOT NULL,
  BlankName varchar(255) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_ReportsBlanksNames_BlankName DEFAULT '' NOT NULL,
  BlankVersion varchar(10) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_OKP_ReportsBlanksNames PRIMARY KEY CLUSTERED (ReportID, BlankID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Описание бланков отчетов', N'schema', N'dbo', N'table', N'OKP_ReportsBlanksNames'
EXEC sp_addextendedproperty 'MS_Description', N'Индентификатор отчёта', N'schema', N'dbo', N'table', N'OKP_ReportsBlanksNames', N'column', N'ReportID'
EXEC sp_addextendedproperty 'MS_Description', N'Индентификатор бланка', N'schema', N'dbo', N'table', N'OKP_ReportsBlanksNames', N'column', N'BlankID'
EXEC sp_addextendedproperty 'MS_Description', N'Порядковый номер бланка для данного отчёта', N'schema', N'dbo', N'table', N'OKP_ReportsBlanksNames', N'column', N'Number'
EXEC sp_addextendedproperty 'MS_Description', N'Имя файла бланка', N'schema', N'dbo', N'table', N'OKP_ReportsBlanksNames', N'column', N'BlankName'
EXEC sp_addextendedproperty 'MS_Description', N'Версия бланка', N'schema', N'dbo', N'table', N'OKP_ReportsBlanksNames', N'column', N'BlankVersion'
GO

--
-- Definition for table OKP_ReportsScripts : 
--
CREATE TABLE dbo.OKP_ReportsScripts (
  ID int NOT NULL,
  FileData image NOT NULL,
  CONSTRAINT PK_OKP_ReportsScripts PRIMARY KEY CLUSTERED (ID)
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Файлы скриптов отчетов', N'schema', N'dbo', N'table', N'OKP_ReportsScripts'
EXEC sp_addextendedproperty 'MS_Description', N'Индентификатор файла', N'schema', N'dbo', N'table', N'OKP_ReportsScripts', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Бинарный файл скрипта отчета', N'schema', N'dbo', N'table', N'OKP_ReportsScripts', N'column', N'FileData'
Go

--
-- Definition for table OKP_REQ : 
--

CREATE TABLE dbo.OKP_REQ (
  ID bigint IDENTITY(1, 1) NOT NULL,
  DOC_ID bigint NULL,
  CONTRACT_ID bigint NULL,
  CTR_ID bigint NULL,
  TYP int CONSTRAINT DF_REQ_TYP DEFAULT 0 NOT NULL,
  PRI int CONSTRAINT DF_REQ_PRI DEFAULT 50 NOT NULL,
  DESCRIBE varchar(100) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_REQ PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Справочник заявок', N'schema', N'dbo', N'table', N'OKP_REQ'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи в журнале (OKP_DOCs.ID)', N'schema', N'dbo', N'table', N'OKP_REQ', N'column', N'DOC_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID договора (OKP_CONTRACT.ID)', N'schema', N'dbo', N'table', N'OKP_REQ', N'column', N'CONTRACT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID контрагента (OKP_CTR.ID)', N'schema', N'dbo', N'table', N'OKP_REQ', N'column', N'CTR_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Тип заявки: 0 - обычная 1 - госзаказ', N'schema', N'dbo', N'table', N'OKP_REQ', N'column', N'TYP'
EXEC sp_addextendedproperty 'MS_Description', N'Приоритет документа "Заявка" - от 1 до 100.   1 -   высший   100 - самый низкий', N'schema', N'dbo', N'table', N'OKP_REQ', N'column', N'PRI'
EXEC sp_addextendedproperty 'MS_Description', N'Описание', N'schema', N'dbo', N'table', N'OKP_REQ', N'column', N'DESCRIBE'
GO

--
-- Definition for table OKP_REQData : 
--

CREATE TABLE dbo.OKP_REQData (
  ID int IDENTITY(1, 1) NOT NULL,
  REQ_ID bigint NOT NULL,
  NOMDATA_ID bigint NOT NULL,
  LIN int NOT NULL,
  DTE_CR datetime DEFAULT getdate() NOT NULL,
  DTE datetime NOT NULL,
  DTE_L datetime NULL,
  DTE_IK datetime NULL,
  REG int CONSTRAINT DF_REQData_REG DEFAULT 0 NOT NULL,
  ORD int NULL,
  STZ int DEFAULT 0 NOT NULL,
  PRI int CONSTRAINT DF_REQData_PRI DEFAULT 50 NOT NULL,
  PRC money CONSTRAINT DF_REQData_PRC DEFAULT 0 NOT NULL,
  QTY_Z float(53) CONSTRAINT DF_REQData_QTY_Z DEFAULT 0 NOT NULL,
  QTY_O float(53) CONSTRAINT DF_REQData_QTY_O DEFAULT 0 NOT NULL,
  QTY_IK float(53) CONSTRAINT DF_REQData_QTY_IK DEFAULT 0 NOT NULL,
  USER_ID int NOT NULL,
  Fold_I float(53) NULL,
  Fold_D datetime NULL,
  CONSTRAINT PK_REQData PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Состав заявки', N'schema', N'dbo', N'table', N'OKP_REQData'
EXEC sp_addextendedproperty 'MS_Description', N'ID заявки (OKP_REQ.ID)', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'REQ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID номенклатурной позиции (OKP_NOM.RWC)', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'NOMDATA_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Номер строки в документе', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'LIN'
EXEC sp_addextendedproperty 'MS_Description', N'Начальная дата поставки', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Конечная дата поставки', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'DTE_L'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последнй отгрузки', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'DTE_IK'
EXEC sp_addextendedproperty 'MS_Description', N'Код периода разбиения времени поставки (от DTE до DTE_L): 0 - год 1 - квартал 2 - месяц 3 - декада 4 - неделя 5 - день', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'REG'
EXEC sp_addextendedproperty 'MS_Description', N'Порядковый номер поставки', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'ORD'
EXEC sp_addextendedproperty 'MS_Description', N'Код сотояния позиции заявки: 0 - принята (факт создания записи в БД) 1 - подтверждена (может стать позицией в заказе)', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'STZ'
EXEC sp_addextendedproperty 'MS_Description', N'Приоритет позиции заявки (приоритет постановки в план) - от 1 до 100.   1 -   высший   100 - самый низкий', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'PRI'
EXEC sp_addextendedproperty 'MS_Description', N'Оптовая цена ТМЦ за единицу', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'PRC'
EXEC sp_addextendedproperty 'MS_Description', N'Заявленное количество', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'QTY_Z'
EXEC sp_addextendedproperty 'MS_Description', N'Оплаченное количество', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'QTY_O'
EXEC sp_addextendedproperty 'MS_Description', N'Отгруженное количество', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'QTY_IK'
EXEC sp_addextendedproperty 'MS_Description', N'ID пользователя создавшего/изменившего запись (OKP_USERS.USER_ID)', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Свёртка QTY_IK', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'Fold_I'
EXEC sp_addextendedproperty 'MS_Description', N'Свёртка DTE_IK', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'Fold_D'
GO

--
-- Definition for table OKP_RZP : 
--

CREATE TABLE OKP_RZP (
	ID bigint IDENTITY(1,1) NOT NULL,
	RZP_IDN varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	CONTRACT_ID bigint NULL,
	DTE_CRT datetime NOT NULL DEFAULT (getdate()),
	USR varchar(50) COLLATE DATABASE_DEFAULT NULL,
	STS int NOT NULL DEFAULT (0),
	DTE datetime NULL DEFAULT (getdate()),
	SUP_IDN varchar(10) COLLATE DATABASE_DEFAULT NULL,
	SUP_NAME varchar(50) COLLATE DATABASE_DEFAULT NULL,
	SUM_DOST float NOT NULL DEFAULT (0),
	RZP_MAX_DTE_POST datetime NULL,
	DTE_DELIV_FACT datetime NULL,
	FROZEN int NOT NULL DEFAULT (0),
	SUP_ID bigint NULL,
	CONSIGNEE_ID bigint NULL,
	GUID uniqueidentifier NULL,
	UPUTRS varchar(30) COLLATE DATABASE_DEFAULT NULL,
	RZP_MIN_DTE_POST datetime NULL,
	SUM_PUR float NULL,
	SUM_ALL float NULL,
	CLOSE_REJECT_ID int NULL,
	CLOSE_COMMENT varchar(255) COLLATE DATABASE_DEFAULT NULL,
    COMMENT varchar(255) COLLATE DATABASE_DEFAULT NULL,
    CONSTRAINT PK_OKP_RZP PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty N'MS_Description', N'Журнал заявок на поставку' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP'
EXEC sp_addextendedproperty N'MS_Description', N'Код заявки' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'ID'
EXEC sp_addextendedproperty N'MS_Description', N'ИД Идентификатор заявки' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'RZP_IDN'
EXEC sp_addextendedproperty N'MS_Description', N'ИД договора' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'CONTRACT_ID'
EXEC sp_addextendedproperty N'MS_Description', N'Дата создания записи' , N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP',N'COLUMN',N'DTE_CRT'
EXEC sp_addextendedproperty N'MS_Description', N'Пользователь' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP',N'COLUMN',N'USR'
EXEC sp_addextendedproperty N'MS_Description', N'Статус заявки: 0 - не подтверждена, 1 - подтверждена, 2 - завершен' ,N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP',N'COLUMN',N'STS'
EXEC sp_addextendedproperty N'MS_Description', N'Дата заявки' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'DTE'
EXEC sp_addextendedproperty N'MS_Description', N'ИД поставщика' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'SUP_IDN'
EXEC sp_addextendedproperty N'MS_Description', N'Наименование поставщика' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'SUP_NAME'
EXEC sp_addextendedproperty N'MS_Description', N'Сумма доставки' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'SUM_DOST'
EXEC sp_addextendedproperty N'MS_Description', N'Дата доставки по плану' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'RZP_MAX_DTE_POST'
EXEC sp_addextendedproperty N'MS_Description', N'Дата доставки по факту' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'DTE_DELIV_FACT'
EXEC sp_addextendedproperty N'MS_Description', N'Заморожена: 0 - Разморожена; 1 - Заморожена' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'FROZEN'
EXEC sp_addextendedproperty N'MS_Description', N'Идентификатор поставщика ' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'SUP_ID'
EXEC sp_addextendedproperty N'MS_Description', N'Идентификатор грузополучателя ' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'CONSIGNEE_ID'
EXEC sp_addextendedproperty N'MS_Description', N'Внутреннее служебное поле ' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'GUID'
EXEC sp_addextendedproperty N'MS_Description', N'Тип транспорта' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'UPUTRS'
EXEC sp_addextendedproperty N'MS_Description', N'Начальная дата поставки по плану' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'RZP_MIN_DTE_POST'
EXEC sp_addextendedproperty N'MS_Description', N'Сумма по КиМ' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'SUM_PUR'
EXEC sp_addextendedproperty N'MS_Description', N'Сумма всего' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'SUM_ALL'
EXEC sp_addextendedproperty N'MS_Description', N'Идентификатор причины завершения заявки вручную' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'CLOSE_REJECT_ID'
EXEC sp_addextendedproperty N'MS_Description', N'Комментарий причины завершения заявки вручную' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'CLOSE_COMMENT'
EXEC sp_addextendedproperty N'MS_Description', N'Комментарий' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'COMMENT'
GO

--
-- Definition for table OKP_RZP_DATA : 
--
--СОСТАВ ЗАЯВКИ НА ПОСТАВКУ
CREATE TABLE OKP_RZP_DATA (
	ID bigint IDENTITY(1,1) NOT NULL,
	ID_RZP bigint NOT NULL,
	QTYPOT float NOT NULL,
	PRC_PUR float NOT NULL,
	DTE_CONFIRMED datetime NULL,
	STS int NOT NULL DEFAULT (0),
	MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
	QTY float NOT NULL DEFAULT (0),
	RWC_NOM int NOT NULL,
	MIN_DTE_POT datetime NOT NULL,
	MIN_PLN_DTE_POST datetime NULL,
	UPU_ID bigint NULL,
	FROZEN int NOT NULL DEFAULT (0),
	DTE_SHP datetime NULL,
	QTY_SHP float NOT NULL DEFAULT (0),
	GUID uniqueidentifier NULL,
	WRH_id int NULL,
	QTY_FROM_POT float NULL DEFAULT (0),
	QTY_FROM_SZP float NULL DEFAULT (0),
	QTY_FOR_OTHER float NULL DEFAULT (0),
	IS_GENERATED int NULL DEFAULT (0),
	QTYMFC float NULL,
	QTYSZP float NULL,
	QTYWRH float NULL,
	QTYINV float NULL,
	QTYUNDELIVERED float NULL,
	QTYDEFICIT float NULL,
	QTYUNCONFIRMED float NULL,
	DTE_SHP_PLN datetime NULL,
	PRC_DOST float NULL,
	MAX_DTE_POT datetime NULL,
	MAX_PLN_DTE_POST datetime NULL,
	EIZ_POT varchar(10) COLLATE DATABASE_DEFAULT NULL,
	EIZ_POST varchar(10) COLLATE DATABASE_DEFAULT NULL,
	K_TO_POST float NULL,
	UPUTRS varchar(30) COLLATE DATABASE_DEFAULT NULL,
	TNP float NULL DEFAULT (1),
	TNP_COUNT int NULL,
	SUM_PUR float NULL,
	SUM_DOST float NULL,
	TOTAL float NULL,
	IMQTY float NULL,
    EXTNOM_ID int NULL,
    SDDPER float NULL,
 CONSTRAINT PK_OKP_RZP_DATA PRIMARY KEY CLUSTERED (ID)
 )
GO

EXEC sp_addextendedproperty N'MS_Description',N'Состав заявок на поставку',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA'
EXEC sp_addextendedproperty N'MS_Description',N'Идентификатор',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'ID'
EXEC sp_addextendedproperty N'MS_Description',N'Ссылка на заявку',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'ID_RZP'
EXEC sp_addextendedproperty N'MS_Description',N'Количество (заявлено)',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTYPOT'
EXEC sp_addextendedproperty N'MS_Description',N'Цена',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'PRC_PUR'
EXEC sp_addextendedproperty N'MS_Description',N'Дата подтверждения',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'DTE_CONFIRMED'
EXEC sp_addextendedproperty N'MS_Description',N'Статус',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'STS'
EXEC sp_addextendedproperty N'MS_Description',N'Метка',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'MET'
EXEC sp_addextendedproperty N'MS_Description',N'Количество (подтверждено) в ЕИЗ поставки ',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTY'
EXEC sp_addextendedproperty N'MS_Description',N'ИД номенклатуры',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'RWC_NOM'
EXEC sp_addextendedproperty N'MS_Description',N'Дата потребности',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'MIN_DTE_POT'
EXEC sp_addextendedproperty N'MS_Description',N'Дата поставки по плану',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'MIN_PLN_DTE_POST'
EXEC sp_addextendedproperty N'MS_Description',N'ИД Условия поставки',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'UPU_ID'
EXEC sp_addextendedproperty N'MS_Description',N'Заморожен',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'FROZEN'
EXEC sp_addextendedproperty N'MS_Description',N'Дата отгрузки',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'DTE_SHP'
EXEC sp_addextendedproperty N'MS_Description',N'Отгружено в ЕИЗ поставки ',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTY_SHP'
EXEC sp_addextendedproperty N'MS_Description',N'GUID-идентификатор (необходим для сопоставления данных со временной таблицей)',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'GUID'
EXEC sp_addextendedproperty N'MS_Description',N'Ссылка на назначенный склад',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'WRH_id'
EXEC sp_addextendedproperty N'MS_Description',N'Служебные поля - Количество из потребности',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTY_FROM_POT'
EXEC sp_addextendedproperty N'MS_Description',N'Служебные поля - Потребность по cтраховому запасу',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTY_FROM_SZP'
EXEC sp_addextendedproperty N'MS_Description',N'Служебные поля - для прочих целей',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTY_FOR_OTHER'
EXEC sp_addextendedproperty N'MS_Description',N'Служебные поля - Сгенерированная заявка',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'IS_GENERATED'
EXEC sp_addextendedproperty N'MS_Description',N'Снимок на момент создания - Остаток по резерву',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTYMFC'
EXEC sp_addextendedproperty N'MS_Description',N'Снимок на момент создания - Страховой запас',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTYSZP'
EXEC sp_addextendedproperty N'MS_Description',N'Снимок на момент создания - В наличии на складе',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTYWRH'
EXEC sp_addextendedproperty N'MS_Description',N'Снимок на момент создания - Неликвид на складе',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTYINV'
EXEC sp_addextendedproperty N'MS_Description',N'Снимок на момент создания - Недоставлено',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTYUNDELIVERED'
EXEC sp_addextendedproperty N'MS_Description',N'Дефицит по складам',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTYDEFICIT'
EXEC sp_addextendedproperty N'MS_Description',N'Снимок на момент создания - Неподтверждено',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTYUNCONFIRMED'
EXEC sp_addextendedproperty N'MS_Description',N'Плановая дата отгрузки поставщиком для транспортировки',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'DTE_SHP_PLN'
EXEC sp_addextendedproperty N'MS_Description',N'Стоимость доставки за ТНП',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'PRC_DOST'
EXEC sp_addextendedproperty N'MS_Description',N'Конечная дата периода потребностей',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'MAX_DTE_POT'
EXEC sp_addextendedproperty N'MS_Description',N'Конечная дата расчетного периода поставки',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'MAX_PLN_DTE_POST'
EXEC sp_addextendedproperty N'MS_Description',N'ЕИЗ потребности',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'EIZ_POT'
EXEC sp_addextendedproperty N'MS_Description',N'ЕИЗ поставки',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'EIZ_POST'
EXEC sp_addextendedproperty N'MS_Description',N'Коэффициент перевода в ЕИЗ поставки',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'K_TO_POST'
EXEC sp_addextendedproperty N'MS_Description',N'Тип транспорта',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'UPUTRS'
EXEC sp_addextendedproperty N'MS_Description',N'Объем транзитной нормы поставки (ТНП)',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'TNP'
EXEC sp_addextendedproperty N'MS_Description',N'Количество ТНП',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'TNP_COUNT'
EXEC sp_addextendedproperty N'MS_Description',N'Сумма стоимости',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'SUM_PUR'
EXEC sp_addextendedproperty N'MS_Description',N'Сумма  доставки',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'SUM_DOST'
EXEC sp_addextendedproperty N'MS_Description',N'Общая стоимость',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'TOTAL'
EXEC sp_addextendedproperty N'MS_Description',N'Количество выданного в производство',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'IMQTY'
EXEC sp_addextendedproperty N'MS_Description',N'Ссылка на таблицу OKP_EXTNOM' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_DATA', N'COLUMN',N'EXTNOM_ID'
EXEC sp_addextendedproperty N'MS_Description',N'Срок поставки' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_DATA', N'COLUMN',N'SDDPER'
GO



--
-- Definition for table OKP_RZP_POT : 
--

--Таблица содержит данные о том из каких потребностей состоит элемент состава заявки
CREATE TABLE OKP_RZP_POT (
	ID_POT bigint NOT NULL,
	ID_RZPDATA bigint NOT NULL,
	QTY float NULL DEFAULT (0),
	USR_SEL_POT bit NULL,
	RWC_NOM int NULL,
	DTE_POT datetime NULL,
	QTYPOT float NULL,
	QTYTQY float NULL,
	RWC_TOZ int NULL,
	WRH_ID int NULL,
	NOP int NULL,
	TRN_ID bigint NULL,
	imQTY float NULL,
	TQY float NULL,
	OLDWRH float NULL,
	SUPPLY float NULL,
	NEWPOT float NULL,
	UPU_ID bigint NULL,
	PLO_ID bigint NULL,
	ID_VAR bigint NULL
)
GO

EXEC sp_addextendedproperty N'MS_Description', N'Связь потребности-состав заявки', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT'
EXEC sp_addextendedproperty N'MS_Description', N'ИД потребности', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'ID_POT'
EXEC sp_addextendedproperty N'MS_Description', N'ИД состава заявки', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'ID_RZPDATA'
EXEC sp_addextendedproperty N'MS_Description', N'Количество в ЕИЗ потребности', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'QTY'
EXEC sp_addextendedproperty N'MS_Description', N'Выбранные пользователем потребности', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'USR_SEL_POT'
EXEC sp_addextendedproperty N'MS_Description', N'Ссылка на номенклатуру', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'RWC_NOM'
EXEC sp_addextendedproperty N'MS_Description', N'Дата потребности', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'DTE_POT'
EXEC sp_addextendedproperty N'MS_Description', N'Плановая потребность', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'QTYPOT'
EXEC sp_addextendedproperty N'MS_Description', N'Текущая потребность', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'QTYTQY'
EXEC sp_addextendedproperty N'MS_Description', N'Ссылка на работу', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'RWC_TOZ'
EXEC sp_addextendedproperty N'MS_Description', N'Склад резерва', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'WRH_ID'
EXEC sp_addextendedproperty N'MS_Description', N'Номер операции', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'NOP'
EXEC sp_addextendedproperty N'MS_Description', N'Ссылка на транзакцию резервирования', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'TRN_ID'
EXEC sp_addextendedproperty N'MS_Description', N'Выдано', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'imQTY'
EXEC sp_addextendedproperty N'MS_Description', N'Сколько осталось выдать = Плановая потребность - Выдано', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'TQY'
EXEC sp_addextendedproperty N'MS_Description', N'Количество на складах до удовлетворения потребности', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'OLDWRH'
EXEC sp_addextendedproperty N'MS_Description', N'Ожидаемые поставки', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'SUPPLY'
EXEC sp_addextendedproperty N'MS_Description', N'Потребность после распределения', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'NEWPOT'
EXEC sp_addextendedproperty N'MS_Description', N'Ссылка на назначенное условие поставки', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'UPU_ID'
EXEC sp_addextendedproperty N'MS_Description', N'Ссылка на заказ', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'PLO_ID'
EXEC sp_addextendedproperty N'MS_Description', N'ИД Варианта', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'ID_VAR'

GO


--
-- Definition for table OKP_RZP_TRN : 
--
--Журнал учета поставок
CREATE TABLE OKP_RZP_TRN (
	ID bigint IDENTITY(1,1) NOT NULL,
	DTE_RZP_TRN datetime NOT NULL DEFAULT (getdate()),
	TRN_NUM varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	ID_CTR int NOT NULL,
	ID_CONTRACT bigint NULL,
	ID_CTR_SHIPPER int NOT NULL,
	ID_CTR_CONSIGNEE int NULL,
	RESPONSIBLE_USERNAME varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	INCOMING_NUMBER varchar(50) COLLATE DATABASE_DEFAULT NULL,
	INCOMING_DATE datetime NULL,
	DESCRIPTION varchar(250) COLLATE DATABASE_DEFAULT NULL,
	STS int NOT NULL DEFAULT (0),
	GUID uniqueidentifier NULL,
	DELETED int NULL DEFAULT (0),
	TOTAL_DELIVERY_COST float NULL,
        CURRENCY_ID int NULL,
        NDS BIT NULL,
        NDS_INCLUDED_IN_PRC BIT NULL,
 CONSTRAINT PK_OKP_RZP_TRN PRIMARY KEY CLUSTERED (ID)
 )
GO

EXEC sp_addextendedproperty N'MS_Description', N'Идентификатор' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'ID'
EXEC sp_addextendedproperty N'MS_Description', N'Дата транзакции' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'DTE_RZP_TRN'
EXEC sp_addextendedproperty N'MS_Description', N'Номер транзакции' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'TRN_NUM'
EXEC sp_addextendedproperty N'MS_Description', N'Контрагент' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'ID_CTR'
EXEC sp_addextendedproperty N'MS_Description', N'Договора' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'ID_CONTRACT'
EXEC sp_addextendedproperty N'MS_Description', N'Грузоотправитель' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'ID_CTR_SHIPPER'
EXEC sp_addextendedproperty N'MS_Description', N'Грузополучатель' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'ID_CTR_CONSIGNEE'
EXEC sp_addextendedproperty N'MS_Description', N'Ответственный' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'RESPONSIBLE_USERNAME'
EXEC sp_addextendedproperty N'MS_Description', N'Входящий номер' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'INCOMING_NUMBER'
EXEC sp_addextendedproperty N'MS_Description', N'Входящая дата ' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'INCOMING_DATE'
EXEC sp_addextendedproperty N'MS_Description', N'Примечание' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'DESCRIPTION'
EXEC sp_addextendedproperty N'MS_Description', N'Статус: 0 - не проведен; 1 - проведен' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'STS'
EXEC sp_addextendedproperty N'MS_Description', N'Записи помеченные на удаление (0 - не помечен, 1 - помечен) ' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'DELETED'
EXEC sp_addextendedproperty N'MS_Description', N'Транзакции учёта поставки (снабжения)' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN'
EXEC sp_addextendedproperty N'MS_Description', N'Общая стоимость доставки', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_TRN', 'COLUMN', N'TOTAL_DELIVERY_COST'
EXEC sp_addextendedproperty N'MS_Description', N'Идентиикатор валюты', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_TRN', 'COLUMN', N'CURRENCY_ID'
EXEC sp_addextendedproperty N'MS_Description', N'Учитывать НДС', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_TRN', 'COLUMN', N'NDS'
EXEC sp_addextendedproperty N'MS_Description', N'НДС включена в стоимость', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_TRN', 'COLUMN', N'NDS_INCLUDED_IN_PRC'
GO

--
-- Definition for table OKP_RZP_TRN_DATA : 
--

CREATE TABLE dbo.OKP_RZP_TRN_DATA (
  ID bigint IDENTITY(1, 1) NOT NULL,
  ID_RZP_TRN bigint NOT NULL,
  ID_PUR bigint NOT NULL,
  ID_WRH int NULL,
  ID_RZP_DATA bigint NULL,
  QTY float NOT NULL,
  PRC float DEFAULT 0 NOT NULL,
  NDS float DEFAULT 0 NOT NULL,
  NDS_INCLUDED bit DEFAULT 0, 	
  ROW_NUM int NOT NULL,
  DESCRIPTION varchar(50) COLLATE DATABASE_DEFAULT NULL,
  NOM_ID int NOT NULL,
  NDS_NAM varchar(10) COLLATE DATABASE_DEFAULT NULL,
  QTY_POSTAV float DEFAULT 0 NULL,
  DTE_POSTAV datetime NULL,
  SUM_POSTAV float DEFAULT 0 NULL,
  RNUM int NULL,
  NDS_SUM float NULL,
  SUM_WITH_NDS float NULL,
  Fold_I float NULL,
  Fold_S float NULL,
  Fold_D datetime NULL,
  DELIVERY_COST float NULL,
  TNP float NULL,
  TNP_DEL_COST float NULL,
  CURRENCY_ID int NULL,
  INCLUDE_DELIVERY_IN_PRICE int NULL,
  PRC_RECALC float(53) NULL,
  SUM_RECALC float(53) NULL,
  CURRENCY_RATE float(53) CONSTRAINT df__OKP_RZP_TRN_DATA__CURRENCY_RATE DEFAULT (1) NOT NULL,
  EXTNOM_ID int null,
  CONSTRAINT PK_OKP_RZP_TRN_DATA PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty N'MS_Description', N'Идентификатор' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'ID'
EXEC sp_addextendedproperty N'MS_Description', N'ИД транзакция' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'ID_RZP_TRN'
EXEC sp_addextendedproperty N'MS_Description', N'ИД предмета поставки' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'ID_PUR'
EXEC sp_addextendedproperty N'MS_Description', N'ИД склад' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'ID_WRH'
EXEC sp_addextendedproperty N'MS_Description', N'ИД Состава заявки' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'ID_RZP_DATA'
EXEC sp_addextendedproperty N'MS_Description', N'Поставлено грузоперевозчиком' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'QTY'
EXEC sp_addextendedproperty N'MS_Description', N'Цена за ед' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'PRC'
EXEC sp_addextendedproperty N'MS_Description', N'НДС в %' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'NDS'
EXEC sp_addextendedproperty N'MS_Description', N'Номер строки (для сортировки и упорядочивания строк)' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'ROW_NUM'
EXEC sp_addextendedproperty N'MS_Description', N'Краткое описание' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'DESCRIPTION'
EXEC sp_addextendedproperty N'MS_Description', N'ссылка на OKP_NOM' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'NOM_ID'
EXEC sp_addextendedproperty N'MS_Description', N'НДС для вывода на экран/печать' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'NDS_NAM'
EXEC sp_addextendedproperty N'MS_Description', N'Количество принятого на складе' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'QTY_POSTAV'
EXEC sp_addextendedproperty N'MS_Description', N'НДС включено в цену', N'schema', N'dbo', N'table', N'OKP_RZP_TRN_DATA', N'column', N'NDS_INCLUDED'
EXEC sp_addextendedproperty N'MS_Description', N'Дата принятия ' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'DTE_POSTAV'
EXEC sp_addextendedproperty N'MS_Description', N'Принято на сумму' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'SUM_POSTAV'
EXEC sp_addextendedproperty N'MS_Description', N'НДС суммой' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'NDS_SUM'
EXEC sp_addextendedproperty N'MS_Description', N'Сумма с НДС' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'SUM_WITH_NDS'
EXEC sp_addextendedproperty N'MS_Description', N'Свёртка QTY_POSTAV' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'Fold_I'
EXEC sp_addextendedproperty N'MS_Description', N'Свёртка цены QTY_POSTAV' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'Fold_S'
EXEC sp_addextendedproperty N'MS_Description', N'Свёртка DTE_POSTAV' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'Fold_D'
EXEC sp_addextendedproperty N'MS_Description', N'Состав транзакции снабжения' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA'
EXEC sp_addextendedproperty N'MS_Description', N'Стоимость доставки', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_TRN_DATA', 'COLUMN', N'DELIVERY_COST'
EXEC sp_addextendedproperty N'MS_Description', N'Транзитная норма поставки из заявки', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_TRN_DATA', 'COLUMN', N'TNP'
EXEC sp_addextendedproperty N'MS_Description', N'Стоимость доставки одной ТНП', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_TRN_DATA', 'COLUMN', N'TNP_DEL_COST'
EXEC sp_addextendedproperty N'MS_Description', N'Идентификатор валюты', N'schema', N'dbo', N'table', N'OKP_RZP_TRN_DATA', N'column', N'CURRENCY_ID'
EXEC sp_addextendedproperty N'MS_Description', N'Включить стоимость доставки в цену 0 - не включать, 1 - включить', N'schema', N'dbo', N'table', N'OKP_RZP_TRN_DATA', N'column', N'INCLUDE_DELIVERY_IN_PRICE'
EXEC sp_addextendedproperty N'MS_Description', N'Цена после пересчета', N'schema', N'dbo', N'table', N'OKP_RZP_TRN_DATA', N'column', N'PRC_RECALC'
EXEC sp_addextendedproperty N'MS_Description', N'Сумма после пересчета', N'schema', N'dbo', N'table', N'OKP_RZP_TRN_DATA', N'column', N'SUM_RECALC'
EXEC sp_addextendedproperty N'MS_Description', N'Курс валюты', N'SCHEMA' ,N'dbo', N'TABLE' ,N'OKP_RZP_TRN_DATA', N'COLUMN' ,N'CURRENCY_RATE'
EXEC sp_addextendedproperty N'MS_Description', N'Cсылка на таблицу OKP_EXTNOM', N'SCHEMA' ,N'dbo', N'TABLE' ,N'OKP_RZP_TRN_DATA', N'COLUMN' ,N'EXTNOM_ID'
GO

/*
** OKP_SDT
-*/
CREATE TABLE dbo.OKP_SDT (
	ID bigint IDENTITY(1, 1) NOT NULL,
	MSTS int DEFAULT 0 NOT NULL,
	IDN varchar(20) COLLATE DATABASE_DEFAULT NOT NULL,
	DT bigint NOT NULL,
	DEP varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	SHIFT int DEFAULT 1 NOT NULL,
	SH_DURATION float DEFAULT 7 NOT NULL,
	FULL_CAPACITY float DEFAULT 0 NOT NULL,
	CREATEBY varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
	CREATEDATE bigint NOT NULL,
	CLOSEBY varchar(100) COLLATE DATABASE_DEFAULT NULL,
	CLOSEDATE bigint NULL,
	REOPENBY varchar(100) COLLATE DATABASE_DEFAULT NULL,
	REOPENDATE bigint NULL,
	COMMENT varchar(500) COLLATE DATABASE_DEFAULT NULL,
	CONSTRAINT PK_OKP_SDT_ PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Сменно-суточные задания', N'schema', N'dbo', N'table', N'OKP_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'Статус', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'MSTS'
EXEC sp_addextendedproperty 'MS_Description', N'Номер суточного задания', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Дата задания', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'DT'
EXEC sp_addextendedproperty 'MS_Description', N'Подразделение', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'DEP'
EXEC sp_addextendedproperty 'MS_Description', N'Номер рабочей смены', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'SHIFT'
EXEC sp_addextendedproperty 'MS_Description', N'Продолжительность смены, ч', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'SH_DURATION'
EXEC sp_addextendedproperty 'MS_Description', N'Загрузка на смену в н/ч', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'FULL_CAPACITY'
EXEC sp_addextendedproperty 'MS_Description', N'Кем создано ', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'CREATEBY'
EXEC sp_addextendedproperty 'MS_Description', N'Когда создано', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'CREATEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'Кем проводилось последнее закрытие', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'CLOSEBY'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последнего закрытия', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'CLOSEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'Кем проводилось последнее переоткрытие', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'REOPENBY'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последнего переоткрытия', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'REOPENDATE'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'COMMENT'
GO

/*
** OKP_SDT_ELEM
*/
CREATE TABLE dbo.OKP_SDT_ELEM (
	ID bigint IDENTITY(1, 1) NOT NULL,
	SDT_ID bigint NOT NULL,
	TOZ_RWC int NOT NULL,
	DEP$$$DEP varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	WCR$$$WCR varchar(12) COLLATE DATABASE_DEFAULT NOT NULL,
	NOP int NOT NULL,
	DTEPDZ datetime NULL,
	DTEPDV datetime NULL,
	QTYPQY float NOT NULL,
	QTYPWO_SDT float NOT NULL,
	QTYPZV float NOT NULL,
	QTYEDV float NOT NULL,
	MOV float NOT NULL,
	TOP$$$KTO varchar(4) COLLATE DATABASE_DEFAULT NOT NULL,
	OOD int NOT NULL,
	PZV float NOT NULL,
	VP float NOT NULL,
	TMO float NOT NULL,
	TRO float NOT NULL,
	RZO int NOT NULL,
	PRF$$$PRF varchar(5) COLLATE DATABASE_DEFAULT NOT NULL,
	TDDOC varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	TPN float NOT NULL,
	PRODTYPE int NOT NULL,
	TSK float NULL,
	SPLITPARTIES int NOT NULL,
	M_DB bigint NOT NULL,
	M_DE bigint NOT NULL,
	M_DB_NR bigint NOT NULL,
	M_DE_NR bigint NOT NULL,
	NR int NOT NULL,
	TU varchar(4000) COLLATE DATABASE_DEFAULT NULL,
	normtaskDate_SDT bigint NULL,
	QTYCQY_SDT float NOT NULL,
	CAPACITY_PLAN float DEFAULT 0 NOT NULL,
	COMMENT varchar(4000) COLLATE DATABASE_DEFAULT NULL,
	CONSTRAINT PK_OKP_SDT_ELEM_ PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Работы ССЗ', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор элемента СЗ', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор СЗ', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'SDT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор операции', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'TOZ_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Код подразделения', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'DEP$$$DEP'
EXEC sp_addextendedproperty 'MS_Description', N'Код РЦ', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'WCR$$$WCR'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции в маршруте', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'Дата запуска', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'DTEPDZ'
EXEC sp_addextendedproperty 'MS_Description', N'Дата выпуска', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'DTEPDV'
EXEC sp_addextendedproperty 'MS_Description', N'Количество по плану', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'QTYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'Время обработки (округленно)', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'QTYPWO_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'Подготов.-заключительное время на единицу', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'QTYPZV'
EXEC sp_addextendedproperty 'MS_Description', N'Штучное время', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'QTYEDV'
EXEC sp_addextendedproperty 'MS_Description', N'Межоперационное время', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'MOV'
EXEC sp_addextendedproperty 'MS_Description', N'код технологической операци (см. OKP_KTO.TOPIDN)', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'TOP$$$KTO'
EXEC sp_addextendedproperty 'MS_Description', N'КОИД', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'OOD'
EXEC sp_addextendedproperty 'MS_Description', N'Подготовительно-заключител.время', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'PZV'
EXEC sp_addextendedproperty 'MS_Description', N'Объём партии', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'VP'
EXEC sp_addextendedproperty 'MS_Description', N'Машинное время обработки', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'TMO'
EXEC sp_addextendedproperty 'MS_Description', N'Рабочее время обработки', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'Разряд работ', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'Код профессии', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'PRF$$$PRF'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ТД', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'TDDOC'
EXEC sp_addextendedproperty 'MS_Description', N'время переналадки', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'TPN'
EXEC sp_addextendedproperty 'MS_Description', N'Тип производства 0-собственное ,  1-кооперация', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'PRODTYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Штучно-калькуляционное время', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'TSK'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг возможности разделения на производственные партии Null,1 - можно, 0-нельзя', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'SPLITPARTIES'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата начала', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'M_DB'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата окончания', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'M_DE'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата начала без контроля связей', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'M_DB_NR'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата окончания без контроля связей', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'M_DE_NR'
EXEC sp_addextendedproperty 'MS_Description', N'Признак отсутствия контроля связей 0-контроль, 1- контроля нет', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'NR'
EXEC sp_addextendedproperty 'MS_Description', N'Технологические указания', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'TU'
EXEC sp_addextendedproperty 'MS_Description', N'Дата выдачи нормированного задания про суточному ', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'normtaskDate_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'Количество на операции (в элементе СЗ)', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'QTYCQY_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'нагрузка по элементу СЗ плановая', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'CAPACITY_PLAN'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий к работе', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'COMMENT'
GO

--
-- Definition for table OKP_SDT_LOG : 
--

CREATE TABLE dbo.OKP_SDT_LOG (
  ID bigint IDENTITY(1, 1) NOT NULL,
  SDT_ID bigint NULL,
  SDT_IDN varchar(20) COLLATE DATABASE_DEFAULT NOT NULL,
  STD_ELEM_ID bigint NULL,
  ACTION varchar(100) COLLATE DATABASE_DEFAULT NULL,
  COMMAND varchar(1000) COLLATE DATABASE_DEFAULT NULL,
  USERFIO varchar(100) COLLATE DATABASE_DEFAULT NULL,
  DT bigint NOT NULL,
  CONSTRAINT PK_OKP_SDT_LOG_ PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Протокол работы со сменно-суточными заданиями (СЗ)', N'schema', N'dbo', N'table', N'OKP_SDT_LOG'
GO

--
-- Definition for table OKP_SDTUOP : 
--

CREATE TABLE dbo.OKP_SDTUOP (
  ID bigint IDENTITY(1, 1) NOT NULL,
  SDT_ID bigint NOT NULL,
  SDT_ELEM_ID bigint NOT NULL,
  UOP_NOS int NOT NULL,
  CONSTRAINT PK_OKP_SDTUOP PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Связка сменносуточных работ с учетами по операции', N'schema', N'dbo', N'table', N'OKP_SDTUOP'
EXEC sp_addextendedproperty 'MS_Description', N'ID СЗ', N'schema', N'dbo', N'table', N'OKP_SDTUOP', N'column', N'SDT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'СЗ работы ID', N'schema', N'dbo', N'table', N'OKP_SDTUOP', N'column', N'SDT_ELEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID учета', N'schema', N'dbo', N'table', N'OKP_SDTUOP', N'column', N'UOP_NOS'
GO

--
-- Definition for table OKP_SLS : 
--

CREATE TABLE dbo.OKP_SLS (
  ID bigint IDENTITY(1, 1) NOT NULL,
  NOMDATA_ID bigint NOT NULL,
  QTY float CONSTRAINT DF_SLS_QTY DEFAULT 0 NOT NULL,
  LIM int NULL,
  KTX varchar(20) COLLATE DATABASE_DEFAULT NULL,
  PRC varchar(2000) COLLATE DATABASE_DEFAULT CONSTRAINT DF_SLS_PRC DEFAULT '' NOT NULL,
  CONSTRAINT PK_SLS PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Данные о продажах', N'schema', N'dbo', N'table', N'OKP_SLS'
EXEC sp_addextendedproperty 'MS_Description', N'ID номенклатурной позиции (OKP_NOMDATA.ID)', N'schema', N'dbo', N'table', N'OKP_SLS', N'column', N'NOMDATA_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Размер отгрузочной партии', N'schema', N'dbo', N'table', N'OKP_SLS', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Цикл комплектации отгрузки', N'schema', N'dbo', N'table', N'OKP_SLS', N'column', N'LIM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор инструкции упаковки', N'schema', N'dbo', N'table', N'OKP_SLS', N'column', N'KTX'
EXEC sp_addextendedproperty 'MS_Description', N'Оптовая цена для соответствующего количества. Поле представляет собой структуру в соответствии с правилами, принятыми в системе ОКП (см. описание функции OKPStruct)', N'schema', N'dbo', N'table', N'OKP_SLS', N'column', N'PRC'
GO

--
-- Definition for table OKP_SReserv : 
--

CREATE TABLE dbo.OKP_SReserv (
  ID bigint IDENTITY(1, 1) NOT NULL,
  CPL_ID bigint NOT NULL,
  INV_ID bigint NOT NULL,
  WRH_ID int NOT NULL,
  DEP_ID int NOT NULL,
  NOP int NOT NULL,
  DTE datetime DEFAULT getdate() NOT NULL,
  QTY float NOT NULL,
  QTY_F float(53) NULL,
  QTY_A float(53) NULL,
  Fold_Q float(53) NULL,
  Fold_A float(53) NULL,
  isActive int DEFAULT 1 NOT NULL,
  User_ID int NOT NULL,
  Comment varchar(200) COLLATE DATABASE_DEFAULT NULL,
  DKD datetime DEFAULT getdate() NOT NULL,
  CONSTRAINT PK_SReserv PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица заявок резервирования производством материалов, узлов, деталей и проч. на складах', N'schema', N'dbo', N'table', N'OKP_SReserv'
EXEC sp_addextendedproperty 'MS_Description', N'ID заявки резервирования', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на производственную партию (OKP_CPL.RWC), для которой сформирована заявка резервирования', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'CPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на складскую номенклатуру (OKP_INV.ID), на которую сформирована заявка резервирования', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'INV_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на склад (OKP_WRH.WRH_ID), на который сформирована заявка резервирования', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'WRH_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на подразделение-получатель (OKP_DEP.RWC), для которого сформирована заявка резервирования', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции, для которой сформирована заявка резервирования', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'Дата создания заявки резервирования', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Количество резервирования в системной ЕИЗ (EV_SYSEIZ.SYSIDN), соответствующей ЕИЗ планирования (OKP_NOM.UOM$$$EIZ) по обозначению номенклатурной позиции', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Выданное со склада количество в системной ЕИЗ (см. описание OKP_SReserv.QTY)', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'QTY_F'
EXEC sp_addextendedproperty 'MS_Description', N'Аннулированное количество (снятое с резерва) в системной ЕИЗ (см. описание OKP_SReserv.QTY)', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'QTY_A'
EXEC sp_addextendedproperty 'MS_Description', N'свёртка QTY_F', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'Fold_Q'
EXEC sp_addextendedproperty 'MS_Description', N'свёртка QTY_A', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'Fold_A'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг активного заказа:  0 - заказ аннулирован  1 - заказ активен', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'isActive'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на пользователя, сделавшего запись', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'User_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'Comment'
EXEC sp_addextendedproperty 'MS_Description', N'Дата документа', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'DKD'
GO

--
-- Definition for table OKP_SDT_SReserv : 
--

CREATE TABLE OKP_SDT_SReserv (
  ID bigint IDENTITY(1, 1) NOT NULL,
  SDTElem_ID bigint NOT NULL,
  INV_ID bigint NOT NULL,
  DTE datetime DEFAULT getdate() NOT NULL,
  QTY float NOT NULL,
  QTY_I float,
  LDATA bigint,
  Fold_I float,
  Fold_D bigint,
  CONSTRAINT PK_SDT_SReserv PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица оборотной информации склада по резервам для ССЗ', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на ССЗ (OKP_SDT_ELEM.ID), для которой сформирована запись', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'SDTElem_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на складскую номенклатуру (OKP_INV.ID), на которую сформирована запись', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'INV_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата создания записи', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Количество резервирования по ССЗ в системной ЕИЗ (EV_SYSEIZ.SYSIDN), соответствующей ЕИЗ планирования   (OKP_NOM.UOM$$$EIZ) по указанной номенклатурной позиции склада', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Итоговое выданное со склада количество по текущей записи ССЗ. ЕИЗ - см. QTY', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'QTY_I'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последней выдачи со склада', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'LDATA'
EXEC sp_addextendedproperty 'MS_Description', N'Свёртка QTY_I', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'Fold_I'
EXEC sp_addextendedproperty 'MS_Description', N'Свёртка LDATA', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'Fold_D'
GO

/*
** Definition for table OKP_SUP : 
*/
CREATE TABLE dbo.OKP_SUP (
	ID bigint IDENTITY(1, 1) NOT NULL,
	SUP_IDN varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	CTR_ID int NOT NULL,
	COC varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_SUP_COC DEFAULT 'A' NULL,
	DTECOC datetime NULL,
	TIS varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_SUP_TIS DEFAULT 'P' NULL,
	PRI varchar(1) COLLATE DATABASE_DEFAULT NULL,
	PRS varchar(50) COLLATE DATABASE_DEFAULT NULL,
	SDD int NULL,
	NPR varchar(1) COLLATE DATABASE_DEFAULT NULL,
	GOG varchar(100) COLLATE DATABASE_DEFAULT NULL,
	TYP_TRAN varchar(50) COLLATE DATABASE_DEFAULT NULL,
	SUP_FON_ID int NULL,
	MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
	PERSON_ID int NULL,
	GRP_ID int NULL,
	ID_MAIN_CONTRACT bigint DEFAULT NULL NULL,
	created_by varchar(50) COLLATE DATABASE_DEFAULT NULL,
	edited_by varchar(50) COLLATE DATABASE_DEFAULT NULL,
	created_date datetime DEFAULT getdate() NULL,
	edited_date datetime DEFAULT getdate() NULL,
	CONSTRAINT PK_OKP_SUP_1 PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Поставщики', N'schema', N'dbo', N'table', N'OKP_SUP'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор поставщика', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор контрагента', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'CTR_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Код отношений с поставщиками (A, S, U): A - Активные; S -  Временно прекращённые; U - Прекращенные', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'COC'
EXEC sp_addextendedproperty 'MS_Description', N'Дата до которой прекращены отношения', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'DTECOC'
EXEC sp_addextendedproperty 'MS_Description', N'Тип поставщика: F - фондодержатель; P - поставщик; K - альтернативный поставщик', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'TIS'
EXEC sp_addextendedproperty 'MS_Description', N'Приоритет поставщика', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'PRI'
EXEC sp_addextendedproperty 'MS_Description', N'Срок документооборота (в часах)', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'SDD'
EXEC sp_addextendedproperty 'MS_Description', N'Направление поставки', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'NPR'
EXEC sp_addextendedproperty 'MS_Description', N'Географическое направление поставки', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'GOG'
EXEC sp_addextendedproperty 'MS_Description', N'Тип транспорта', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'TYP_TRAN'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор фондодержателя', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'SUP_FON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Метка записи', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Ответветственное лицо (у поставщика)', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'PERSON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Кем создана запись', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'created_by'
EXEC sp_addextendedproperty 'MS_Description', N'Кем изменена запись', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'edited_by'
EXEC sp_addextendedproperty 'MS_Description', N'Когда создана запись', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'created_date'
EXEC sp_addextendedproperty 'MS_Description', N'Когда изменена запись', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'edited_date'
EXEC sp_addextendedproperty N'MS_Description', N'Группа', 'SCHEMA', N'dbo', 'TABLE', N'OKP_SUP', 'COLUMN', N'GRP_ID'
GO

--
-- Definition for table OKP_sysCounters : 
--

CREATE TABLE dbo.OKP_sysCounters (
  ID int IDENTITY(1, 1) NOT NULL,
  IDN varchar(200) COLLATE DATABASE_DEFAULT NOT NULL,
  Counter bigint NOT NULL,
  Step int DEFAULT 1 NOT NULL,
  Prefix varchar(50) COLLATE DATABASE_DEFAULT NULL,
  Sufix varchar(50) COLLATE DATABASE_DEFAULT NULL,
  Format varchar(500) COLLATE DATABASE_DEFAULT NULL,
  Describe varchar(4000) COLLATE DATABASE_DEFAULT NULL,
  pCounter bigint DEFAULT 0 NULL,
  CONSTRAINT PK_sysCounters PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица шаблонов-счётчиков', N'schema', N'dbo', N'table', N'OKP_sysCounters'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор шаблона-счётчика', N'schema', N'dbo', N'table', N'OKP_sysCounters', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Цифровая часть шаблона-счётчика', N'schema', N'dbo', N'table', N'OKP_sysCounters', N'column', N'Counter'
EXEC sp_addextendedproperty 'MS_Description', N'Шаг увеличения счётчика', N'schema', N'dbo', N'table', N'OKP_sysCounters', N'column', N'Step'
EXEC sp_addextendedproperty 'MS_Description', N'Префикс шаблона-счётчика', N'schema', N'dbo', N'table', N'OKP_sysCounters', N'column', N'Prefix'
EXEC sp_addextendedproperty 'MS_Description', N'Завершающая часть шаблона-счётчика', N'schema', N'dbo', N'table', N'OKP_sysCounters', N'column', N'Sufix'
EXEC sp_addextendedproperty 'MS_Description', N'Текст шаблона. В состав шаблона, в общем случае, входят следующие   лексеммы (подлежат замене при обработке):   - стандартные       1) [d], [dd] -    подставляется номер дня        2) [m], [mm] -    подставляется номер месяца       3) [yy], [yyyy] - подставляется номер года       4) [hh] -         подставляется номер часа       5) [nn] -         подставляется номер минуты       6) [ss] -         подставляется номер секунды       7) [ms] -         подставляется номер милисекунды       8) [0] -          подставляется значение счётчика -                           если текстовое представление счётчика занимает меньше                           позиций, то эти позиции ПЕРЕД ним заполняются нулями       9) [9] -          подставляется значение счётчика -                           если текстовое представление счётчика занимает меньше                           позиций, то размер результирующего значения лексеммы                           уменьшается   - OKP-параметры (см. TOKPParameter) в квадратных скобках   - пользовательские - любой текст в квадратных скобкахКроме того, шаблон может содержать текст, лежащий за пределами  квадратных скобок - такой текст замене не подлежит и подставляется  в экземпляры при обработке как есть.Пример:  при Counter = 1,       Step = 10,       Prefix = "",       Suffix = "",       Format = "на [dd].[mm].[yy] [hh]:[mm]:[ss] счётчик равен [000] единиц"  экземпляр шаблона равен      "на 1.2.2013 17:2:57 счётчик равен 011 единиц"', N'schema', N'dbo', N'table', N'OKP_sysCounters', N'column', N'Format'
EXEC sp_addextendedproperty 'MS_Description', N'Описание, пояснения, комментарии...', N'schema', N'dbo', N'table', N'OKP_sysCounters', N'column', N'Describe'
EXEC sp_addextendedproperty 'MS_Description', N'Предыдущее значение счётчика (значение для отката)', N'schema', N'dbo', N'table', N'OKP_sysCounters', N'column', N'pCounter'
GO

--
-- Definition for table OKP_sysFiles : 
--

CREATE TABLE dbo.OKP_sysFiles (
  NAME varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  VID varchar(15) COLLATE DATABASE_DEFAULT NOT NULL,
  DT bigint NOT NULL,
  Flag int NOT NULL,
  Path varchar(1000) COLLATE DATABASE_DEFAULT NULL
)
GO

--
-- Definition for table OKP_sysJobs : 
--

CREATE TABLE dbo.OKP_sysJobs (
  ID int IDENTITY(1, 1) NOT NULL,
  Nomer int NOT NULL,
  Name varchar(100) COLLATE DATABASE_DEFAULT NULL,
  ScheduleID int NULL,
  ActiveFrom datetime NULL,
  ActiveTo datetime NULL,
  isStopped int NULL,
  isSystem int not null,
  LastExecuted datetime NULL,
  Describe varchar(4000) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_sysJobs PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица автоматически выполняемых заданий', N'schema', N'dbo', N'table', N'OKP_sysJobs'
GO

EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Номер задания', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'Nomer'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'Name'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на расписание (OKP_sysSchedules.ID)', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'ScheduleID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата начала действия задания', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'ActiveFrom'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата окончания действия задания', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'ActiveTo'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Задание остановлено', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'isStopped'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Системное задание', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'isSystem'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата и время последнего выполнения', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'LastExecuted'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Описание', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'Describe'
GO

--
-- Definition for table OKP_sysJobsLog : 
--

CREATE TABLE dbo.OKP_sysJobsLog (
  ID int IDENTITY(1, 1) NOT NULL,
  DateExecute datetime NULL,
  JobName varchar(100) COLLATE DATABASE_DEFAULT NULL,
  Successful int NULL,
  Message varchar(1000) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_sysJobsLog PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Журнал выполнения автоматически выполняемых заданий', N'schema', N'dbo', N'table', N'OKP_sysJobsLog'
GO

EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'OKP_sysJobsLog', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата выполнения', N'schema', N'dbo', N'table', N'OKP_sysJobsLog', N'column', N'DateExecute'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Имя выполненного задания', N'schema', N'dbo', N'table', N'OKP_sysJobsLog', N'column', N'JobName'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Флаг выполнения 0 - успешно, 1 - ошибка', N'schema', N'dbo', N'table', N'OKP_sysJobsLog', N'column', N'Successful'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Текст сообщения', N'schema', N'dbo', N'table', N'OKP_sysJobsLog', N'column', N'Message'
GO

--
-- Definition for table OKP_sysJobSteps : 
--

CREATE TABLE dbo.OKP_sysJobSteps (
  ID int IDENTITY(1, 1) NOT NULL,
  Nomer int NULL,
  Name varchar(100) COLLATE DATABASE_DEFAULT NULL,
  JobID int NULL,
  Context text COLLATE DATABASE_DEFAULT NULL,
  Describe varchar(1000) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_sysJobSteps PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица шагов автоматически выполняемых заданий', N'schema', N'dbo', N'table', N'OKP_sysJobSteps'
EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'OKP_sysJobSteps', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Номер шага', N'schema', N'dbo', N'table', N'OKP_sysJobSteps', N'column', N'Nomer'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'OKP_sysJobSteps', N'column', N'Name'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на задание (OKP_sysJobs.ID)', N'schema', N'dbo', N'table', N'OKP_sysJobSteps', N'column', N'JobID'
EXEC sp_addextendedproperty 'MS_Description', N'Текст скрипта', N'schema', N'dbo', N'table', N'OKP_sysJobSteps', N'column', N'Context'
EXEC sp_addextendedproperty 'MS_Description', N'Описание', N'schema', N'dbo', N'table', N'OKP_sysJobSteps', N'column', N'Describe'
GO

--
-- Definition for table OKP_sysLocks : 
--
CREATE TABLE dbo.OKP_sysLocks (
  UID uniqueidentifier NOT NULL,
  SUID uniqueidentifier NOT NULL,
  ObjectID int NOT NULL,
  IDN varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  LoginID bigint NOT NULL,
  CONSTRAINT PK_OKP_SYSLOCKS PRIMARY KEY CLUSTERED (ObjectID, IDN)
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Системная таблица блокировок', N'schema', N'dbo', N'table', N'OKP_sysLocks'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор ведущего блокировщика', N'schema', N'dbo', N'table', N'OKP_sysLocks', N'column', N'UID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор блокировщика', N'schema', N'dbo', N'table', N'OKP_sysLocks', N'column', N'SUID'
EXEC sp_addextendedproperty 'MS_Description', N'Тип заблокированного объекта (см. OKP_sysObjects.ID)', N'schema', N'dbo', N'table', N'OKP_sysLocks', N'column', N'ObjectID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор заблокированного объекта (в соответствии со значением поля OKP_sysObjects.PARAMETERS)', N'schema', N'dbo', N'table', N'OKP_sysLocks', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор пользователя, от имени которого объект заблокирован (см. OKP_sysLogins.ID)', N'schema', N'dbo', N'table', N'OKP_sysLocks', N'column', N'LoginID'
GO

--
-- Definition for table OKP_sysLOGISTICS : 
--

CREATE TABLE dbo.OKP_sysLOGISTICS (
  UID uniqueidentifier NOT NULL,
  IDN varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  Name varchar(30) COLLATE DATABASE_DEFAULT NOT NULL,
  FileName varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  FunctionName varchar(20) COLLATE DATABASE_DEFAULT NOT NULL,
  Comment varchar(4000) COLLATE DATABASE_DEFAULT NULL,
  PRIMARY KEY CLUSTERED (UID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица списка присоединяемых расчётчиков "9CE20B99-D254-4C62-BC37-57CE93413CD2" - встроенный. Внутри библиотеки может быть несколько рассчётчиков, Допускается повторение пары FileName-FunctionName, что дает возможность регистрировать синонимы.', N'schema', N'dbo', N'table', N'OKP_sysLOGISTICS'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_sysLOGISTICS', N'column', N'UID'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение', N'schema', N'dbo', N'table', N'OKP_sysLOGISTICS', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'OKP_sysLOGISTICS', N'column', N'Name'
EXEC sp_addextendedproperty 'MS_Description', N'Имя файла библиотеки', N'schema', N'dbo', N'table', N'OKP_sysLOGISTICS', N'column', N'FileName'
EXEC sp_addextendedproperty 'MS_Description', N'Имя функции', N'schema', N'dbo', N'table', N'OKP_sysLOGISTICS', N'column', N'FunctionName'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'OKP_sysLOGISTICS', N'column', N'Comment'
GO

--
-- Definition for table OKP_sysParameters : 
--

CREATE TABLE dbo.OKP_sysParameters (
  ID int NOT NULL,
  IDN varchar(20) COLLATE DATABASE_DEFAULT NOT NULL,
  GRP varchar(20) COLLATE DATABASE_DEFAULT NULL,
  NICK varchar(50) COLLATE DATABASE_DEFAULT NULL,
  DESCRIBE varchar(255) COLLATE DATABASE_DEFAULT NOT NULL,
  ADDINFO varchar(255) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_OKP_sysParameters PRIMARY KEY CLUSTERED (ID)
)

GO

EXEC sp_addextendedproperty 'MS_Description', N'список параметров, используемых для взаимодействия с пользователем', N'schema', N'dbo', N'table', N'OKP_sysParameters'
GO

EXEC sp_addextendedproperty 'MS_Description', N'номер', N'schema', N'dbo', N'table', N'OKP_sysParameters', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор параметра', N'schema', N'dbo', N'table', N'OKP_sysParameters', N'column', N'IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Группа параметров', N'schema', N'dbo', N'table', N'OKP_sysParameters', N'column', N'GRP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Псевдоним параметра', N'schema', N'dbo', N'table', N'OKP_sysParameters', N'column', N'NICK'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Описание параметра', N'schema', N'dbo', N'table', N'OKP_sysParameters', N'column', N'DESCRIBE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дополнительные данные', N'schema', N'dbo', N'table', N'OKP_sysParameters', N'column', N'ADDINFO'
GO

--
-- Definition for table OKP_sysPrmStruct : 
--

CREATE TABLE dbo.OKP_sysPrmStruct (
  ID int IDENTITY(1, 1) NOT NULL,
  Prm_ID int NOT NULL,
  NICK varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  DESCRIBE varchar(255) COLLATE DATABASE_DEFAULT NOT NULL,
  CONSTRAINT PK_OKP_sysPrmStruct PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'список дополнительных псевдонимов параметра', N'schema', N'dbo', N'table', N'OKP_sysPrmStruct'
GO

EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'OKP_sysPrmStruct', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID параметра', N'schema', N'dbo', N'table', N'OKP_sysPrmStruct', N'column', N'Prm_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дополнительный псевдоним параметра', N'schema', N'dbo', N'table', N'OKP_sysPrmStruct', N'column', N'NICK'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Описание дополнительного псевдонима параметра', N'schema', N'dbo', N'table', N'OKP_sysPrmStruct', N'column', N'DESCRIBE'
GO

--
-- Definition for table OKP_sysSampleTypes : 
--

CREATE TABLE dbo.OKP_sysSampleTypes (
  ID int IDENTITY(1, 1) NOT NULL,
  GUID uniqueidentifier NOT NULL,
  CounterID int NULL,
  Describe varchar(4000) COLLATE DATABASE_DEFAULT NOT NULL,
  ColumnName varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  ObjectTypeID int NOT NULL,
  CONSTRAINT PK_sysSampleTypes PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица системных типов шаблонов', N'schema', N'dbo', N'table', N'OKP_sysSampleTypes'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор типа', N'schema', N'dbo', N'table', N'OKP_sysSampleTypes', N'column', N'GUID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор привязанного шаблона-счётчика OKP_sysCounters.ID', N'schema', N'dbo', N'table', N'OKP_sysSampleTypes', N'column', N'CounterID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Описание, пояснения, комментарии...', N'schema', N'dbo', N'table', N'OKP_sysSampleTypes', N'column', N'Describe'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Спецификация обслуживаемой колонки', N'schema', N'dbo', N'table', N'OKP_sysSampleTypes', N'column', N'ColumnName'
GO

--
-- Definition for table OKP_sysSchedules : 
--

CREATE TABLE dbo.OKP_sysSchedules (
  ID int IDENTITY(1, 1) NOT NULL,
  Name varchar(100) COLLATE DATABASE_DEFAULT NULL,
  ActiveWeekDays varchar(20) COLLATE DATABASE_DEFAULT NULL,
  ActiveDay datetime NULL,
  IntervalBase int NOT NULL,
  IntervalVal int NOT NULL,
  CONSTRAINT PK_sysSchedules PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица расписаний', N'schema', N'dbo', N'table', N'OKP_sysSchedules'
EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'OKP_sysSchedules', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Список активных дней недели (используется только если IntervalBase = час или день). 1 - понедельник, 2 - вторник,  ...  7 - воскресенье, 8 - вся неделя.значения перечисляются через запятую.', N'schema', N'dbo', N'table', N'OKP_sysSchedules', N'column', N'ActiveWeekDays'
EXEC sp_addextendedproperty 'MS_Description', N'Активное [время]/[день месяца + время]/[день года + время].   - при IntervalBase = час   - не имеет значение  - при IntervalBase = день  - используется значение времени  - при IntervalBase = месяц - используется значение дня + времени  - при IntervalBase = год   - используется значение дня + месяца + времени', N'schema', N'dbo', N'table', N'OKP_sysSchedules', N'column', N'ActiveDay'
EXEC sp_addextendedproperty 'MS_Description', N'Интервал срабатывания.  1 - час, 2 - день, 3 - месяц, 4 - год', N'schema', N'dbo', N'table', N'OKP_sysSchedules', N'column', N'IntervalBase'
EXEC sp_addextendedproperty 'MS_Description', N'Размер период срабатывания   - при IntervalBase = час   - количество часов   - при IntervalBase = день  - количество дней   - при IntervalBase = месяц - количество месяцев  - при IntervalBase = год   - количество лет', N'schema', N'dbo', N'table', N'OKP_sysSchedules', N'column', N'IntervalVal'
GO

--
-- Definition for table OKP_TECHDOUBLES : 
--
CREATE TABLE dbo.OKP_TECHDOUBLES (
  RWC int IDENTITY(1, 1) NOT NULL,
  PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  NUM_ORIGIN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  NUM_DEPENDINGS varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  RWC_PPP int NULL,
  RWC_CPL_ORIG int NULL,
  RWC_CPL_DEPEND int NULL,
  PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица описания зависимостей партий ', N'schema', N'dbo', N'table', N'OKP_TECHDOUBLES'
EXEC sp_addextendedproperty 'MS_Description', N'Номер плановой позиции', N'schema', N'dbo', N'table', N'OKP_TECHDOUBLES', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Наряд - оригинал', N'schema', N'dbo', N'table', N'OKP_TECHDOUBLES', N'column', N'NUM_ORIGIN'
EXEC sp_addextendedproperty 'MS_Description', N'Зависящие наряды', N'schema', N'dbo', N'table', N'OKP_TECHDOUBLES', N'column', N'NUM_DEPENDINGS'
EXEC sp_addextendedproperty 'MS_Description', N'Ид ПлП', N'schema', N'dbo', N'table', N'OKP_TECHDOUBLES', N'column', N'RWC_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'Ид ПрП оригинала', N'schema', N'dbo', N'table', N'OKP_TECHDOUBLES', N'column', N'RWC_CPL_ORIG'
EXEC sp_addextendedproperty 'MS_Description', N'Ид зависящих ПрП', N'schema', N'dbo', N'table', N'OKP_TECHDOUBLES', N'column', N'RWC_CPL_DEPEND'

GO

/*
** Параметры пользователя терминала
*/ 
CREATE TABLE dbo.OKP_TERMINAL_USR (
	ID int IDENTITY(1, 1) NOT NULL,
	ID_FIO int NOT NULL,
	WCRIDN varchar(12) COLLATE DATABASE_DEFAULT NOT NULL,
	REG_OP int NULL,
	EditRZO int DEFAULT 0 NULL,
	EditTRO int DEFAULT 0 NULL,
	EditTSK int DEFAULT 0 NULL,
	ShowCost INT NOT NULL,
	REG_BY_SN int DEFAULT(0),
	CONSTRAINT PK_OKP_TERMINAL_USR PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty N'MS_Description',N'Пользователи терминала',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR'
EXEC sp_addextendedproperty N'MS_Description',N'Идентификатор',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'ID'
EXEC sp_addextendedproperty N'MS_Description',N'ссылка запись справочника Персонал',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'ID_FIO'
EXEC sp_addextendedproperty N'MS_Description',N'Обозначение рабочего центра',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'WCRIDN'
EXEC sp_addextendedproperty N'MS_Description',N'Право на учет операции',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'REG_OP'
EXEC sp_addextendedproperty N'MS_Description',N'Право на изменение Разряда',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'EditRZO'
EXEC sp_addextendedproperty N'MS_Description',N'Право на изменение Тшк',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'EditTRO'
EXEC sp_addextendedproperty N'MS_Description',N'Право на изменение Тшк-зп',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'EditTSK'
EXEC sp_addextendedproperty N'MS_Description',N'Отображать стоимость работы',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'ShowCost'
EXEC sp_addextendedproperty N'MS_Description',N'Учет по серийному номеру',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'REG_BY_SN'
GO

--
-- Definition for table OKP_TPC : 
--

CREATE TABLE dbo.OKP_TPC (
  ID bigint IDENTITY(1, 1) NOT NULL,
  DOC_ID bigint NOT NULL,
  DB bigint NOT NULL,
  DE bigint NOT NULL,
  Describe varchar(200) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_TPC PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица проектов производственного плана на основе циклограмм (T_emp P_lans based on C_yclogramm)', N'schema', N'dbo', N'table', N'OKP_TPC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Начало периода планирования', N'schema', N'dbo', N'table', N'OKP_TPC', N'column', N'DB'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Окончание периода планирования', N'schema', N'dbo', N'table', N'OKP_TPC', N'column', N'DE'
GO

--
-- Definition for table OKP_TPC_POT : 
--

CREATE TABLE dbo.OKP_TPC_POT (
  CPLNUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  PRTIDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  DTE datetime NOT NULL,
  QTYPOT float NOT NULL,
  NOP int NOT NULL,
  QTYRQY float NOT NULL,
  TM int NOT NULL,
  NMP$$$NAM varchar(100) COLLATE DATABASE_DEFAULT NOT NULL
)

GO

/*
** Definition for table OKP_TPC_TOZ : 
*/
CREATE TABLE dbo.OKP_TPC_TOZ (
	NUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	PRT$$$MNF varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	DEP_ID bigint NOT NULL,
	WCR$$$WCR varchar(12) COLLATE DATABASE_DEFAULT NOT NULL,
	NOP int NOT NULL,
	DTEPDZ datetime NOT NULL,
	DTEPDV datetime NOT NULL,
	QTYPQY float NOT NULL,
	QTYCQY float NOT NULL,
	QTYPWO float NOT NULL,
	QTYPZV float NOT NULL,
	MOV float NOT NULL,
	PlanType int NOT NULL,
	Holidays bit NOT NULL,
	QCY int NOT NULL,
	TimeBegin datetime NOT NULL,
	PSM float NOT NULL,
	SRC int NOT NULL,
	QCYFLX float NULL,
	TOP$$$KTO varchar(4) COLLATE DATABASE_DEFAULT NOT NULL,
	OOD int NOT NULL,
	PZV float NOT NULL,
	VP float NOT NULL,
	TMO float NOT NULL,
	TRO float NOT NULL,
	RZO int NOT NULL,
	PRF$$$PRF varchar(5) COLLATE DATABASE_DEFAULT NOT NULL,
	TDDOC varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	TPN float NOT NULL,
	PRODTYPE int NOT NULL,
	TSK float NOT NULL,
	SPLITPARTIES int NOT NULL,
	M_DB bigint NOT NULL,
	M_DE bigint NOT NULL,
	M_DB_NR bigint NOT NULL,
	M_DE_NR bigint NOT NULL,
	NR int NOT NULL,
	WPLCOUNT int NOT NULL,
	TU varchar(4000) COLLATE DATABASE_DEFAULT NULL,
	FILES_ID int NULL,
	COMMENT varchar(100) COLLATE DATABASE_DEFAULT NULL,
	autouop BIT DEFAULT 0 NOT NULL,
	useKOID tinyint CONSTRAINT df_okp_tpc_toz_useKOID DEFAULT (1) NOT NULL,
	verify_need bit DEFAULT 0 NOT NULL,
    SHELFLIFE float CONSTRAINT df_okp_tpc_toz_SHELFLIFE DEFAULT 0 NOT NULL,
    SHELFLIFE_EIZID INT CONSTRAINT df_okp_tpc_toz_SHELFLIFE_EIZID DEFAULT 9 NOT NULL,
    SHELFLIFE_STS INT CONSTRAINT df_okp_tpc_toz_SHELFLIFE_STS DEFAULT 0 NOT NULL,
    SHT float CONSTRAINT df_okp_tpc_toz_SHT DEFAULT 0 NOT NULL
)
GO

/* @NAME: OKP_TPC_WCRCapacity
** @COMM: 1. WPL_ID пришлось разрешить NULL, потому что при переходе на данное поле оказался мусор с этой таблице
*/
CREATE TABLE dbo.OKP_TPC_WCRCapacity (
	WCR varchar(12) COLLATE DATABASE_DEFAULT NOT NULL,
	CPLNUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	NOP int NOT NULL,	
	DateBegin datetime NOT NULL,
	DateEnd datetime NOT NULL,
	wpl_id INT NULL
)
GO

--
-- Definition for table OKP_TPCData : 
--

CREATE TABLE dbo.OKP_TPCData (
  ID bigint IDENTITY(1, 1) NOT NULL,
  IDP bigint NULL,
  TPC_ID bigint NOT NULL,
  ITEM_ID bigint NOT NULL,
  NOM_ID bigint NOT NULL,
  NOM_IDX varchar(211) COLLATE DATABASE_DEFAULT NULL,
  SHIFT int NOT NULL,
  DB bigint NOT NULL,
  DE bigint NOT NULL,
  ROUTE_ID int NOT NULL,
  QTY_PC float NOT NULL,
  QTY_PCO float NOT NULL,
  QTY float NOT NULL,
  CGM_ID bigint NULL,
  PlanType bit NOT NULL,
  PartySize float NOT NULL,
  STATE int NULL,
  USER_ID int NOT NULL,
  PPP_ID int NULL,
  UseSteps int NULL,
  PLOData_ID bigint null,
  Master_ITEM_ID bigint null,
  Slave_ITEM_ID bigint null,
  CONSTRAINT PK_TPCData PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица данных проектов производственного плана на основе циклограмм', N'schema', N'dbo', N'table', N'OKP_TPCData'
EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на "родительскую" запись (OKP_TPCData.ID)', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'IDP'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на проект плана (OKP_TPC.ID)', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'TPC_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор, указывающий на принадлежность к одной позиции', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'ITEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на номенклатуру (OKP_NOM.RWC)', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор состава (см. f_FullBom)', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'NOM_IDX'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг состояния: 0 - запись входит в состав циклограммы 1 - запись исключена из состава и переведена в потребность 2 - запись исключена из состава и переведена в дубль 3 - запись исключена из состава 4 - запись исключена из состава и выведена в отдельную ПП 5 - запись исключена из состава и является составной частью записи, выведенной в отдельную ПП', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'SHIFT'
EXEC sp_addextendedproperty 'MS_Description', N'Начало изготовления номенклатуры NOM_ID', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'DB'
EXEC sp_addextendedproperty 'MS_Description', N'Окончание изготовления номенклатуры NOM_ID', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'DE'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор маршрута (OKP_ROUTES.ID)', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'ROUTE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Количество на единицу "родителя" текущее', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'QTY_PC'
EXEC sp_addextendedproperty 'MS_Description', N'Количество на единицу "родителя" базовое', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'QTY_PCO'
EXEC sp_addextendedproperty 'MS_Description', N'Количество полное', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на циклограмму (OKP_CGM.ID) - только для TOP-элемента', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'CGM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Тип планирования', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'Размер передаточной партии', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'PartySize'
EXEC sp_addextendedproperty 'MS_Description', N'Состояние записи (имеет значение только для записей, у которых IDP is null)  0 - не расчитан   1 - расчитан   2 - поставлен в план', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'STATE'
EXEC sp_addextendedproperty 'MS_Description', N'Пользователь, создавший/изменивший запись (OKP_USERS.USER_ID)', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'плановая позиция в производственном плане (OKP_PPP.RWC)', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'PPP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на запись в заказе (OKP_PLOData.ID)', 'schema', 'dbo', 'table', 'OKP_TPCData', 'column', 'PLOData_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ключ ведущей группы (OKP_TPCData.ITEM_ID)', 'schema', 'dbo', 'table', 'OKP_TPCData', 'column', 'Master_ITEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ключ ведомой группы (OKP_TPCData.ITEM_ID)', N'SCHEMA', N'dbo', N'TABLE', N'OKP_TPCData', N'COLUMN', N'Slave_ITEM_ID'
go

--
-- Definition for table OKP_TPSample : 
--

CREATE TABLE dbo.OKP_TPSample (
  ID bigint IDENTITY(1, 1) NOT NULL,
  NOMDATA_ID bigint NOT NULL,
  DOC_ID bigint NOT NULL,
  OFFICE varchar(30) COLLATE DATABASE_DEFAULT NULL,
  A_FIO varchar(100) COLLATE DATABASE_DEFAULT NULL,
  A_DTE datetime NULL,
  DESCRIBE varchar(max) COLLATE DATABASE_DEFAULT NULL,
  isAgreed int DEFAULT 0 NOT NULL,
  isDefault int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_TPSample PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица шаблонов технологических процессов', N'schema', N'dbo', N'table', N'OKP_TPSample'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на предмет в OKP_NOM', N'schema', N'dbo', N'table', N'OKP_TPSample', N'column', N'NOMDATA_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на спецификацию шаблона', N'schema', N'dbo', N'table', N'OKP_TPSample', N'column', N'DOC_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ответственное бюро', N'schema', N'dbo', N'table', N'OKP_TPSample', N'column', N'OFFICE'
EXEC sp_addextendedproperty 'MS_Description', N'Кто активировал (OKP_users.FIO)', N'schema', N'dbo', N'table', N'OKP_TPSample', N'column', N'A_FIO'
EXEC sp_addextendedproperty 'MS_Description', N'Дата утверждения', N'schema', N'dbo', N'table', N'OKP_TPSample', N'column', N'A_DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Описание шаблона', N'schema', N'dbo', N'table', N'OKP_TPSample', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг "Шаблон утверждён". 0 - не утверждён, 1 - утверждён', N'schema', N'dbo', N'table', N'OKP_TPSample', N'column', N'isAgreed'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг "Шаблон по умолчанию". По умолчанию может быть только один. Шаблоном по умолчанию может быть и утверждённый и неутверждённый шаблон. 0 - не является шаблоном по умолчанию, 1 - является шаблоном по умолчанию', N'schema', N'dbo', N'table', N'OKP_TPSample', N'column', N'isDefault'
GO

--
-- Definition for table OKP_TPSampleData : 
--

CREATE TABLE dbo.OKP_TPSampleData (
  ID bigint IDENTITY(1, 1) NOT NULL,
  TPS_ID bigint NOT NULL,
  N int NOT NULL,
  NAME varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  BEGIN_ID bigint NULL,
  END_ID bigint NULL,
  DESCRIBE varchar(100) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_TPSampleData PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица шаблонных этапов технологических процессов', N'schema', N'dbo', N'table', N'OKP_TPSampleData'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на шаблон ТП в OKP_TPSample.ID', N'schema', N'dbo', N'table', N'OKP_TPSampleData', N'column', N'TPS_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Номер этапа', N'schema', N'dbo', N'table', N'OKP_TPSampleData', N'column', N'N'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Наименование этапа', N'schema', N'dbo', N'table', N'OKP_TPSampleData', N'column', N'NAME'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на этап (OKP_TPSampleData.ID), задающий начало (равно окончанию)', N'schema', N'dbo', N'table', N'OKP_TPSampleData', N'column', N'BEGIN_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на этап (OKP_TPSampleData.ID), задающий окончание (равно началу)', N'schema', N'dbo', N'table', N'OKP_TPSampleData', N'column', N'END_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Краткое описание этапа шаблона ТП', N'schema', N'dbo', N'table', N'OKP_TPSampleData', N'column', N'DESCRIBE'
GO

--
-- Definition for table OKP_TPSampleQTY : 
--

CREATE TABLE dbo.OKP_TPSampleQTY (
  ID bigint IDENTITY(1, 1) NOT NULL,
  TPS_ID bigint NOT NULL,
  QTY float NOT NULL,
  EIZ_ID int NOT NULL,
  DESCRIBE varchar(200) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_TPSampleQTY PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица количества изготовления по шаблонам технологических процессов', N'schema', N'dbo', N'table', N'OKP_TPSampleQTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на шаблон ТП (OKP_TPSample.ID)', N'schema', N'dbo', N'table', N'OKP_TPSampleQTY', N'column', N'TPS_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Количество изготовления по шаблону', N'schema', N'dbo', N'table', N'OKP_TPSampleQTY', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ длительностей шагов шаблона для указанного количества изготовления', N'schema', N'dbo', N'table', N'OKP_TPSampleQTY', N'column', N'EIZ_ID'
GO

--
-- Definition for table OKP_TPSampleQTYData : 
--

CREATE TABLE dbo.OKP_TPSampleQTYData (
  ID bigint IDENTITY(1, 1) NOT NULL,
  TPQ_ID bigint NOT NULL,
  TPD_ID bigint NOT NULL,
  CYCLE float NOT NULL,
  CONSTRAINT PK_TPSampleQTYData PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица длительностей шаблонных этапов технологических процессов', N'schema', N'dbo', N'table', N'OKP_TPSampleQTYData'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на описание количества изготовления по шаблону ТП (OKP_TPSampleQTY.ID)', N'schema', N'dbo', N'table', N'OKP_TPSampleQTYData', N'column', N'TPQ_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на этап шаблона ТП (OKP_TPSampleData.ID)', N'schema', N'dbo', N'table', N'OKP_TPSampleQTYData', N'column', N'TPD_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Длительность этапа', N'schema', N'dbo', N'table', N'OKP_TPSampleQTYData', N'column', N'CYCLE'
GO

--
-- Definition for table OKP_TPSampleSostav : 
--

CREATE TABLE dbo.OKP_TPSampleSostav (
  TPD_ID bigint NOT NULL,
  TPS_ID bigint NOT NULL,
  NOM_IDX varchar(200) COLLATE DATABASE_DEFAULT NOT NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица состава шаблонных этапов технологических процессов', N'schema', N'dbo', N'table', N'OKP_TPSampleSostav'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на этап шаблона ТП (OKP_TPSampleData.ID)', N'schema', N'dbo', N'table', N'OKP_TPSampleSostav', N'column', N'TPD_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на шаблон ТП (OKP_TPSample.ID) (для удобства)', N'schema', N'dbo', N'table', N'OKP_TPSampleSostav', N'column', N'TPS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Расширенная ссылка на номенклатуру в составе (f_FullBom.GRP_IDN+","+f_FullBom.ID)', N'schema', N'dbo', N'table', N'OKP_TPSampleSostav', N'column', N'NOM_IDX'
GO

--
-- Definition for table OKP_TRNGRP : 
--

CREATE TABLE dbo.OKP_TRNGRP (
  ID int IDENTITY(1, 1) NOT NULL,
  P_ID int NULL,
  NAM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  WRH varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  PRIMARY KEY CLUSTERED (ID)
)

GO

--
-- Definition for table OKP_TSO : 
--

CREATE TABLE dbo.OKP_TSO (
  TSO_IDN varchar(2) COLLATE DATABASE_DEFAULT NOT NULL,
  TSO_NAM varchar(40) COLLATE DATABASE_DEFAULT NOT NULL,
  ID int IDENTITY(1, 1) NOT NULL,
  CONSTRAINT PK_OKP_TSO PRIMARY KEY CLUSTERED (TSO_IDN)
)

GO

EXEC sp_addextendedproperty 'MS_Description', N'ВИДЫ ТРАНЗАКЦИЙ', N'schema', N'dbo', N'table', N'OKP_TSO'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Код вида транзакции', N'schema', N'dbo', N'table', N'OKP_TSO', N'column', N'TSO_IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Наименование транзакции', N'schema', N'dbo', N'table', N'OKP_TSO', N'column', N'TSO_NAM'
GO

--
-- Definition for table OKP_UBRNUMS : 
--

CREATE TABLE dbo.OKP_UBRNUMS (
  ID bigint IDENTITY(1, 1) NOT NULL,
  N_Act int NOT NULL,
  TOZ_ID int NOT NULL,
  UNOM_ID bigint NOT NULL,
  N_TYPE int NOT NULL,
  QTY float NOT NULL,
  EditDate datetime DEFAULT getdate() NOT NULL,
  PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Серийные номера акта о браке', N'schema', N'dbo', N'table', N'OKP_UBRNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на акт о браке', N'schema', N'dbo', N'table', N'OKP_UBRNUMS', N'column', N'N_Act'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на технологическую операцию OKP_TOZ.RWC', N'schema', N'dbo', N'table', N'OKP_UBRNUMS', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на внутренний идентификационный номер (OKP_UNOM.ID/OKP_UKIM.ID)', N'schema', N'dbo', N'table', N'OKP_UBRNUMS', N'column', N'UNOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на тип номера (OKP_sysObjects.ID)', N'schema', N'dbo', N'table', N'OKP_UBRNUMS', N'column', N'N_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Забракованное количество в партии', N'schema', N'dbo', N'table', N'OKP_UBRNUMS', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Дата занесения', N'schema', N'dbo', N'table', N'OKP_UBRNUMS', N'column', N'EditDate'
GO

--
-- Definition for table OKP_UOPNUMS : 
--

CREATE TABLE dbo.OKP_UOPNUMS (
  ID bigint IDENTITY(1, 1) NOT NULL,
  TOZ_ID int NOT NULL,
  UNOM_ID bigint NOT NULL,
  UOP_GrUID uniqueidentifier NOT NULL,
  N_TYPE int NOT NULL,
  QTY float DEFAULT 1 NOT NULL,
  PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица связей учетов и внутренних идентификационных номеров изделий', N'schema', N'dbo', N'table', N'OKP_UOPNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'Ключ', N'schema', N'dbo', N'table', N'OKP_UOPNUMS', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на технологическую операцию OKP_TOZ.RWC', N'schema', N'dbo', N'table', N'OKP_UOPNUMS', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на внутренний идентификационный номер (OKP_UNOM.ID)', N'schema', N'dbo', N'table', N'OKP_UOPNUMS', N'column', N'UNOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на группу учета (OKP_UOP.GrIDN)', N'schema', N'dbo', N'table', N'OKP_UOPNUMS', N'column', N'UOP_GrUID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на тип номера (OKP_sysObjects.ID)', N'schema', N'dbo', N'table', N'OKP_UOPNUMS', N'column', N'N_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Количество в идентификационной партии', N'schema', N'dbo', N'table', N'OKP_UOPNUMS', N'column', N'QTY'
GO

--
-- Definition for table OKP_UKIM : 
--

CREATE TABLE dbo.OKP_UKIM (
  ID bigint IDENTITY(1, 1) NOT NULL,
  NOM_ID bigint NOT NULL,
  IDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  EXT_IDN varchar(50) COLLATE DATABASE_DEFAULT NULL,
  CERTIFICATE varchar(100) COLLATE DATABASE_DEFAULT NULL,
  PermDate datetime null,
  DESCRIBE varchar(100) COLLATE DATABASE_DEFAULT NULL,
  CPL_ID bigint NULL,
  EXTNOM_ID bigint NULL,
  CONSTRAINT PK_UKIM PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Список номерованных партий КИМ', N'schema', N'dbo', N'table', N'OKP_UKIM'
EXEC sp_addextendedproperty 'MS_Description', N'Ключ', N'schema', N'dbo', N'table', N'OKP_UKIM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Классификационный ключ. Ссылка на OKP_NOM.RWC', N'schema', N'dbo', N'table', N'OKP_UKIM', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Персональный внутрисистемный идентификатор партии КИМ', N'schema', N'dbo', N'table', N'OKP_UKIM', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Внешний идентификатор партии КИМ', N'schema', N'dbo', N'table', N'OKP_UKIM', N'column', N'EXT_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Сертификат', N'schema', N'dbo', N'table', N'OKP_UKIM', N'column', N'CERTIFICATE'
EXEC sp_addextendedproperty 'MS_Description', N'Дата окончания срока годности', N'schema', N'dbo', N'table', N'OKP_UKIM', N'column', N'PermDate'
EXEC sp_addextendedproperty 'MS_Description', N'Описание партии КИМ', N'schema', N'dbo', N'table', N'OKP_UKIM', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на OKP_EXTNOM.ID (указывает связь с таблицей внешних обозначений номенклатуры)', N'schema', N'dbo', N'table', N'OKP_UKIM', N'column', N'EXTNOM_ID'
GO

/*
** Информацию по объединённым ПрП
*/
CREATE TABLE dbo.OKP_UNIONCPL (
	ID int IDENTITY(1, 1) NOT NULL,
	OLD_NUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	OLD_QTY float NOT NULL,
	OLD_PARNUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	OLD_PARRWC bigint NULL,
	OLD_PLODATAID bigint NULL,
	NEW_NUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	NEW_RWC bigint NULL,
	NEW_PPP varchar(10) COLLATE DATABASE_DEFAULT NULL,
	OLD_PPP varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	OLD_REM varchar(50) COLLATE DATABASE_DEFAULT NULL,
	OLD_NPR varchar(50) COLLATE DATABASE_DEFAULT NULL,
	CONSTRAINT PK_OKP_UNIONCPL PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица информации об объединениях производственных партий', N'schema', N'dbo', N'table', N'OKP_UNIONCPL'
EXEC sp_addextendedproperty 'MS_Description', N'ID', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'номер партии', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'OLD_NUM'
EXEC sp_addextendedproperty 'MS_Description', N'плановое количество', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'OLD_QTY'
EXEC sp_addextendedproperty 'MS_Description', N'номер ПрП - владельца партии', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'OLD_PARNUM'
EXEC sp_addextendedproperty 'MS_Description', N'идентификатор ПрП владельца', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'OLD_PARRWC'
EXEC sp_addextendedproperty 'MS_Description', N'идентификатор элемента заказа', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'OLD_PLODATAID'
EXEC sp_addextendedproperty 'MS_Description', N'номер новой объединенной партии', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'NEW_NUM'
EXEC sp_addextendedproperty 'MS_Description', N'идентификатор записи новой объединенной партии ПрП', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'NEW_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Номер ПП новой патрии', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'NEW_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'номер ПП', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'OLD_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'комментарий', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'OLD_REM'
EXEC sp_addextendedproperty 'MS_Description', N'направление реализации', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'OLD_NPR'
GO

--
-- Definition for table OKP_WRH_SUBJECTS : 
--

CREATE TABLE dbo.OKP_WRH_SUBJECTS (
  ID bigint IDENTITY(1, 1) NOT NULL,
  IDP bigint NULL,
  INV_ID bigint NOT NULL,
  S_ID bigint NOT NULL,
  ObjectTypeID int NOT NULL,
  QTY float NOT NULL,
  PRC float NULL,
  DKD datetime NOT NULL,
  DTE datetime DEFAULT getdate() NOT NULL,
  CONSTRAINT PK_WRH_SUBJECTS PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Набор складских карточек объектов (распределение объектов по складам)', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на ведущую карточку (OKP_WRH_SUBJECTS.ID) ', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS', N'column', N'IDP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Номенклатурный складской ключ. Ссылка на OKP_INV.INV_ID', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS', N'column', N'INV_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ключ объекта. Ссылка на OKP_UNOM.ID/OKP_KIM.ID', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS', N'column', N'S_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Тип объекта. Ссылка на OKP_sysObjects.ID', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS', N'column', N'ObjectTypeID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Текущее количество объекта в карточке. Количество указано в системной ЕИЗ расхода (см. описание OKP_INV.QTY)', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Цена единицы предмета в системной ЕИЗ расхода (см. описание OKP_INV.PRC)', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS', N'column', N'PRC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата поступления (соответствует OKP_TRN.DKD документа прихода на склад)', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS', N'column', N'DKD'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата создания карточки', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS', N'column', N'DTE'
GO

/*
** Definition for table OKP_UNOM : 
*/
CREATE TABLE dbo.OKP_UNOM (
	ID bigint IDENTITY(1, 1) NOT NULL,
	NOM_ID bigint NOT NULL,
	IDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	EXT_IDN varchar(50) COLLATE DATABASE_DEFAULT NULL,
	CERTIFICATE varchar(100) COLLATE DATABASE_DEFAULT NULL,
	DESCRIBE varchar(100) COLLATE DATABASE_DEFAULT NULL,
	CPL_ID bigint NULL,
	EXTNOM_ID bigint NULL,
	PermDate datetime null,
	CONSTRAINT PK_UNOM PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Серийные номера', N'schema', N'dbo', N'table', N'OKP_UNOM'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Классификационный ключ. Ссылка на OKP_NOM.RWC', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Серийный номер', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Внешний серийный номер', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'EXT_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Сертификат', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'CERTIFICATE'
EXEC sp_addextendedproperty 'MS_Description', N'Описание', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на OKP_CPL.RWC (указывает принадлежность к партии изготовления)', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'CPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на OKP_EXTNOM.ID (указывает связь с таблицей внешних обозначений номенклатуры)', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'EXTNOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата окончания срока годности', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'PermDate'
GO

--
-- Definition for table OKP_UOPKIMNUMS : 
--

CREATE TABLE dbo.OKP_UOPKIMNUMS (
  ID bigint IDENTITY(1, 1) NOT NULL,
  UOP_GrUID uniqueidentifier NOT NULL,
  WRHSUBJ_ID bigint NOT NULL,
  QTY_USED float DEFAULT 0 NOT NULL,
  TK int NOT NULL,
  CONSTRAINT PK_OKP_UOPKIMNUMS PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица связей учетов и внутренних идентификационных номеров КИМ', N'schema', N'dbo', N'table', N'OKP_UOPKIMNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на группу учета (OKP_UOP.GrUID)', N'schema', N'dbo', N'table', N'OKP_UOPKIMNUMS', N'column', N'UOP_GrUID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на распределение объектов выдачи (OKP_WRH_SUBJECTS.ID)', N'schema', N'dbo', N'table', N'OKP_UOPKIMNUMS', N'column', N'WRHSUBJ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Использованное кол-во в единицах измерения аналогичных OKP_POT.QTYPOT', N'schema', N'dbo', N'table', N'OKP_UOPKIMNUMS', N'column', N'QTY_USED'
EXEC sp_addextendedproperty 'MS_Description', N'Тип комплектации (0 со склада; 1 с производства)', N'schema', N'dbo', N'table', N'OKP_UOPKIMNUMS', N'column', N'TK'
GO

--
-- Definition for table OKP_UOPUNION : 
--

CREATE TABLE dbo.OKP_UOPUNION (
  ID bigint IDENTITY(1, 1) NOT NULL,
  NOS int NOT NULL,
  L_QTYGQY float NOT NULL,
  OLD_PPP varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  OLD_CPL varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  CONSTRAINT PK_OKP_UOPUNION PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Журнал распределения учетов по объединенным позициям ', N'schema', N'dbo', N'table', N'OKP_UOPUNION'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор учета', N'schema', N'dbo', N'table', N'OKP_UOPUNION', N'column', N'NOS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Количество учтенное на операцию позиции', N'schema', N'dbo', N'table', N'OKP_UOPUNION', N'column', N'L_QTYGQY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Номер ПП до объединения', N'schema', N'dbo', N'table', N'OKP_UOPUNION', N'column', N'OLD_PPP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Номер ПрП до объединения', N'schema', N'dbo', N'table', N'OKP_UOPUNION', N'column', N'OLD_CPL'
GO

--
-- Definition for table OKP_UPU : 
--

CREATE TABLE dbo.OKP_UPU (
  ID bigint IDENTITY(1, 1) NOT NULL,
  UPU_IDN varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  SUP_IDN varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  PRC money NULL,
  REG int DEFAULT 0 NOT NULL,
  SDDPER float DEFAULT 0 NOT NULL,
  QTYTNP float DEFAULT 0 NOT NULL,
  EIZ_IDN varchar(3) COLLATE DATABASE_DEFAULT NOT NULL,
  UPUCPP float DEFAULT 0 NOT NULL,
  UPUGPP float DEFAULT 0 NOT NULL,
  UPUTRS varchar(30) COLLATE DATABASE_DEFAULT NULL,
  FLLINT varchar(30) COLLATE DATABASE_DEFAULT NULL,
  FLLINU varchar(30) COLLATE DATABASE_DEFAULT NULL,
  Comment varchar(255) COLLATE DATABASE_DEFAULT NULL,
  MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
  PRIORITY int DEFAULT 0 NOT NULL,
  WRH_ID int NULL,
  K float NULL,
  WKL_BARCODE bigint NULL,
  PRC_PUR float DEFAULT 0 NOT NULL,
  SUP_ID bigint NULL,
  K_EIZ_POST float DEFAULT 1 NULL,
  K_EIZ_POTR float DEFAULT 1 NULL,
  ISACTIVE int DEFAULT 1 NULL,
  created_by varchar(50) COLLATE DATABASE_DEFAULT NULL,
  edited_by varchar(50) COLLATE DATABASE_DEFAULT NULL,
  created_date datetime DEFAULT getdate() NULL,
  edited_date datetime DEFAULT getdate() NULL,
  NOM_ID int NULL,
  dte_prc_updated datetime DEFAULT getdate() NULL,
  EXTNOM_ID int NULL,
  PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица свзязей поставщиков с предметами поставки', N'schema', N'dbo', N'table', N'OKP_UPU'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'UPU_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор поставщика', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'SUP_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Стоимость транспортировки одной ТНП', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'PRC'
EXEC sp_addextendedproperty 'MS_Description', N'Режим поставки', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'REG'
EXEC sp_addextendedproperty 'MS_Description', N'Срок поставки', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'SDDPER'
EXEC sp_addextendedproperty 'MS_Description', N'Транзитная норма поставки', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'QTYTNP'
EXEC sp_addextendedproperty 'MS_Description', N'Единица измерения поставки товара', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'EIZ_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Цикл поставки', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'UPUCPP'
EXEC sp_addextendedproperty 'MS_Description', N'Среднегодовой выпуск предмета', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'UPUGPP'
EXEC sp_addextendedproperty 'MS_Description', N'Основной вид транспорта', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'UPUTRS'
EXEC sp_addextendedproperty 'MS_Description', N'Код инструкции транспортировки', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'FLLINT'
EXEC sp_addextendedproperty 'MS_Description', N'Код инструкции упаковки', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'FLLINU'
EXEC sp_addextendedproperty 'MS_Description', N'Метка', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Приоритетность поставщика', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'PRIORITY'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на склад поставки (OKP_WRH)', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'WRH_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Коэффициент конвертации из ЕИЗ планирования в ЕИЗ поставки', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'K'
EXEC sp_addextendedproperty 'MS_Description', N'Внешний штрихкод', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'WKL_BARCODE'
EXEC sp_addextendedproperty 'MS_Description', N'Цена поставщика (за ЕИЗ)', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'PRC_PUR'
EXEC sp_addextendedproperty 'MS_Description', N'Статус условия поставки: 0-Не действующее, 1-Действующее', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'ISACTIVE'
EXEC sp_addextendedproperty 'MS_Description', N'Кем создана запись', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'created_by'
EXEC sp_addextendedproperty 'MS_Description', N'Кем изменена запись', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'edited_by'
EXEC sp_addextendedproperty 'MS_Description', N'Когда создана запись', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'created_date'
EXEC sp_addextendedproperty 'MS_Description', N'Когда изменена запись', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'edited_date'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор связанной номенклатуры', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последнего обновления цены', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'dte_prc_updated'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на таблицу OKP_EXTNOM', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'EXTNOM_ID'
GO

--
-- Definition for table OKP_UserReports : 
--

CREATE TABLE dbo.OKP_UserReports (
  ReportID int NOT NULL,
  UserName varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  CONSTRAINT PK_OKP_UserReports PRIMARY KEY CLUSTERED (ReportID, UserName)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Права пользователей на запуск отчетов', N'schema', N'dbo', N'table', N'OKP_UserReports'

--
-- Definition for table OKP_VPlan : 
--

CREATE TABLE dbo.OKP_VPlan (
  ID int IDENTITY(1, 1) NOT NULL,
  N int NOT NULL,
  Name varchar(50) COLLATE DATABASE_DEFAULT NULL,
  LimB datetime NOT NULL,
  LimE datetime NOT NULL,
  Comment varchar(1000) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_OKP_VPlan PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Виртуальные планы', N'schema', N'dbo', N'table', N'OKP_VPlan'
EXEC sp_addextendedproperty 'MS_Description', N'Номер по порядку, генерируется системой', N'schema', N'dbo', N'table', N'OKP_VPlan', N'column', N'N'
EXEC sp_addextendedproperty 'MS_Description', N'Произвольное имя плана', N'schema', N'dbo', N'table', N'OKP_VPlan', N'column', N'Name'
EXEC sp_addextendedproperty 'MS_Description', N'Начальная граница ПЛАНИРОВАНИЯ (не плана)', N'schema', N'dbo', N'table', N'OKP_VPlan', N'column', N'LimB'
EXEC sp_addextendedproperty 'MS_Description', N'Конечная граница ПЛАНИРОВАНИЯ (не плана)', N'schema', N'dbo', N'table', N'OKP_VPlan', N'column', N'LimE'
EXEC sp_addextendedproperty 'MS_Description', N'Текст пояснения', N'schema', N'dbo', N'table', N'OKP_VPlan', N'column', N'Comment'
GO

--
-- Definition for table OKP_VObj : 
--

CREATE TABLE dbo.OKP_VObj (
  ID int IDENTITY(1, 1) NOT NULL,
  VID int NOT NULL,
  Name varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  DB bigint NULL,
  DE bigint NULL,
  ZakDTE bigint NULL,
  Priority int CONSTRAINT DF_OKP_VObj2 DEFAULT 50 NOT NULL,
  Calced int CONSTRAINT DF_OKP_VObj1 DEFAULT 0 NOT NULL,
  Comment varchar(50) COLLATE DATABASE_DEFAULT NULL,
  Num int NOT NULL,
  CONSTRAINT PK_OKP_VObj PRIMARY KEY CLUSTERED (ID)
)
GO


EXEC sp_addextendedproperty 'MS_Description', N'Объекты виртуальных планов', N'schema', N'dbo', N'table', N'OKP_VObj'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на таблицу планов OKP_VPlan.ID', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'VID'
EXEC sp_addextendedproperty 'MS_Description', N'Произвольное уникальное непустое имя плана', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'Name'
EXEC sp_addextendedproperty 'MS_Description', N'Дата начала изготовления объекта; значение указывается на целочисленной шкале дат (см. функцию TWTime_IntAsDateTime)', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'DB'
EXEC sp_addextendedproperty 'MS_Description', N'Дата окончания изготовления объекта; значение указывается на целочисленной шкале дат (см. функцию TWTime_IntAsDateTime)', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'DE'
EXEC sp_addextendedproperty 'MS_Description', N'Дата выпуска заказа', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'ZakDTE'
EXEC sp_addextendedproperty 'MS_Description', N'Приоритет', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'Priority'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг расчёта (1 - расчитан, 0 - нет)', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'Calced'
EXEC sp_addextendedproperty 'MS_Description', N'Текст пояснения', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'Comment'
EXEC sp_addextendedproperty 'MS_Description', N'уникальный номер (порядковый) объекта в пределах плана', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'Num'
GO

--
-- Definition for table OKP_VElem : 
--

CREATE TABLE dbo.OKP_VElem (
  ID int IDENTITY(1, 1) NOT NULL,
  P_ID int NULL,
  OID int NOT NULL,
  NID int NOT NULL,
  KOL float NOT NULL,
  KOLpO float NOT NULL,
  PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NULL,
  RegDB datetime NULL,
  RegDE datetime NULL,
  ST int DEFAULT 0 NULL,
  CONSTRAINT PK_OKP_VElem PRIMARY KEY CLUSTERED (ID)
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Таблица элементов виртуальных планов', N'schema', N'dbo', N'table', N'OKP_VElem'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на родителя OKP_VElem.ID', N'schema', N'dbo', N'table', N'OKP_VElem', N'column', N'P_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на таблицу объектов OKP_VObj.ID', N'schema', N'dbo', N'table', N'OKP_VElem', N'column', N'OID'
EXEC sp_addextendedproperty 'MS_Description', N'Планируемое количество элемента', N'schema', N'dbo', N'table', N'OKP_VElem', N'column', N'KOL'
EXEC sp_addextendedproperty 'MS_Description', N'Количество элемента на единицу родителя', N'schema', N'dbo', N'table', N'OKP_VElem', N'column', N'KOLpO'
EXEC sp_addextendedproperty 'MS_Description', N'Номер ПП поставленной в настоящий план по данному элементу', N'schema', N'dbo', N'table', N'OKP_VElem', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Дата начала соответствующей ПП', N'schema', N'dbo', N'table', N'OKP_VElem', N'column', N'RegDB'
EXEC sp_addextendedproperty 'MS_Description', N'Дата окончания соответствующей ПП', N'schema', N'dbo', N'table', N'OKP_VElem', N'column', N'RegDE'
EXEC sp_addextendedproperty 'MS_Description', N'Статус элемента: 0-не поставлено в план; 1-поставленно', N'schema', N'dbo', N'table', N'OKP_VElem', N'column', N'ST'
GO

--
-- Definition for table OKP_VOper : 
--

CREATE TABLE dbo.OKP_VOper (
  ID int IDENTITY(1, 1) NOT NULL,
  EID int NOT NULL,
  OID int NOT NULL,
  WCR varchar(20) COLLATE DATABASE_DEFAULT NOT NULL,
  KTO varchar(4) COLLATE DATABASE_DEFAULT NOT NULL,
  KTOName varchar(150) COLLATE DATABASE_DEFAULT NULL,
  N int NOT NULL,
  TSH float NOT NULL,
  TPN float NOT NULL,
  TMO float NOT NULL,
  EIZ_TSH int NOT NULL,
  EIZ_TPN int NOT NULL,
  EIZ_TMO int NOT NULL,
  DB bigint NULL,
  DE bigint NULL,
  WCRName varchar(30) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_OKP_VOper PRIMARY KEY CLUSTERED (ID)
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Таблица операций виртуальных планов', N'schema', N'dbo', N'table', N'OKP_VOper'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на таблицу элементов OKP_VElem.ID', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'EID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на таблицу объектов OKP_VObj.ID (для ускорения выборок)', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'OID'
EXEC sp_addextendedproperty 'MS_Description', N'РЦ (см. таблицу OKP_WRC.WCR$$$IDN)', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'WCR'
EXEC sp_addextendedproperty 'MS_Description', N'Код операции', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'KTO'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование операции', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'KTOName'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'N'
EXEC sp_addextendedproperty 'MS_Description', N'Т штучное', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'TSH'
EXEC sp_addextendedproperty 'MS_Description', N'Т переналадки', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'TPN'
EXEC sp_addextendedproperty 'MS_Description', N'Т межоперационное', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'TMO'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ Т штучного', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'EIZ_TSH'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ Т переналадки', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'EIZ_TPN'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ Т межоперационного', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'EIZ_TMO'
EXEC sp_addextendedproperty 'MS_Description', N'Дата начала операции; значение указывается на целочисленной шкале дат (см. функцию TWTime_IntAsDateTime)', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'DB'
EXEC sp_addextendedproperty 'MS_Description', N'Дата окончания операции; значение указывается на целочисленной шкале дат (см. функцию TWTime_IntAsDateTime)', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'DE'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование РЦ (см. таблицу OKP_WCR.NMC$$$NAM)', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'WCRName'
GO

--
-- Definition for table OKP_WASTE : 
--

CREATE TABLE dbo.OKP_WASTE (
  ID bigint IDENTITY(1, 1) NOT NULL,
  IDN varchar(15) COLLATE DATABASE_DEFAULT NULL,
  Datecreation datetime NULL,
  creator varchar(100) COLLATE DATABASE_DEFAULT NULL,
  RWC_toz int NOT NULL,
  QtyW float NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица учета возвратных отходов', N'schema', N'dbo', N'table', N'OKP_WASTE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'OKP_WASTE', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'номер документа', N'schema', N'dbo', N'table', N'OKP_WASTE', N'column', N'IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'дата создания', N'schema', N'dbo', N'table', N'OKP_WASTE', N'column', N'Datecreation'
GO

EXEC sp_addextendedproperty 'MS_Description', N'кем создано', N'schema', N'dbo', N'table', N'OKP_WASTE', N'column', N'creator'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ссылка на операцию (TOZ)', N'schema', N'dbo', N'table', N'OKP_WASTE', N'column', N'RWC_toz'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Количество возвратных  отходов', N'schema', N'dbo', N'table', N'OKP_WASTE', N'column', N'QtyW'
GO

--
-- Definition for table OKP_WCRALTER : 
--

CREATE TABLE dbo.OKP_WCRALTER (
  ID int IDENTITY(1, 1) NOT NULL,
  WCR_MAIN varchar(12) COLLATE DATABASE_DEFAULT NULL,
  WCR_ALTER varchar(12) COLLATE DATABASE_DEFAULT NULL,
  USERNAME varchar(50) COLLATE DATABASE_DEFAULT NULL,
  DATE_CREATE datetime DEFAULT getdate() NULL,
  PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Альтернативные РЦ', N'schema', N'dbo', N'table', N'OKP_WCRALTER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ОСНОВНОЙ РЦ', N'schema', N'dbo', N'table', N'OKP_WCRALTER', N'column', N'WCR_MAIN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'АЛЬТЕРНАТИВНЫЙ РЦ', N'schema', N'dbo', N'table', N'OKP_WCRALTER', N'column', N'WCR_ALTER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'пользователь создавший альтернативу', N'schema', N'dbo', N'table', N'OKP_WCRALTER', N'column', N'USERNAME'
GO

EXEC sp_addextendedproperty 'MS_Description', N'дата создания альтернативы', N'schema', N'dbo', N'table', N'OKP_WCRALTER', N'column', N'DATE_CREATE'
GO

--
-- Definition for table OKP_WCRCapEnlarged : 
--

CREATE TABLE dbo.OKP_WCRCapEnlarged (
  RWC bigint IDENTITY(1, 1) NOT NULL,
  WCR varchar(12) COLLATE DATABASE_DEFAULT NOT NULL,
  RWC_TOZ int NOT NULL,
  EMPLOYMENT int DEFAULT 0 NOT NULL,
  DateEMPLOYMENT datetime NOT NULL,
  CPLNUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  NOP int NOT NULL,
  PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Укрупненная загрузка РЦ', N'schema', N'dbo', N'table', N'OKP_WCRCapEnlarged'
GO

EXEC sp_addextendedproperty 'MS_Description', N'РЦ', N'schema', N'dbo', N'table', N'OKP_WCRCapEnlarged', N'column', N'WCR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'RWC операции', N'schema', N'dbo', N'table', N'OKP_WCRCapEnlarged', N'column', N'RWC_TOZ'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Загрузка РЦ операцией в сутки (сек.)', N'schema', N'dbo', N'table', N'OKP_WCRCapEnlarged', N'column', N'EMPLOYMENT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата загрузки', N'schema', N'dbo', N'table', N'OKP_WCRCapEnlarged', N'column', N'DateEMPLOYMENT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ПрП', N'schema', N'dbo', N'table', N'OKP_WCRCapEnlarged', N'column', N'CPLNUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Номер омерации', N'schema', N'dbo', N'table', N'OKP_WCRCapEnlarged', N'column', N'NOP'
GO

--
-- Definition for table OKP_WorkCond : 
--

CREATE TABLE dbo.OKP_WorkCond (
  Cond_ID int NOT NULL,
  Cond_Desc varchar(30) COLLATE DATABASE_DEFAULT NOT NULL,
  CONSTRAINT PK_OKP_WorkCond PRIMARY KEY CLUSTERED (Cond_ID)
)
GO

--
-- Definition for table OKP_WRHFOLDS : 
--

CREATE TABLE dbo.OKP_WRHFOLDS (
  ID int IDENTITY(1, 1) NOT NULL,
  WRH_ID int NOT NULL,
  DOC varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  DTE datetime DEFAULT getdate() NOT NULL,
  DKD datetime NOT NULL,
  DESCRIBE varchar(4000) COLLATE DATABASE_DEFAULT NULL,
  CONSTRAINT PK_WRHFOLDS PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица документов "свёртки" складских журналов', N'schema', N'dbo', N'table', N'OKP_WRHFOLDS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'OKP_WRHFOLDS', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на склад (OKP_WRH.WRH_ID)', N'schema', N'dbo', N'table', N'OKP_WRHFOLDS', N'column', N'WRH_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Номер документа', N'schema', N'dbo', N'table', N'OKP_WRHFOLDS', N'column', N'DOC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата фактической регистрации документа', N'schema', N'dbo', N'table', N'OKP_WRHFOLDS', N'column', N'DTE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата регистрации документа', N'schema', N'dbo', N'table', N'OKP_WRHFOLDS', N'column', N'DKD'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Описание документа', N'schema', N'dbo', N'table', N'OKP_WRHFOLDS', N'column', N'DESCRIBE'
GO

--
-- Definition for table OKP_WRK : 
--

CREATE TABLE dbo.OKP_WRK (
  ID bigint IDENTITY(1, 1) NOT NULL,
  DTE datetime DEFAULT getdate() NOT NULL,
  WHO_ADD_RWC int NOT NULL,
  RWC_FIO int NOT NULL,
  RWC_TOZ int NOT NULL,
  QTY float NOT NULL,
  MET int DEFAULT 0 NULL,
  ID_SDT_ELEM bigint NULL,
  SEL int DEFAULT 1 NULL,
  OLD_NUM varchar(50) NULL,
  TGRP_ID bigint NULL,
  IS_SETTED int NULL DEFAULT(0),
  WPL_ID int NULL,
  CONSTRAINT PK_OKP_WRK_ID PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty N'MS_Description',N'Работы выбраные пользователями терминала в список Мои работы',N'SCHEMA',N'dbo',N'TABLE',N'OKP_WRK'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата добавления', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор (OKP_FIO) того, кто добавил работу', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'WHO_ADD_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор исполнителя', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'RWC_FIO'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор работы', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'RWC_TOZ'
EXEC sp_addextendedproperty 'MS_Description', N'Выбранное количество', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'1 - Помечен на удаление.  Не учитывать', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор элемента сменного задания', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'ID_SDT_ELEM'
EXEC sp_addextendedproperty 'MS_Description', N'Работа отмечена', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'SEL'
EXEC sp_addextendedproperty 'MS_Description', N'Номер партии до объединения',N'SCHEMA',N'dbo','TABLE',N'OKP_WRK','COLUMN',N'OLD_NUM'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на бригаду (только для назначенных работ)',N'SCHEMA',N'dbo','TABLE',N'OKP_WRK','COLUMN',N'TGRP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Назначенная работа',N'SCHEMA',N'dbo','TABLE',N'OKP_WRK','COLUMN',N'IS_SETTED'
EXEC sp_addextendedproperty 'MS_Description', N'Назначена на РМ',N'SCHEMA',N'dbo','TABLE',N'OKP_WRK','COLUMN',N'WPL_ID'

GO

/*
** Definition for table OKP_WRK_ACTIV : 
*/
CREATE TABLE dbo.OKP_WRK_ACTIV (
	ID bigint IDENTITY(1, 1) NOT NULL,
	WRK_ID bigint NOT NULL,
	WCR_IDN varchar(12) COLLATE DATABASE_DEFAULT NULL,
	DTE_ACTIVE datetime NOT NULL,
	QTY float DEFAULT 0 NOT NULL,
	QTY_DONE float DEFAULT 0 NULL,
	STS int DEFAULT 1 NOT NULL,
	DTE_DEACTIVE datetime NULL,
	MET varchar(1) COLLATE DATABASE_DEFAULT NULL,
	wpl_id INT NULL,
	CONSTRAINT PK_OKP_WRK_ACTIV_ID PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Список активированных работ на рабочих местах',N'SCHEMA',N'dbo',N'TABLE',N'OKP_WRK_ACTIV'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Работа из OKP_WRK', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'WRK_ID'
EXEC sp_addextendedproperty 'MS_Description', N'РЦ - Обозначение', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'WCR_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Дата активации', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'DTE_ACTIVE'
EXEC sp_addextendedproperty 'MS_Description', N'Количество', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Количество выполнено', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'QTY_DONE'
EXEC sp_addextendedproperty 'MS_Description', N'Статус: 0 - деактивировано; 1 - активировано', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'Дата деактивации работы', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'DTE_DEACTIVE'
EXEC sp_addextendedproperty 'MS_Description', N'Метка (служебное поле)', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'ID РМ', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'wpl_id'
GO

--
-- Definition for table OKP_XSL : 
--

CREATE TABLE dbo.OKP_XSL (
  RWC int IDENTITY(1, 1) NOT NULL,
  UID uniqueidentifier DEFAULT newid() NOT NULL,
  NAME varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  COMMENT varchar(255) COLLATE DATABASE_DEFAULT NULL,
  FILENAME varchar(255) COLLATE DATABASE_DEFAULT NULL,
  FILEDATA image NULL,
  EXT varchar(3) COLLATE DATABASE_DEFAULT DEFAULT 'xml' NULL,
  PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица со схемами преобразования данных для экспорта ', N'schema', N'dbo', N'table', N'OKP_XSL'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ключ', N'schema', N'dbo', N'table', N'OKP_XSL', N'column', N'RWC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Уникальный идентификатор схемы', N'schema', N'dbo', N'table', N'OKP_XSL', N'column', N'UID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'OKP_XSL', N'column', N'NAME'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Коментарий', N'schema', N'dbo', N'table', N'OKP_XSL', N'column', N'COMMENT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'имя файла', N'schema', N'dbo', N'table', N'OKP_XSL', N'column', N'FILENAME'
GO

EXEC sp_addextendedproperty 'MS_Description', N'данные схемы', N'schema', N'dbo', N'table', N'OKP_XSL', N'column', N'FILEDATA'
GO

EXEC sp_addextendedproperty 'MS_Description', N'расширение файла по умолчанию', N'schema', N'dbo', N'table', N'OKP_XSL', N'column', N'EXT'
GO

--
-- Definition for table OKP_ZPU : 
--

CREATE TABLE dbo.OKP_ZPU (
  ID int IDENTITY(1, 1) NOT NULL,
  PLOData_ID bigint NOT NULL,
  LIN int NOT NULL,
  PRI int CONSTRAINT DF_ZPU_PRI DEFAULT 0 NOT NULL,
  STS int CONSTRAINT DF_ZPU_STS DEFAULT 2 NOT NULL,
  DTE_PO datetime NOT NULL,
  DTE_TO datetime NULL,
  DTE_DS datetime NULL,
  QTY_PK float CONSTRAINT DF_ZPU_QTY_PK DEFAULT 0 NOT NULL,
  QTY_TK float CONSTRAINT DF_ZPU_QTY_TK DEFAULT 0 NOT NULL,
  QTY_KS float CONSTRAINT DF_ZPU_QTY_KS DEFAULT 0 NOT NULL,
  QTY_FC float CONSTRAINT DF_ZPU_QTY_FC DEFAULT 0 NOT NULL,
  PRC real CONSTRAINT DF_ZPU_PRC DEFAULT 0 NOT NULL,
  CONSTRAINT PK_ZPU PRIMARY KEY CLUSTERED (ID)
)

GO

EXEC sp_addextendedproperty 'MS_Description', N'Данные графика отгрузки', N'schema', N'dbo', N'table', N'OKP_ZPU'
EXEC sp_addextendedproperty 'MS_Description', N'ID позиции заказа (OKP_PLOData.ID)', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'PLOData_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Порядковый номер поставки', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'LIN'
EXEC sp_addextendedproperty 'MS_Description', N'Приоритет', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'PRI'
EXEC sp_addextendedproperty 'MS_Description', N'Код состояния записи: 1 - план поставок 2 - график отгрузки 3 - в задание на отгрузку', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая дата отгрузки', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'DTE_PO'
EXEC sp_addextendedproperty 'MS_Description', N'Текущая дата отгрузки', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'DTE_TO'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая дата сдачи на склад', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'DTE_DS'
EXEC sp_addextendedproperty 'MS_Description', N'Плановое количество отгрузки', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'QTY_PK'
EXEC sp_addextendedproperty 'MS_Description', N'Текущая количество отгрузки', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'QTY_TK'
EXEC sp_addextendedproperty 'MS_Description', N'Количество сдачи на склад', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'QTY_KS'
EXEC sp_addextendedproperty 'MS_Description', N'Фактически отгруженное количество', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'QTY_FC'
EXEC sp_addextendedproperty 'MS_Description', N'Договорная цена единицы ТМЦ', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'PRC'
GO

--
-- Definition for table ARH_SDT : 
--
CREATE TABLE ARH_SDT (
  ID bigint,
  MSTS int,
  IDN varchar(20)  COLLATE DATABASE_DEFAULT ,
  DT bigint,
  DEP varchar(10) COLLATE DATABASE_DEFAULT ,
  SHIFT int,
  SH_DURATION float,
  FULL_CAPACITY float,
  CREATEBY varchar(100) COLLATE DATABASE_DEFAULT ,
  CREATEDATE bigint,
  CLOSEBY varchar(100) COLLATE DATABASE_DEFAULT ,
  CLOSEDATE bigint,
  REOPENBY varchar(100) COLLATE DATABASE_DEFAULT ,
  REOPENDATE bigint,
  COMMENT varchar(500) COLLATE DATABASE_DEFAULT NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архив сменно-суточные задания', N'schema', N'dbo', N'table', N'ARH_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'Статус', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'MSTS'
EXEC sp_addextendedproperty 'MS_Description', N'Номер суточного задания', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Дата задания', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'DT'
EXEC sp_addextendedproperty 'MS_Description', N'Подразделение', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'DEP'
EXEC sp_addextendedproperty 'MS_Description', N'Номер рабочей смены', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'SHIFT'
EXEC sp_addextendedproperty 'MS_Description', N'Продолжительность смены, ч', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'SH_DURATION'
EXEC sp_addextendedproperty 'MS_Description', N'Загрузка на смену в н/ч', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'FULL_CAPACITY'
EXEC sp_addextendedproperty 'MS_Description', N'Кем создано ', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'CREATEBY'
EXEC sp_addextendedproperty 'MS_Description', N'Когда создано', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'CREATEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'Кем проводилось последнее закрытие', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'CLOSEBY'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последнего закрытия', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'CLOSEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'Кем проводилось последнее переоткрытие', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'REOPENBY'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последнего переоткрытия', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'REOPENDATE'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'COMMENT'
GO


--
-- Definition for table ARH_SDT_ELEM : 
--

CREATE TABLE ARH_SDT_ELEM (
  ID bigint,
  SDT_ID bigint,
  TOZ_RWC int,
  DEP$$$DEP varchar(10) COLLATE DATABASE_DEFAULT ,
  WCR$$$WCR varchar(12) COLLATE DATABASE_DEFAULT ,
  NOP int,
  DTEPDZ datetime,
  DTEPDV datetime,
  QTYPQY float,
  QTYPWO_SDT float,
  QTYPZV float,
  QTYEDV float,
  MOV float,
  TOP$$$KTO varchar(4) COLLATE DATABASE_DEFAULT ,
  OOD int,
  PZV float,
  VP float,
  TMO float,
  TRO float,
  RZO int,
  PRF$$$PRF varchar(5) COLLATE DATABASE_DEFAULT ,
  TDDOC varchar(50) COLLATE DATABASE_DEFAULT ,
  TPN float,
  PRODTYPE int,
  TSK float,
  SPLITPARTIES int,
  M_DB bigint,
  M_DE bigint,
  M_DB_NR bigint,
  M_DE_NR bigint,
  NR int,
  TU varchar(4000)  COLLATE DATABASE_DEFAULT ,
  normtaskDate_SDT bigint,
  QTYCQY_SDT float,
  CAPACITY_PLAN float,
  COMMENT varchar(4000) COLLATE DATABASE_DEFAULT 
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Архив работ ССЗ', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор элемента СЗ', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор СЗ', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'SDT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор операции', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'TOZ_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'Код подразделения', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'DEP$$$DEP'
EXEC sp_addextendedproperty 'MS_Description', N'Код РЦ', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'WCR$$$WCR'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции в маршруте', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'Дата запуска', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'DTEPDZ'
EXEC sp_addextendedproperty 'MS_Description', N'Дата выпуска', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'DTEPDV'
EXEC sp_addextendedproperty 'MS_Description', N'Количество по плану', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'QTYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'Время обработки (округленно)', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'QTYPWO_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'Подготов.-заключительное время на единицу', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'QTYPZV'
EXEC sp_addextendedproperty 'MS_Description', N'Штучное время', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'QTYEDV'
EXEC sp_addextendedproperty 'MS_Description', N'Межоперационное время', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'MOV'
EXEC sp_addextendedproperty 'MS_Description', N'код технологической операци (см. OKP_KTO.TOPIDN)', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'TOP$$$KTO'
EXEC sp_addextendedproperty 'MS_Description', N'КОИД', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'OOD'
EXEC sp_addextendedproperty 'MS_Description', N'Подготовительно-заключител.время', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'PZV'
EXEC sp_addextendedproperty 'MS_Description', N'Объём партии', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'VP'
EXEC sp_addextendedproperty 'MS_Description', N'Машинное время обработки', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'TMO'
EXEC sp_addextendedproperty 'MS_Description', N'Рабочее время обработки', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'Разряд работ', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'Код профессии', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'PRF$$$PRF'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение ТД', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'TDDOC'
EXEC sp_addextendedproperty 'MS_Description', N'время переналадки', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'TPN'
EXEC sp_addextendedproperty 'MS_Description', N'Тип производства 0-собственное ,  1-кооперация', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'PRODTYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Штучно-калькуляционное время', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'TSK'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг возможности разделения на производственные партии Null,1 - можно, 0-нельзя', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'SPLITPARTIES'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата начала', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'M_DB'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата окончания', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'M_DE'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата начала без контроля связей', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'M_DB_NR'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая (директивная) дата окончания без контроля связей', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'M_DE_NR'
EXEC sp_addextendedproperty 'MS_Description', N'Признак отсутствия контроля связей 0-контроль, 1- контроля нет', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'NR'
EXEC sp_addextendedproperty 'MS_Description', N'Технологические указания', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'TU'
EXEC sp_addextendedproperty 'MS_Description', N'Дата выдачи нормированного задания про суточному ', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'normtaskDate_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'Количество на операции (в элементе СЗ)', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'QTYCQY_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'нагрузка по элементу СЗ плановая', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'CAPACITY_PLAN'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий к работе', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'COMMENT'
GO



--
-- Definition for table ARH_SDTUOP : 
--

CREATE TABLE ARH_SDTUOP (
  ID bigint,
  SDT_ID bigint,
  SDT_ELEM_ID bigint,
  UOP_NOS int
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'архив связей сменносуточных работ с учетами по операции', N'schema', N'dbo', N'table', N'ARH_SDTUOP'
EXEC sp_addextendedproperty 'MS_Description', N'ID СЗ', N'schema', N'dbo', N'table', N'ARH_SDTUOP', N'column', N'SDT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'СЗ работы ID', N'schema', N'dbo', N'table', N'ARH_SDTUOP', N'column', N'SDT_ELEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID учета', N'schema', N'dbo', N'table', N'ARH_SDTUOP', N'column', N'UOP_NOS'
GO


--
-- Definition for table ARH_IPT : 
--

CREATE TABLE ARH_IPT (
  ID bigint,
  DT bigint,
  IPTNUM varchar(25) COLLATE DATABASE_DEFAULT ,
  INTNUM int,
  CREATEBY varchar(100) COLLATE DATABASE_DEFAULT ,
  CREATEDATE bigint,
  STATE int,
  STATE1DATE bigint,
  STATE2DATE bigint,
  STATE1BY varchar(100) COLLATE DATABASE_DEFAULT ,
  STATE2BY varchar(100)  COLLATE DATABASE_DEFAULT,
  dep_id_sender int,
  dep_id_receiver int 
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архив журнала межцеховых передач (InterPlant Transfer)', N'schema', N'dbo', N'table', N'ARH_IPT'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор IPT', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата (IntFormat)', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'DT'
EXEC sp_addextendedproperty 'MS_Description', N'Номер накладной ХХХ/MM-ГГ-DEP', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'IPTNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Порядковый номер документа за месяц', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'INTNUM'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения-отправителя', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'DEP_ID_SENDER'
EXEC sp_addextendedproperty 'MS_Description', N'ID подразделения-получателя', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'DEP_ID_RECEIVER'
EXEC sp_addextendedproperty 'MS_Description', N'Кем создано', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'CREATEBY'
EXEC sp_addextendedproperty 'MS_Description', N'Дата создания', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'CREATEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'0-новая, 1-отправлена, 2-принята', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'STATE'
EXEC sp_addextendedproperty 'MS_Description', N'Дата установки статуса "1 Отправлена"', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'STATE1DATE'
EXEC sp_addextendedproperty 'MS_Description', N'Дата установки статуса "2 Принята"', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'STATE2DATE'
EXEC sp_addextendedproperty 'MS_Description', N'Кем установлен статус "1 Отправлена"', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'STATE1BY'
EXEC sp_addextendedproperty 'MS_Description', N'Кем установлен статус "2 Принята"', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'STATE2BY'
GO




--
-- Definition for table ARH_IPT_ELEM : 
--

CREATE TABLE ARH_IPT_ELEM (
  ID bigint,
  IPT_ID bigint,
  QTY float,
  TOZ_RWC_SENDER int,
  TOZ_RWC_RECEIVER int,
  CREATEBY varchar(100) COLLATE DATABASE_DEFAULT ,
  CREATEDATE bigint,
  STATE int,
  QTY_CLOSED float,
  UID uniqueidentifier
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Архив элементов документа "межцеховая передача"', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM'
EXEC sp_addextendedproperty 'MS_Description', N'ИД', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на Документ IPT', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'IPT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Количество для передачи', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор операции-источника', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'TOZ_RWC_SENDER'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор операции-приемника', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'TOZ_RWC_RECEIVER'
EXEC sp_addextendedproperty 'MS_Description', N'Кем сформировано', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'CREATEBY'
EXEC sp_addextendedproperty 'MS_Description', N'Когда сформировано', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'CREATEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'Текущий статус 0- сформирован 1- частично принят 2- полностью принят', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'STATE'
EXEC sp_addextendedproperty 'MS_Description', N'Подтвержденное принятое количество после перехода в статус "Принято"', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'QTY_CLOSED'
EXEC sp_addextendedproperty N'MS_Description', N'Вспомогательное поле идентификации', 'schema', 'dbo', 'table', 'ARH_IPT_ELEM', 'column', 'UID'
GO


--
-- Definition for table ARH_IPT_RECEIVE : 
--

CREATE TABLE ARH_IPT_RECEIVE (
  ID bigint,
  IPT_ELEM_ID bigint,
  QCY_RECEIVE float,
  RECEIVEBY varchar(100) COLLATE DATABASE_DEFAULT ,
  RECEIVEDATA bigint,
  UID uniqueidentifier
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Архив учетов закрытия межцеховых передач', N'schema', N'dbo', N'table', N'ARH_IPT_RECEIVE'
EXEC sp_addextendedproperty 'MS_Description', N'ИД', N'schema', N'dbo', N'table', N'ARH_IPT_RECEIVE', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор элемента документа межцеховой передачи', N'schema', N'dbo', N'table', N'ARH_IPT_RECEIVE', N'column', N'IPT_ELEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'количество подтвержденного приема', N'schema', N'dbo', N'table', N'ARH_IPT_RECEIVE', N'column', N'QCY_RECEIVE'
EXEC sp_addextendedproperty 'MS_Description', N'Кем принято', N'schema', N'dbo', N'table', N'ARH_IPT_RECEIVE', N'column', N'RECEIVEBY'
EXEC sp_addextendedproperty 'MS_Description', N'когда принято', N'schema', N'dbo', N'table', N'ARH_IPT_RECEIVE', N'column', N'RECEIVEDATA'
EXEC sp_addextendedproperty N'MS_Description', N'Вспомогательное поле идентификации', 'schema', 'dbo', 'table', 'ARH_IPT_RECEIVE', 'column', 'UID'  
GO


--
-- Definition for table ARH_DST : 
--

CREATE TABLE ARH_DST (
  ID bigint,
  DT bigint,
  DSTNUM varchar(25) COLLATE DATABASE_DEFAULT ,
  DEP_SENDER varchar(10) COLLATE DATABASE_DEFAULT ,
  WRH_RECEIVER varchar(10) COLLATE DATABASE_DEFAULT ,
  CREATEBY varchar(100) COLLATE DATABASE_DEFAULT ,
  CREATEDATE bigint,
  INTNUM int,
  STATE int,
  STATE1DATE bigint,
  STATE2DATE bigint,
  STATE1BY varchar(100) COLLATE DATABASE_DEFAULT ,
  STATE2BY varchar(100) COLLATE DATABASE_DEFAULT 
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Архив журнала цехоскладских передач (DepartmentStock Transfer)', N'schema', N'dbo', N'table', N'ARH_DST'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор DST', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата (IntFormat)', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'DT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Номер накладной ХХХ/MM-ГГ-WRH_IDN', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'DSTNUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Подразделение - отправитель', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'DEP_SENDER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Склад - получатель (WRH_IDN)', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'WRH_RECEIVER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кем создано', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'CREATEBY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата создания', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'CREATEDATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'порядковый номер за месяц', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'INTNUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'0-новая, 1-отправлена, 2-принята', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'STATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата установки статуса "1 Отправлена"', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'STATE1DATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата установки статуса "2 Принята"', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'STATE2DATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кем установлен статус "1 Отправлена"', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'STATE1BY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кем установлен статус "2 Принята"', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'STATE2BY'
GO


--
-- Definition for table ARH_DST_ELEM : 
--

CREATE TABLE ARH_DST_ELEM (
  ID bigint,
  DST_ID bigint,
  QTY float,
  TOZ_RWC_SENDER int,
  CREATEBY varchar(100) COLLATE DATABASE_DEFAULT ,
  CREATEDATE bigint,
  QTY_R float,
  RECEIVEBY varchar(100) COLLATE DATABASE_DEFAULT ,
  RECEIVEDATA bigint,
  UID uniqueidentifier,
  Fold_I float NULL,
  Fold_D bigint NULL,
  Fold_U varchar(100) NULL
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Архив элементы документа "цеховая передача на склад"', N'schema', N'dbo', N'table', N'ARH_DST_ELEM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ИД', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на Документ DST', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'DST_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Количество для передачи', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор операции-источника', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'TOZ_RWC_SENDER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кем сформировано', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'CREATEBY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Когда сформировано', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'CREATEDATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Итоговое переданное на склад количество по текущей строке накладной', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'QTY_R'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Кто выполнил последнюю приёмку на склад', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'RECEIVEBY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Дата последней приёмки на склад', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'RECEIVEDATA'
GO

EXEC sp_addextendedproperty N'MS_Description', N'Вспомогательное поле идентификации', 'schema', 'dbo', 'table', 'ARH_DST_ELEM', 'column', 'UID'
go

EXEC sp_addextendedproperty 'MS_Description', N'Свёртка QTY_R', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'Fold_I'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Свёртка RECEIVEDATA', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'Fold_D'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Свёртка RECEIVEBY', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'Fold_U'
GO


--
-- OKP_WPlaces
--
CREATE TABLE OKP_WPlaces
(
	ID bigint not null identity(1, 1),
	WRH_ID bigint not null,
	IDP bigint null,
	IDN varchar(100)  COLLATE DATABASE_DEFAULT not null,
	Addr varchar(100) COLLATE DATABASE_DEFAULT not null,
	Name varchar(50)  COLLATE DATABASE_DEFAULT null,
	Enabled int not null,
	IDNFlag int not null,
	CONSTRAINT PK_OKP_WPlaces PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица складских мест хранения', 'schema', 'dbo', 'table', 'OKP_WPlaces'
EXEC sp_addextendedproperty 'MS_Description', N'Счётчик', 'schema', 'dbo', 'table', 'OKP_WPlaces', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на склад (OKP_WRH.WRH_ID)', 'schema', 'dbo', 'table', 'OKP_WPlaces', 'column', 'WRH_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение места хранения', 'schema', 'dbo', 'table', 'OKP_WPlaces', 'column', 'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Адрес места хранения', 'schema', 'dbo', 'table', 'OKP_WPlaces', 'column', 'Addr'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', 'schema', 'dbo', 'table', 'OKP_WPlaces', 'column', 'Name'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на родительское место хранения', 'schema', 'dbo', 'table', 'OKP_WPlaces', 'column', 'IDP'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг разрешения размещения: 0 - нет, 1 - да', 'schema', 'dbo', 'table', 'OKP_WPlaces', 'column', 'Enabled'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг формирования полного обозначения места хранения:  0 - формируется свободно (особое место хранения)	 1 - формируется в соответстви с шаблоном (см. OKP_WRH.WPTemplate)	 Примечание:	   "полное обозначение" - v_WPlaces.FullIDN', 	'schema', 'dbo', 'table', 'OKP_WPlaces', 'column', 'IDNFlag'
GO

--
-- OKP_WPDocs
--
create table OKP_WPDocs (
	ID bigint identity(1, 1) not null,
	GRP_ID int null,
	DOC varchar(50) COLLATE Database_default not null,
	TYP int not null,
	WRH_ID int not null,
	DKD datetime not null,
	Owner_ID int not null,
	DESCRIBE varchar(255) COLLATE Database_default null,
	DTE datetime not null default(getdate()),
	CONSTRAINT PK_OKP_WPDocs PRIMARY KEY CLUSTERED (ID)
)
go

EXEC sp_addextendedproperty 'MS_Description', N'Таблица складских документов распределения по местам хранения', 'schema', 'dbo', 'table', 'OKP_WPDocs'
EXEC sp_addextendedproperty 'MS_Description', N'Счётчик', 'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на группу (OKP_GROUPS.ID)', 'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'GRP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение документа', 'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'DOC'
EXEC sp_addextendedproperty 'MS_Description', N'Тип документа 1 - распределение', 'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'TYP'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на склад (OKP_WRH.WRH_ID)', 'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'WRH_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата документа', 'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'DKD'
EXEC sp_addextendedproperty 'MS_Description', N'Владелец документа (тот, кто создал документ) - ссылка на OKP_USERS.User_ID', 'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'Owner_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Описание документа', 'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'Дата создания документа (не меняется)', 'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'DTE'
GO

--
-- OKP_WPDocsData
--
CREATE TABLE OKP_WPDocsData (
	ID bigint identity(1, 1) not null,
	LIN int not null, 
	DOC_ID int not null,
	INV_ID bigint not null,
	SUB_ID bigint not null,
	WP_S_ID bigint not null, 
	WP_D_ID bigint not null, 
	QTY float(53) not null,
	TRN_ID bigint null,
	STS int NULL,
	Fold_S int NULL,
	CONSTRAINT PK_OKP_WPDocsData PRIMARY KEY CLUSTERED (ID)
)
GO	

EXEC sp_addextendedproperty 'MS_Description', N'Таблица содержимого документов распределения (OKP_WPDocs)', 'schema', 'dbo', 'table', 'OKP_WPDocsData'
EXEC sp_addextendedproperty 'MS_Description', N'Счётчик', 'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на документ (OKP_WPDocs.ID)', 'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'DOC_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Номер строки в документе', 'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'LIN'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на ТМЦ (OKP_INV.INV_ID)', 'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'INV_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на складскую карточку объекта (OKP_WRH_SUBJECTS.ID)', 'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'SUB_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на место-источник (OKP_WPlaces.ID)', 'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'WP_S_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на место-приёмник (OKP_WPlaces.ID)', 'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'WP_D_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Количество в ЕИЗ хранения из бланка ТМЦ (OKP_INV.UOMHEIZ)', 'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на документ "Транзакция" (OKP_TRN.TRN_ID)', 'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'TRN_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Статус строки:  - null, 0 - строка НЕ заблокирована  - 1 - строка заблокирована в связи с тем, что ведущая запись (по ссылке OKP_TRN.TRN_ID) является полностью         распределенной строкой утверждённого документа оборота',   N'schema', N'dbo', N'table', N'OKP_WPDocsData', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'Свёртка статуса (STS) строки (описание см. OKP_WPDocsData.STS)',  N'schema', N'dbo', N'table', N'OKP_WPDocsData', N'column', N'Fold_S'
GO

--
-- OKP_WPInv
--
CREATE TABLE OKP_WPInv (
    ID bigint not null identity(1, 1),
    INV_ID bigint not null,
    SUB_ID bigint null,
    WP_ID bigint not null,
    QTY float(53) not null,
    CONSTRAINT PK_OKP_WPInv PRIMARY KEY CLUSTERED (ID)	
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица распределения ТМЦ по ячейкам', 'schema', 'dbo', 'table', 'OKP_WPInv'
EXEC sp_addextendedproperty 'MS_Description', N'Счётчик', 'schema', 'dbo', 'table', 'OKP_WPInv', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на ТМЦ (OKP_INV.INV_ID)', 'schema', 'dbo', 'table', 'OKP_WPInv', 'column', 'INV_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на складскую карточку объектов (OKP_WRH_SUBJECTS.ID)', 'schema', 'dbo', 'table', 'OKP_WPInv', 'column', 'SUB_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на ячейку (OKP_WPlaces.ID)', 'schema', 'dbo', 'table', 'OKP_WPInv', 'column', 'WP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Количество в ЕИЗ хранения из бланка ТМЦ (OKP_INV.UOMHEIZ)', 'schema', 'dbo', 'table', 'OKP_WPInv', 'column', 'QTY'
GO

--
-- OKP_WPInvDef
--
CREATE TABLE OKP_WPInvDef (
	ID bigint not null identity(1, 1),
	INV_ID bigint not null,
	WP_ID bigint not null,
	CONSTRAINT PK_OKP_WPInvDef PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица стандартных мест хранения ТМЦ', 'schema', 'dbo', 'table', 'OKP_WPInvDef'
EXEC sp_addextendedproperty 'MS_Description', N'Счётчик', 'schema', 'dbo', 'table', 'OKP_WPInvDef', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на ТМЦ (OKP_INV.INV_ID)', 'schema', 'dbo', 'table', 'OKP_WPInvDef', 'column', 'INV_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на ячейк (OKP_WPlaces.ID)', 'schema', 'dbo', 'table', 'OKP_WPInvDef', 'column', 'WP_ID'
GO

/*
** OKP_NOMRUTAdd
*/
CREATE TABLE OKP_NOMRUTAdd (
	ID INT not null identity(1, 1),
	NOM_ID int not null,
	rut_id INT NOT NULL,
	amount FLOAT(53) NOT NULL,
	eiz_id int NOT NULL,
	verifyparam_obj_id INT NULL,
	CONSTRAINT PK_OKP_NOMRUTAdd PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Вспомогательные материалы и инструменты', N'schema', N'dbo', N'table', N'OKP_NOMRUTADD'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи',   'schema', 'dbo', 'table', 'OKP_NOMRUTADD', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID номенклатуры',   'schema', 'dbo', 'table', 'OKP_NOMRUTADD', 'column', 'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID операции',   'schema', 'dbo', 'table', 'OKP_NOMRUTADD', 'column', 'RUT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ЕИЗ расхода', 'schema', 'dbo', 'table', 'OKP_NOMRUTADD', 'column', 'eiz_id'
EXEC sp_addextendedproperty 'MS_Description', N'Норма расхода', 'schema', 'dbo', 'table', 'OKP_NOMRUTADD', 'column', 'amount'
EXEC sp_addextendedproperty 'MS_Description', N'ID параметра контроля, требующего текущую номенклатуру', N'schema', N'dbo', N'table', N'okp_nomrutadd', N'column', N'verifyparam_obj_id'
GO

--
-- OKP_sysColumns
--
create table OKP_sysColumns (
	ID int not null identity(1, 1),
	NAME varchar(50)  COLLATE DATABASE_DEFAULT not null,
	TYPE int not null,
	LIST varchar(8000)  COLLATE DATABASE_DEFAULT null,
	DESCRIBE varchar(250)  COLLATE DATABASE_DEFAULT not null,
    isSystem int not null,
	CONSTRAINT PK_OKP_sysColumns PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица пользовательских колонок', 'schema', 'dbo', 'table', 'OKP_sysColumns'
EXEC sp_addextendedproperty 'MS_Description', N'счётчик', 'schema', 'dbo', 'table', 'OKP_sysColumns', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', 'schema', 'dbo', 'table', 'OKP_sysColumns', 'column', 'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Тип данных: 	1 - текст	2 - число (вещественное)	3 - целое число	4 - время	5 - список	6 - набор (несколько значений из списка)	', 	'schema', 'dbo', 'table', 'OKP_sysColumns', 'column', 'TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Список предопределённых значений. Значения разделяются символом char(1)', 'schema', 'dbo', 'table', 'OKP_sysColumns', 'column', 'LIST'
EXEC sp_addextendedproperty 'MS_Description', N'Описание', 'schema', 'dbo', 'table', 'OKP_sysColumns', 'column', 'DESCRIBE'
GO

--
-- OKP_NOMTechInfo
--
create table OKP_NOMTechInfo (
	ID bigint not null identity(1, 1),
	NOM_ID bigint not null,
	Column_ID int not null,
	Value varchar(8000)  COLLATE DATABASE_DEFAULT null,
	CONSTRAINT PK_OKP_NOMTechInfo PRIMARY KEY CLUSTERED (ID)
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Таблица дополнительной технической информации о номенклатуре', 'schema', 'dbo', 'table', 'OKP_NOMTechInfo'
EXEC sp_addextendedproperty 'MS_Description', N'счётчик', 'schema', 'dbo', 'table', 'OKP_NOMTechInfo', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на номенклатуру (OKP_NOM.RWC)', 'schema', 'dbo', 'table', 'OKP_NOMTechInfo', 'column', 'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на пользовательский тип данных (OKP_sysColumns.ID)', 'schema', 'dbo', 'table', 'OKP_NOMTechInfo', 'column', 'Column_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Значение характеристики', 'schema', 'dbo', 'table', 'OKP_NOMTechInfo', 'column', 'Value'
GO


--
-- OKP_CERT
-- 
CREATE TABLE dbo.OKP_CERT (
	ID int NOT NULL IDENTITY(1,1),
	IDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(250) COLLATE DATABASE_DEFAULT NOT NULL,
	ISOUT bit CONSTRAINT DF_OKP_CERT_ISOUT DEFAULT '1' NOT NULL,
	BEG_DATE DATETIME NOT NULL,
	END_DATE DATETIME NOT NULL,
	CTR_ID int NOT NULL,
	ESKIZ_ID int NULL,
	TMPL_ID int NULL,
	EDIT_DATE DATETIME NOT NULL,
	USER_ID int NOT NULL, 
	GRP_ID int NULL,
	IS_VALID BIT CONSTRAINT DF_OKP_CERT_IS_VALID DEFAULT 1 NOT NULL,
	CONSTRAINT PK_OKP_CERT PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Сертификаты качества', N'schema', N'dbo', N'table', N'OKP_CERT'
EXEC sp_addextendedproperty 'MS_Description', N'ID сертификата', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор сертификата', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование сертификата', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Внешний/внутренний сертификат', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'isOut'
EXEC sp_addextendedproperty 'MS_Description', N'Дата начала действия', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'beg_date'
EXEC sp_addextendedproperty 'MS_Description', N'Дата окончания действия', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'end_date'
EXEC sp_addextendedproperty 'MS_Description', N'ID контрагента', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'CTR_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID эскиза', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'ESKIZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID шаблона', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'TMPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последнего редактирования', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'EDIT_DATE'
EXEC sp_addextendedproperty 'MS_Description', N'ID изменившего пользователя', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'GRP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Сертификат действителен', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'IS_VALID'
GO

--
-- OKP_TMPL
--
CREATE TABLE dbo.OKP_TMPL (
	ID int NOT NULL IDENTITY(1,1),
	IDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(250) COLLATE DATABASE_DEFAULT NOT NULL,
	OKP_TABLE varchar(50) COLLATE DATABASE_DEFAULT NULL,
	EDIT_DATE DATETIME NOT NULL,
	USER_ID int NOT NULL, 
	DESCR varchar(999) COLLATE DATABASE_DEFAULT NULL,	
	GRP_ID int NULL,
	CONSTRAINT PK_OKP_TMPL PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Шаблоны (пока что только для OKP_CERT)', N'schema', N'dbo', N'table', N'OKP_TMPL'
EXEC sp_addextendedproperty 'MS_Description', N'ID шаблона', N'schema', N'dbo', N'table', N'OKP_TMPL', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор шаблона', N'schema', N'dbo', N'table', N'OKP_TMPL', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование шаблона', N'schema', N'dbo', N'table', N'OKP_TMPL', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование таблицы (пока что поле избыточно, но оставлено для расширения)', N'schema', N'dbo', N'table', N'OKP_TMPL', N'column', N'OKP_TABLE'
EXEC sp_addextendedproperty 'MS_Description', N'Дата последнего редактирования', N'schema', N'dbo', N'table', N'OKP_TMPL', N'column', N'EDIT_DATE'
EXEC sp_addextendedproperty 'MS_Description', N'ID изменившего пользователя', N'schema', N'dbo', N'table', N'OKP_TMPL', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'OKP_TMPL', N'column', N'DESCR'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы', N'schema', N'dbo', N'table', N'OKP_TMPL', N'column', N'GRP_ID'
GO

-- 
-- OKP_TFLD
--
CREATE TABLE dbo.OKP_TFLD (
	ID int NOT NULL IDENTITY(1,1),
	NAME varchar(250) COLLATE DATABASE_DEFAULT NOT NULL,
	DESCR varchar(999) COLLATE DATABASE_DEFAULT NULL,	
	GRP_ID int NULL,
	CONSTRAINT PK_OKP_TFLD PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Поля шаблонов', N'schema', N'dbo', N'table', N'OKP_TFLD'
EXEC sp_addextendedproperty 'MS_Description', N'ID поля', N'schema', N'dbo', N'table', N'OKP_TFLD', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование поля', N'schema', N'dbo', N'table', N'OKP_TFLD', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'OKP_TFLD', N'column', N'DESCR'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы', N'schema', N'dbo', N'table', N'OKP_TFLD', N'column', N'GRP_ID'
GO

-- 
-- OKP_TMPL_TFLD
--
CREATE TABLE dbo.OKP_TMPL_TFLD (
	ID int NOT NULL IDENTITY(1,1),
	TMPL_ID int NOT NULL,
	FLD_ID int NOT NULL,
	FLD_ORDER int NOT NULL,
	CONSTRAINT PK_OKP_TMPL_TFLD PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Связь шаблон - поле', N'schema', N'dbo', N'table', N'OKP_TMPL_TFLD'
EXEC sp_addextendedproperty 'MS_Description', N'ID связи', N'schema', N'dbo', N'table', N'OKP_TMPL_TFLD', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор шаблона', N'schema', N'dbo', N'table', N'OKP_TMPL_TFLD', N'column', N'TMPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор поля', N'schema', N'dbo', N'table', N'OKP_TMPL_TFLD', N'column', N'FLD_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Порядок', N'schema', N'dbo', N'table', N'OKP_TMPL_TFLD', N'column', N'FLD_ORDER'
GO

-- 
-- OKP_CERT_TFLD
--
CREATE TABLE dbo.OKP_CERT_TFLD (
	ID int NOT NULL IDENTITY(1,1),
	CERT_ID int NOT NULL,
	FLD_ID int NOT NULL,
	VAL varchar(256) COLLATE DATABASE_DEFAULT NOT NULL,
	CONSTRAINT PK_OKP_CERT_TFLD PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Состав материала по сертификату', N'schema', N'dbo', N'table', N'OKP_CERT_TFLD'
EXEC sp_addextendedproperty 'MS_Description', N'ID связи', N'schema', N'dbo', N'table', N'OKP_CERT_TFLD', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор сертификата', N'schema', N'dbo', N'table', N'OKP_CERT_TFLD', N'column', N'CERT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор поля', N'schema', N'dbo', N'table', N'OKP_CERT_TFLD', N'column', N'FLD_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Значение', N'schema', N'dbo', N'table', N'OKP_CERT_TFLD', N'column', N'VAL'
GO

--
-- OKP_GROUPColumns
-- 
CREATE TABLE OKP_GROUPColumns (
	ID int IDENTITY(1,1) NOT NULL,
        LIN int NOT NULL,
	GROUP_ID int NOT NULL,
	Column_ID int NOT NULL,
	CONSTRAINT PK_OKP_GROUPColumns PRIMARY KEY CLUSTERED (ID))
GO

EXEC sp_addextendedproperty @name=N'MS_Description', @value=N'счётчик' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OKP_GROUPColumns', @level2type=N'COLUMN',@level2name=N'ID'
EXEC sp_addextendedproperty @name=N'MS_Description', @value=N'Ссылка на группу (OKP_GROUPS.ID)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OKP_GROUPColumns', @level2type=N'COLUMN',@level2name=N'GROUP_ID'
EXEC sp_addextendedproperty @name=N'MS_Description', @value=N'Ссылка на пользовательскую колонку (OKP_sysColumns.ID)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OKP_GROUPColumns', @level2type=N'COLUMN',@level2name=N'Column_ID'
EXEC sp_addextendedproperty @name=N'MS_Description', @value=N'Таблица соответствия пользовательских колонок группе объекта. Позволяет задать набор характеристик   одновременно всем объектам, входящим в группу.  Напрмер, если объект инструмент "fr000101" ввести в группу "Фрезы", которой сопоставлена колонка "Шифр",   то у этого инструмента автоматически появляется техническая характеристика "Шифр" ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OKP_GROUPColumns'
GO

/*
** OKP_THO
*/
CREATE TABLE OKP_THO (
	ID int NOT NULL identity(1,1),
	IDN varchar(4) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(150) COLLATE DATABASE_DEFAULT NOT NULL,
	NAM_GOST varchar(150) COLLATE DATABASE_DEFAULT NOT NULL,
	GRP_ID int NULL,
	CONSTRAINT PK_OKP_THO PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Технологические операции', N'schema', N'dbo', N'table', N'OKP_THO'
EXEC sp_addextendedproperty 'MS_Description', N'ID технологической операции', 'schema', 'dbo', 'table', 'OKP_THO', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Код операции', 'schema', 'dbo', 'table', 'OKP_THO', 'column', 'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование операции', 'schema', 'dbo', 'table', 'OKP_THO', 'column', 'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование операции по ГОСТ', 'schema', 'dbo', 'table', 'OKP_THO', 'column', 'NAM_GOST'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы операций', 'schema', 'dbo', 'table', 'OKP_THO', 'column', 'GRP_ID'
GO

/*
** OKP_REJECT
*/
CREATE TABLE OKP_REJECT (
	ID int NOT NULL identity(1,1),
	IDN varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(150) COLLATE DATABASE_DEFAULT NOT NULL,
	GRP_ID int NULL,
	SOURCE int NULL,
	CONSTRAINT PK_OKP_REJECT PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Причины отклонений', N'schema', N'dbo', N'table', N'OKP_REJECT'
EXEC sp_addextendedproperty 'MS_Description', N'ID причины отклонения', 'schema', 'dbo', 'table', 'OKP_REJECT', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Код причины отклонения', 'schema', 'dbo', 'table', 'OKP_REJECT', 'column', 'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', 'schema', 'dbo', 'table', 'OKP_REJECT', 'column', 'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы', 'schema', 'dbo', 'table', 'OKP_REJECT', 'column', 'GRP_ID'
GO

/*
** OKP_SYSGRP
*/
CREATE TABLE OKP_SYSGRP (
	ID int NOT NULL identity(1,1),
	name varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	IMAGE_ID bigint NULL,
	MODULE_ID int NOT NULL,
	TYPE_ID int not null,
	gravity int CONSTRAINT DF_OKP_SYSGRP_GRAVITY DEFAULT 0 NOT NULL,
	PARENT_ID int,
    IsSystem bit DEFAULT 0 NOT NULL,
	SYSOBJ_ID int DEFAULT 0 NOT NULL,
	CONSTRAINT PK_OKP_SYSGRP PRIMARY KEY CLUSTERED (ID)
)
GO
	
EXEC sp_addextendedproperty 'MS_Description', N'Группы системных объектов', N'schema', N'dbo', N'table', N'OKP_SYSGRP'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы системных объектов', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'ID'	
EXEC sp_addextendedproperty 'MS_Description', N'Наименование группы системных объектов', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'NAME'	
EXEC sp_addextendedproperty 'MS_Description', N'Изображение группы системных объектов', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'IMAGE_ID'	
EXEC sp_addextendedproperty 'MS_Description', N'ID модуля', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'MODULE_ID'	
EXEC sp_addextendedproperty 'MS_Description', N'ID типа объекта', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'TYPE_ID'	
EXEC sp_addextendedproperty 'MS_Description', N'Порядок отображения', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'GRAVITY'
EXEC sp_addextendedproperty 'MS_Description', N'Родительская группа', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'PARENT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Объект является системным', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'IsSystem'
EXEC sp_addextendedproperty 'MS_Description', N'Принадлежность группы к контекстному меню указанного объекта (0 для модуля)', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'SYSOBJ_ID'
GO

--
-- OKP_SYSGRP_ITEM
--
CREATE TABLE OKP_SYSGRP_ITEM (
	ID int NOT NULL identity(1,1),
	SYSGRP_ID int NOT NULL,
	ITEM_ID int NOT NULL,
	GRAVITY int CONSTRAINT DF_OKP_SYSGRP_ITEM_GRAVITY DEFAULT (0) NOT NULL, 
	CONSTRAINT PK_OKP_SYSGRP_ITEM PRIMARY KEY CLUSTERED (ID)
)
GO
	
EXEC sp_addextendedproperty 'MS_Description', N'Принадлежность объекта к системной группе', N'schema', N'dbo', N'table', N'OKP_SYSGRP_ITEM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID принадлежности', 'schema', 'dbo', 'table', 'OKP_SYSGRP_ITEM', 'column', 'ID'	
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID системной группы', 'schema', 'dbo', 'table', 'OKP_SYSGRP_ITEM', 'column', 'SYSGRP_ID'	
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID объекта', 'schema', 'dbo', 'table', 'OKP_SYSGRP_ITEM', 'column', 'ITEM_ID'	
GO

EXEC sp_addextendedproperty 'MS_Description', N'Порядок отображения', 'schema', 'dbo', 'table', 'OKP_SYSGRP_ITEM', 'column', 'GRAVITY'
GO

--
-- таблица связей итемов (функций, отчётов, экспортов) к модулям
--
CREATE TABLE OKP_MODULE_ITEM (
	ID int NOT NULL identity(1,1),
	MODULE_ID int NOT NULL,
    TYPE_ID int NOT NULL,
	ITEM_ID int NOT NULL,
	CONSTRAINT PK_OKP_MODULE_ITEM PRIMARY KEY CLUSTERED (ID)
)
GO
	
EXEC sp_addextendedproperty 'MS_Description', N'Принадлежность объекта к модулю', N'schema', N'dbo', N'table', N'OKP_MODULE_ITEM'
EXEC sp_addextendedproperty 'MS_Description', N'ID принадлежности', 'schema', 'dbo', 'table', 'OKP_MODULE_ITEM', 'column', 'ID'	
EXEC sp_addextendedproperty 'MS_Description', N'ID модуля', 'schema', 'dbo', 'table', 'OKP_MODULE_ITEM', 'column', 'MODULE_ID'	
EXEC sp_addextendedproperty 'MS_Description', N'Тип объекта (1 - Функция, 2 - Отчёт, 3 - Экспорт)', 'schema', 'dbo', 'table', 'OKP_MODULE_ITEM', 'column', 'TYPE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID объекта', 'schema', 'dbo', 'table', 'OKP_MODULE_ITEM', 'column', 'ITEM_ID'	
GO

--
-- OKP_USER_ROLE
--
CREATE TABLE OKP_USER_ROLE (
	ID int NOT NULL identity(1,1),
	USER_ID int not null,
	ROLE_ID int not null,
	CONSTRAINT PK_OKP_USER_ROLE PRIMARY KEY CLUSTERED (ID)
)
GO
	
EXEC sp_addextendedproperty 'MS_Description', N'Связи "Пользователь-Роль"', N'schema', N'dbo', N'table', N'OKP_USER_ROLE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID связи', 'schema', 'dbo', 'table', 'OKP_USER_ROLE', 'column', 'ID'	
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID пользователя', 'schema', 'dbo', 'table', 'OKP_USER_ROLE', 'column', 'USER_ID'	
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID роли', 'schema', 'dbo', 'table', 'OKP_USER_ROLE', 'column', 'ROLE_ID'		
GO

--
-- создание таблицы функций
--
CREATE TABLE OKP_FUNCTION (
    ID int IDENTITY(1,1) NOT NULL,
    NAME varchar(100) COLLATE DATABASE_DEFAULT,
    PARENT_ID int NULL,
    IS_ACTIVE bit CONSTRAINT DF_OKP_FUNCTION_IS_ACTIVE DEFAULT '1' NOT NULL,
    COMMENT varchar(250) COLLATE DATABASE_DEFAULT,
	CONSTRAINT PK_OKP_FUNCTION PRIMARY KEY CLUSTERED (ID)
)
GO 

EXEC sp_addextendedproperty 'MS_Description', N'Системные функции', N'schema', N'dbo', N'table', N'OKP_FUNCTION'
EXEC sp_addextendedproperty 'MS_Description', N'ID', 'schema', 'dbo', 'table', 'OKP_FUNCTION', 'column', 'ID'	
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', 'schema', 'dbo', 'table', 'OKP_FUNCTION', 'column', 'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'ID родительской функции', 'schema', 'dbo', 'table', 'OKP_FUNCTION', 'column', 'PARENT_ID'	
EXEC sp_addextendedproperty 'MS_Description', N'Функция активна?', 'schema', 'dbo', 'table', 'OKP_FUNCTION', 'column', 'IS_ACTIVE'	
EXEC sp_addextendedproperty 'MS_Description', N'Описание', 'schema', 'dbo', 'table', 'OKP_FUNCTION', 'column', 'COMMENT'		
GO

--
-- Права доступа к объектам
--
CREATE TABLE OKP_ObjAccess (
    ID int IDENTITY(1,1) NOT NULL,
    SYSOBJ_ID int NOT NULL,
    USER_ID int NOT NULL,
    OBJ_TYPE int NULL,
    OBJ_ID int NULL,
    AccessType_ID int NOT NULL,
    ACCESS bit CONSTRAINT DF_OKP_OBJACCESS_ACCESS DEFAULT '1' NOT NULL,
	CONSTRAINT PK_OKP_ObjAccess PRIMARY KEY CLUSTERED (ID)
)
GO  

EXEC sp_addextendedproperty 'MS_Description', N'Права доступа к объектам', N'schema', N'dbo', N'table', N'OKP_ObjAccess'
EXEC sp_addextendedproperty 'MS_Description', N'ID', 'schema', 'dbo', 'table', 'OKP_ObjAccess', 'column', 'ID'		
EXEC sp_addextendedproperty 'MS_Description', N'ID системного объекта', 'schema', 'dbo', 'table', 'OKP_ObjAccess', 'column', 'SYSOBJ_ID'		
EXEC sp_addextendedproperty 'MS_Description', N'ID пользователя', 'schema', 'dbo', 'table', 'OKP_ObjAccess', 'column', 'USER_ID'		
EXEC sp_addextendedproperty 'MS_Description', N'Вид объекта прав доступа: 	0 - базовые из OKP_AccessType;	1 - методы из OKP_ObjMethod;	2 - подразделения из OKP_DEP;	3 - аттрибуты из OKP_ObjAttr;	4 - зарезервировано под админку;	5 - модули из OKP_v_sysModules;	6 - отчёты из OKP_Reports;	7 - экспорта из OKP_DataExport;	8 - функции из OKP_FUNCTION;	9 - подразделения из OKP_DEP (временно);	10 - мониторы из OKP_MON', 	'schema', 'dbo', 'table', 'OKP_ObjAccess', 'column', 'OBJ_TYPE'			
EXEC sp_addextendedproperty 'MS_Description', N'ID объекта', 'schema', 'dbo', 'table', 'OKP_ObjAccess', 'column', 'OBJ_ID'		
EXEC sp_addextendedproperty 'MS_Description', N'Тип доступа', 'schema', 'dbo', 'table', 'OKP_ObjAccess', 'column', 'AccessType_ID'		
EXEC sp_addextendedproperty 'MS_Description', N'Разрешение', 'schema', 'dbo', 'table', 'OKP_ObjAccess', 'column', 'ACCESS'		
GO 

/*
** Методы объектов
*/
CREATE TABLE OKP_ObjMethod (
    ID int IDENTITY(1,1) NOT NULL,
    IDN varchar(20) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(99) COLLATE DATABASE_DEFAULT NOT NULL, 
    SYSOBJ_ID int NOT NULL,
	CONSTRAINT PK_OKP_ObjMethod PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Методы объектов', N'schema', N'dbo', N'table', N'OKP_ObjMethod'
EXEC sp_addextendedproperty 'MS_Description', N'Ключ', 'schema', 'dbo', 'table', 'OKP_ObjMethod', 'column', 'ID'		
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный идентификатор', 'schema', 'dbo', 'table', 'OKP_ObjMethod', 'column', 'IDN'		
EXEC sp_addextendedproperty 'MS_Description', N'Название', 'schema', 'dbo', 'table', 'OKP_ObjMethod', 'column', 'NAME'		
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор системного объекта', 'schema', 'dbo', 'table', 'OKP_ObjMethod', 'column', 'SYSOBJ_ID'
GO

--
-- Аттрибуты объектов
--
CREATE TABLE OKP_ObjAttr (
    ID int IDENTITY(1,1) NOT NULL,
    IDN varchar(25) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(50) COLLATE DATABASE_DEFAULT NOT NULL, 
    SYSOBJ_ID int NOT NULL,
	CONSTRAINT PK_OKP_ObjAttr PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Аттрибуты объектов', N'schema', N'dbo', N'table', N'OKP_ObjAttr'
EXEC sp_addextendedproperty 'MS_Description', N'Ключ', 'schema', 'dbo', 'table', 'OKP_ObjAttr', 'column', 'ID'		
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный идентификатор', 'schema', 'dbo', 'table', 'OKP_ObjAttr', 'column', 'IDN'		
EXEC sp_addextendedproperty 'MS_Description', N'Название', 'schema', 'dbo', 'table', 'OKP_ObjAttr', 'column', 'NAME'		
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор системного объекта', 'schema', 'dbo', 'table', 'OKP_ObjAttr', 'column', 'SYSOBJ_ID'
GO

--
-- типы прав доступа к объектам
--
CREATE TABLE OKP_AccessType (
    ID int IDENTITY(1,1) NOT NULL,
	IDN varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	CONSTRAINT PK_OKP_AccessType PRIMARY KEY CLUSTERED (ID)
)
GO  

EXEC sp_addextendedproperty 'MS_Description', N'Типы прав доступа к объектам', N'schema', N'dbo', N'table', N'OKP_AccessType'
GO

EXEC sp_addextendedproperty 'MS_Description', N'Ключ', 'schema', 'dbo', 'table', 'OKP_AccessType', 'column', 'ID'		
GO

EXEC sp_addextendedproperty 'MS_Description', N'Уникальный идентификатор', 'schema', 'dbo', 'table', 'OKP_AccessType', 'column', 'IDN'		
GO

EXEC sp_addextendedproperty 'MS_Description', N'Название', 'schema', 'dbo', 'table', 'OKP_AccessType', 'column', 'NAME'		
GO

/*
** Системные настройки
*/
CREATE TABLE OKP_SysProp (
	ID int identity(1,1) NOT NULL,
	IDN varchar(20) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(75) COLLATE DATABASE_DEFAULT NOT NULL,  
	PARENT_ID int NULL,
	IS_VISIBLE bit DEFAULT 0 NOT NULL,
	PICK_TYPE int CONSTRAINT DF_OKP_SYSPROP_PICK_TYPE DEFAULT(1) NOT NULL,
	PICK_LIST varchar(8000) COLLATE DATABASE_DEFAULT NULL, 
	DATA_TYPE int NOT NULL,
	VALUE_CHAR varchar(8000) COLLATE DATABASE_DEFAULT NULL,
	VALUE_FLOAT float NULL,
	VALUE_BIT bit NULL,
	VALUE_DATE datetime NULL,
	gravity INT DEFAULT 0 NOT NULL,
  CONSTRAINT PK_OKP_SysProp PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица системных настроек', N'schema', N'dbo', N'table', N'OKP_SysProp'
EXEC sp_addextendedproperty 'MS_Description', N'Искусственный идентификатор', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный идентификатор', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Родительская настройка', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'PARENT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Видимость в администраторе для редактирования', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'IS_VISIBLE'
EXEC sp_addextendedproperty 'MS_Description', N'Тип поля при редактировании из TSTInLineEditType', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'PICK_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Список доступных значений (через ";")', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'PICK_LIST'
EXEC sp_addextendedproperty 'MS_Description', N'Тип данных (из sys.types)', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'DATA_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Данные (если тип - строка)', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'VALUE_CHAR'
EXEC sp_addextendedproperty 'MS_Description', N'Данные (если тип - число)', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'VALUE_FLOAT'
EXEC sp_addextendedproperty 'MS_Description', N'Данные (если тип - логическое значение)', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'VALUE_BIT'
EXEC sp_addextendedproperty 'MS_Description', N'Данные (если тип - дата)', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'VALUE_DATE'
EXEC sp_addextendedproperty 'MS_Description', N'Приоритет', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'gravity'
GO

--
-- OKP_InventoryWP
--
CREATE TABLE OKP_InventoryWP (
    ID bigint not null identity(1, 1),
    DOC_ID bigint not null,
    INV_ID bigint not null,
    SUB_ID bigint null,
    WP_ID  bigint not null,
    QTY_OLD float(53) not null,
    QTY_NEW float(53) not null
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на документ инвентаризации (OKP_TRNDoc.ID)', 'schema', 'dbo', 'table', 'OKP_InventoryWP', 'column', 'DOC_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на ТМЦ (OKP_INV.INV_ID)', 'schema', 'dbo', 'table', 'OKP_InventoryWP', 'column', 'INV_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на складскую карточку объектов (OKP_WRH_SUBJECTS.ID)', 'schema', 'dbo', 'table', 'OKP_InventoryWP', 'column', 'SUB_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на место хранения (OKP_WPlaces.ID)', 'schema', 'dbo', 'table', 'OKP_InventoryWP', 'column', 'WP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Количество ДО инвентаризации. Указано в ЕИЗ хранения из бланка ТМЦ (OKP_INV.UOMHEIZ)', 'schema', 'dbo', 'table', 'OKP_InventoryWP', 'column', 'QTY_OLD'
EXEC sp_addextendedproperty 'MS_Description', N'Количество ПОСЛЕ инвентаризации. Указано в ЕИЗ хранения из бланка ТМЦ (OKP_INV.UOMHEIZ)', 'schema', 'dbo', 'table', 'OKP_InventoryWP', 'column', 'QTY_NEW'
GO 
        
--
-- UNIT-тестирование
-- Таблица объектов тестирования
--
CREATE TABLE OKP_UTO (
    ID int NOT NULL identity(1,1),
    NAME VARCHAR(50) COLLATE DATABASE_DEFAULT NOT NULL,
    TYP VARCHAR(20) COLLATE DATABASE_DEFAULT NOT NULL,
    CONSTRAINT PK_OKP_UTO PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Объекты unit-тестирования', N'schema', N'dbo', N'table', N'OKP_UTO'
EXEC sp_addextendedproperty 'MS_Description', N'Искусственный идентификатор', N'schema', N'dbo', N'table', N'OKP_UTO', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальное наименование объекта', N'schema', N'dbo', N'table', N'OKP_UTO', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Тип объекта', N'schema', N'dbo', N'table', N'OKP_UTO', N'column', N'TYP'
GO

--
-- UNIT-тестирование
-- Тесты объектов
--
CREATE TABLE OKP_UTT (
    ID int NOT NULL identity(1,1),
    IDN VARCHAR(99) COLLATE DATABASE_DEFAULT NOT NULL,
    OBJECT_ID int NOT NULL,
    SQLCMD VARCHAR(999) COLLATE DATABASE_DEFAULT NOT NULL,
    COLUMNS VARCHAR(3000) COLLATE DATABASE_DEFAULT NOT NULL,
    DESCR VARCHAR(199) COLLATE DATABASE_DEFAULT NOT NULL,  
    IsSystem BIT DEFAULT 0 NOT NULL,  
    AVOID varchar(999) COLLATE DATABASE_DEFAULT NULL,
    CONSTRAINT PK_OKP_UTT PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Тесты unit-тестирования', N'schema', N'dbo', N'table', N'OKP_UTT'
EXEC sp_addextendedproperty 'MS_Description', N'Искусственный идентификатор', N'schema', N'dbo', N'table', N'OKP_UTT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Естесственный идентификатор', N'schema', N'dbo', N'table', N'OKP_UTT', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'ID объекта тестирования', N'schema', N'dbo', N'table', N'OKP_UTT', N'column', N'OBJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Команда', N'schema', N'dbo', N'table', N'OKP_UTT', N'column', N'SQLCMD'
EXEC sp_addextendedproperty 'MS_Description', N'Заполняемые в OKP_UTR столбцы', N'schema', N'dbo', N'table', N'OKP_UTT', N'column', N'COLUMNS'
EXEC sp_addextendedproperty 'MS_Description', N'Описание unit-теста', N'schema', N'dbo', N'table', N'OKP_UTT', N'column', N'DESCR'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг "Системный"', N'schema', N'dbo', N'table', N'OKP_UTT', N'column', N'IsSystem'
EXEC sp_addextendedproperty 'MS_Description', N'Список колонок, которые не участвуют в сравнении', N'schema', N'dbo', N'table', N'OKP_UTT', N'column', N'AVOID'
GO

--
-- UNIT-тестирование
-- Параметры запуска тестов
--
CREATE TABLE OKP_UTP (
    ID int NOT NULL identity(1,1),
    IDN VARCHAR(99) COLLATE DATABASE_DEFAULT NOT NULL,       
    NAME VARCHAR(99) COLLATE DATABASE_DEFAULT NOT NULL,
    SELCOM VARCHAR(999) COLLATE DATABASE_DEFAULT NULL,
    DATA_TYPE int NOT NULL,
    VALUE_CHAR varchar(999) COLLATE DATABASE_DEFAULT NULL,
    VALUE_FLOAT float NULL,
    VALUE_BIT bit NULL,
    VALUE_DATE datetime NULL,    
    CONSTRAINT PK_OKP_UTP PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Входные параметры к тестам', N'schema', N'dbo', N'table', N'OKP_UTP'
EXEC sp_addextendedproperty 'MS_Description', N'Искусственный идентификатор', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный идентификатор параметра', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование параметра', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Команда для получения значения параметра', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'SELCOM'
EXEC sp_addextendedproperty 'MS_Description', N'Тип данных (из sys.types)', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'DATA_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Данные (если тип - строка)', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'VALUE_CHAR'
EXEC sp_addextendedproperty 'MS_Description', N'Данные (если тип - число)', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'VALUE_FLOAT'
EXEC sp_addextendedproperty 'MS_Description', N'Данные (если тип - логическое значение)', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'VALUE_BIT'
EXEC sp_addextendedproperty 'MS_Description', N'Данные (если тип - дата)', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'VALUE_DATE'
GO

--
-- UNIT-тестирование
-- Эталоны результатов тестов
--
CREATE TABLE OKP_UTE (
    ID int NOT NULL identity(1,1),
    TEST_ID int NULL,
    LINE_NUM int NULL,
    CHAR_1 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_1 FLOAT(53) NULL,
    DATETIME_1 datetime NULL,
    CHAR_2 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_2 FLOAT(53) NULL,
    DATETIME_2 datetime NULL,
    CHAR_3 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_3 FLOAT(53) NULL,
    DATETIME_3 datetime NULL,
    CHAR_4 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_4 FLOAT(53) NULL,
    DATETIME_4 datetime NULL,
    CHAR_5 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_5 FLOAT(53) NULL,
    DATETIME_5 datetime NULL,
    CHAR_6 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_6 FLOAT(53) NULL,
    DATETIME_6 datetime NULL,
    CHAR_7 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_7 FLOAT(53) NULL,
    DATETIME_7 datetime NULL,
    CHAR_8 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_8 FLOAT(53) NULL,
    DATETIME_8 datetime NULL,
    CHAR_9 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_9 FLOAT(53) NULL,
    DATETIME_9 datetime NULL,
    CHAR_10 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_10 FLOAT(53) NULL,
    DATETIME_10 datetime NULL,
    CHAR_11 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_11 FLOAT(53) NULL,
    DATETIME_11 datetime NULL,
    CHAR_12 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_12 FLOAT(53) NULL,
    DATETIME_12 datetime NULL,      
    CHAR_13 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_13 FLOAT(53) NULL,
    DATETIME_13 datetime NULL,     
    CHAR_14 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_14 FLOAT(53) NULL,
    DATETIME_14 datetime NULL,
    CHAR_15 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_15 FLOAT(53) NULL,
    DATETIME_15 datetime NULL,   
    CHAR_16 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_16 FLOAT(53) NULL,
    DATETIME_16 datetime NULL,   
    CHAR_17 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_17 FLOAT(53) NULL,
    DATETIME_17 datetime NULL,   
    CHAR_18 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_18 FLOAT(53) NULL,
    DATETIME_18 datetime NULL,   
    CHAR_19 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_19 FLOAT(53) NULL,
    DATETIME_19 datetime NULL,   
    CHAR_20 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_20 FLOAT(53) NULL,
    DATETIME_20 datetime NULL,   
    CHAR_21 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_21 FLOAT(53) NULL,
    DATETIME_21 datetime NULL,   
    CHAR_22 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_22 FLOAT(53) NULL,
    DATETIME_22 datetime NULL,   
    CHAR_23 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_23 FLOAT(53) NULL,
    DATETIME_23 datetime NULL,   
    CHAR_24 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_24 FLOAT(53) NULL,
    DATETIME_24 datetime NULL,  
    CHAR_25 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_25 FLOAT(53) NULL,
    DATETIME_25 datetime NULL, 
    CHAR_26 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_26 FLOAT(53) NULL,
    DATETIME_26 datetime NULL, 
    CHAR_27 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_27 FLOAT(53) NULL,
    DATETIME_27 datetime NULL, 
    CHAR_28 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_28 FLOAT(53) NULL,
    DATETIME_28 datetime NULL, 
    CHAR_29 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_29 FLOAT(53) NULL,
    DATETIME_29 datetime NULL, 
    CHAR_30 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_30 FLOAT(53) NULL,
    DATETIME_30 datetime NULL, 
    CHAR_31 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_31 FLOAT(53) NULL,
    DATETIME_31 datetime NULL, 
    CHAR_32 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_32 FLOAT(53) NULL,
    DATETIME_32 datetime NULL, 
    CHAR_33 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_33 FLOAT(53) NULL,
    DATETIME_33 datetime NULL,   
    CHAR_34 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_34 FLOAT(53) NULL,
    DATETIME_34 datetime NULL,  
    CHAR_35 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_35 FLOAT(53) NULL,
    DATETIME_35 datetime NULL,  
    CHAR_36 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_36 FLOAT(53) NULL,
    DATETIME_36 datetime NULL,  
    CHAR_37 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_37 FLOAT(53) NULL,
    DATETIME_37 datetime NULL,  
    CHAR_38 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_38 FLOAT(53) NULL,
    DATETIME_38 datetime NULL,  
    CHAR_39 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_39 FLOAT(53) NULL,
    DATETIME_39 datetime NULL,  
    CHAR_40 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_40 FLOAT(53) NULL,
    DATETIME_40 datetime NULL,  
    CHAR_41 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_41 FLOAT(53) NULL,
    DATETIME_41 datetime NULL,  
    CHAR_42 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_42 FLOAT(53) NULL,
    DATETIME_42 datetime NULL,  
    CHAR_43 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_43 FLOAT(53) NULL,
    DATETIME_43 datetime NULL,  
    CHAR_44 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_44 FLOAT(53) NULL,
    DATETIME_44 datetime NULL,
    CHAR_45 VARCHAR(199) COLLATE DATABASE_DEFAULT NULL,
    FLOAT_45 FLOAT(53) NULL,
    DATETIME_45 datetime NULL,                                         
    CONSTRAINT PK_OKP_UTE PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Эталоны unit-тестирования', N'schema', N'dbo', N'table', N'OKP_UTE'
EXEC sp_addextendedproperty 'MS_Description', N'Искусственный идентификатор', N'schema', N'dbo', N'table', N'OKP_UTE', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID теста', N'schema', N'dbo', N'table', N'OKP_UTE', N'column', N'TEST_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Номер строки результатов', N'schema', N'dbo', N'table', N'OKP_UTE', N'column', N'LINE_NUM'
GO

/*
** таблица анализируемых сущностей для мониторов
*/
CREATE TABLE OKP_MSRC (
	ID int identity (1,1) NOT NULL,
	NAME varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	GRP_ID int NOT NULL,
	sysobj_id INT NULL,
	caption varchar(256) COLLATE DATABASE_DEFAULT NULL,
	field_auto_inc VARCHAR(64) NULL,
	inImport BIT default 0 NOT NULL,
	CONSTRAINT PK_OKP_MSRC PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Источники метасхемы', N'schema', N'dbo', N'table', N'OKP_MSRC'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_MSRC', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование объекта БД', N'schema', N'dbo', N'table', N'OKP_MSRC', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'ID системного объекта', N'schema', N'dbo', N'table', N'OKP_MSRC', N'column', N'sysobj_id'
EXEC sp_addextendedproperty 'MS_Description', N'Собственное наименование', N'schema', N'dbo', N'table', N'OKP_MSRC', N'column', N'caption'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование поля-автоинкремента', N'schema', N'dbo', N'table', N'okp_msrc', N'column', N'field_auto_inc'
GO

/*
** таблица мониторов
*/
CREATE TABLE OKP_MON (
	ID int identity (1,1) NOT NULL,
	idn VARCHAR(50) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME_1 varchar(16) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME_2 varchar(16) COLLATE DATABASE_DEFAULT NULL,
	MSRC_ID int NOT NULL,
	AUTHOR_ID int NULL,
	DESCR varchar(999) COLLATE DATABASE_DEFAULT NULL,
	is_system bit DEFAULT 0 NOT NULL,
	api_getter varchar(32) COLLATE DATABASE_DEFAULT NULL,
	CONSTRAINT PK_OKP_MON PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица мониторов', N'schema', N'dbo', N'table', N'OKP_MON'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_MON', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальное обозначение для идентификации', N'schema', N'dbo', N'table', N'OKP_MON', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование (строка 1)', N'schema', N'dbo', N'table', N'OKP_MON', N'column', N'NAME_1'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование (строка 2)', N'schema', N'dbo', N'table', N'OKP_MON', N'column', N'NAME_2'
EXEC sp_addextendedproperty 'MS_Description', N'ID сущности, по которой будет построен монитор', N'schema', N'dbo', N'table', N'OKP_MON', N'column', N'MSRC_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID автора', N'schema', N'dbo', N'table', N'OKP_MON', N'column', N'AUTHOR_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Описание монитора', N'schema', N'dbo', N'table', N'OKP_MON', N'column', N'DESCR'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг "системный"', N'schema', N'dbo', N'table', N'OKP_MON', N'column', N'is_system'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор API-команды', N'schema', N'dbo', N'table', N'okp_mon', N'column', N'api_getter'
GO

/*
** таблица полей для мониторов
*/
CREATE TABLE OKP_MFLD (
	ID int identity (1,1) NOT NULL,
	MSRC_ID int NOT NULL,
	FLD_NAME varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	USER_TYPE_ID int NOT NULL,
	CAPTION varchar(99) COLLATE DATABASE_DEFAULT NULL,
	FORMULA varchar(999) COLLATE DATABASE_DEFAULT NULL,
	IsSystem bit DEFAULT 1 NOT NULL,
	IsVisible bit DEFAULT 1 NOT NULL,
	gravity INT NOT NULL,
	CONSTRAINT PK_OKP_MFLD PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица полей для мониторов', N'schema', N'dbo', N'table', N'OKP_MFLD'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_MFLD', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор сущности, содержащей поле', N'schema', N'dbo', N'table', N'OKP_MFLD', N'column', N'MSRC_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование поля', N'schema', N'dbo', N'table', N'OKP_MFLD', N'column', N'FLD_NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Тип данных поля', N'schema', N'dbo', N'table', N'OKP_MFLD', N'column', N'USER_TYPE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Название атрибута', N'schema', N'dbo', N'TABLE', N'OKP_MFLD', N'column', N'CAPTION'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг системности атрибута (невозможен к администрированию)', N'schema', N'dbo', N'TABLE', N'OKP_MFLD', N'column', N'IsSystem'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг видимости атрибута', N'schema', N'dbo', N'TABLE', N'OKP_MFLD', N'column', N'IsVisible'
EXEC sp_addextendedproperty 'MS_Description', N'Формула атрибута', N'schema', N'dbo', N'TABLE', N'OKP_MFLD', N'column', N'FORMULA'
EXEC sp_addextendedproperty 'MS_Description', N'Порядок отражения', N'schema', N'dbo', N'TABLE', N'OKP_MFLD', N'column', N'gravity'
GO

-- таблица связей между монитором и полями
CREATE TABLE OKP_MON_MFLD (
	ID int identity (1,1) NOT NULL,
	MON_ID int NOT NULL,
	MFLD_ID int NOT NULL,
	MFLD_PATH varchar(255) COLLATE DATABASE_DEFAULT NULL,
	IDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(999) COLLATE DATABASE_DEFAULT NOT NULL,
	GRAVITY int NOT NULL,
	ALIGN int DEFAULT 2 NOT NULL,
	IsVisible bit DEFAULT 1 NOT NULL,
	USER_TYPE_ID int NULL,
	FORMULA varchar(999) COLLATE DATABASE_DEFAULT NULL,
	CONSTRAINT PK_OKP_MON_MFLD PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица связей между монитором и полями', N'schema', N'dbo', N'table', N'OKP_MON_MFLD'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор монитора', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'MON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор поля', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'MFLD_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Путь от источника к полю через JOIN', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'MFLD_PATH'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование поля в тексте запроса', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование поля в мониторе', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Порядковый номер колонки в сетке', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'GRAVITY'
EXEC sp_addextendedproperty 'MS_Description', N'Центрирование данных в сетке', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'ALIGN'
EXEC sp_addextendedproperty 'MS_Description', N'Видимость столбца', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'ISVISIBLE'
EXEC sp_addextendedproperty 'MS_Description', N'Тип данных в колонке (NULL - по умолчанию)', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'USER_TYPE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Формула атрибута', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'FORMULA'
GO

-- таблица межтабличных связей, которые могут быть задействованы при построении монитора
CREATE TABLE OKP_MLINK (
    ID int identity (1,1) NOT NULL,
    NAME varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
    SRC_TAB varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
    SRC_FLD varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	SRC_FILTR varchar(255) COLLATE DATABASE_DEFAULT NULL,
    REF_TAB varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
    REF_FLD varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,  
    CONSTRAINT PK_OKP_MON_MLINK PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица межтабличных связей, которые могут быть задействованы при построении монитора', N'schema', N'dbo', N'table', N'OKP_MLINK'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_MLINK', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальное наименование связи, которое будет участвовать в построении запроса', N'schema', N'dbo', N'table', N'OKP_MLINK', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Таблица-источник', N'schema', N'dbo', N'table', N'OKP_MLINK', N'column', N'SRC_TAB'
EXEC sp_addextendedproperty 'MS_Description', N'Поле таблицы-источника', N'schema', N'dbo', N'table', N'OKP_MLINK', N'column', N'SRC_FLD'
EXEC sp_addextendedproperty 'MS_Description', N'Команда фильтрации записей таблицы-источника', N'schema', N'dbo', N'table', N'OKP_MLINK', N'column', N'SRC_FILTR'
EXEC sp_addextendedproperty 'MS_Description', N'Таблица-приёмник', N'schema', N'dbo', N'table', N'OKP_MLINK', N'column', N'REF_TAB'
EXEC sp_addextendedproperty 'MS_Description', N'Поле таблицы-приёмника', N'schema', N'dbo', N'table', N'OKP_MLINK', N'column', N'REF_FLD'
GO  

-- таблица допустимых параметров работы монитора со значениями по умолчанию
CREATE TABLE OKP_MPARM (
  ID int identity (1,1) NOT NULL,
  MON_ID int NOT NULL,
  MON_MFLD_ID int NOT NULL,
  VAL varchar(99) COLLATE DATABASE_DEFAULT NULL,
  IsActive bit DEFAULT 1 NOT NULL,
  OPERAND varchar(15) CONSTRAINT DF_OKP_MPARM_OPERAND DEFAULT '=' NOT NULL,
  CONSTRAINT PK_OKP_MPARM PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица допустимых параметров работы монитора со значениями', N'schema', N'dbo', N'table', N'OKP_MPARM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_MPARM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID монитора', N'schema', N'dbo', N'table', N'OKP_MPARM', N'column', N'MON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID поля', N'schema', N'dbo', N'table', N'OKP_MPARM', N'column', N'MON_MFLD_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Значение по умолчанию (формула)', N'schema', N'dbo', N'table', N'OKP_MPARM', N'column', N'VAL'
EXEC sp_addextendedproperty 'MS_Description', N'Применяемость параметра в настройках', N'schema', N'dbo', N'table', N'OKP_MPARM', N'column', N'IsActive'
EXEC sp_addextendedproperty 'MS_Description', N'Операнд сравнения', N'schema', N'dbo', N'table', N'OKP_MPARM', N'column', N'OPERAND'      
GO  

-- таблица допустимых диаграмм для построений в мониторе
CREATE TABLE OKP_MDIAG (
    ID int identity (1,1) NOT NULL,
    IDN varchar(15) COLLATE DATABASE_DEFAULT NOT NULL,
    NAME varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	DESCR varchar(999) COLLATE DATABASE_DEFAULT NOT NULL,
    CONSTRAINT PK_OKP_MDIAG PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица допустимых диаграмм для построений в мониторе', N'schema', N'dbo', N'table', N'OKP_MDIAG'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_MDIAG', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальное наименование диаграммы', N'schema', N'dbo', N'table', N'OKP_MDIAG', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Полное наименование диаграммы', N'schema', N'dbo', N'table', N'OKP_MDIAG', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Описание диаграммы', N'schema', N'dbo', N'table', N'OKP_MDIAG', N'column', N'DESCR'
GO

-- таблица настроенных диаграмм для мониторов
CREATE TABLE OKP_MON_MDIAG (
	ID int identity (1,1) NOT NULL,
	MON_ID int NOT NULL,
	MDIAG_ID int NOT NULL,
	IDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(999) COLLATE DATABASE_DEFAULT NOT NULL,
	CONSTRAINT PK_OKP_MON_MDIAG PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица настроенных диаграмм для мониторов', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID монитора', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG', N'column', N'MON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID диаграммы', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG', N'column', N'MDIAG_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный внутренний идентификатор', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование настроенной диаграммы', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG', N'column', N'NAME'
GO

-- таблица настроек работы диаграммы
CREATE TABLE OKP_MDSET (
	ID int identity (1,1) NOT NULL,
	MDIAG_ID int NULL,
	IDN varchar(99) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(999) COLLATE DATABASE_DEFAULT NOT NULL,
	DESCR varchar(999) COLLATE DATABASE_DEFAULT NOT NULL,
	TYPE varchar(999) COLLATE DATABASE_DEFAULT NOT NULL,
	def_value VARCHAR(999) COLLATE DATABASE_DEFAULT NULL,
	GRAVITY int CONSTRAINT DF_OKP_MDSET_GRAVITY DEFAULT (0) NOT NULL,
	type_id_need INT NULL,
	is_hidden BIT DEFAULT 0 NOT NULL,
	is_mandatory BIT DEFAULT 1 NOT NULL,
	CONSTRAINT PK_OKP_MDSET PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица настроек работы диаграммы', N'schema', N'dbo', N'table', N'OKP_MDSET'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID диаграммы (NULL для всех)', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'MDIAG_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор настройки', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Название настройки', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'Описание настройки', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'DESCR'
EXEC sp_addextendedproperty 'MS_Description', N'Тип значения:	COLUMN -> OKP_MON_MFLD.IDN, 	TEXT -> простой текст,	HIDDEN -> скрытое поле (системное),	BIT -> логическое значение (да/нет)', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Приоритет настройки в отражаемом списке', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'GRAVITY'
EXEC sp_addextendedproperty 'MS_Description', N'Значение по умолчанию', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'def_value'
EXEC sp_addextendedproperty 'MS_Description', N'Требуемый тип данных', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'type_id_need'
EXEC sp_addextendedproperty 'MS_Description', N'Скрытая настройка', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'is_hidden'
EXEC sp_addextendedproperty 'MS_Description', N'Обязательная настройка', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'is_mandatory'
GO

-- таблица настроек работы диаграммы конкретного монитора
CREATE TABLE OKP_MON_MDIAG_MDSET (
	ID int identity (1,1) NOT NULL,
	MON_MDIAG_ID int NOT NULL,
	MDSET_ID int NOT NULL,
	VAL varchar(999) COLLATE DATABASE_DEFAULT NOT NULL,
	CONSTRAINT PK_OKP_MON_MDIAG_MDSET PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица настроек работы диаграммы конкретного монитора', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG_MDSET'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG_MDSET', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID диаграммы монитора', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG_MDSET', N'column', N'MON_MDIAG_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID настройки диаграммы', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG_MDSET', N'column', N'MDSET_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Значение настройки', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG_MDSET', N'column', N'VAL'
GO

-- таблица правил раскрашивания
CREATE TABLE OKP_MCLR (
	ID int identity (1,1) NOT NULL,
	NAME varchar(99) COLLATE DATABASE_DEFAULT NOT NULL,
	MON_ID int NOT NULL,
	COLOR int NOT NULL,
	USER_ID int NULL,
	FORMULA varchar(999) COLLATE DATABASE_DEFAULT NOT NULL,
	GRAVITY int NOT NULL,
	IsActive bit DEFAULT 1 NOT NULL,     
	CONSTRAINT PK_OKP_MCLR PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица правил раскрашивания', N'schema', N'dbo', N'table', N'OKP_MCLR'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_MCLR', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование правила раскраски', N'schema', N'dbo', N'table', N'OKP_MCLR', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'ID монитора', N'schema', N'dbo', N'table', N'OKP_MCLR', N'column', N'MON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Значение цвета', N'schema', N'dbo', N'table', N'OKP_MCLR', N'column', N'COLOR'
EXEC sp_addextendedproperty 'MS_Description', N'ID пользователя', N'schema', N'dbo', N'table', N'OKP_MCLR', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Условие, при выполнении которого будет применён текущий цвет', N'schema', N'dbo', N'table', N'OKP_MCLR', N'column', N'FORMULA'
EXEC sp_addextendedproperty 'MS_Description', N'Приоритет раскрашивания (0 - максимальный)', N'schema', N'dbo', N'table', N'OKP_MCLR', N'column', N'GRAVITY'
EXEC sp_addextendedproperty 'MS_Description', N'Применямость правила', N'schema', N'dbo', N'table', N'OKP_MCLR', N'column', N'IsActive'
GO

-- тексты сохранённых запросов
CREATE TABLE OKP_MSREQ (
	ID int identity(1,1) NOT NULL,
	MON_ID int NOT NULL,
	USER_ID int NULL,
	TYPE_ID int NOT NULL,
	REQ_TEXT varchar(MAX) COLLATE DATABASE_DEFAULT NOT NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Сохранённые тексты запросов для мониторов', N'schema', N'dbo', N'table', N'OKP_MSREQ'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_MSREQ', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID монитора', N'schema', N'dbo', N'table', N'OKP_MSREQ', N'column', N'MON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID пользователя', N'schema', N'dbo', N'table', N'OKP_MSREQ', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Тип зароса (1 - PARM, 2 - GRID)', N'schema', N'dbo', N'table', N'OKP_MSREQ', N'column', N'TYPE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Текст запроса', N'schema', N'dbo', N'table', N'OKP_MSREQ', N'column', N'REQ_TEXT'
GO

-- таблица правил фильтрации
CREATE TABLE OKP_MFILTR (
  ID int identity (1,1) NOT NULL,
  NAME varchar(99) COLLATE DATABASE_DEFAULT NOT NULL,
	MON_ID int NOT NULL,
	FORMULA varchar(999) COLLATE DATABASE_DEFAULT NOT NULL,
  GRAVITY int NOT NULL,
  IsActive bit DEFAULT 1 NOT NULL, 
  CONSTRAINT PK_OKP_MFILTR PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица правил фильтрации', N'schema', N'dbo', N'table', N'OKP_MFILTR'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_MFILTR', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'OKP_MFILTR', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'ID монитора', N'schema', N'dbo', N'table', N'OKP_MFILTR', N'column', N'MON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Условие, при выполнении которого будет применена фильтрация', N'schema', N'dbo', N'table', N'OKP_MFILTR', N'column', N'FORMULA'
EXEC sp_addextendedproperty 'MS_Description', N'Приоритет отражения на панели (0 - максимальный)', N'schema', N'dbo', N'table', N'OKP_MFILTR', N'column', N'GRAVITY'
EXEC sp_addextendedproperty 'MS_Description', N'Применямость правила', N'schema', N'dbo', N'table', N'OKP_MFILTR', N'column', N'IsActive'
GO

CREATE TABLE OKP_MFUNC (
    ID int identity (1,1) NOT NULL,
    IDN varchar(32) COLLATE DATABASE_DEFAULT NOT NULL,
    DESCR varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
    FUNC_IDN varchar(32) COLLATE DATABASE_DEFAULT NOT NULL,
    CONSTRAINT PK_OKP_MFUNC PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица функций преобразования', N'schema', N'dbo', N'table', N'OKP_MFUNC'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_MFUNC', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальное наименование функции (в среде редактора)', N'schema', N'dbo', N'table', N'OKP_MFUNC', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'OKP_MFUNC', N'column', N'DESCR'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальное наименование функции (в среде SQL - начинается  "dbo.")', N'schema', N'dbo', N'table', N'OKP_MFUNC', N'column', N'FUNC_IDN'
GO

/* @BLOCK: Мастер импорта
** @DESCR: Общие настройки импортируемых таблиц
*/
CREATE TABLE OKP_IMSET (
	id INT IDENTITY(1,1) NOT NULL,
	sysobject_id INT NOT NULL,
	sysobject_parent_id INT NULL,
	idField VARCHAR(32) COLLATE DATABASE_DEFAULT NOT NULL,
	idnField VARCHAR(99) COLLATE DATABASE_DEFAULT NULL,
	ownerField VARCHAR(99) COLLATE DATABASE_DEFAULT NULL,
	CONSTRAINT PK_OKP_IMSET PRIMARY KEY CLUSTERED (ID)  
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Общие настройки импортируемых таблиц', N'schema', N'dbo', N'table', N'OKP_IMSET'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_IMSET', N'column', N'id' 
EXEC sp_addextendedproperty 'MS_Description', N'ID системного объекта', N'schema', N'dbo', N'table', N'OKP_IMSET', N'column', N'sysobject_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID родительского системного объекта', N'schema', N'dbo', N'table', N'OKP_IMSET', N'column', N'sysobject_parent_id'
EXEC sp_addextendedproperty 'MS_Description', N'Поле, хранящее искусственный идентификатор', N'schema', N'dbo', N'table', N'OKP_IMSET', N'column', N'idField'
EXEC sp_addextendedproperty 'MS_Description', N'Поле, хранящее естественный идентификатор', N'schema', N'dbo', N'table', N'OKP_IMSET', N'column', N'idnField'
EXEC sp_addextendedproperty 'MS_Description', N'Поле, хранящее ссылку на ответственного исполнителя', N'schema', N'dbo', N'table', N'OKP_IMSET', N'column', N'ownerField'
GO

--
-- @BLOCK: Мастер импорта
-- @DESCR: Настройки связей между таблицами
--
CREATE TABLE OKP_IMLNK (
	id INT IDENTITY(1,1) NOT NULL,
	MainTable VARCHAR(32) COLLATE DATABASE_DEFAULT NOT NULL,
	MainField VARCHAR(32) COLLATE DATABASE_DEFAULT NOT NULL,
	RefTable VARCHAR(32) COLLATE DATABASE_DEFAULT NOT NULL,
	RefField VARCHAR(32) COLLATE DATABASE_DEFAULT NOT NULL,
	IsNullable bit NOT NULL,
	additionCondition VARCHAR(256) COLLATE DATABASE_DEFAULT NULL,
	CONSTRAINT PK_OKP_IMLNK PRIMARY KEY CLUSTERED (ID)  
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Настройки связей таблиц в мастере импорта', N'schema', N'dbo', N'table', N'OKP_IMLNK'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'OKP_IMLNK', N'column', N'id' 
EXEC sp_addextendedproperty 'MS_Description', N'Основная таблица', N'schema', N'dbo', N'table', N'OKP_IMLNK', N'column', N'MainTable'
EXEC sp_addextendedproperty 'MS_Description', N'Естественный идентификатор основной таблицы', N'schema', N'dbo', N'table', N'OKP_IMLNK', N'column', N'MainField'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылающаяся таблица', N'schema', N'dbo', N'table', N'OKP_IMLNK', N'column', N'RefTable'
EXEC sp_addextendedproperty 'MS_Description', N'Искусственный идентификатор ссылающейся таблицы', N'schema', N'dbo', N'table', N'OKP_IMLNK', N'column', N'RefField'
EXEC sp_addextendedproperty 'MS_Description', N'Связь соединяется через LEFT JOIN', N'schema', N'dbo', N'table', N'OKP_IMLNK', N'column', N'IsNullable'
EXEC sp_addextendedproperty 'MS_Description', N'Дополнительное условие для JOIN', N'schema', N'dbo', N'table', N'OKP_IMLNK', N'column', N'additionCondition'
GO

--
-- @BLOCK: none
-- @DESCR: Связь между UID в таблице OKP_reports и ID в других таблицах (например, OKP_SYSGRP_ITEM)
--
CREATE TABLE OKP_UID_ID (
	ID int identity(1,1) NOT NULL,
	UID uniqueidentifier NOT NULL,
	CONSTRAINT PK_OKP_UID_ID PRIMARY KEY CLUSTERED (ID)  
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица связей UID и ID', N'schema', N'dbo', N'table', N'OKP_UID_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID', N'schema', N'dbo', N'table', N'OKP_UID_ID', N'column', N'ID' 
EXEC sp_addextendedproperty 'MS_Description', N'UID', N'schema', N'dbo', N'table', N'OKP_UID_ID', N'column', N'UID'
GO

--
-- Definition for table OKP_IPTNUMS : ТАБЛИЦА СЕРИЙНЫХ\ПАРТИОННЫХ НОМЕРОВ НА МЕЖЦЕХОВОЙ ПЕРЕДАЧЕ
--

CREATE TABLE OKP_IPTNUMS (
  ID bigint IDENTITY(1, 1) NOT NULL,
  IPT_ELEM_ID bigint NOT NULL,
  TOZ_ID int NOT NULL,
  UNOM_ID bigint NOT NULL,
  N_TYPE int NOT NULL,
  QTY float NOT NULL,
  IGNORE tinyint DEFAULT 0 NOT NULL,
  PRIMARY KEY CLUSTERED (ID)
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'ТАБЛИЦА СЕРИЙНЫХ\ПАРТИОННЫХ НОМЕРОВ НА МЕЖЦЕХОВОЙ ПЕРЕДАЧЕ', N'schema', N'dbo', N'table', N'OKP_IPTNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор элемента (строки) документа передачи', N'schema', N'dbo', N'table', N'OKP_IPTNUMS', N'column', N'IPT_ELEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на технологическую операцию-передатчик OKP_TOZ.RWC', N'schema', N'dbo', N'table', N'OKP_IPTNUMS', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на внутренний идентификационный номер (OKP_UNOM.ID/OKP_UKIM.ID)', N'schema', N'dbo', N'table', N'OKP_IPTNUMS', N'column', N'UNOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на тип номера (OKP_sysObjects.ID)', N'schema', N'dbo', N'table', N'OKP_IPTNUMS', N'column', N'N_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Переданное количество на номере', N'schema', N'dbo', N'table', N'OKP_IPTNUMS', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг игнорирования', N'schema', N'dbo', N'table', N'OKP_IPTNUMS', N'column', N'IGNORE'
GO


CREATE TABLE ARH_IPTNUMS (
  ID bigint NULL,
  IPT_ELEM_ID bigint NULL,
  TOZ_ID int NULL,
  UNOM_ID bigint NULL,
  N_TYPE int NULL,
  QTY float  NULL,
  IGNORE tinyint NULL
)
go
EXEC sp_addextendedproperty 'MS_Description', N'Архив СЕРИЙНЫХ\ПАРТИОННЫХ НОМЕРОВ НА МЕЖЦЕХОВОЙ ПЕРЕДАЧЕ', N'schema', N'dbo', N'table', N'ARH_IPTNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор элемента (строки) документа передачи', N'schema', N'dbo', N'table', N'ARH_IPTNUMS', N'column', N'IPT_ELEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на технологическую операцию-передатчик OKP_TOZ.RWC', N'schema', N'dbo', N'table', N'ARH_IPTNUMS', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на внутренний идентификационный номер (OKP_UNOM.ID/OKP_UKIM.ID)', N'schema', N'dbo', N'table', N'ARH_IPTNUMS', N'column', N'UNOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на тип номера (OKP_sysObjects.ID)', N'schema', N'dbo', N'table', N'ARH_IPTNUMS', N'column', N'N_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Переданное количество на номере', N'schema', N'dbo', N'table', N'ARH_IPTNUMS', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг игнорирования', N'schema', N'dbo', N'table', N'ARH_IPTNUMS', N'column', N'IGNORE'
GO



CREATE TABLE OKP_IPTNUMSRECEIVE (
  ID bigint IDENTITY(1, 1) NOT NULL,
  IPTRECEIVE_ID bigint NOT NULL,
  IPTNUMS_ID bigint NOT NULL,
  QTY float NOT NULL,
  PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Принятые по межцеховой передаче  серийные номера', N'schema', N'dbo', N'table', N'OKP_IPTNUMSRECEIVE'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор подтверждения передачи', N'schema', N'dbo', N'table', N'OKP_IPTNUMSRECEIVE', N'column', N'IPTRECEIVE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор передаваемого/принимаемого серийного номера', N'schema', N'dbo', N'table', N'OKP_IPTNUMSRECEIVE', N'column', N'IPTNUMS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Количество принятое по SN', N'schema', N'dbo', N'table', N'OKP_IPTNUMSRECEIVE', N'column', N'QTY'
GO


CREATE TABLE ARH_IPTNUMSRECEIVE (
  ID bigint  NULL,
  IPTRECEIVE_ID bigint NULL,
  IPTNUMS_ID bigint NULL,
  QTY float NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архив принятых по межцеховой передаче  серийных номеров', N'schema', N'dbo', N'table', N'ARH_IPTNUMSRECEIVE'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор подтверждения передачи', N'schema', N'dbo', N'table', N'ARH_IPTNUMSRECEIVE', N'column', N'IPTRECEIVE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор передаваемого/принимаемого серийного номера', N'schema', N'dbo', N'table', N'ARH_IPTNUMSRECEIVE', N'column', N'IPTNUMS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Количество принятое по SN', N'schema', N'dbo', N'table', N'ARH_IPTNUMSRECEIVE', N'column', N'QTY'
GO



CREATE TABLE OKP_DSTNUMS (
  ID bigint IDENTITY(1, 1) NOT NULL,
  DST_ELEM_ID bigint NOT NULL,
  TOZ_ID int NOT NULL,
  UNOM_ID bigint NOT NULL,
  N_TYPE int NOT NULL,
  QTY float NOT NULL,
  PRIMARY KEY CLUSTERED (ID)
)
go
EXEC sp_addextendedproperty 'MS_Description', N'Cерийные номера документа "цеховая передача на склад"', N'schema', N'dbo', N'table', N'OKP_DSTNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор элемента (строки) документа передачи', N'schema', N'dbo', N'table', N'OKP_DSTNUMS', N'column', N'DST_ELEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на технологическую операцию OKP_TOZ.RWC', N'schema', N'dbo', N'table', N'OKP_DSTNUMS', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на внутренний идентификационный номер (OKP_UNOM.ID/OKP_UKIM.ID)', N'schema', N'dbo', N'table', N'OKP_DSTNUMS', N'column', N'UNOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на тип номера (OKP_sysObjects.ID)', N'schema', N'dbo', N'table', N'OKP_DSTNUMS', N'column', N'N_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Переданное количество на номере', N'schema', N'dbo', N'table', N'OKP_DSTNUMS', N'column', N'QTY'
GO


CREATE TABLE ARH_DSTNUMS (
  ID bigint NULL,
  DST_ELEM_ID bigint NULL,
  TOZ_ID int NULL,
  UNOM_ID bigint NULL,
  N_TYPE int NULL,
  QTY float NULL
)
go
EXEC sp_addextendedproperty 'MS_Description', N'Архив серийные номера документа "цеховая передача на склад"', N'schema', N'dbo', N'table', N'ARH_DSTNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор элемента (строки) документа передачи', N'schema', N'dbo', N'table', N'ARH_DSTNUMS', N'column', N'DST_ELEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на технологическую операцию OKP_TOZ.RWC', N'schema', N'dbo', N'table', N'ARH_DSTNUMS', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на внутренний идентификационный номер (OKP_UNOM.ID/OKP_UKIM.ID)', N'schema', N'dbo', N'table', N'ARH_DSTNUMS', N'column', N'UNOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на тип номера (OKP_sysObjects.ID)', N'schema', N'dbo', N'table', N'ARH_DSTNUMS', N'column', N'N_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'Переданное количество на номере', N'schema', N'dbo', N'table', N'ARH_DSTNUMS', N'column', N'QTY'
GO


CREATE TABLE dbo.OKP_TPC_TOZ_WPL (
    WPL_ID int NOT NULL,
    CPL_NUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
    NOP int NOT NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор рабочего места', N'schema', N'dbo', N'table', N'OKP_TPC_TOZ_WPL', N'column', N'WPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Номер партии', N'schema', N'dbo', N'table', N'OKP_TPC_TOZ_WPL', N'column', N'CPL_NUM'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции в партии', N'schema', N'dbo', N'table', N'OKP_TPC_TOZ_WPL', N'column', N'NOP'
GO

CREATE TABLE ARH_TOZ_WPL (
    ID int ,
    TOZ_ID int,
    WPL_ID int
  )
GO
EXEC sp_addextendedproperty 'MS_Description', N'Архив привязок производственных операций к рабочим местам', N'schema', N'dbo', N'table', N'ARH_TOZ_WPL'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор', N'schema', N'dbo', N'table', N'ARH_TOZ_WPL', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор операции технологического маршрута', N'schema', N'dbo', N'table', N'ARH_TOZ_WPL', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор рабочего места', N'schema', N'dbo', N'table', N'ARH_TOZ_WPL', N'column', N'WPL_ID'
GO

/*
** таблица вариантов разрядов на РЦ 
**/
CREATE TABLE OKP_WCRTAR (
	id INT IDENTITY(1,1) NOT NULL,
	wcr_id INT NOT NULL,
	rzo INT NOT NULL,
	CONSTRAINT PK_OKP_WCRTAR PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Разряды на РЦ', N'schema', N'dbo', N'table', N'OKP_WCRTAR'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'OKP_WCRTAR', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'ID рабочего центра', N'schema', N'dbo', N'table', N'OKP_WCRTAR', N'column', N'wcr_id'
EXEC sp_addextendedproperty 'MS_Description', N'Разряд', N'schema', N'dbo', N'table', N'OKP_WCRTAR', N'column', N'rzo'
GO

/*
** информация о разряде на РЦ 
**/
CREATE TABLE OKP_WCRTAR_DATA (
	id INT IDENTITY(1,1) NOT NULL,
	wcrtar_id INT NOT NULL,
	owner_id INT NULL,
	since INT NOT NULL,
	tshkzp_val FLOAT(53) NOT NULL,
	tpn_val FLOAT(53) NULL,
	CONSTRAINT PK_OKP_WCRTAR_DATA PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Тарифы разрядов на РЦ', N'schema', N'dbo', N'table', N'OKP_WCRTAR_DATA'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'OKP_WCRTAR_DATA', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'ID разряда на РЦ', N'schema', N'dbo', N'table', N'OKP_WCRTAR_DATA', N'column', N'wcrtar_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID ответственного исполнителя', N'schema', N'dbo', N'table', N'OKP_WCRTAR_DATA', N'column', N'owner_id'
EXEC sp_addextendedproperty 'MS_Description', N'Дата начала действия', N'schema', N'dbo', N'table', N'OKP_WCRTAR_DATA', N'column', N'since'
EXEC sp_addextendedproperty 'MS_Description', N'Значение тарифа', N'schema', N'dbo', N'table', N'OKP_WCRTAR_DATA', N'column', N'tshkzp_val'
EXEC sp_addextendedproperty 'MS_Description', N'Расценка Тпн', N'schema', N'dbo', N'table', N'OKP_WCRTAR_DATA', N'column', N'tpn_val'
GO

/*
** @NAME:  OKP_VAR_PARAM
**/
CREATE TABLE OKP_VAR_PARAM (
	id bigint NOT NULL IDENTITY(1,1),
	dte_create datetime NOT NULL DEFAULT GETDATE(),
	usr_create varchar(50) COLLATE database_default NOT NULL,
	dte_edit datetime NOT NULL DEFAULT GETDATE(),
	usr_edit varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	FlagDel bit DEFAULT 0 NOT NULL,
	start datetime,
	finish datetime,
	only_confirmed bit,
	autofill_szp bit,
	unified bit NOT NULL DEFAULT 0,
	for_user smallint NOT NULL CONSTRAINT df_okp_var_param_for_user DEFAULT 0,
	sel_user varchar(50) COLLATE database_default,
	nam varchar(250) COLLATE database_default,
	comment varchar(MAX) COLLATE database_default,
	split_goz bit,
	split_fav bit,
	onlybysupid bigint,
	rzp_guid uniqueidentifier,
        consignee_id bigint,
        review_by INT NOT NULL CONSTRAINT DF_OKP_VAR_PARAM_review_by DEFAULT  0,
	CONSTRAINT PK_OKP_VAR_PARAM PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty N'MS_Description',N'Настройки анализа потребностей для составления вариантов заявок на поставку',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_PARAM'
EXEC sp_addextendedproperty N'MS_Description',N'Идентификатор',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_PARAM',N'COLUMN',N'id'
EXEC sp_addextendedproperty 'MS_Description', N'Дата создания', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'dte_create'
EXEC sp_addextendedproperty 'MS_Description', N'Кем создано', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'usr_create'
EXEC sp_addextendedproperty 'MS_Description', N'Дата редактирования', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'dte_edit'
EXEC sp_addextendedproperty 'MS_Description', N'отредактировано пользователем', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'usr_edit'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг удаления', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'FlagDel'
EXEC sp_addextendedproperty 'MS_Description', N'Начало периода', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'start'
EXEC sp_addextendedproperty 'MS_Description', N'Конец периода', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'finish'
EXEC sp_addextendedproperty 'MS_Description', N'Только по подтвержденным', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'only_confirmed'
EXEC sp_addextendedproperty 'MS_Description', N'Восполнять страховой запас', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'autofill_szp'
EXEC sp_addextendedproperty 'MS_Description', N'Унифицированные', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'unified'
EXEC sp_addextendedproperty 'MS_Description', N'0 - общая; 1 - с разбивкой по ответственным снабженцам; 2 - только по снабженцу', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'for_user'  
EXEC sp_addextendedproperty 'MS_Description', N'ссылка на снабженца', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'sel_user'
EXEC sp_addextendedproperty 'MS_Description', N'Имя варианта', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'nam'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'comment'
EXEC sp_addextendedproperty 'MS_Description', N'ГОЗ отдельной строкой', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'split_goz'
EXEC sp_addextendedproperty 'MS_Description', N'Избранные отдельной строкой', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'split_fav'
EXEC sp_addextendedproperty 'MS_Description', N'Только по указанному поставщику', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'onlybysupid'
EXEC sp_addextendedproperty 'MS_Description', N'GUID', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'rzp_guid'
EXEC sp_addextendedproperty 'MS_Description', N'ID Грузополучателя', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'consignee_id'
EXEC sp_addextendedproperty 'MS_Description', N'Область сканирования (0 - по всей производственной программе; 1 - По списку ПП; 2 - По заказу)', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PARAM', 'COLUMN', N'review_by'
GO

/*
** @NAME:  OKP_VAR_RZP
**/
CREATE TABLE dbo.OKP_VAR_RZP (
	ID bigint IDENTITY(1,1),
	DTE_CALC datetime NOT NULL CONSTRAINT df_okp_var_rzp_dte_calc DEFAULT GETDATE(),
	ID_VAR bigint NOT NULL,
	SUP_ID int NOT NULL,
	UPUTRS varchar(30) NULL,
	INCLUDE_GOZ bit NOT NULL DEFAULT 0,
	MIN_DTE_POST_RZP datetime NULL,
	MAX_DTE_POST_RZP datetime NULL,
	CONSTRAINT PK_OKP_VAR_RZP PRIMARY KEY CLUSTERED (ID)
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Сгенерированные варианты заявок на поставку',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_RZP'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_RZP',N'COLUMN',N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата расчета', N'schema', N'dbo', N'table', N'OKP_VAR_RZP', N'column', N'DTE_CALC'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на вариант OKP_VAR_PARAM.ID', N'schema', N'dbo', N'table', N'OKP_VAR_RZP', N'column', N'ID_VAR'  
EXEC sp_addextendedproperty 'MS_Description', N'Поставщик', N'schema', N'dbo', N'table', N'OKP_VAR_RZP', N'column', N'SUP_ID'    
EXEC sp_addextendedproperty 'MS_Description', N'Транспорт', N'schema', N'dbo', N'table', N'OKP_VAR_RZP', N'column', N'UPUTRS'
EXEC sp_addextendedproperty 'MS_Description', N'Содержит ГОЗ', N'schema', N'dbo', N'table', N'OKP_VAR_RZP', N'column', N'INCLUDE_GOZ'
EXEC sp_addextendedproperty 'MS_Description', N'Начальная дата поставки', N'schema', N'dbo', N'table', N'OKP_VAR_RZP', N'column', N'MIN_DTE_POST_RZP'
EXEC sp_addextendedproperty 'MS_Description', N'Конечная дата поставки', N'schema', N'dbo', N'table', N'OKP_VAR_RZP', N'column', N'MAX_DTE_POST_RZP'    
GO

/*
** @NAME:  OKP_VAR_RZP_DATA
**/
CREATE TABLE dbo.OKP_VAR_RZP_DATA (
	ID bigint IDENTITY(1,1),
	DTE_CALC datetime NOT NULL CONSTRAINT df_okp_var_rzp_data_dte_calc DEFAULT (GETDATE()),
	ID_VAR bigint NOT NULL,
	PID bigint NOT NULL,
	UPU_ID bigint NOT NULL,
	PRC_KIM float NOT NULL CONSTRAINT df_okp_var_rzp_data_prc_kim DEFAULT (0),
	PRC_DOST float NOT NULL CONSTRAINT df_okp_var_rzp_data_prc_dost DEFAULT (0),
	NEWPOT float NOT NULL,
	TNP float NOT NULL,
	TNP_COUNT int NULL,
	QZKZ float NOT NULL,
	K float NOT NULL CONSTRAINT df_okp_var_rzp_data_k DEFAULT (1),
	EIZ_POST float NOT NULL,
	SUM_COST float NOT NULL CONSTRAINT df_okp_var_rzp_data_sum_cost DEFAULT (0),
	SUM_DOST float NOT NULL CONSTRAINT df_okp_var_rzp_data_sum_dost DEFAULT (0),
	CONSTRAINT PK_OKP_VAR_RZP_DATA PRIMARY KEY CLUSTERED (ID)
)  
GO

EXEC sp_addextendedproperty N'MS_Description',N'Состав сгенерированных заявок на поставку',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_RZP_DATA'
EXEC sp_addextendedproperty N'MS_Description',N'Идентификатор',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_RZP_DATA',N'COLUMN',N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата расчета', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'DTE_CALC'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на вариант', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'ID_VAR'
EXEC sp_addextendedproperty 'MS_Description', N'OKP_VAR_RZP.ID', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'PID'
EXEC sp_addextendedproperty 'MS_Description', N'Условие поставки', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'UPU_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Цена за ЕИЗ', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'PRC_KIM'
EXEC sp_addextendedproperty 'MS_Description', N'Стоимость доставки за ТНП', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'PRC_DOST'
EXEC sp_addextendedproperty 'MS_Description', N'Потребность', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'NEWPOT'
EXEC sp_addextendedproperty 'MS_Description', N'Транзитная Норма поставки', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'TNP'
EXEC sp_addextendedproperty 'MS_Description', N'Количество необходимых ТНП для покрытия потребностей', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'TNP_COUNT'
EXEC sp_addextendedproperty 'MS_Description', N'Заказываемое количество', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'QZKZ'
EXEC sp_addextendedproperty 'MS_Description', N'Коэффициент', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'K'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ поставки', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'EIZ_POST'
EXEC sp_addextendedproperty 'MS_Description', N'Стоимость КиМ', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'SUM_COST'
EXEC sp_addextendedproperty 'MS_Description', N'Стоимость доставки', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'SUM_DOST'    
GO

/*
** @NAME:  OKP_VAR_KIMTYPE
**/
CREATE TABLE dbo.OKP_VAR_KIMTYPE (
	id bigint identity(1,1) not null,
	id_var bigint NOT NULL,
	TYP varchar(1) NOT NULL,
	CONSTRAINT PK_OKP_VAR_KIMTYPE PRIMARY KEY CLUSTERED (ID)		
)
GO

EXEC sp_addextendedproperty N'MS_Description',N'Варианты заявок. Хранение настроек анализируемых типов номенклатур.',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_KIMTYPE'
EXEC sp_addextendedproperty N'MS_Description',N'Идентификатор',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_KIMTYPE',N'COLUMN',N'id'
EXEC sp_addextendedproperty N'MS_Description', N'Ссылка на вариант', N'schema', N'dbo', N'table', N'OKP_VAR_KIMTYPE', N'column', N'id_var'
EXEC sp_addextendedproperty N'MS_Description', N'Отмеченные пользователем типы номенклатуры', N'schema', N'dbo', N'table', N'OKP_VAR_KIMTYPE', N'column', N'TYP'  
GO

/*
** @NAME:  OKP_VAR_PPP
**/
CREATE TABLE OKP_VAR_PPP (
ID BIGINT IDENTITY,
id_var BIGINT NOT NULL,
PPPNUM VARCHAR(10) NOT NULL,
CONSTRAINT PK_OKP_VAR_PPP_ID PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty N'MS_Description', N'Список плановых позиций, который необходимо проанализировать', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PPP'
EXEC sp_addextendedproperty N'MS_Description', N'Идентификатор', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PPP', 'COLUMN', N'ID'
EXEC sp_addextendedproperty N'MS_Description', N'Связь с вариантом', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PPP', 'COLUMN', N'id_var'
EXEC sp_addextendedproperty N'MS_Description', N'Номер ПП', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PPP', 'COLUMN', N'PPPNUM'
GO

/*
** @NAME:  OKP_VAR_PLO
**/
CREATE TABLE OKP_VAR_PLO (
ID BIGINT IDENTITY,
id_var BIGINT NOT NULL,
ID_PLO BIGINT NOT NULL,
CONSTRAINT PK_OKP_VAR_PLO_ID PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty N'MS_Description', N'Список заказов, который необходимо проанализировать', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PLO'
EXEC sp_addextendedproperty N'MS_Description', N'Идентификатор', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PLO', 'COLUMN', N'ID'
EXEC sp_addextendedproperty N'MS_Description', N'Связь с вариантом', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PLO', 'COLUMN', N'id_var'
EXEC sp_addextendedproperty N'MS_Description', N'Идентификатор заказа', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PLO', 'COLUMN', N'ID_PLO'
GO

/*
** @NAME:  OKP_VAR_EXWRH
**/
CREATE TABLE OKP_VAR_EXWRH (
	id bigint identity(1,1) not null,
    id_var bigint NOT NULL,
    WRH_IDN varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	CONSTRAINT PK_OKP_VAR_EXWRH PRIMARY KEY CLUSTERED (ID)	
)
GO

EXEC sp_addextendedproperty N'MS_Description',N'Список исключенных складов из анализа вариантов заявок на поставку',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_EXWRH'
EXEC sp_addextendedproperty N'MS_Description',N'Идентификатор',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_EXWRH',N'COLUMN',N'id'
EXEC sp_addextendedproperty N'MS_Description',N'Ссылка на вариант',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_EXWRH',N'COLUMN',N'id_var'
EXEC sp_addextendedproperty N'MS_Description',N'Склады  исключенные пользователем из рассмотрения',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_EXWRH',N'COLUMN',N'WRH_IDN'
GO

/*
** @NAME:  OKP_VAR_EXWRH
**/
CREATE TABLE OKP_VAR_POTS (
	id bigint identity(1,1) not null,
	id_var bigint,
	DN int,
	RN int,
	GOS_ZAKAZ bit,
	PLO_ID bigint,
	FAV_CPL bit,
	RWC_POT bigint NOT NULL,
	DTE_POT datetime,
	QTYPOT float(53),
	QTYTQY float(53),
	RWC_TOZ int,
	RWC_PPP int,
	PRT_IDN varchar(50) COLLATE DATABASE_DEFAULT,
	RWC_NOM int,
	WRH_ID int,
	TYP varchar(1) COLLATE DATABASE_DEFAULT,
	unified bit,
	CPLNUM varchar(10) COLLATE DATABASE_DEFAULT,
	NOP int,
	TRN_ID bigint,
	imQTY float(53),
	TQY float(53),
	AUTO_SEL_POT bit DEFAULT 0,
	USR_SEL_POT bit DEFAULT 0,
	PREV_DTE_POT datetime,
	OLDWRH float(53) CONSTRAINT df_okp_var_pots_oldwrh DEFAULT(0),
	SUPPLY float(53) CONSTRAINT df_okp_var_pots_supply DEFAULT(0),
	NEWWRH float(53) CONSTRAINT df_okp_var_pots_newwrh DEFAULT(0),
	NEWPOT float(53) CONSTRAINT df_okp_var_pots_newpot DEFAULT(0),
	UPU_ID bigint,
	MIN_DTE_POT datetime NULL,
	MAX_EXP_DTE datetime NULL,
	MIN_PLN_DTE_POST datetime NULL,
	MAX_PLN_DTE_POST datetime NULL,
	MIN_DTE_POST_RZP datetime NULL,
	MAX_DTE_POST_RZP datetime NULL,
	CONSTRAINT PK_OKP_VAR_POTS PRIMARY KEY CLUSTERED (ID)		
)
GO

EXEC sp_addextendedproperty N'MS_Description',N'Состав потребностей вариантов заявок на поставку',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_POTS'
EXEC sp_addextendedproperty N'MS_Description',N'Идентификатор',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_POTS',N'COLUMN',N'id'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на вариант', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'id_var'
EXEC sp_addextendedproperty 'MS_Description', N'Служебное поле - ранг', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'DN'
EXEC sp_addextendedproperty 'MS_Description', N'Служебное поле - порядковый номер в ранге', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'RN'  
EXEC sp_addextendedproperty 'MS_Description', N'Метка - потребность по ГОЗ', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'GOS_ZAKAZ'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на заказ', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'PLO_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Метка - относится к OKP_PPP c метко RZP_MARK=1', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'FAV_CPL'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на потребность OKP_RZP_POT.RWC', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'RWC_POT'
EXEC sp_addextendedproperty 'MS_Description', N'Дата потребности', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'DTE_POT'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая потребность', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'QTYPOT'
EXEC sp_addextendedproperty 'MS_Description', N'Текщая потребность', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'QTYTQY'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на маршрут', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'RWC_TOZ'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на плановую позицию', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'RWC_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на обозначение предмета', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'PRT_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на номенклатуру', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'RWC_NOM'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на склад', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'WRH_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Тип потребности', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'TYP'
EXEC sp_addextendedproperty 'MS_Description', N'Унифицированная', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'unified'
EXEC sp_addextendedproperty 'MS_Description', N'Номер партии', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'Номер операции', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'Транзакция', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'TRN_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Выдано', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'imQTY'
EXEC sp_addextendedproperty 'MS_Description', N'Осталось выдать', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'TQY'
EXEC sp_addextendedproperty 'MS_Description', N'Потребности отмеченные автоматически на основе указанных параметров', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'AUTO_SEL_POT'
EXEC sp_addextendedproperty 'MS_Description', N'Потребность отмеченная пользователем', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'USR_SEL_POT'
EXEC sp_addextendedproperty 'MS_Description', N'Дата предыдущей потребности', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'PREV_DTE_POT'
EXEC sp_addextendedproperty 'MS_Description', N'Плановое количество на складе до поставки', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'OLDWRH'
EXEC sp_addextendedproperty 'MS_Description', N'Плановое количество поставки', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'SUPPLY'
EXEC sp_addextendedproperty 'MS_Description', N'Плановое количество на складе после поставки', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'NEWWRH'
EXEC sp_addextendedproperty 'MS_Description', N'Потребность после поставки', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'NEWPOT'
EXEC sp_addextendedproperty 'MS_Description', N'Назначенное условие поставки', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'UPU_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Минимальная дата потребности', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'MIN_DTE_POT'
EXEC sp_addextendedproperty 'MS_Description', N'Срок годности выходит', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'MAX_EXP_DTE'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая дата поставки - Начало периода', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'MIN_PLN_DTE_POST'
EXEC sp_addextendedproperty 'MS_Description', N'Плановая дата поставки - Конец периода', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'MAX_PLN_DTE_POST'
EXEC sp_addextendedproperty 'MS_Description', N'Начальная дата поставки по заявке', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'MIN_DTE_POST_RZP'
EXEC sp_addextendedproperty 'MS_Description', N'Конечная дата поставки по заявке', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'MAX_DTE_POST_RZP'
GO

CREATE TABLE OKP_VAR_SZP (
  id bigint identity(1,1) not null,
  id_var bigint not null, 
  RWC_NOM int not null, 
  QTY float(53) CONSTRAINT df_okp_var_szp_qty DEFAULT(0),
  UPU_ID bigint NULL,  
  CONSTRAINT PK_OKP_VAR_SZP PRIMARY KEY CLUSTERED (ID)	
)  
GO
EXEC sp_addextendedproperty 'MS_Description',N'Информация по восполнению страховых запасов при генерации вариантов зявок на поставку',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_SZP'
EXEC sp_addextendedproperty 'MS_Description',N'Идентификатор',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_SZP',N'COLUMN',N'id'
EXEC sp_addextendedproperty 'MS_Description',N'Ссылка на вариант', N'schema', N'dbo', N'table', N'OKP_VAR_SZP', N'column', N'id_var'
EXEC sp_addextendedproperty 'MS_Description',N'Ссылка на номенклатуру по которой требуется восполнение СЗ', N'schema', N'dbo', N'table', N'OKP_VAR_SZP', N'column', N'RWC_NOM'
EXEC sp_addextendedproperty 'MS_Description',N'Максимальное количество на которое необходимо восполнить СЗ', N'schema', N'dbo', N'table', N'OKP_VAR_SZP', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description',N'Назначенное условие поставки', N'schema', N'dbo', N'table', N'OKP_VAR_SZP', N'column', N'UPU_ID'
GO

/* @BLOCK: Варианты плана
** @DESCR: OKP_VPN
*/
CREATE TABLE OKP_VPN (
	ID bigint not null identity(1, 1),
	IDN varchar(50) COLLATE DATABASE_DEFAULT not null,
	Name varchar(100) COLLATE DATABASE_DEFAULT not null,
	DB bigint not null,
	DE bigint not null,
	Describe varchar(4000) COLLATE DATABASE_DEFAULT null,
	GRP_ID int null,
	CONSTRAINT PK_OKP_VPN PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Справочник вариантов плана', N'schema', N'dbo', N'table', N'OKP_VPN'
EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'OKP_VPN', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Обозначение', N'schema', N'dbo', N'table', N'OKP_VPN', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'OKP_VPN', N'column', N'Name'
EXEC sp_addextendedproperty 'MS_Description', N'Начало периода планирования', N'schema', N'dbo', N'table', N'OKP_VPN', N'column', N'DB'
EXEC sp_addextendedproperty 'MS_Description', N'Окончание периода планирования', N'schema', N'dbo', N'table', N'OKP_VPN', N'column', N'DE'
EXEC sp_addextendedproperty 'MS_Description', N'Описание', N'schema', N'dbo', N'table', N'OKP_VPN', N'column', N'Describe'
GO

/* @BLOCK: Варианты плана
** @DESCR: OKP_VPNItem
*/
CREATE TABLE OKP_VPNItem (
	ID bigint not null identity(1, 1),
	VPN_ID bigint not null,
	NOM_ID bigint not null,
	ROUTE_ID bigint not null,
	USER_ID int not null,
	SCHEME_ID bigint null,
	SCHEME_Type int not null,
	PPP_ID bigint null,
	PLOData_ID bigint null,
	N int not null,
	QTY float(53) not null,
	DTE bigint null
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Список позиций варианта плана', N'schema', N'dbo', N'table', N'OKP_VPNItem'
EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на варианта плана (OKP_VPN.ID)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'VPN_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на предмет (OKP_NOM.RWC)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на маршрут (OKP_ROUTES.ID)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'ROUTE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на пользователя (OKP_USERS.USER_ID)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на схему расчёта (подробнее см. SCHEME_Type)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'SCHEME_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Схема расчёта:  1 - вперёд  2 - назад  3 - по циклограмме (SCHEME_ID - ссылка на циклограмму OKP_CGM.ID)  4 - по шаблону (SCHEME_ID - ссылка на шаблон OKP_TPSampleQTY.ID)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'SCHEME_Type'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на реальную позицию (OKP_PPP.RWC)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'PPP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на запись в заказе (OKP_PLOData.ID)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'PLOData_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Визуальный номер позиции', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'N'
EXEC sp_addextendedproperty 'MS_Description', N'Количество', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Дата по плану (в зависимости от схемы расчёта - либо завершения, либо начала)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'DTE'
GO

/* @BLOCK: Варианты плана
** @DESCR: OKP_VPNItem
*/
CREATE TABLE OKP_VPNItemData (
	ID bigint not null identity(1, 1),
	IDP bigint null,
	VPNItemData_ID bigint not null,
	NOM_ID bigint not null,
	DB bigint not null,
	DE bigint not null,
	QTY_PC float(53) not null,
	QTY_PCO float(53) not null,
	QTY float(53) not null,
	PlanType bit not null,
	PartySize float(53) not null
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Содержимое варианта плана', N'schema', N'dbo', N'table', N'OKP_VPNItemData'
EXEC sp_addextendedproperty 'MS_Description', N'счётчик', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на "родительскую" запись (OKP_VPNItemData.ID)', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'IDP'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на позицию (OKP_VPNItem.ID)', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'VPNItemData_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на предмет (OKP_NOM.RWC)', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Начало изготовления предмета', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'DB'
EXEC sp_addextendedproperty 'MS_Description', N'Завершение изготовления предмета', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'DE'
EXEC sp_addextendedproperty 'MS_Description', N'Количество на единицу "родителя" текущее', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'QTY_PC'
EXEC sp_addextendedproperty 'MS_Description', N'Количество на единицу "родителя" базовое', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'QTY_PCO'
EXEC sp_addextendedproperty 'MS_Description', N'Количество полное', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'Тип планирования', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'Размер передаточной партии', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'PartySize'
GO

/* @NAME:  OKP_CERT_OBJ
** @DESCR: Связи сертификатов качества с объектами системы
**/
CREATE TABLE OKP_NOM_CERT (
	id INT IDENTITY(1,1) NOT NULL,
	nom_id INT NOT NULL,
	cert_id INT NOT NULL,
	sysobj_id INT NOT NULL,
	obj_id INT NOT NULL,
	owner_id INT NOT NULL,
	create_date DATETIME CONSTRAINT DF_OKP_NOM_CERT_CREATE_DATE DEFAULT GETDATE() NOT NULL,
	CONSTRAINT PK_OKP_NOM_CERT PRIMARY KEY CLUSTERED (ID)	
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Связи сертификатов качества с объектами системы', N'schema', N'dbo', N'table', N'OKP_NOM_CERT'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'OKP_NOM_CERT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID номенклатуры', N'schema', N'dbo', N'table', N'OKP_NOM_CERT', N'column', N'nom_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID сертификата качества', N'schema', N'dbo', N'table', N'OKP_NOM_CERT', N'column', N'cert_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID системного объекта (привязка)', N'schema', N'dbo', N'table', N'OKP_NOM_CERT', N'column', N'sysobj_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи в таблице системного объекта (привязка)', N'schema', N'dbo', N'table', N'OKP_NOM_CERT', N'column', N'obj_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID пользователя', N'schema', N'dbo', N'table', N'OKP_NOM_CERT', N'column', N'owner_id'
EXEC sp_addextendedproperty 'MS_Description', N'Дата создания', N'schema', N'dbo', N'table', N'OKP_NOM_CERT', N'column', N'create_date'
GO

/* @NAME:  OKP_CERT_OBJ_SNUM
** @DESCR: Связи сертификатов качества с серийными номерами
**/
CREATE TABLE OKP_NOM_CERT_SNUM (
	id INT IDENTITY(1,1) NOT NULL,
	NOM_CERT_id INT NOT NULL,
	snum VARCHAR(32) COLLATE DATABASE_DEFAULT NOT NULL,
	owner_id INT NOT NULL,
	create_date DATETIME NOT NULL,
	CONSTRAINT PK_OKP_NOM_CERT_SNUM PRIMARY KEY CLUSTERED (ID)	
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Связи сертификатов качества с объектами системы', N'schema', N'dbo', N'table', N'OKP_NOM_CERT_SNUM'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'OKP_NOM_CERT_SNUM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID привязки сертификата качества к номенклатуре', N'schema', N'dbo', N'table', N'OKP_NOM_CERT_SNUM', N'column', N'NOM_CERT_id'
EXEC sp_addextendedproperty 'MS_Description', N'Серийный номер', N'schema', N'dbo', N'table', N'OKP_NOM_CERT_SNUM', N'column', N'snum'
EXEC sp_addextendedproperty 'MS_Description', N'ID пользователя', N'schema', N'dbo', N'table', N'OKP_NOM_CERT_SNUM', N'column', N'owner_id'
EXEC sp_addextendedproperty 'MS_Description', N'Дата создания', N'schema', N'dbo', N'table', N'OKP_NOM_CERT_SNUM', N'column', N'create_date'
GO

/* @NAME:  okp_help
** @DESCR: связь HelpContext со страницами справки
**/
CREATE TABLE okp_help (
	ID INT IDENTITY(1,1) NOT NULL,
	pageid INT NOT NULL,
	area_name VARCHAR(255) COLLATE DATABASE_DEFAULT NOT NULL,
	url_name VARCHAR(255) COLLATE DATABASE_DEFAULT NOT NULL,
	pdf_name VARCHAR(255) COLLATE DATABASE_DEFAULT NOT NULL,
	CONSTRAINT pk_okp_help PRIMARY KEY CLUSTERED (ID) 
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Связь HelpContext со страницами справки', N'schema', N'dbo', N'table', N'okp_help'
EXEC sp_addextendedproperty 'MS_Description', N'Значение HelpContext', N'schema', N'dbo', N'table', N'okp_help', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'PageID страницы в пространстве авторинга', N'schema', N'dbo', N'table', N'okp_help', N'column', N'pageid'
EXEC sp_addextendedproperty 'MS_Description', N'Пространство страницы в Confluence', N'schema', N'dbo', N'table', N'okp_help', N'column', N'area_name'
EXEC sp_addextendedproperty 'MS_Description', N'Permalink страницы в Confluence', N'schema', N'dbo', N'table', N'okp_help', N'column', N'url_name'
EXEC sp_addextendedproperty 'MS_Description', N'Название локального PDF-файла', N'schema', N'dbo', N'table', N'okp_help', N'column', N'pdf_name'
GO

/* @NAME:  okp_verify
** @DESCR: Контроль операций
** @COMM:  1. По идее ключ уникальности: toz_id / fio_id / snum_id_verified / verifyParam_obj_id
**         но так не стали делать - разрешено дублирование
**/
CREATE TABLE okp_verify (
	id INT IDENTITY(1,1) NOT NULL,
	uop_id INT NOT NULL,
	fio_id INT NULL,
	time_execute DATETIME NOT NULL,
	user_id INT NULL,
	time_create DATETIME NULL,
	verifyParam_obj_id INT NOT NULL,
	result VARCHAR(255) COLLATE DATABASE_DEFAULT NOT NULL,
	snum_id_checked BIGINT NULL,
	count_checked FLOAT(53) CONSTRAINT df__okp_verify__count_checked DEFAULT 0 NOT NULL,	
	snum_id_affected BIGINT NULL,
	count_verified FLOAT(53) CONSTRAINT df__okp_verify__count_verified DEFAULT 0 NOT NULL,
	count_defected FLOAT(53) CONSTRAINT df__okp_verify__count_defected DEFAULT 0 NOT NULL,
	state TINYINT NULL,
	work_control INT CONSTRAINT df__okp_verify__work_control DEFAULT 0 NULL,
	CONSTRAINT pk_okp_verify PRIMARY KEY CLUSTERED (ID) 
)
GO
	
EXEC sp_addextendedproperty 'MS_Description', N'Контроль операций', N'schema', N'dbo', N'table', N'okp_verify'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID учёта операции', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'uop_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID контроллёра', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'fio_id'
EXEC sp_addextendedproperty 'MS_Description', N'Дата выполнения контроля', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'time_execute'
EXEC sp_addextendedproperty 'MS_Description', N'ID пользователя, создавшего запись', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'user_id'
EXEC sp_addextendedproperty 'MS_Description', N'Время создания записи', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'time_create'
EXEC sp_addextendedproperty 'MS_Description', N'ID параметра контроля', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'verifyParam_obj_id'
EXEC sp_addextendedproperty 'MS_Description', N'Результат контроля', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'result'
EXEC sp_addextendedproperty 'MS_Description', N'ID серийного номера проверенной детали', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'snum_id_checked'
EXEC sp_addextendedproperty 'MS_Description', N'Количество проверенных', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'count_checked'
EXEC sp_addextendedproperty 'MS_Description', N'ID серийного номера детали, признанной годной', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'snum_id_affected'
EXEC sp_addextendedproperty 'MS_Description', N'Количество годных', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'count_verified'
EXEC sp_addextendedproperty 'MS_Description', N'Количество бракованных', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'count_defected'
EXEC sp_addextendedproperty 'MS_Description', N'Статус', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'state'
EXEC sp_addextendedproperty 'MS_Description', N'Разрешение на учёт без ОТК (самоконтроль)', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'work_control'
GO

/* @NAME:  okp_verify_snum
** @DESCR: Информация о количестве годных деталей на конкретной операции (можно в разрезе серийников)
** @COMM:  1. Здесь хранится калькулируемая информация, потому что очень дорого анализировать таблицу okp_verify
**         с учётом того, что один контроль может проверить один параметр контроля, а другой контроль - другой параметр
**/
CREATE TABLE okp_verify_snum (
	id INT IDENTITY(1,1) NOT NULL,
	snum_id BIGINT NULL,
	uop_id INT NOT NULL,
	count_affected FLOAT(53) NOT NULL,
	pass bit not null,
	CONSTRAINT pk_okp_verify_snum PRIMARY KEY CLUSTERED (ID) 
)
GO
	
EXEC sp_addextendedproperty 'MS_Description', N'Количество годных деталей на операции', N'schema', N'dbo', N'table', N'okp_verify_snum'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'okp_verify_snum', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID серийного номера', N'schema', N'dbo', N'table', N'okp_verify_snum', N'column', N'snum_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID учёта операции', N'schema', N'dbo', N'table', N'okp_verify_snum', N'column', N'uop_id'
EXEC sp_addextendedproperty 'MS_Description', N'Количество', N'schema', N'dbo', N'table', N'okp_verify_snum', N'column', N'count_affected'
EXEC sp_addextendedproperty 'MS_Description', N'Флаг "признано годными"', N'schema', N'dbo', N'table', N'okp_verify_snum', N'column', N'pass'
GO

/* @NAME:  OKP_VerifyParam_OBJ
** @DESCR: Параметры карты контроля операций
**/
CREATE TABLE OKP_VerifyParam_OBJ (
	id INT IDENTITY(1,1) NOT NULL,
	number INT NOT NULL,
	name VARCHAR(255) COLLATE DATABASE_DEFAULT CONSTRAINT df__verifyparam_obj__name DEFAULT '' NOT NULL,
	sysobj_id INT NOT NULL,
	obj_id INT NOT NULL,
	volume VARCHAR(255) COLLATE DATABASE_DEFAULT NULL,
	tro FLOAT(53) NULL,
	eiz_id_tro INT NULL,
	tvo FLOAT(53) NULL,
	eiz_id_tvo INT NULL,
	gravity INT NOT NULL,
	auxiliary uniqueidentifier NULL,
	cert_id INT NULL,
	CONSTRAINT pk_okp_verifyparam_obj PRIMARY KEY CLUSTERED (ID) 
)
GO
	
EXEC sp_addextendedproperty 'MS_Description', N'Контролируемые параметры', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Номер', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'number'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование параметра контроля', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'ID системного объекта', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'sysobj_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID объекта', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'obj_id'
EXEC sp_addextendedproperty 'MS_Description', N'Объём/Периодичность контроля', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'volume'
EXEC sp_addextendedproperty 'MS_Description', N'Время основное', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'tro'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ времени основного', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'eiz_id_tro'
EXEC sp_addextendedproperty 'MS_Description', N'Время вспомогательное', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'tvo'
EXEC sp_addextendedproperty 'MS_Description', N'ЕИЗ времени вспомогательного', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'eiz_id_tvo'
EXEC sp_addextendedproperty 'MS_Description', N'Порядковый номер', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'gravity'
EXEC sp_addextendedproperty 'MS_Description', N'Вспомогательное поле', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'auxiliary'
EXEC sp_addextendedproperty 'MS_Description', N'ID сертификата качества', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'cert_id'
GO

/* @NAME:  OKP_TOZ_VERIFYNOM
** @DESCR: Инструмент контроля на операции в потребностях
**/
CREATE TABLE dbo.OKP_TOZ_VERIFYNOM (
	ID bigint IDENTITY(1, 1) NOT NULL,
	NOM_ID int NOT NULL,
	TOZ_ID int NOT NULL,
	AMOUNT float CONSTRAINT DF_OKP_TOZ_VERIFYNOM_AMOUNT DEFAULT 0 NOT NULL,
	EIZ_ID int NOT NULL,
	VERIFYPARAM_OBJ_ID int NOT NULL,
	CONSTRAINT PK_OKP_TOZ_VERIFYNOM PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица потребностей производственных КК', N'schema', N'dbo', N'table', N'OKP_TOZ_VERIFYNOM'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор потребности производственной КК', N'schema', N'dbo', N'table', N'OKP_TOZ_VERIFYNOM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор номенклатуры-инструмента', N'schema', N'dbo', N'table', N'OKP_TOZ_VERIFYNOM', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор производстченной операции', N'schema', N'dbo', N'table', N'OKP_TOZ_VERIFYNOM', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Расход инструмента', N'schema', N'dbo', N'table', N'OKP_TOZ_VERIFYNOM', N'column', N'AMOUNT'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор единицы измерения', N'schema', N'dbo', N'table', N'OKP_TOZ_VERIFYNOM', N'column', N'EIZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на параметр контроля', N'schema', N'dbo', N'table', N'OKP_TOZ_VERIFYNOM', N'column', N'VERIFYPARAM_OBJ_ID'
GO


/* @NAME:  OKP_FORM
** @DESCR: Визуальные формы
**/
CREATE TABLE dbo.okp_form (
	id INT IDENTITY(1, 1) NOT NULL,
	idn VARCHAR(40) COLLATE DATABASE_DEFAULT NOT NULL,
	name VARCHAR(63) COLLATE DATABASE_DEFAULT NOT NULL,
	comment VARCHAR(255) COLLATE DATABASE_DEFAULT NOT NULL,
	image_id INT NULL,
	CONSTRAINT pk_okp_form PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Визуальные формы ОКП', N'schema', N'dbo', N'table', N'okp_form'
EXEC sp_addextendedproperty 'MS_Description', N'ID формы', N'schema', N'dbo', N'table', N'okp_form', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальное обозначение формы', N'schema', N'dbo', N'table', N'okp_form', N'column', N'idn'
EXEC sp_addextendedproperty 'MS_Description', N'Название формы', N'schema', N'dbo', N'table', N'okp_form', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'Описание формы', N'schema', N'dbo', N'table', N'okp_form', N'column', N'comment'
EXEC sp_addextendedproperty 'MS_Description', N'ID изображения', 'schema', 'dbo', 'table', 'okp_form', 'column', 'image_id'
GO

CREATE TABLE okp_tmz_type (
	id INT IDENTITY(1, 1) NOT NULL,
	name VARCHAR(64) COLLATE DATABASE_DEFAULT NOT NULL,
	grp_id INT NULL,
	CONSTRAINT pk_okp_tmz_type PRIMARY KEY CLUSTERED (id)
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'Виды товарно-материальных запасов', N'schema', N'dbo', N'table', N'okp_tmz_type'
EXEC sp_addextendedproperty 'MS_Description', N'ID типа ТМЗ', N'schema', N'dbo', N'table', N'okp_tmz_type', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование типа ТМЗ', N'schema', N'dbo', N'table', N'okp_tmz_type', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы', N'schema', N'dbo', N'table', N'okp_tmz_type', N'column', N'grp_id'
GO

/* @NAME:  OKP_CURRENCY
** @DESCR: Валюты
**/
CREATE TABLE OKP_CURRENCY (
  ID int IDENTITY,
  IDN varchar(3) NOT NULL,
  NAME varchar(50) NOT NULL,
  CONSTRAINT PK_OKP_CURRENCY PRIMARY KEY CLUSTERED (ID)
)
GO
EXEC sp_addextendedproperty 'MS_Description',N'Валюты',N'SCHEMA',N'dbo','TABLE',N'OKP_CURRENCY'
EXEC sp_addextendedproperty 'MS_Description',N'Идентификатор валюты',N'SCHEMA',N'dbo',N'TABLE',N'OKP_CURRENCY',N'COLUMN',N'ID'
EXEC sp_addextendedproperty 'MS_Description',N'Код валюты',N'SCHEMA',N'dbo',N'TABLE',N'OKP_CURRENCY',N'COLUMN',N'IDN'
EXEC sp_addextendedproperty 'MS_Description',N'Наименование валюты',N'SCHEMA',N'dbo',N'TABLE',N'OKP_CURRENCY',N'COLUMN',N'NAME'
GO


/* @NAME:  OKP_SDT_FIO
** @DESCR: Исполнители работы ССЗ
**/
CREATE TABLE OKP_SDT_FIO (
	ID bigint IDENTITY(1, 1) NOT NULL,
	SDTELEM_ID bigint NOT NULL,
	PERS_ID bigint NULL,
	WPL_ID int NULL,
	ISGRPFLAG tinyint DEFAULT 0 NULL,
	QTY float DEFAULT 0 NULL,
	CREATED datetime DEFAULT getdate() NOT NULL,
	CREATEBY int NOT NULL,
	CONSTRAINT PK_OKP_SDT_FIO PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Исполнители работы ССЗ', N'schema', N'dbo', N'table', N'OKP_SDT_FIO'
EXEC sp_addextendedproperty 'MS_Description', N'Идентификатор связи', N'schema', N'dbo', N'table', N'OKP_SDT_FIO', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'идентификатор элемента СЗ', N'schema', N'dbo', N'table', N'OKP_SDT_FIO', N'column', N'SDTELEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ид. персонала', N'schema', N'dbo', N'table', N'OKP_SDT_FIO', N'column', N'PERS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ид. рабочего места', N'schema', N'dbo', N'table', N'OKP_SDT_FIO', N'column', N'WPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'флаг, является ли персонал группой (бригадой)', N'schema', N'dbo', N'table', N'OKP_SDT_FIO', N'column', N'ISGRPFLAG'
EXEC sp_addextendedproperty 'MS_Description', N'Количество ', N'schema', N'dbo', N'table', N'OKP_SDT_FIO', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'дата создания/изменения', N'schema', N'dbo', N'table', N'OKP_SDT_FIO', N'column', N'CREATED'
EXEC sp_addextendedproperty 'MS_Description', N'кем создано/изменено, OKP_USERS.USER_ID', N'schema', N'dbo', N'table', N'OKP_SDT_FIO', N'column', N'CREATEBY'
go


/* @NAME:  OKP_OBSP_CALC_SESSIONS
** @DESCR: Сессии расчетов статусов обеспеченности КиМ
**/
CREATE TABLE OKP_OBSP_CALC_SESSIONS (
  ID int IDENTITY,
  DTE datetime NULL,
  USR varchar(50) NULL,
  CONSTRAINT PK_OKP_OBSP_CALC_SESSIONS PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty N'MS_Description','История сессий расчетов статусов обеспеченности КиМ','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_CALC_SESSIONS'
EXEC sp_addextendedproperty N'MS_Description','Идентификатор','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_CALC_SESSIONS','COLUMN',N'ID'
EXEC sp_addextendedproperty N'MS_Description','Дата время расчета','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_CALC_SESSIONS','COLUMN',N'DTE'
EXEC sp_addextendedproperty N'MS_Description','Расчитано польщователем','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_CALC_SESSIONS','COLUMN',N'USR'
GO

/* @NAME:  OKP_OBSP_POT
** @DESCR: Дополнительная информация по расчетам статусов обеспеченности в КиМ
**/
CREATE TABLE OKP_OBSP_POT (
  RWC_POT bigint NOT NULL,
  QTY_DEFICIT float NULL,
  DAY_RESERV int NULL,
  CONSTRAINT PK_OKP_OBSP_POT PRIMARY KEY CLUSTERED (RWC_POT)
)
GO

EXEC sp_addextendedproperty N'MS_Description','Исходные данные для расчета статуса обеспеченности КиМ','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_POT'
EXEC sp_addextendedproperty N'MS_Description','Ссылка на запись в таблице OKP_POT','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_POT','COLUMN',N'RWC_POT'
EXEC sp_addextendedproperty N'MS_Description','Объём дефицита','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_POT','COLUMN',N'QTY_DEFICIT'
EXEC sp_addextendedproperty N'MS_Description','Резерв заказа, в днях','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_POT','COLUMN',N'DAY_RESERV'
GO


/* @NAME:  OKP_OBSP_STS
** @DESCR: Статусы обеспеченности в КиМ в разбивке по системным объектам
**/
CREATE TABLE OKP_OBSP_STS (
  id bigint IDENTITY,
  sysobj_id int NOT NULL,
  rwc bigint NOT NULL,
  STS_WRH int NULL,
  STS_RZP int NULL,
  STS_IM int NULL,
  CONSTRAINT PK_OKP_OBSP_STS PRIMARY KEY CLUSTERED (id)
)
GO

EXEC sp_addextendedproperty N'MS_Description','Статусы обеспеченности КиМ','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_STS'
EXEC sp_addextendedproperty N'MS_Description','ID','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_STS','COLUMN',N'id'
EXEC sp_addextendedproperty N'MS_Description','ID системного объекта','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_STS','COLUMN',N'sysobj_id'
EXEC sp_addextendedproperty N'MS_Description','ID объекта','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_STS','COLUMN',N'rwc'
EXEC sp_addextendedproperty N'MS_Description','Статус по остаткам','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_STS','COLUMN',N'STS_WRH'
EXEC sp_addextendedproperty N'MS_Description','Статус по заявкам','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_STS','COLUMN',N'STS_RZP'
EXEC sp_addextendedproperty N'MS_Description','Статус по выданному','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_STS','COLUMN',N'STS_IM'
GO

/* @NAME:  OKP_POTUDSE
** @DESCR: Таблица связей ПлП с потребностями (УДСЕ)
**/

CREATE TABLE dbo.OKP_POTUDSE (
  ID bigint IDENTITY(1, 1) NOT NULL,
  ID_POT bigint NOT NULL,
  ID_PPP int NOT NULL,
  QTY float DEFAULT 0 NOT NULL,
  MET int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_OKP_POTUDSE PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица УДСЕ, связей ПлП с потребностями', N'schema', N'dbo', N'table', N'OKP_POTUDSE'
EXEC sp_addextendedproperty 'MS_Description', N'идентификатор записи', N'schema', N'dbo', N'table', N'OKP_POTUDSE', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ссылка на идентификатор потребности OKP_POT.rwc', N'schema', N'dbo', N'table', N'OKP_POTUDSE', N'column', N'ID_POT'
EXEC sp_addextendedproperty 'MS_Description', N'ссылка на идентификатор ПлП OKP_PPP.RWC', N'schema', N'dbo', N'table', N'OKP_POTUDSE', N'column', N'ID_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'количество УДСЕ', N'schema', N'dbo', N'table', N'OKP_POTUDSE', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'признак актуальности записи (1-актуальна, 0- родительская ПлП не фигурирует в производственной программе)', N'schema', N'dbo', N'table', N'OKP_POTUDSE', N'column', N'MET'
GO

/* @NAME:  ARH_POTUDSE
** @DESCR: Таблица архива связей ПлП с потребностями (УДСЕ)
**/
CREATE TABLE dbo.ARH_POTUDSE (
	ID bigint  NULL,
	ID_POT bigint NULL,
	ID_PPP int NULL,
	QTY float NULL,
	MET int  NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица УДСЕ, связей ПлП с потребностями', N'schema', N'dbo', N'table', N'ARH_POTUDSE'
EXEC sp_addextendedproperty 'MS_Description', N'идентификатор записи', N'schema', N'dbo', N'table', N'ARH_POTUDSE', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ссылка на идентификатор потребности OKP_POT.rwc', N'schema', N'dbo', N'table', N'ARH_POTUDSE', N'column', N'ID_POT'
EXEC sp_addextendedproperty 'MS_Description', N'ссылка на идентификатор ПлП OKP_PPP.RWC', N'schema', N'dbo', N'table', N'ARH_POTUDSE', N'column', N'ID_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'количество УДСЕ', N'schema', N'dbo', N'table', N'ARH_POTUDSE', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'признак актуальности записи (1-актуальна, 0- родительская ПлП не фигурирует в производственной программе)', N'schema', N'dbo', N'table', N'ARH_POTUDSE', N'column', N'MET'
GO

/* @NAME:  okp_person_job
** @DESCR: Таблица должностей, необхоидмая для таблицы контаткных лиц контрагентов
**/
CREATE TABLE okp_person_job (
	id INT NOT NULL IDENTITY(1, 1),
	name VARCHAR(128) COLLATE DATABASE_DEFAULT NULL,
	grp_id INT NULL,
	CONSTRAINT pk__okp_person_job PRIMARY KEY CLUSTERED (id)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Должности', N'schema', N'dbo', N'table', N'okp_person_job'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'okp_person_job', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'okp_person_job', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы', N'schema', N'dbo', N'table', N'okp_person_job', N'column', N'grp_id'
GO

/* @NAME:  okp_imsyn
** @DESCR: Таблица синонимов импорта
**/
CREATE TABLE okp_imsyn (
	id INT NOT NULL IDENTITY(1, 1),
	tab VARCHAR(32) COLLATE DATABASE_DEFAULT NOT NULL,
	field VARCHAR(32) COLLATE DATABASE_DEFAULT NOT NULL,
	syn VARCHAR(32) COLLATE DATABASE_DEFAULT NOT NULL,
	val VARCHAR(32) COLLATE DATABASE_DEFAULT NOT NULL,
	CONSTRAINT pk__okp_imsyn PRIMARY KEY CLUSTERED (id)
)
GO
	
EXEC sp_addextendedproperty 'MS_Description', N'Синонимы в импорте', N'schema', N'dbo', N'table', N'okp_imsyn'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'okp_imsyn', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'Таблица', N'schema', N'dbo', N'table', N'okp_imsyn', N'column', N'tab'
EXEC sp_addextendedproperty 'MS_Description', N'Поле таблицы', N'schema', N'dbo', N'table', N'okp_imsyn', N'column', N'field'
EXEC sp_addextendedproperty 'MS_Description', N'Синоним', N'schema', N'dbo', N'table', N'okp_imsyn', N'column', N'syn'
EXEC sp_addextendedproperty 'MS_Description', N'Значение', N'schema', N'dbo', N'table', N'okp_imsyn', N'column', N'val'
GO

/* @NAME:  OKP_EXTNOM
** @DESCR: Внешние наименования номенклатуры
**/
CREATE TABLE OKP_EXTNOM (
	id INT IDENTITY,
	idn VARCHAR(64) COLLATE DATABASE_DEFAULT NULL,
	name VARCHAR(256) COLLATE DATABASE_DEFAULT NOT NULL,
	nom_id INT NOT NULL,
	ctr_id INT NULL,
	user_id INT NOT NULL,
	date_created DATETIME NOT NULL,
	is_default BIT CONSTRAINT df__okp_extnom__is_default DEFAULT 0 NOT NULL,
	CONSTRAINT pk__okp_extnom PRIMARY KEY CLUSTERED (id)
)
GO

EXEC sp_addextendedproperty N'MS_Description','Внешние наименования номенклатуры','SCHEMA',N'dbo','TABLE',N'OKP_EXTNOM'
EXEC sp_addextendedproperty N'MS_Description','Внешнее обозначение','SCHEMA',N'dbo','TABLE',N'OKP_EXTNOM','COLUMN',N'idn'
EXEC sp_addextendedproperty N'MS_Description','Внешнее наименования','SCHEMA',N'dbo','TABLE',N'OKP_EXTNOM','COLUMN',N'name'
EXEC sp_addextendedproperty N'MS_Description','ID номенклатуры','SCHEMA',N'dbo','TABLE',N'OKP_EXTNOM','COLUMN',N'nom_id'
EXEC sp_addextendedproperty N'MS_Description','ID контрагента','SCHEMA',N'dbo','TABLE',N'OKP_EXTNOM','COLUMN',N'ctr_id'
EXEC sp_addextendedproperty N'MS_Description','ID ответственного','SCHEMA',N'dbo','TABLE',N'OKP_EXTNOM','COLUMN',N'user_id'
EXEC sp_addextendedproperty N'MS_Description','Дата создания','SCHEMA',N'dbo','TABLE',N'OKP_EXTNOM','COLUMN',N'date_created'
EXEC sp_addextendedproperty N'MS_Description','По умолчанию','SCHEMA',N'dbo','TABLE',N'OKP_EXTNOM','COLUMN',N'is_default'
GO

/* @NAME:  OKP_UOPCOMMENT
** @DESCR: Комментарии к группам учётов
**/

CREATE TABLE dbo.OKP_UOPCOMMENT (
  ID int IDENTITY(1, 1) NOT NULL,
  UOP_GRUID uniqueidentifier NOT NULL,
  COMMENT varchar(4000) COLLATE Database_default NULL,
  CONSTRAINT OKP_UOPCOMMENT_pk PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица комментариев к группам учётов', N'schema', N'dbo', N'table', N'OKP_UOPCOMMENT'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный номер записи', N'schema', N'dbo', N'table', N'OKP_UOPCOMMENT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'уникальный идентификатор группы учёта', N'schema', N'dbo', N'table', N'OKP_UOPCOMMENT', N'column', N'UOP_GRUID'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий к учёту (на всё группу учётов)', N'schema', N'dbo', N'table', N'OKP_UOPCOMMENT', N'column', N'COMMENT'
GO

/* @NAME:  ARH_UOPCOMMENT
** @DESCR: Архив комментариев к группам учётов
**/
CREATE TABLE dbo.ARH_UOPCOMMENT (
    ID int  NULL,
    UOP_GRUID uniqueidentifier  NULL,
    COMMENT varchar(4000) COLLATE Database_default NULL
 )
GO

EXEC sp_addextendedproperty 'MS_Description', N'Архивная таблица комментариев к группам учётов', N'schema', N'dbo', N'table', N'ARH_UOPCOMMENT'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный номер записи', N'schema', N'dbo', N'table', N'ARH_UOPCOMMENT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'уникальный идентификатор группы учёта', N'schema', N'dbo', N'table', N'ARH_UOPCOMMENT', N'column', N'UOP_GRUID'
EXEC sp_addextendedproperty 'MS_Description', N'Комментарий к учёту (на всё группу учётов)', N'schema', N'dbo', N'table', N'ARH_UOPCOMMENT', N'column', N'COMMENT'
GO

/* @NAME: okp_select
** @DESCR: Окна выбора из списка
**/
CREATE TABLE dbo.okp_select (
	id INT IDENTITY(1, 1) NOT NULL,
	idn VARCHAR(32) COLLATE Database_default NOT NULL,
	name VARCHAR(64) COLLATE Database_default NOT NULL,
	msrc_id INT NOT NULL,
	filter_union INT NOT NULL,
	system BIT CONSTRAINT df__okp_select__system DEFAULT 0 NOT NULL,
	grp_id INT NULL,
	CONSTRAINT pk__okp_select PRIMARY KEY CLUSTERED (id)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Окна выбора', N'schema', N'dbo', N'table', N'okp_select'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'okp_select', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальное обозначение', N'schema', N'dbo', N'table', N'okp_select', N'column', N'idn'
EXEC sp_addextendedproperty 'MS_Description', N'Название', N'schema', N'dbo', N'table', N'okp_select', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'ID основного источника', N'schema', N'dbo', N'table', N'okp_select', N'column', N'msrc_id'
EXEC sp_addextendedproperty 'MS_Description', N'Сочетание фильтров', N'schema', N'dbo', N'table', N'okp_select', N'column', N'filter_union'
EXEC sp_addextendedproperty 'MS_Description', N'Системный', N'schema', N'dbo', N'table', N'okp_select', N'column', N'system'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы', N'schema', N'dbo', N'table', N'okp_select', N'column', N'grp_id'
GO

/* @NAME: okp_sfield
** @DESCR: Поля в окнах выбора
**/
CREATE TABLE dbo.okp_sfield (
	id INT IDENTITY(1, 1) NOT NULL,
	idn VARCHAR(32) COLLATE Database_default NOT NULL,
	name VARCHAR(64) COLLATE Database_default NOT NULL,
	select_id INT NOT NULL,
	mfld_id INT NOT NULL,
	mfld_path VARCHAR(255) COLLATE Database_default NULL,
	visible BIT CONSTRAINT df__okp_sfield__visible DEFAULT 1 NOT NULL,
	gravity INT NOT NULL,
	CONSTRAINT pk__okp_sfield PRIMARY KEY CLUSTERED (id)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Поля в окнах выбора', N'schema', N'dbo', N'table', N'okp_sfield'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'okp_sfield', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальное обозначение', N'schema', N'dbo', N'table', N'okp_sfield', N'column', N'idn'
EXEC sp_addextendedproperty 'MS_Description', N'Название', N'schema', N'dbo', N'table', N'okp_sfield', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'ID окна выбора', N'schema', N'dbo', N'table', N'okp_sfield', N'column', N'select_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID атрибута', N'schema', N'dbo', N'table', N'okp_sfield', N'column', N'mfld_id'
EXEC sp_addextendedproperty 'MS_Description', N'Путь к атрибуту от основной таблицы', N'schema', N'dbo', N'table', N'okp_sfield', N'column', N'mfld_path'
EXEC sp_addextendedproperty 'MS_Description', N'Видимый', N'schema', N'dbo', N'table', N'okp_sfield', N'column', N'visible'
EXEC sp_addextendedproperty 'MS_Description', N'Порядок отражения', N'schema', N'dbo', N'table', N'okp_sfield', N'column', N'gravity'
GO

/* @NAME: okp_sfilter
** @DESCR: Фильтры в окнах выбора
**/
CREATE TABLE dbo.okp_sfilter (
	id INT IDENTITY(1, 1) NOT NULL,
	idn VARCHAR(32) COLLATE Database_default NOT NULL,
	name VARCHAR(64) COLLATE Database_default NOT NULL,
	select_id INT NOT NULL,
	visible BIT CONSTRAINT df__okp_sfilter__visible DEFAULT 1 NOT NULL,
	checked BIT CONSTRAINT df__okp_sfilter__checked DEFAULT 1 NOT NULL,
	gravity INT NOT NULL,
	query_text VARCHAR(4000) COLLATE DATABASE_DEFAULT NOT NULL,
	CONSTRAINT pk__okp_sfilter PRIMARY KEY CLUSTERED (id)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Фильтры в окнах выбора', N'schema', N'dbo', N'table', N'okp_sfilter'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'okp_sfilter', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальное обозначение', N'schema', N'dbo', N'table', N'okp_sfilter', N'column', N'idn'
EXEC sp_addextendedproperty 'MS_Description', N'Название', N'schema', N'dbo', N'table', N'okp_sfilter', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'ID окна выбора', N'schema', N'dbo', N'table', N'okp_sfilter', N'column', N'select_id'
EXEC sp_addextendedproperty 'MS_Description', N'Видимый', N'schema', N'dbo', N'table', N'okp_sfilter', N'column', N'visible'
EXEC sp_addextendedproperty 'MS_Description', N'Включён по умолчанию', N'schema', N'dbo', N'table', N'okp_sfilter', N'column', N'checked'
EXEC sp_addextendedproperty 'MS_Description', N'Порядок отражения', N'schema', N'dbo', N'table', N'okp_sfilter', N'column', N'gravity'
EXEC sp_addextendedproperty 'MS_Description', N'Текст SQL-запроса', N'schema', N'dbo', N'table', N'okp_sfilter', N'column', N'query_text'
GO

/* @NAME: okp_rparm
** @DESCR: Параметры отчётной системы
**/
CREATE TABLE dbo.okp_rparm (
	id INT IDENTITY(1, 1) NOT NULL,
	idn VARCHAR(32) COLLATE Database_default NOT NULL,
	name VARCHAR(64) COLLATE Database_default NOT NULL,
	typ INT NOT NULL,
	build_line VARCHAR(4000) COLLATE DATABASE_DEFAULT NOT NULL,
	system BIT CONSTRAINT df__okp_rparm__system DEFAULT 0 NOT NULL,
	grp_id INT NULL,
	CONSTRAINT pk__okp_rparm PRIMARY KEY CLUSTERED (id)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Параметры отчётной системы', N'schema', N'dbo', N'table', N'okp_rparm'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'okp_rparm', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный идентификатор', N'schema', N'dbo', N'table', N'okp_rparm', N'column', N'idn'
EXEC sp_addextendedproperty 'MS_Description', N'Название', N'schema', N'dbo', N'table', N'okp_rparm', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'Тип', N'schema', N'dbo', N'table', N'okp_rparm', N'column', N'typ'
EXEC sp_addextendedproperty 'MS_Description', N'Системный', N'schema', N'dbo', N'table', N'okp_rparm', N'column', N'system'
EXEC sp_addextendedproperty 'MS_Description', N'Строка построения', N'schema', N'dbo', N'table', N'okp_rparm', N'column', N'build_line'
EXEC sp_addextendedproperty 'MS_Description', N'ID группы', N'schema', N'dbo', N'table', N'okp_rparm', N'column', N'grp_id'
GO

/* @NAME: okp_calc_model
** @DESCR: Шаблоны калькуляций
**/
CREATE TABLE dbo.okp_calc_model (
	id INT IDENTITY(1, 1) NOT NULL,
	idn VARCHAR(32) COLLATE Database_default NOT NULL,
	name VARCHAR(64) COLLATE Database_default NOT NULL,
	costing INT NOT NULL,
	main BIT CONSTRAINT df__okp_calc_model__main DEFAULT 0 NOT NULL,
	CONSTRAINT pk__okp_calc_model PRIMARY KEY CLUSTERED (id)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'Шаблоны калькуляций', N'schema', N'dbo', N'table', N'okp_calc_model'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи', N'schema', N'dbo', N'table', N'okp_calc_model', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'Уникальный номер', N'schema', N'dbo', N'table', N'okp_calc_model', N'column', N'idn'
EXEC sp_addextendedproperty 'MS_Description', N'Наименование', N'schema', N'dbo', N'table', N'okp_calc_model', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'Способ расчёт затрат', N'schema', N'dbo', N'table', N'okp_calc_model', N'column', N'costing'
EXEC sp_addextendedproperty 'MS_Description', N'Основной', N'schema', N'dbo', N'table', N'okp_calc_model', N'column', N'main'
GO

create table OKP_ROOTpasp (
    ID int not null identity(1, 1),
    CPL_ID int not null,
    DATE_CREATER datetime NOT NULL DEFAULT (GETDATE())
  )
GO

EXEC sp_addextendedproperty 'MS_Description', N'Таблица маршрутных паспортов', N'schema', N'dbo', N'table', N'OKP_ROOTpasp'
EXEC sp_addextendedproperty 'MS_Description', N'ID записи (часть номера марщрутного паспорта)', N'schema', N'dbo', N'table', N'OKP_ROOTpasp', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'Ссылка на RWC производственной парии', N'schema', N'dbo', N'table', N'OKP_ROOTpasp', N'column', N'CPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'Дата создания маршрутного паспорта', N'schema', N'dbo', N'table', N'OKP_ROOTpasp', N'column', N'DATE_CREATER'
GO