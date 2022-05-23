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

EXEC sp_addextendedproperty 'MS_Description', N'������� ����� ����������������� ������� (OKP_SReserv) � ��������� ��������� (OKP_UNOM/OKP_UKIM)', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� �������� ������� �� ������ (OKP_WRH_SUBJECTS.ID)', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'SUB_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������. ������ �� OKP_SReserv.ID', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'SReserv_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �������������� � ��������� ��� (EV_SYSEIZ.SYSIDN), ��������������� ��� ������������ 
(OKP_NOM.UOM$$$EIZ) �� ����������� �������������� �������', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �� ������ ���������� � ��������� ��� (��. �������� OKP_UNOM_REZERV.QTY).', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'QTY_F'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ���������� (������ � �������) � ��������� ��� (��. �������� OKP_UNOM_REZERV.QTY)', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'QTY_A'
EXEC sp_addextendedproperty 'MS_Description', N'������ QTY_F', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'Fold_Q'
EXEC sp_addextendedproperty 'MS_Description', N'������ QTY_A', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'Fold_A'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_UNOM_REZERV', N'column', N'Comment'
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
EXEC sp_addextendedproperty 'MS_Description', N'������� ������ �� ������', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� OKP_WRHFOLDS.ID', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData', N'column', N'FOLD_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� OKP_WRH.WRH_ID', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData', N'column', N'WRH_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� OKP_INV.INV_ID', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData', N'column', N'INV_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ��� � ������ ����������� (�� ������ ��������������� ������)', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData', N'column', N'QTY_S'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������� ��� �� ������� ������', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData', N'column', N'QTY_I'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������� ��� �� ������� ������', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData', N'column', N'QTY_O'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������', N'schema', N'dbo', N'table', N'OKP_WRHFOLDData', N'column', N'DKD'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������ �� ��������� �������� �������� (��), ������� � �����', N'schema', N'dbo', N'table', N'OKP_PLODataPPA'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� OKP_PLOData.ID', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'PLOData_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������� ������� (�� ��)', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'QTY_F'
EXEC sp_addextendedproperty 'MS_Description', N'����� �� ����� ������', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'QTY_W'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'FIO'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������� ��������', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'D_Begin'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ��������', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'D_Final'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� �����������', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'D_Fact'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������������', N'schema', N'dbo', N'table', N'OKP_PLODataPPA', N'column', N'D_Confirm'
GO

/*
  OKP_sysStatistics :
	  IDN - ����������� ������� ����������
	  StatTable - ������� ���������� - ��������� ����. ������ (��. "STC_-�������" �����)
	  Source - ��������, ������������ ��� ���������� �������������� �������, �������� ����� ���� ���� �����:
                   1) ������ ����. ������ - ��� ����� ���� ������, ������� ��� ����� ������� (������ ���� �������� � ������� ������).
                      ����� �������� ������ ���������� ������ �������������� ������, ����� ����� ������ ��������� ��� ���� ������
                      ����� �������������� ������� �� ����������� ��������� �����
                   2) ����������� ���������, ���������� � ���������� ����������:
                       2.1) ����� ����� ������������ ������� ������ ��������� � ������� ����� �������������� ������� �� ����������� ��������� 
                            ����� (�.�. � �� ������� � �� �����������)
                       2.2) ��������� ������ ��������� �� ���� ������� ���� ��������:
                            - ��������, ���������� ��� ������� ������, ���� ����� SQL-������� ������, ����������� � ������� ������.
                              ���� ������ ���� (��� �� ������), �� �������������� ������� ������ �������������� ������
                       ������ 1:
                         p_stc_CPL_OVEREXPENDITURE (@List varchar(2000), @Typ int)
               
                       2.3) � ������� �������� ���������� ����������� ���� �������:
                            �) ������ ��� �������� ����� EXECUTE
                            �) ����� ����� ������� - ��� ���������
                            �) ����� ����� ������� ��������� (� ������������ � ��������� ���������):
                               - ������������ ��������� (�� �. 2) ����������� ���������� (�������� ������ - :LIST)
                               - ��������� ��������� - �����������
                       ������ 2:
                         EXECUTE p_stc_CPL_OVEREXPENDITURE :LIST 1
                           ������ ������ ������������� ������� �1, � ������� �������������� �������:
                           - @List = :LIST
                           - @Typ  = 1

	  ListField - ��� ���� ��� ���������� �������������� �������, ������ ����� ����������� ������ ������� �� ���� ��������� (��. �������� Source):
                        �) ���� � �������� ��������� ������������ ������ ������� ���� (��. Source - �.1), �� ListField - ��� ���� ��� ����� �������������� 
                           ������� �� ������� ������������ � ���������� ��� ������.
                        �) ���� � �������� ��������� ������������ ������ ������� ���� (��. Source - �.2), �� ListField - ��� ���� ��� ����� �������������� 
                           ������� � ��������-�����������, ������������ ����������-����������                     
                      ��� ����������� ������� �������� ������ ���������� ���������� ����� ��� ���� � StatTable ���� ����������������

	  UpdateIgnoreFields - ������ �����, ������� ��� ���������� ������ ����������� �� ����� (������������ - ����� �������)

  STC_-������� :
	������������� ���������� � ��������� �������������� ������:
	  - ���������� PRIMARY KEY �/��� UNIQUE KEY 
	  - ������� ���� TAG - ��������� ���� 
	  - ���������� ����� ������� 
*/
create table OKP_sysStatistics(
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
  �������������� ������� ������� dbo.f_OKP_ZKD(null)
*/
create table STC_ZKD(
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
  �������������� ������� ������� dbo.f_OKP_SUBZKD(null)
*/
create table STC_SUBZKD(
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

create table STC_CPL_OVEREXPENDITURE(
  CPL_ID bigint, 
  Self_ int, 
  Full_ int, 
  TAG int,
  CONSTRAINT PK_STC_CPL_OVEREXPENDITURE PRIMARY KEY CLUSTERED (CPL_ID)
)
GO

/*
** �������� ������� ��� OKP_CPL
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
  SIZES_EIZ varchar(3) COLLATE DATABASE_DEFAULT NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� "���������������� ������"', N'schema', N'dbo', N'table', N'ARH_CPL'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������������� ������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'DEP$$$DEP'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ������������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'ZPR'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'PRT$$$NOM'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� �������������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'PRTPARNOM'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ������� ������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'DTEPDZ'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ������� ������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'DTEPDV'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� ������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTYTQY'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���� ������� ������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'DTEFDV'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������� ������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTYFQY'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������� �����', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTYBRK'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'TPZ'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� ������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'KNO'
EXEC sp_addextendedproperty 'MS_Description', N'������ �������� ������� -��������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'SEBPTZ'
EXEC sp_addextendedproperty 'MS_Description', N'������ �������� ������� - ����������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'SEBPTF'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������� � �����', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'SEBSTZ'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'REM'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����� �� ����� ������ (�������������) ��������� (� ������� ���� + ��������)', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTYIQY'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'PartySize'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'DTEASH'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'M_DB'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ���������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'M_DE'
EXEC sp_addextendedproperty 'MS_Description', N'����� �� ����� ������ (�������������) ��������� � ������� ����', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTYAQY'
EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'NMP$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� �������� ���������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'LastCDTE'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������� ����������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTYCQY'
EXEC sp_addextendedproperty 'MS_Description', N'�¨���� ����������, ���������� �� ������ ��������. � ������� ���', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'FOLD_I'
EXEC sp_addextendedproperty 'MS_Description', N'�¨���� ���������� �������, �������������� ����� ��������. 
  ����������� ������ ��� �������� ������ (��� ��), ��������� - 0.
  � ������� ���', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'FOLD_K'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������������� ������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'PARNUM'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������ ���������������� ������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'PAR_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �� ���������������� ������ ����������������� ��� ������������ ���(0-������,1-�����������������)', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'IsExternalNode'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������������� ��������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'ROUTE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� �������/������� � �������� ������������ ������������ ����', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'DELTADATE'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������������� ������:  0- ����������, 1-�����������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'OMP'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������� ������
  0-�� ��������
  1-������� �����
  2-������� �����', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'NRP'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ������� �� ������ ���������� � ����', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QCYRAT'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����� �� ����� ����������� ��������� (� ������� ������������ ���� + ��������)', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTY_BI'
EXEC sp_addextendedproperty 'MS_Description', N'����� �� ����� ����������� ��������� � ������� ����', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'QTY_BA'
EXEC sp_addextendedproperty 'MS_Description', N'�¨���� ���������� �����, ���������� �� ������ ���������� ��������. � ������� ���', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'FOLD_B'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������� �������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'RWC_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'������ ����� ��������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'SHELFLIFE_STS'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'SIZES'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ��������', N'schema', N'dbo', N'table', N'ARH_CPL', N'column', N'SIZES_EIZ'
GO


/*
** �������� ������� ��� OKP_ESKORTLIST
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
EXEC sp_addextendedproperty 'MS_Description', N'����� ������� ���������������� ������', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST', N'column', N'DATECREATION'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST', N'column', N'CREATOR'
EXEC sp_addextendedproperty 'MS_Description', N'RWC �������� �������', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST', N'column', N'PPPNUM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'RWC CPL', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST', N'column', N'CPLNUM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ : 1-�����������, 0 - �����������', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST', N'column', N'STATUS'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������������', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST', N'column', N'DATENULLIFICATION'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������������', N'schema', N'dbo', N'table', N'ARH_ESKORTLIST', N'column', N'NULLIFICATOR'
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ������ ������� ���������������� ������', N'schema', N'dbo', N'table', N'ARH_OPLAN_DATA'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������ �������', N'schema', N'dbo', N'table', N'ARH_OPLAN_DATA', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� �����', N'schema', N'dbo', N'table', N'ARH_OPLAN_DATA', N'column', N'OPLAN_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'ARH_OPLAN_DATA', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� � ���������', N'schema', N'dbo', N'table', N'ARH_OPLAN_DATA', N'column', N'ORDERNUM'
GO


/*
** �������� ������� ��� OKP_POT
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ����������� ��� �� ���������������� ��������', N'schema', N'dbo', N'table', N'ARH_POT'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������������� ������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'PRTIDN'
EXEC sp_addextendedproperty 'MS_Description', N'���� �����������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �����������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'QTYPOT'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� �����������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'QTYTQY'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'ZPR'
EXEC sp_addextendedproperty 'MS_Description', N'�����  �������� ������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'LLC'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������� ���������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'REF'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �p����������� ����������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'QTYRQY'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� �������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'INR'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� ����������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'REJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'VIN'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����� ������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'EditDTE'
EXEC sp_addextendedproperty 'MS_Description', N'������ (0 - �������, 1 - ����������)', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� ������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'ReplaceDocNum'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'ReplaceDocDTE'
EXEC sp_addextendedproperty 'MS_Description', N'�', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'��� �����������:
  0 - ��������
  1 - ���������������
  2 - ���������
  3 - �������������
  4 - ����������
  5 - ���������������
  6 - �������� �������� �� ����������
  7 - ��������������� �������� �� ����������
  8 - ��������� �� ����������
  9 - �������� �� ����������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'TM'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� toz', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'Rwc_toz'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'NMP$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������� IR (okp_sreserv.ID)', N'schema', N'dbo', N'table', N'ARH_POT', N'column', N'TRN_ID'
GO


/*
** �������� ������� ��� OKP_PPP
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

EXEC sp_addextendedproperty 'MS_Description', N'����� �������� �������', N'schema', N'dbo', N'table', N'ARH_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������� �������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� �������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'PRT$$$NOM'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ��������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'NMP$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������� �������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������� ������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'DTEZ'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ����������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'NPR'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������� �������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'QCYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� �������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'PER'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����������� ����������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'QCYFQY'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� ��', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'WAR'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���� �������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'FDTE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� �������� �������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'REM'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������� �����������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������������: 0 - �����, -1 - ������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'DIRECTION'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� �� ������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'ZAKDTE'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���� ������������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'FPDTE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������������� ������ �������� ������ ������ ����� (0 - �� ������������, 1 - ������������)', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'UseSklad'
EXEC sp_addextendedproperty 'MS_Description', N'��������(�����������) ���� ������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'M_DB'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ���������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'M_DE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� �������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'Manual'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'CONFIRMBYUSER'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'CONFIRMDATE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������������� �������� ������������, 0 - �� ������������, 1 - ������������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'IGNORECAPACITY'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ID ������������� �������, ', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'TPS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����� � �������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'TPS_N'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������ �����', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'TPS_N_DB'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� �����', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'TPS_N_DE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� �������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'ISENLARGED'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ����������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'PRIORITY'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��� ��������� - �� ��������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'RZP_MARK'
EXEC sp_addextendedproperty 'MS_Description', N'������ ����� ��������', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'SHELFLIFE_STS'
EXEC sp_addextendedproperty 'MS_Description', N'������ ��', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'RSTS'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���� ������������� ��', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'SHEDULEDBY'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������������ ��', N'schema', N'dbo', N'table', N'ARH_PPP', N'column', N'SHEDULED'

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

EXEC sp_addextendedproperty 'MS_Description', N'����� ������ ��� � ����������������', N'schema', N'dbo', N'table', N'ARH_PPPDEP'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����', 'schema', 'dbo', 'table', 'ARH_PPPDEP', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'�� ���', 'schema', 'dbo', 'table', 'ARH_PPPDEP', 'column', 'RWC_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'�� �������������', 'schema', 'dbo', 'table', 'ARH_PPPDEP', 'column', 'RWC_DEP'
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
EXEC sp_addextendedproperty 'MS_Description', N'����� ������� ��������� �� ������������', N'schema', N'dbo', N'table', N'ARH_RAM'
EXEC sp_addextendedproperty 'MS_Description', N'�������������-������������', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'DEP'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����������', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'PRTIDN'
EXEC sp_addextendedproperty 'MS_Description', N'����p ������', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����������', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'���� p������', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'��� �p�������������� ���p��', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'CPZ'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �p����������� ����������', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'QTYRQY'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �p����������� ����������', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'QTYINR'
EXEC sp_addextendedproperty 'MS_Description', N'��� �p����� ����������', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'PRO'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� ����������', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'VIN'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ��������� �� �����', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'QTYPOL'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� (����� � OKP_UOP)', N'schema', N'dbo', N'table', N'ARH_RAM', N'column', N'NOS'
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ������������ ������ ', N'schema', N'dbo', N'table', N'ARH_TECHDOUBLES'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� �������', N'schema', N'dbo', N'table', N'ARH_TECHDOUBLES', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'��� - ��������', N'schema', N'dbo', N'table', N'ARH_TECHDOUBLES', N'column', N'NUM_ORIGIN'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ���', N'schema', N'dbo', N'table', N'ARH_TECHDOUBLES', N'column', N'NUM_DEPENDINGS'
EXEC sp_addextendedproperty 'MS_Description', N'�� ���', N'schema', N'dbo', N'table', N'ARH_TECHDOUBLES', N'column', N'RWC_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'�� ��� ���������', N'schema', N'dbo', N'table', N'ARH_TECHDOUBLES', N'column', N'RWC_CPL_ORIG'
EXEC sp_addextendedproperty 'MS_Description', N'�� ��������� ���', N'schema', N'dbo', N'table', N'ARH_TECHDOUBLES', N'column', N'RWC_CPL_DEPEND'
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
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������������� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PRT$$$MNF'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������-������������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� ������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'WCR$$$WCR'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PRI'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ������ ��������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'DTEPDZ'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ������� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'DTEPDV'
EXEC sp_addextendedproperty 'MS_Description', N'������. ���� ������� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'FCD'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� ����������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QTYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� �� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QTYCQY'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������� �� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QTYGQY'
EXEC sp_addextendedproperty 'MS_Description', N'������. ���������� ����� ���������� �� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QTYFSC'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� � ����� (����������)', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QTYPWO'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������������������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PNK'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������� 0,1,2,3', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PRP'
EXEC sp_addextendedproperty 'MS_Description', N'��������.-�������������� ����� �� �������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QTYPZV'
EXEC sp_addextendedproperty 'MS_Description', N'������� �����', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QTYEDV'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� ����������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'REJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'VIN_DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��p��p������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'ENR'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� �����', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'MOV'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������ � �������� � ����������� ���', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'Holidays'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������ ������������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QCY'
EXEC sp_addextendedproperty 'MS_Description', N'������ ��������������� ������������ ������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QCYFLX'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������������ �������������� �������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'normTaskDate'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������������� �������� �����������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'ZPR_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������������� �������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'TOP$$$KTO'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������������ ��������������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'OOD'
EXEC sp_addextendedproperty 'MS_Description', N'���������������-����������.�����', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PZV'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'VP'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ����� ���������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'TMO'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����� ���������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'���������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PRF$$$PRF'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'TDDOC'
EXEC sp_addextendedproperty 'MS_Description', N'����� �����������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'TPN'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������ 0-����������� ,  1-����������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'PRODTYPE'
EXEC sp_addextendedproperty 'MS_Description', N'������-��������������� �����', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'TSK'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� ���������� �� ���������������� ������ Null,1 - �����, 0-������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'SPLITPARTIES'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'M_DB'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ���������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'M_DE'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� ������� �����������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'DTETPNE'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ ���������������� ����������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'DTEMO'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ������ ��� �������� ������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'M_DB_NR'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ��������� ��� �������� ������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'M_DE_NR'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� �������� ������ 0-��������, 1- �������� ���', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'NR'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'TU'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �����', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'FILES_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ����������� � �������� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'COMMENT'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ���������� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'QTYBRK'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'autouop'
EXEC sp_addextendedproperty 'MS_Description', N'������ ���� ��� ������� �����������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'useKOID'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������� ���', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'verify_need'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'SHELFLIFE'
Exec sp_addextendedproperty 'MS_Description', N'ID ��� ����� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'SHELFLIFE_EIZID'
EXEC sp_addextendedproperty 'MS_Description', N'������ ����� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ', N'column', N'SHELFLIFE_STS'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� ��������� ��������, ������� � �����', N'schema', N'dbo', N'table', N'ARH_TRNDOC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'ARH_TRNDOC', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� ������ (OKP_WRHFOLDS.ID)', N'schema', N'dbo', N'table', N'ARH_TRNDOC', N'column', N'FOLD_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����� (OKP_WRH.WRH_ID)', N'schema', N'dbo', N'table', N'ARH_TRNDOC', N'column', N'WRH_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������, � ������� ��������� �������� � ������ (ARH_TRNGRP.ID)', N'schema', N'dbo', N'table', N'ARH_TRNDOC', N'column', N'GRP_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������-���������', N'schema', N'dbo', N'table', N'ARH_TRNDOC', N'column', N'DOCBase'
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

EXEC sp_addextendedproperty 'MS_Description', N'���������� ���������� ��������� ��������, ������� � �����', N'schema', N'dbo', N'table', N'ARH_TRNDOCData'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������� �������� � ������ (ARH_TRNDOC.ID)', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'DOC_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� ������ (OKP_WRHFOLDS.ID)', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'FOLD_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����� (OKP_WRH.WRH_ID)', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'WRH_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������� ���������', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'DOC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ���� ���������� (OKP_TSO.TSO_IDN)', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'TSO'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ����', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'PRS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� (OKP_INV.INV_ID)', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'INV_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� (OKP_INV.PRTIDN)', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'INV_IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ������ (������ ���������)', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'LIN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� ���� �������� ������ � ���������', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'DTE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ���� ��������', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'PRC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ���� �������� �� ���������', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'PRC_D'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ ����������', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� ���������� (ARH_TRNDOCData.QTY) � ���������', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'EIZ'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������� ���������� (OKP_TRN.QTY) �� ��� ���������� (OKP_TRN.EIZ_RASH) � 
������� ��� (� ������������ � �������� ���) ��������', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'CNT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ����. �����', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'ART'
GO

EXEC sp_addextendedproperty 'MS_Description', N'� ������/�������� �� ���', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'NUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������-���������', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'DOCBase'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ������� ��� (� ������������ � ������� �������� ���) �������� - ��� ���, 
� ������� ������� h_prc, h_qty', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'H_EIZH'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� �� ���������� ���������� � ������� ������� ��� (� ������������ � ������� �������� ���) �������� ', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'H_PRC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� �� ���������� ���������� � ������� ������� ��� (� ������������ � ������� �������� ���) �������� ', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'H_QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ������. �������� ��������� ������ (������������� ��. �������� OKP_TRN.MET)', N'schema', N'dbo', N'table', N'ARH_TRNDOCData', N'column', N'MET'
GO

--
-- Definition for table ARH_WPDDOC : 
--
create table ARH_WPDDOC(
  ID bigint IDENTITY(1, 1) NOT NULL,
  FOLD_ID int NOT NULL, 
  WRH_ID int NOT NULL,
  DOC varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  DKD datetime NOT NULL,
  PRS varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  DESCRIBE varchar(4000) COLLATE DATABASE_DEFAULT NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� ���������� �������������, ������� � �����', N'schema', N'dbo', N'table', N'ARH_WPDDOC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'ARH_WPDDOC', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� ������ (OKP_WRHFOLDS.ID)', N'schema', N'dbo', N'table', N'ARH_WPDDOC', N'column', N'FOLD_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����� (OKP_WRH.WRH_ID)', N'schema', N'dbo', N'table', N'ARH_WPDDOC', N'column', N'WRH_ID'
GO

--
-- Definition for table ARH_WPDData : 
--
create table ARH_WPDData( 
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

EXEC sp_addextendedproperty 'MS_Description', N'���������� ��������� ���������� �������������, ������� � �����', N'schema', N'dbo', N'table', N'ARH_WPDData'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������� �������� � ������ (ARH_TRNDOC.ID)', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'DOC_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� ������ (OKP_WRHFOLDS.ID)', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'FOLD_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����� (OKP_WRH.WRH_ID)', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'WRH_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������� ���������', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'DOC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������-���������', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'DOCBase'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ����', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'PRS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� (OKP_INV.INV_ID)', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'INV_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� (OKP_INV.PRTIDN)', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'INV_IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ������ (������ ���������)', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'LIN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ ����������', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� ���������� (ARH_WPDData.QTY) � ���������', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'EIZ'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ���� ��������', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'PRC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� �����', N'schema', N'dbo', N'table', N'ARH_WPDData', N'column', N'UIDN'
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ����� �����', N'schema', N'dbo', N'table', N'ARH_UBR'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'NOS'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� ���� � �����', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������������-������������, nil -  �������, �������� ����������. ', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'DEPDOB'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �� ������������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'WCRWCT'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������������ ������������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'ZPRZOB'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� ������������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'NOPNOB'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������������ �������������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'ZPRZOZ'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� �������������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'NOPNOW'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� �����', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'KBR'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� ����������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'REJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� �����', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'VINDEP'
EXEC sp_addextendedproperty 'MS_Description', N'�����, ���������� � ���������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'PRCSVN'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ����������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'SEBSVO'
EXEC sp_addextendedproperty 'MS_Description', N'������� (�������� ��������)', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'SEBZMT'
EXEC sp_addextendedproperty 'MS_Description', N'������� (��������)', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'SEBZZT'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'QTYBQY'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� �����', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'RetDTE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������������� ������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'ZATID'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����� 0-�������������, 1-���������������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'RETRIEVABLE'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �������� ���������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'NAMENOW'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �������� ������������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'NAMENOB'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� ��������������� ��������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'SEBZMV'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� �������� �� ����������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'SEBZMK'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� ������ �� ����������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'SEBZZK'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� ��������: '''' - �������� ������, ''3'' - ������������� ������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� toz', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'Rwc_toz'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� cpl', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'rwc_cpl'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'TZ'
EXEC sp_addextendedproperty 'MS_Description', N'���������	�����', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'Tab'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'FIO_K'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� �����������', 'schema', 'dbo', 'table', 'ARH_UBR', 'column', 'SEBZI'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������� �� �������� ���������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'SEBZZT_v'
EXEC sp_addextendedproperty 'MS_Description', N'K�������� �������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'SEBZKOS'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���� �����', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'eskiz_id'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'ARH_UBR', N'column', N'REM'
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ����� ����� �� ��������������', N'schema', N'dbo', N'table', N'ARH_UBRDEP'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����� ����', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'N_Act'
EXEC sp_addextendedproperty 'MS_Description', N'���������������� ������', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'������� (�������� ��������)', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'SEBZMT'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� ��������������� ��������', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'SEBZMV'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� �������� �� ����������', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'SEBZMK'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� �����������', 'schema', 'dbo', 'table', 'ARH_UBRDEP', 'column', 'SEBZI'
EXEC sp_addextendedproperty 'MS_Description', N'������� (��������)', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'SEBZZT'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� ������ �� ����������', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'SEBZZK'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ����������', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'SEBSVO'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������������', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'DEP_Id'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �������', N'schema', N'dbo', N'table', N'ARH_UBRDEP', N'column', N'SEBZKOS'
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
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� �������', N'schema', N'dbo', N'table', N'ARH_UNOM'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'ARH_UNOM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'����������������� ����. ������ �� OKP_NOM.RWC', N'schema', N'dbo', N'table', N'ARH_UNOM', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �����', N'schema', N'dbo', N'table', N'ARH_UNOM', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������� �����', N'schema', N'dbo', N'table', N'ARH_UNOM', N'column', N'EXT_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'����������', N'schema', N'dbo', N'table', N'ARH_UNOM', N'column', N'CERTIFICATE'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'ARH_UNOM', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� OKP_CPL.RWC (��������� �������������� � ������ ������������)', N'schema', N'dbo', N'table', N'ARH_UNOM', N'column', N'CPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ����� ��������', N'schema', N'dbo', N'table', N'ARH_UNOM', N'column', N'PermDate'
GO


/*
** ����� ������� okp_uop
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ����� ��������', N'schema', N'dbo', N'table', N'ARH_UOP'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����� ��������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'NOS'
EXEC sp_addextendedproperty 'MS_Description', N'����p ������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'PRT$$$MNF'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������-������������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� ��������
'''' - �������� ������
''2'' - ��������, ������������ ������������
''3'' - ������������� ������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� ����������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'QTYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'����p������ ���������� ������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'QTYGQY'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'QTYKOL'
EXEC sp_addextendedproperty 'MS_Description', N'��������.-�������������� �����', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'QTYPZV'
EXEC sp_addextendedproperty 'MS_Description', N'���-�� (������-��������������� ����������)', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'QTYEDV'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �����', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'TAB'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� ���������� �� ����', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'REJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������� ��������� ����������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'VIN_DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� �����', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������� 1 - ���������, 0 - ���', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'PRP'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��p��p������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'ENR'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ���� ', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� ������ �� ������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'ORDDTE'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ����, ��������� � OKP_Order ', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'Order_Count'
EXEC sp_addextendedproperty 'MS_Description', N'���� �����������(�����)', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'DTEREG'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� ���������� ����������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'REJECT_ID_TSH'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'����������� �������� ������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'WCR$$$WCR'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� �������������� �����', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'REJECT_ID_EDIT'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������������\�������������� �����', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'DTECancel'
EXEC sp_addextendedproperty 'MS_Description', N'��� �����������\�������������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'CancelByUser'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������ 0-����������� ,  1-����������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'Prodtype'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������������� �������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'Top$$$kto'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������������� ��������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'Rwc_toz'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������������� ������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'rwc_cpl'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����� ��������� ��� (������-���������������)', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������� � ������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'KU'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������� ������ �����', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'GrUID'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������� ����', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'REGBYUSER'
EXEC sp_addextendedproperty 'MS_Description', N'����', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'OOD'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������� �������', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'PPP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������� �����', N'schema', N'dbo', N'table', N'ARH_UOP', N'column', N'WPL_ID'
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
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ ������ � ���������� ����������������� ������� ���', N'schema', N'dbo', N'table', N'ARH_UOPKIMNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ ����� ', N'schema', N'dbo', N'table', N'ARH_UOPKIMNUMS', N'column', N'UOP_GrUID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������� �������� ������ ', N'schema', N'dbo', N'table', N'ARH_UOPKIMNUMS', N'column', N'WRHSUBJ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ���-�� � �������� ��������� ����������� ARH_POT.QTYPOT', N'schema', N'dbo', N'table', N'ARH_UOPKIMNUMS', N'column', N'QTY_USED'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������ (0 �� ������; 1 � ������������)', N'schema', N'dbo', N'table', N'ARH_UOPKIMNUMS', N'column', N'TK'
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
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ ������ � ���������� ����������������� ������� �������', N'schema', N'dbo', N'table', N'ARH_UOPNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'����', N'schema', N'dbo', N'table', N'ARH_UOPNUMS', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������������� �������� OKP_TOZ.RWC', N'schema', N'dbo', N'table', N'ARH_UOPNUMS', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���������� ����������������� ����� (OKP_UNOM.ID)', N'schema', N'dbo', N'table', N'ARH_UOPNUMS', N'column', N'UNOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ ����� (OKP_UOP.GrIDN)', N'schema', N'dbo', N'table', N'ARH_UOPNUMS', N'column', N'UOP_GrUID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��� ������ (OKP_sysObjects.ID)', N'schema', N'dbo', N'table', N'ARH_UOPNUMS', N'column', N'N_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'���������� � ����������������� ������', N'schema', N'dbo', N'table', N'ARH_UOPNUMS', N'column', N'QTY'
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
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� ����������� ������', N'schema', N'dbo', N'table', N'ARH_VElem'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� ARH_VElem.ID', N'schema', N'dbo', N'table', N'ARH_VElem', N'column', N'P_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� �������� OKP_VObj.ID', N'schema', N'dbo', N'table', N'ARH_VElem', N'column', N'OID'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������� ��������', N'schema', N'dbo', N'table', N'ARH_VElem', N'column', N'KOL'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �������� �� ������� ��������', N'schema', N'dbo', N'table', N'ARH_VElem', N'column', N'KOLpO'
EXEC sp_addextendedproperty 'MS_Description', N'����� �� ������������ � ��������� ���� �� ������� ��������', N'schema', N'dbo', N'table', N'ARH_VElem', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������ ��������������� ��', N'schema', N'dbo', N'table', N'ARH_VElem', N'column', N'RegDB'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ��������������� ��', N'schema', N'dbo', N'table', N'ARH_VElem', N'column', N'RegDE'
EXEC sp_addextendedproperty 'MS_Description', N'������ ��������: 0-�� ���������� � ����; 1-�����������', N'schema', N'dbo', N'table', N'ARH_VElem', N'column', N'ST'
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

EXEC sp_addextendedproperty 'MS_Description', N'����� �������� ����������� ������', N'schema', N'dbo', N'table', N'ARH_VOper'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� ��������� OKP_VElem.ID', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'EID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� �������� OKP_VObj.ID (��� ��������� �������)', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'OID'
EXEC sp_addextendedproperty 'MS_Description', N'�� (��. ������� OKP_WRC.WCR$$$IDN)', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'WCR'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'KTO'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ��������', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'KTOName'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'N'
EXEC sp_addextendedproperty 'MS_Description', N'� �������', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'TSH'
EXEC sp_addextendedproperty 'MS_Description', N'� �����������', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'TPN'
EXEC sp_addextendedproperty 'MS_Description', N'� ���������������', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'TMO'
EXEC sp_addextendedproperty 'MS_Description', N'��� � ��������', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'EIZ_TSH'
EXEC sp_addextendedproperty 'MS_Description', N'��� � �����������', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'EIZ_TPN'
EXEC sp_addextendedproperty 'MS_Description', N'��� � ����������������', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'EIZ_TMO'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������ ��������; �������� ����������� 
�� ������������� ����� ��� (��. ������� TWTime_IntAsDateTime)', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'DB'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ��������; �������� ����������� 
�� ������������� ����� ��� (��. ������� TWTime_IntAsDateTime)', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'DE'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �� (��. ������� OKP_WCR.NMC$$$NAM)', N'schema', N'dbo', N'table', N'ARH_VOper', N'column', N'WCRName'
GO


/* @BLOCK: �������� �������
** @DESCR: ����� ������� ���������� �������� ��������
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

EXEC sp_addextendedproperty 'MS_Description', N'����� �������� ��������', N'schema', N'dbo', N'table', N'ARH_verify'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����� ��������', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'uop_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����������', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'fio_id'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ��������', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'time_execute'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������, ���������� ������', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'user_id'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� ������', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'time_create'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� ��������', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'verifyParam_obj_id'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'result'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� ������ ����������� ������', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'snum_id_checked'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �����������', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'count_checked'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� ������ ������, ���������� ������', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'snum_id_affected'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'count_verified'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'count_defected'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'ARH_verify', N'column', N'state'
GO


/* @BLOCK: �������� �������
** @DESCR: ����� ���������� ������ ������� �� ��������
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ���������� ������ ������� �� ��������', N'schema', N'dbo', N'table', N'ARH_verify_snum'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'ARH_verify_snum', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� ������', N'schema', N'dbo', N'table', N'ARH_verify_snum', N'column', N'snum'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����� ��������', N'schema', N'dbo', N'table', N'ARH_verify_snum', N'column', N'uop_id'
EXEC sp_addextendedproperty 'MS_Description', N'����������', N'schema', N'dbo', N'table', N'ARH_verify_snum', N'column', N'count_affected'
EXEC sp_addextendedproperty 'MS_Description', N'���� "�������� �������"', N'schema', N'dbo', N'table', N'ARH_verify_snum', N'column', N'pass'
GO


/* @BLOCK: �������� �������
** @DESCR: ����� ���������� �������� ��������
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

EXEC sp_addextendedproperty 'MS_Description', N'����� �������������� ����������', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'�����', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'number'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ��������� ��������', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������� �������', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'sysobj_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'obj_id'
EXEC sp_addextendedproperty 'MS_Description', N'�����/������������� ��������', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'volume'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'tro'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ���������', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'eiz_id_tro'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������������', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'tvo'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ����������������', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'eiz_id_tvo'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �����', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'gravity'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� ����', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'auxiliary'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����������� ��������', N'schema', N'dbo', N'table', N'ARH_VerifyParam_OBJ', N'column', N'cert_id'
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
EXEC sp_addextendedproperty 'MS_Description', N'����� ������������ ���������������� ��', N'schema', N'dbo', N'table', N'ARH_TOZ_VERIFYNOM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����������� ���������������� ��', N'schema', N'dbo', N'table', N'ARH_TOZ_VERIFYNOM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������������-�����������', N'schema', N'dbo', N'table', N'ARH_TOZ_VERIFYNOM', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������������� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ_VERIFYNOM', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �����������', N'schema', N'dbo', N'table', N'ARH_TOZ_VERIFYNOM', N'column', N'AMOUNT'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������� ���������', N'schema', N'dbo', N'table', N'ARH_TOZ_VERIFYNOM', N'column', N'EIZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ_VERIFYNOM', N'column', N'VERIFYPARAM_OBJ_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� ��������', N'schema', N'dbo', N'table', N'OKP_BARCODES'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_BARCODES', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ���� ������� (��. ������� OKP_sysObjects)', N'schema', N'dbo', N'table', N'OKP_BARCODES', N'column', N'ObjectID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ������� 
������������ �����, � ����� ������, ������ � ������������� <char(1)>.
� ������ ����������� �������� ����� �������, �������� � ���������� ���� ������� ���������������� �������.
������, ��� ��������� �������� � ������ �������� �� ��� �������� ����', N'schema', N'dbo', N'table', N'OKP_BARCODES', N'column', N'IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ������������� ���������', N'schema', N'dbo', N'table', N'OKP_BARCODES', N'column', N'BarCode'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ������:
0 - �������� ������������ �������������
1 - �������� ������ �������������', N'schema', N'dbo', N'table', N'OKP_BARCODES', N'column', N'Met'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,N'RFID-�����'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'OKP_BARCODES'
                               ,'COLUMN'
                               ,N'RFID'
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
	BCVIEW sysname COLLATE DATABASE_DEFAULT NULL,
	BaseGrp_ID int NULL,
	IDN_fields varchar(255) COLLATE DATABASE_DEFAULT NULL,
	has_perm_base BIT CONSTRAINT df__okp_sysobjects__has_perm_base DEFAULT (0) NOT NULL,
	has_perm_group BIT CONSTRAINT df__okp_sysobjects__has_perm_group DEFAULT (0) NOT NULL,
	has_perm_dep BIT CONSTRAINT df__okp_sysobjects__has_perm_dep DEFAULT (0) NOT NULL,
	rparm_id INT NULL,
	CONSTRAINT PK_OKP_sysObjects PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� �������', N'schema', N'dbo', N'table', N'OKP_sysObjects'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������� �������', N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������', N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'�������-��������. ���� ������������ �������������, ����������� ������ ���� ���� RWC, ������� identity � �������.', N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'SOURCE'
EXEC sp_addextendedproperty 'MS_Description', N'������ �������� �����, �������� � ������ ����������� ";"', N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'PARAMETERS'
EXEC sp_addextendedproperty 'MS_Description', 
N'������ ���������� ������������ ������� � �������������� �������. 
������������ ��� ������ ������������ ������ � ��������������� �������� - ��. ����� GetLockedInfoMethod. �������� � ������ ����������� ";"', N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'LOCKEDINFOCOLUMNS'
EXEC sp_addextendedproperty 'MS_Description', 'ID ������� ������', 'schema', 'dbo', 'table', 'OKP_sysObjects', 'column', 'BaseGrp_ID'
EXEC sp_addextendedproperty 'MS_Description', 
N'��������� ����� ���������� ������ ��� ������ ������������ ���������� � ���������� ������������ �������', 
N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'GetLockedInfoMethod'
EXEC sp_addextendedproperty 'MS_Description', 
N'��������� �������� ��������������� �� ������ ������� �� ������ (#LO_Locks) - ��. ��������� sp_SelectLockedByList',  N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'SelectLockedMethod'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������� ���������� �� ������ �������� �� ������ (#LO_Locks) - ��. ��������� sp_CheckLinkLocks', 
N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'CheckLockMethod'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������� �������', N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������� � �������� �������', N'schema', N'dbo', N'table', N'OKP_sysObjects', N'column', N'IDN_fields' 
EXEC sp_addextendedproperty 'MS_Description', N'������� ����������� ���� ������� �� ������', N'schema', N'dbo', N'table', N'okp_sysobjects', N'column', N'has_perm_base'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����������� ���� ������� �� ������', N'schema', N'dbo', N'table', N'okp_sysobjects', N'column', N'has_perm_group'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����������� ���� ������� �� ������ � ������� �������������', N'schema', N'dbo', N'table', N'okp_sysobjects', N'column', N'has_perm_dep'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������� ��������� �������� �������', N'schema', N'dbo', N'table', N'okp_sysobjects', N'column', N'rparm_id'
GO

/* @NAME:  OKP_PPP
** @DESCR: �������� ������
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

EXEC sp_addextendedproperty 'MS_Description', N'�������� �������', N'schema', N'dbo', N'table', N'OKP_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������� �������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� �������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'PRT$$$NOM'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ��������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'NMP$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������� �������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������� ������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'DTEZ'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ����������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'NPR'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������� �������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'QCYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� �������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'PER'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����������� ����������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'QCYFQY'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� ��', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'WAR'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���� �������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'FDTE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� �������� �������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'REM'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������� �����������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������������: 0 - �����, -1 - ������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'DIRECTION'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� �� ������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'ZAKDTE'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���� ������������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'FPDTE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������������� ������ �������� ������ ������ ����� (0 - �� ������������, 1 - ������������)', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'UseSklad'
EXEC sp_addextendedproperty 'MS_Description', N'��������(�����������) ���� ������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'M_DB'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ���������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'M_DE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� �������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'Manual'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'CONFIRMBYUSER'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'CONFIRMDATE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������������� �������� ������������, 0 - �� ������������, 1 - ������������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'IGNORECAPACITY'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ID ������������� �������, ', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'TPS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����� � �������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'TPS_N'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������ �����', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'TPS_N_DB'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� �����', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'TPS_N_DE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� �������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'ISENLARGED'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ����������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'PRIORITY'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��� ��������� - �� ��������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'RZP_MARK'
EXEC sp_addextendedproperty 'MS_Description', N'������ ����� ��������', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'SHELFLIFE_STS'
EXEC sp_addextendedproperty 'MS_Description', N'������ ��', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'RSTS'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���� ������������� ��', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'SHEDULEDBY'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������������ ��', N'schema', N'dbo', N'table', N'OKP_PPP', N'column', N'SHEDULED'

GO

--
-- Definition for table OKP_CPL : 
--
CREATE TABLE dbo.OKP_CPL (
  DEP$$$DEP varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  ZPR int CONSTRAINT DF_OKP_CPL_ZPR1 DEFAULT 10 NOT NULL,
  NUM varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_CPL_NUM1 DEFAULT 1 NOT NULL,
  PRT$$$NOM varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_CPL_PRT$$$NOM1 DEFAULT '' NOT NULL,
  PRTPARNOM varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_CPL_PRTCHLNOM1 DEFAULT '' NOT NULL,
  DTEPDZ datetime NULL,
  DTEPDV datetime NULL,
  QTYPQY float CONSTRAINT DF_OKP_CPL_QTYPQY1 DEFAULT 0 NOT NULL,
  QTYTQY float CONSTRAINT DF_OKP_CPL_QTYTQY1 DEFAULT 0 NOT NULL,
  DTEFDV datetime NULL,
  QTYFQY float CONSTRAINT DF_OKP_CPL_QTYFQY1 DEFAULT 0 NOT NULL,
  QTYBRK float CONSTRAINT DF_OKP_CPL_QTYBRK1 DEFAULT 0 NOT NULL,
  TPZ varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_CPL_TPZ1 DEFAULT 'C' NOT NULL,
  STS int CONSTRAINT DF_OKP_CPL_STS1 DEFAULT 0 NOT NULL,
  KNO varchar(1) COLLATE DATABASE_DEFAULT NULL,
  SEBPTZ float CONSTRAINT DF_OKP_CPL_SEBPTZ1 DEFAULT 0 NOT NULL,
  SEBPTF float CONSTRAINT DF_OKP_CPL_SEBPTF1 DEFAULT 0 NOT NULL,
  SEBSTZ float CONSTRAINT DF_OKP_CPL_SEBSTZ1 DEFAULT 0 NOT NULL,
  PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  REM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  MET tinyint NULL,
  RSTS int NULL,
  QTYIQY float CONSTRAINT DF_OKP_CPL_QTYIQY1 DEFAULT 0 NOT NULL,
  rwc int IDENTITY(1, 1) NOT NULL,
  PlanType bit NULL,
  PartySize float CONSTRAINT DF_OKP_CPL_PartySize DEFAULT 0 NULL,
  DTEASH datetime NULL,
  QTY_PC float NOT NULL,
  RWC_PPP int NULL,
  M_DB bigint NOT NULL,
  M_DE bigint NOT NULL,
  QTYAQY FLOAT(53) CONSTRAINT df_okp_cpl__qtyaqy DEFAULT 0 NOT NULL,
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
  SHELFLIFE_STS INT CONSTRAINT DK_OKP_CPL_SHELFLIFE_STS DEFAULT 0 NOT NULL,
  SIZES varchar(256) COLLATE DATABASE_DEFAULT NULL,
  SIZES_EIZ varchar(3) COLLATE DATABASE_DEFAULT NULL
  CONSTRAINT PK_OKP_CPL PRIMARY KEY CLUSTERED (NUM, PPPNUM, ZPR)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������������� ������', N'schema', N'dbo', N'table', N'OKP_CPL'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������������� ������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'DEP$$$DEP'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ������������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'ZPR'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'PRT$$$NOM'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� �������������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'PRTPARNOM'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ������� ������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'DTEPDZ'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ������� ������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'DTEPDV'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� ������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTYTQY'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���� ������� ������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'DTEFDV'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������� ������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTYFQY'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������� �����', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTYBRK'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'TPZ'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� ������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'KNO'
EXEC sp_addextendedproperty 'MS_Description', N'������ �������� ������� -��������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'SEBPTZ'
EXEC sp_addextendedproperty 'MS_Description', N'������ �������� ������� - ����������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'SEBPTF'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������� � �����', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'SEBSTZ'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'REM'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����� �� ����� ������ (�������������) ��������� (� ������� ���� + ��������)', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTYIQY'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'PartySize'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'DTEASH'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'M_DB'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ���������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'M_DE'
EXEC sp_addextendedproperty 'MS_Description', N'����� �� ����� ������ (�������������) ��������� � ������� ����', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTYAQY'
EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'NMP$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� �������� ���������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'LastCDTE'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������� ����������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTYCQY'
EXEC sp_addextendedproperty 'MS_Description', N'�¨���� ����������, ���������� �� ������ ��������. � ������� ���', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'FOLD_I'
EXEC sp_addextendedproperty 'MS_Description', N'�¨���� ���������� �������, �������������� ����� ��������. 
  ����������� ������ ��� �������� ������ (��� ��), ��������� - 0.
  � ������� ���', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'FOLD_K'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������������� ������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'PARNUM'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������ ���������������� ������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'PAR_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �� ���������������� ������ ����������������� ��� ������������ ���(0-������,1-�����������������)', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'IsExternalNode'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������������� ��������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'ROUTE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� �������/������� � �������� ������������ ������������ ����', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'DELTADATE'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������������� ������:  0- ����������, 1-�����������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'OMP'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������� ������
  0-�� ��������
  1-������� �����
  2-������� �����', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'NRP'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ������� �� ������ ���������� � ����', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QCYRAT'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����� �� ����� ����������� ��������� (� ������� ������������ ���� + ��������)', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTY_BI'
EXEC sp_addextendedproperty 'MS_Description', N'����� �� ����� ����������� ��������� � ������� ����', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'QTY_BA'
EXEC sp_addextendedproperty 'MS_Description', N'�¨���� ���������� �����, ���������� �� ������ ���������� ��������. � ������� ���', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'FOLD_B'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������� �������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'RWC_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'������ ����� ��������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'SHELFLIFE_STS'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'SIZES'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ��������', N'schema', N'dbo', N'table', N'OKP_CPL', N'column', N'SIZES_EIZ'
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
	QTYTQY float CONSTRAINT DF_OKP_POT_QTYTQY DEFAULT 0 NULL,
	ZPR int NULL,
	NOP int NULL,
	LLC int NULL,
	REF varchar(10) COLLATE DATABASE_DEFAULT NULL,
	QTYRQY float NULL,
	INR float NULL,
	VIN varchar(10) COLLATE DATABASE_DEFAULT NULL,
	EditDTE datetime CONSTRAINT DF_OKP_POT_EditDTE DEFAULT getdate() NULL,
	MET bit CONSTRAINT DF_OKP_POT_STS DEFAULT 0 NULL,
	ReplaceDocNum varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_POT_ReplaceDocNum DEFAULT '' NULL,
	ReplaceDocDTE datetime NULL,
	PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	TM int CONSTRAINT DF_OKP_POT_TM DEFAULT 0 NOT NULL,
	RWC_PPP int NULL,
	Rwc_toz int NULL,
	NMP$$$NAM varchar(100) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
	TRN_ID bigint NULL,
	REJECT_ID int NULL,
	CONSTRAINT PK_OKP_POT PRIMARY KEY CLUSTERED (RWC)
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� �� ���������������� ��������', N'schema', N'dbo', N'table', N'OKP_POT'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������������� ������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'PRTIDN'
EXEC sp_addextendedproperty 'MS_Description', N'���� �����������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �����������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'QTYPOT'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� �����������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'QTYTQY'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'ZPR'
EXEC sp_addextendedproperty 'MS_Description', N'�����  �������� ������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'LLC'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������� ���������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'REF'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �p����������� ����������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'QTYRQY'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� �������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'INR'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� ����������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'REJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'VIN'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����� ������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'EditDTE'
EXEC sp_addextendedproperty 'MS_Description', N'������ (0 - �������, 1 - ����������)', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� ������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'ReplaceDocNum'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'ReplaceDocDTE'
EXEC sp_addextendedproperty 'MS_Description', N'�', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'��� �����������:
  0 - ��������
  1 - ���������������
  2 - ���������
  3 - �������������
  4 - ����������
  5 - ���������������
  6 - �������� �������� �� ����������
  7 - ��������������� �������� �� ����������
  8 - ��������� �� ����������
  9 - �������� �� ����������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'TM'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� toz', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'Rwc_toz'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'NMP$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������� IR (okp_sreserv.ID)', N'schema', N'dbo', N'table', N'OKP_POT', N'column', N'TRN_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'RWC ������������', N'schema', N'dbo', N'table', N'OKP_NOMLOG', N'column', N'NOM_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ���������', N'schema', N'dbo', N'table', N'OKP_NOMLOG', N'column', N'CHANGEDATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� �������� ������� ������������', N'schema', N'dbo', N'table', N'OKP_NOMLOG', N'column', N'SET_MET'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_NOMLOG', N'column', N'UserName'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_NOMLOG', N'column', N'Comment'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������', N'schema', N'dbo', N'table', N'OKP_NOMLOG', N'column', N'PRTIDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ����������', N'schema', N'dbo', N'table', N'OKP_NOMLOG', N'column', N'HostName'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'OKP_NOMLOG', N'column', N'MODUL'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������������� �������������� ����������', N'schema', N'dbo', N'table', N'OKP_NOMALT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �����������', N'schema', N'dbo', N'table', N'OKP_NOMALT', N'column', N'REPLACED_RWC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ����������(���������)', N'schema', N'dbo', N'table', N'OKP_NOMALT', N'column', N'SUBSTITUDE_RWC'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� �������� ���� �����������', N'schema', N'dbo', N'table', N'OKP_MatKompl'
GO
EXEC sp_addextendedproperty 'MS_Description', N'�������� �������', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'PPPNum'
GO
EXEC sp_addextendedproperty 'MS_Description', N'���������������� ������', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Cplnum'
GO
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Prtnom'
GO
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Matidn'
GO
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Matname'
GO
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Qtypot'
GO
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Naenam'
GO
EXEC sp_addextendedproperty 'MS_Description', N'����', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'PRC'
GO
EXEC sp_addextendedproperty 'MS_Description', N'���������', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'SumPRC'
GO
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ID ���������������� ������ (OKP_CPL.RWC)', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Num_id'
GO
EXEC sp_addextendedproperty 'MS_Description', N'��� ���:
  0 - ��������
  1 - ���������������
  2 - ���������
  3 - �������������
  4 - ����������
', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'TM'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'����� �����������', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'CalcIdn'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������� (OKP_DEP.RWC)', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Dep_Id'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'id ��� �� ������� ���� (OKP_NOM.RWC)', N'schema', N'dbo', N'table', N'Okp_MatKompl', N'column', N'Nom_Id'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� �������� ����������� �����������', N'schema', N'dbo', N'table', N'OKP_labour'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �������', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'PPPNum'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'Num'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (��� + ������������)', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'KodOper'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����� (��� + ������������)', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'KodWcr'
EXEC sp_addextendedproperty 'MS_Description', N'��������� (��� + ������������)', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'KodPrf'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'Rzo'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'Vid_Oplat'
EXEC sp_addextendedproperty 'MS_Description', N'�����', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'data_id'
EXEC sp_addextendedproperty 'MS_Description', N'��������, ���.', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'GradRate'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���.', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'TimeSum'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ��������', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'OsnZ'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ����', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'rwc'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'PRTPAR'
EXEC sp_addextendedproperty 'MS_Description', N'����� �����������', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'CalcIdn'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������������� ������������', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'typ'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������������', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'Dep_id'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �������������', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'Nmdnam'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ��������', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'NameOper'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �������� ������', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'NameWCR'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'NamePRF'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'KODRES'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �������', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'NAMERES'
EXEC sp_addextendedproperty 'MS_Description', N'id ��������', N'schema', N'dbo', N'table', N'okp_labour', N'column', N'Nom_Id'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������� �� ������� ���������', N'schema', N'dbo', N'table', N'OKP_labour', N'column', N'OsnZ_1'
GO

/*
** ����������� �� �������
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

EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_NKL'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������������� ������', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������������', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'DEP'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'Tst'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������ �����������', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'SEBNUM'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'SEBVAL'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ �� �������', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'SEBVAL_st'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'LNUM'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���� �������������', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'STKBAS'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����������', N'schema', N'dbo', N'table', N'OKP_NKL', N'column', N'nkl_list_id'
GO

/*
** Definition for table OKP_LIM : 
*/
CREATE TABLE dbo.OKP_LIM (
	RWC bigint IDENTITY(1, 1) NOT NULL,
	PRTIDN dbo.PRT_LEN NOT NULL,
	PER dbo.G_CODE NOT NULL,
	DTE dbo.D_DATE NOT NULL,
	QTYFQY FLOAT CONSTRAINT df__okp_lim__qtyfqy DEFAULT 0 NULL,
	QTYLIM FLOAT CONSTRAINT df__okp_lim__qtylim DEFAULT 0 NULL,
	QTYVQY FLOAT CONSTRAINT df__okp_lim__qtyvqy DEFAULT 0 NULL,
	QTYIQY FLOAT CONSTRAINT df__okp_lim__qtyiqy DEFAULT 0 NULL,
	QTYOST FLOAT CONSTRAINT df__okp_lim__qtyost DEFAULT 0 NULL,
	MET dbo.G_CODE NULL,
	RD dbo.D_DATE DEFAULT getdate() NULL,
	CD dbo.D_DATE DEFAULT getdate() NULL,
	R_FIO varchar(100) COLLATE DATABASE_DEFAULT NULL,
	C_FIO varchar(100) COLLATE DATABASE_DEFAULT NULL,
	CPLNUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	DEP_ID int NOT NULL,
	CONSTRAINT PK_OKP_LIM PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �������������', N'schema', N'dbo', N'table', N'OKP_LIM'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ������', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'PRTIDN'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� 0-������; 1-�����; 2-�������; 3-���', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'PER'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����� �������', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'������������� � ������������', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'QTYFQY'
EXEC sp_addextendedproperty 'MS_Description', N'�����', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'QTYLIM'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������� �� ������', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'QTYVQY'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ���������� �� ������', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'QTYIQY'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'QTYOST'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������( ��� ���������)', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'RD'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ���������', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'CD'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'R_FIO'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� ��� �������', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'C_FIO'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_LIM', N'column', N'CPLNUM'
GO

/*
** ����������� ���������
*/
CREATE TABLE dbo.OKP_SystemProperties (
	id int CONSTRAINT DF_OKP_SystemProperties_id DEFAULT 0 NOT NULL,
	Enterprise varchar(255) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_SystemProperties_Enterprise DEFAULT '' NOT NULL,
	ChiefName varchar(255) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_SystemProperties_ChiefName DEFAULT '' NOT NULL,
	ChiefEconomistName varchar(255) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_SystemProperties_ChiefEconomistName DEFAULT '' NOT NULL,
	ChiefAccountantName varchar(255) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_SystemProperties_ChiefAccountantName DEFAULT '' NOT NULL,
	ControlOperCalcOrder int CONSTRAINT DF_OKP_SystemProperties_ControlOperCalcOrder DEFAULT 1 NOT NULL,
	UseStoreModule int CONSTRAINT DF_OKP_SystemProperties_UseStoreModule DEFAULT 1 NOT NULL,
	BaseEIZQuantity varchar(3) COLLATE DATABASE_DEFAULT NOT NULL,
	BaseEIZWeight varchar(3) COLLATE DATABASE_DEFAULT NOT NULL,
	UpdatePeriod int CONSTRAINT DF_OKP_SystemProperties_RefreshTime DEFAULT 120 NOT NULL,
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
	ControlStructure int CONSTRAINT df__OKP_SystemProperties__ControlStructure DEFAULT 1 NOT NULL,
	CommandTimeout int DEFAULT 120 NULL,
	BaseSkladRegOnly int DEFAULT 1 NOT NULL,
	SPShowLogins int DEFAULT 1 NOT NULL,
	SPCertFile int DEFAULT 0 NOT NULL,
	JobsLogPeriod int NULL,
	JobsLogEraseDate datetime NULL,
	UseToolsReserve int DEFAULT 0 NOT NULL,
	UseKIMOutPriority int DEFAULT 0 NOT NULL,
	SEPARATE_UOP_UNIONCPL int CONSTRAINT DF_OKP_SystemProperties_SEPARATE_UOP_UNIONCPL DEFAULT 0 NOT NULL,
	Files_id int NULL,
	UseAutoCalc int NULL,
	sZagControll int DEFAULT 1 NOT NULL,
	CanUseExistingLogin int DEFAULT 1 NOT NULL,
	DeviationLimitDate int CONSTRAINT DF_OKP_SystemProperties_DeviationLimitDate DEFAULT -1 NOT NULL,
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

EXEC sp_addextendedproperty 'MS_Description', N'��������� �������', N'schema', N'dbo', N'table', N'OKP_SystemProperties'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �����������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'Enterprise'
EXEC sp_addextendedproperty 'MS_Description', N'�.�.�. ������������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'ChiefName'
EXEC sp_addextendedproperty 'MS_Description', N'�.�.�. �������� ����������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'ChiefEconomistName'
EXEC sp_addextendedproperty 'MS_Description', N'�.�.�. �������� ����������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'ChiefAccountantName'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ������� ����� ��������: ��=1, ���=0', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'ControlOperCalcOrder'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ������ "�����": ��=1, ���=0', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'UseStoreModule'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��� ����������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'BaseEIZQuantity'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��� ����', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'BaseEIZWeight'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������ ����  ������, ���.', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'UpdatePeriod'
EXEC sp_addextendedproperty 'MS_Description', N'������� EIZ �������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'BaseEIZSize'
EXEC sp_addextendedproperty 'MS_Description', N'������� EIZ �������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'BaseEIZTime'
EXEC sp_addextendedproperty 'MS_Description', N'���� � ����� ���������� ��������� ������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'LastBaseVersionChange'
EXEC sp_addextendedproperty 'MS_Description', N'�.�.�. ����������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'ChiefKladName'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ���������� � ����', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'AdmissibleDeparture'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'ManufactureType'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ��������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'Calc_Digit'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������������� ������� � ��: 0 - �������; 1 - �����������; 2 - ������ ', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'LogType'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������� ������ � ������� (OKP_LOGS). �������� ����������� � ����', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'LogArchTerm'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������� ��������� ������� ������ ������� (OKP_BUFLOG). �������� ����������� � ����', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'LogEraseBufPeriod'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ������� ��������� ������� ������ ������� (OKP_BUFLOG).', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'LogEraseDate'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��� �������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'BaseEIZSquare'
EXEC sp_addextendedproperty 'MS_Description', N'�����', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'Adres'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������: ��=1, ���=0', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'UseBarCodes'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��� ������������ ����������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'BaseEIZPlanQuantity'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��� ������������ �������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'BaseEIZPlanTime'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������������� ������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'UseCenterWRH'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ������ ������ �������������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'UseAlienWRH'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������� ��� ��� ����� ���������� ��������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'ImControl'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��� ������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'BaseEIZVolume'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������  �������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'TimeShow_Digit'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������/�����/�����������/�������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'CalcShow_Digit'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������� ��������� ������ ��� ����� ��������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'ControlStructure'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����������� ����� � ������������� � ���� ������ 1 - ����������, 0 - �� ����������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'SPShowLogins'
EXEC sp_addextendedproperty 'MS_Description', N'id ����� � OKP_FILES, ������ ���������� X.509 � ��������� ���� ������������ � ��������� Base-64', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'SPCertFile'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� �� ������� �����������, 1 - �������������, 0 - �� �������������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'UseToolsReserve'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����� �������� ��������� ���� �� ������������ ��', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'SEPARATE_UOP_UNIONCPL'
EXEC sp_addextendedproperty 'MS_Description', N'C����� �� �������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'Files_id'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ����������� ��� ����� �� �����: �� = 1, ��� = 0', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'UseAutoCalc'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������� ���� "������ ���������" ', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'sZagControll'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ���������� ���� ����� �� ������� ����, ���.', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'DeviationLimitDate'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������ �� ���������� (�������� ������ "�����"):
   0 - �� ��������� ������, ���� - �������
   1 - FIFO - ��������� � ������ ������, ���� = ���� ������
   2 - LIFO - ��������� � ��������� ������, ���� = ���� ������
   3 - FEFO - ��������� � ������, � ������� ������ �������� ���� ��������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'KIM_OutType'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������� ���� �������� (�������� ������ "�����")', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'KIM_UseParties'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ��������� ������� ��� ���������� � ����:
   0 - �� ���������
   1 - ���������� ��� ���������� � ���� ������ ���� ������ ��������� "��������� �������"', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'QCYRATControll'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������������� ����� ����������� ������: �� = 1, ��� = 0', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'UseSList'
EXEC sp_addextendedproperty 'MS_Description', 
    N'���� ���������� ��������� ��������� ���� ��� ������� (�������������� ���� � ������ ���, �������������� ���� � ������� ������ ����������)', 
    N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'EnablePRCManualChange'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����������� � ����������� � ���������� ��������  ������. 1-���������, 0- �� ���������. �� ��������� -0', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'RoundToolsDemand'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������� �������� ��� �������', N'schema', N'dbo', N'table', N'OKP_SystemProperties', N'column', N'DoxPack'
GO

--
-- Definition for table OKP_TGRP : 
--

CREATE TABLE OKP_TGRP (
  ID bigint IDENTITY,
  IDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  NAM varchar(100)  COLLATE DATABASE_DEFAULT NOT NULL,
  DTE_REG datetime NOT NULL DEFAULT (GETDATE()),
  RWC_FIO_MANAGER INT NOT NULL,
  CONSTRAINT PK_OKP_TGRP_ID PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty N'MS_Description', N'������ ���������� (�������)',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TGRP'
EXEC sp_addextendedproperty N'MS_Description', N'ID', 'SCHEMA', N'dbo', 'TABLE', N'OKP_TGRP', 'COLUMN', N'ID'
EXEC sp_addextendedproperty N'MS_Description', N'�����������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_TGRP', 'COLUMN', N'IDN'
EXEC sp_addextendedproperty N'MS_Description', N'������������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_TGRP', 'COLUMN', N'NAM'
EXEC sp_addextendedproperty N'MS_Description', N'������������ ������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_TGRP', 'COLUMN', N'RWC_FIO_MANAGER'
EXEC sp_addextendedproperty N'MS_Description', N'���� ������������', 'SCHEMA' ,N'dbo', 'TABLE', N'OKP_TGRP', 'COLUMN' ,N'DTE_REG'
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

EXEC sp_addextendedproperty N'MS_Description', N'������ �������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TGRP_DATA'
EXEC sp_addextendedproperty N'MS_Description', N'ID', N'SCHEMA', N'dbo', N'TABLE', N'OKP_TGRP_DATA', N'COLUMN', N'ID'
EXEC sp_addextendedproperty N'MS_Description', N'������������� ������', N'SCHEMA', N'dbo', N'TABLE', N'OKP_TGRP_DATA', N'COLUMN', N'ID_TGRP'
EXEC sp_addextendedproperty N'MS_Description', N'�����������', 'SCHEMA', N'dbo', N'TABLE', N'OKP_TGRP_DATA', N'COLUMN', N'RWC_FIO'
EXEC sp_addextendedproperty N'MS_Description', N'���� ��������� � ������', N'SCHEMA', N'dbo', N'TABLE', N'OKP_TGRP_DATA', N'COLUMN', N'DTE_REG'
EXEC sp_addextendedproperty N'MS_Description', N'����������� �������', N'SCHEMA', N'dbo', N'TABLE', N'OKP_TGRP_DATA', N'COLUMN', N'K'
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

EXEC sp_addextendedproperty 'MS_Description', N'�����/������', N'schema', N'dbo', N'table', N'OKP_FILES'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����', N'schema', N'dbo', N'table', N'OKP_FILES', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'��� �����', N'schema', N'dbo', N'table', N'OKP_FILES', N'column', N'FileName'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �����', N'schema', N'dbo', N'table', N'OKP_FILES', N'column', N'Data'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������� (guid)', N'schema', N'dbo', N'table', N'OKP_FILES', N'column', N'UID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������: 3 - ����, 4 - ������, 5 - ��������, 6 - ���������, 7 - ��������, 8 - �������������� ', N'schema', N'dbo', N'table', N'OKP_FILES', N'column', N'Pict'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� �����', N'schema', N'dbo', N'table', N'OKP_WPL'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ����� ��', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'INVNUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ��', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'MachName'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'WCR'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� � ��', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'MIDN'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����� ��� ������������ (��/���)', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'CheckPlan'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ���������', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'BalCost'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'RelDate'
EXEC sp_addextendedproperty 'MS_Description', N'���-�� �����������', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'WorkNum'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'WorkCond'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������� ����', N'schema', N'dbo', N'table', N'OKP_WPL', N'column', N'YearFond'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� �������� ������ ����� ������� ������', N'schema', N'dbo', N'table', N'OKP_ZATR'
GO
EXEC sys.sp_addextendedproperty N'MS_Description', N'��� ������
1 - ������� �� �������� ��������� ��� ������������ ������������
2 - ������� �� ��������������� ��������� ��� ������������ ������������
3 - �������� �������
4 - ������� �� ��������� �� ����������
5 - ���� � ������������
7 - ������ �������� �������
8 - ��������� �������
9 - ������ �������� ������� �� ����������
17 - ����������� ���
18 - ����������� ��� ��� �������� �������
19 - �������� ��������� ��� 
22 - �������� ��������� ��� ��� �������� �������
23 - ��������������� ��������� ���
24 - ��������������� ��������� ��� ��� �������� �������
25 - ��������� �� ���������� ���
26 - ��������� �� ���������� ��� ��� �������� �������
27 - �������� ���
28 - �������� ��� ��� �������� �������
29 - �������� �������� ����������� ���
30 - �������� �������� ����������� ��� ��� �������� �������
31 - O������� �������� �� ���������� ���
32 - O������� �������� �� ���������� ��� ��� �������� �������
33 - ������� �� �����������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_ZATR', 'COLUMN', N'TYPE'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������������', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'DEP_ID'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'CPLNUM'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'������� �� ���� �������', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'DAT'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� �� ���� �������', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'OTC'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'��������� ������������� �������� �������������', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'PNO'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'���������� � ����', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'DEPKOL'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������ �������', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'Qtygqy'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����������', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'KOL'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'��� ��� ������������', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'Calc_Code'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'PRTIDN'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������� ����������� � �� ��� ������� ���������� ���������� � ��', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'QtyZ'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'� �������� ���������� �����������', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'QtyPot'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'PRC'
GO 
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���������������� ������ (OKP_CPL.RWC)', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'rwc_cpl'
GO
EXEC sp_addextendedproperty 'MS_Description', N'������� �� ����������', N'schema', N'dbo', N'table', N'OKP_ZATR', N'column', N'NORM'
GO


/*
** Definition for table OKP_UOP : 
*/
CREATE TABLE dbo.OKP_UOP (
	NOS int IDENTITY(1, 1) NOT NULL,
	PPPNUM varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	NUM varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_UOP_NUM DEFAULT '' NOT NULL,
	PRT$$$MNF varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_UOP_PRT$$$MNF DEFAULT '' NOT NULL,
	DEP_ID int NOT NULL,
	NOP int CONSTRAINT DF_OKP_UOP_NOP DEFAULT 0 NOT NULL,
	STS varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_UOP_STS DEFAULT '' NOT NULL,
	QTYPQY float CONSTRAINT DF_OKP_UOP_QTYPQY DEFAULT 0 NOT NULL,
	QTYGQY float CONSTRAINT DF_OKP_UOP_QTYGQY DEFAULT 0 NOT NULL,
	QTYKOL float CONSTRAINT DF_OKP_UOP_QTYKOL DEFAULT 0 NOT NULL,
	QTYPZV float CONSTRAINT DF_OKP_UOP_QTYPZV DEFAULT 0 NOT NULL,
	QTYEDV float CONSTRAINT DF_OKP_UOP_QTYEDV DEFAULT 0 NOT NULL,
	TAB varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_UOP_TAB DEFAULT 0 NOT NULL,
	REJECT_ID int NULL,
	VIN_DEP_ID int NULL,
	DTE datetime NOT NULL,
	PRP varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_UOP_PRP DEFAULT '' NOT NULL,
	ENR varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_UOP_ENR DEFAULT '068' NOT NULL,
	MET tinyint NULL,
	ORDDTE datetime NULL,
	Order_Count int NULL,
	DTEREG DATETIME CONSTRAINT df__okp_uop__dtereg DEFAULT getdate() NULL,
	REJECT_ID_TSH int NULL,
	RZO varchar(3) COLLATE DATABASE_DEFAULT CONSTRAINT df__okp_uop__rzo DEFAULT '3' NOT NULL,
	WCR$$$WCR varchar(12) COLLATE DATABASE_DEFAULT CONSTRAINT df__okp_uop__wcr$$$wcr DEFAULT '' NOT NULL,
	REJECT_ID_EDIT int NULL,
	DTECancel datetime NULL,
	CancelByUser varchar(50) COLLATE DATABASE_DEFAULT NULL,
	Prodtype int NULL,
	Top$$$kto varchar(4) COLLATE DATABASE_DEFAULT NULL,
	Rwc_toz int NULL,
	rwc_cpl int NULL,
	TRO float NULL,
	KU FLOAT CONSTRAINT df__okp_uop__ku DEFAULT 1 NOT NULL,
	GrUID uniqueidentifier CONSTRAINT df__okp_uop__gruid DEFAULT newid() NOT NULL,
	REGBYUSER varchar(50) COLLATE DATABASE_DEFAULT NULL,
	OOD INT CONSTRAINT df__okp_uop__ood DEFAULT 1 NOT NULL,
	PPP_ID int NOT NULL DEFAULT 0,
	WPL_ID INT NULL
	CONSTRAINT PK_OKP_UOP PRIMARY KEY CLUSTERED (NOS)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_UOP'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����� ��������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'NOS'
EXEC sp_addextendedproperty 'MS_Description', N'����p ������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'PRT$$$MNF'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������-������������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� ��������
'''' - �������� ������
''2'' - ��������, ������������ ������������
''3'' - ������������� ������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� ����������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'QTYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'����p������ ���������� ������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'QTYGQY'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'QTYKOL'
EXEC sp_addextendedproperty 'MS_Description', N'��������.-�������������� �����', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'QTYPZV'
EXEC sp_addextendedproperty 'MS_Description', N'���-�� (������-��������������� ����������)', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'QTYEDV'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �����', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'TAB'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� ���������� �� ����', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'REJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������� ��������� ����������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'VIN_DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� �����', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������� 1 - ���������, 0 - ���', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'PRP'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��p��p������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'ENR'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ���� ', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� ������ �� ������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'ORDDTE'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ����, ��������� � OKP_Order ', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'Order_Count'
EXEC sp_addextendedproperty 'MS_Description', N'���� �����������(�����)', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'DTEREG'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� ���������� ����������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'REJECT_ID_TSH'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'����������� �������� ������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'WCR$$$WCR'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� �������������� �����', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'REJECT_ID_EDIT'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������������\�������������� �����', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'DTECancel'
EXEC sp_addextendedproperty 'MS_Description', N'��� �����������\�������������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'CancelByUser'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������ 0-����������� ,  1-����������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'Prodtype'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������������� �������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'Top$$$kto'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������������� ��������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'Rwc_toz'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������������� ������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'rwc_cpl'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����� ��������� ��� (������-���������������)', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������� � ������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'KU'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������� ������ �����', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'GrUID'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������� ����', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'REGBYUSER'
EXEC sp_addextendedproperty 'MS_Description', N'����', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'OOD'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������� �������', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'PPP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������� �����', N'schema', N'dbo', N'table', N'OKP_UOP', N'column', N'WPL_ID'
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
	autouop BIT CONSTRAINT df_okp_toz_autouop DEFAULT (0) NOT NULL,
	useKOID TINYINT CONSTRAINT DK_OKP_TOZ_USEKOID DEFAULT (1) NOT NULL,
	verify_need bit CONSTRAINT DK_OKP_TOZ_VERIFY_NEED DEFAULT (0) NOT NULL,
        SHELFLIFE float CONSTRAINT DK_OKP_TOZ_SHELFLIFE DEFAULT 0 NOT NULL,
        SHELFLIFE_EIZID INT CONSTRAINT DK_OKP_TOZ_SHELFLIFE_EIZID DEFAULT 9 NOT NULL,
        SHELFLIFE_STS INT CONSTRAINT DK_OKP_TOZ_SHELFLIFE_STS DEFAULT 0 NOT NULL,
        SHT float CONSTRAINT DF_TOZ_SHT DEFAULT 0 NOT NULL,
	CONSTRAINT PK_OKP_TOZ PRIMARY KEY CLUSTERED (rwc)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������������� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PRT$$$MNF'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������-������������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� ������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'WCR$$$WCR'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PRI'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ������ ��������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'DTEPDZ'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ������� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'DTEPDV'
EXEC sp_addextendedproperty 'MS_Description', N'������. ���� ������� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'FCD'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� ����������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QTYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� �� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QTYCQY'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������� �� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QTYGQY'
EXEC sp_addextendedproperty 'MS_Description', N'������. ���������� ����� ���������� �� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QTYFSC'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� � ����� (����������)', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QTYPWO'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������������������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PNK'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������� 0,1,2,3', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PRP'
EXEC sp_addextendedproperty 'MS_Description', N'��������.-�������������� ����� �� �������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QTYPZV'
EXEC sp_addextendedproperty 'MS_Description', N'������� �����', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QTYEDV'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� ����������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'REJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'VIN_DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��p��p������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'ENR'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� �����', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'MOV'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������ � �������� � ����������� ���', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'Holidays'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������ ������������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QCY'
EXEC sp_addextendedproperty 'MS_Description', N'������ ��������������� ������������ ������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QCYFLX'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������������ �������������� �������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'normTaskDate'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������������� �������� �����������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'ZPR_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������������� �������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'TOP$$$KTO'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������������ ��������������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'OOD'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������������� - �������������� (���)', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PZV'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'VP'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ����� ���������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'TMO'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ - ��������������� (���)', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'���������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PRF$$$PRF'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'TDDOC'
EXEC sp_addextendedproperty 'MS_Description', N'����� �����������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'TPN'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������ 0-����������� ,  1-����������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'PRODTYPE'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ - ��������������� ���������� (���-��)', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'TSK'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� ���������� �� ���������������� ������ Null,1 - �����, 0-������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'SPLITPARTIES'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'M_DB'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ���������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'M_DE'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� ������� �����������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'DTETPNE'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ ���������������� ����������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'DTEMO'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ������ ��� �������� ������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'M_DB_NR'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ��������� ��� �������� ������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'M_DE_NR'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� �������� ������ 0-��������, 1- �������� ���', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'NR'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'TU'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �����', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'FILES_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ����������� � �������� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'COMMENT'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ���������� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'QTYBRK'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������������', N'schema', N'dbo', N'table', N'okp_toz', N'column', N'autouop'
EXEC sp_addextendedproperty 'MS_Description', N'������ ���� ��� ������� �����������', N'schema', N'dbo', N'table', N'okp_toz', N'column', N'useKOID'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������� ���', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'verify_need'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'SHELFLIFE'
Exec sp_addextendedproperty 'MS_Description', N'ID ��� ����� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'SHELFLIFE_EIZID'
EXEC sp_addextendedproperty 'MS_Description', N'������ ����� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'SHELFLIFE_STS'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������� (���)', N'schema', N'dbo', N'table', N'OKP_TOZ', N'column', N'SHT'
GO

/* @NAME:  OKP_WCRCapacity
** @DESCR: �������� ���������� �������� � ����������� �� � ���������� �����
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

EXEC sp_addextendedproperty 'MS_Description', N'�������� ������������', N'schema', N'dbo', N'table', N'OKP_WCRCapacity'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��', N'schema', N'dbo', N'table', N'OKP_WCRCapacity', N'column', N'WCR'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��', N'schema', N'dbo', N'table', N'OKP_WCRCapacity', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���', N'schema', N'dbo', N'table', N'OKP_WCRCapacity', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'OKP_WCRCapacity', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������', N'schema', N'dbo', N'table', N'OKP_WCRCapacity', N'column', N'DateBegin'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������', N'schema', N'dbo', N'table', N'OKP_WCRCapacity', N'column', N'DateEnd'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_WCRCapacity', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��', N'schema', N'dbo', N'table', N'OKP_WCRCapacity', N'column', N'WPL_ID'
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
	verify_need BIT CONSTRAINT df__kto__verify_need DEFAULT (0) NOT NULL,
	shelflife FLOAT(53) CONSTRAINT df__okp_kto__shelflife DEFAULT (0) NOT NULL,
	shelflife_eizid INT CONSTRAINT df__okp_kto__shelflife_eizid DEFAULT 9 NOT NULL,
	CONSTRAINT PK_OKP_KTO PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ��������', N'schema', N'dbo', N'table', N'OKP_KTO'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� ��������', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������������� ��������', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'THO_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'WCR'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'PRF'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������������� - �������������� (���)', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'PZV'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� ���', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'UOMPZVEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� (��)', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'TMO'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� ��', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'UOMTMOEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ - ��������������� (���)', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� ���', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'UOMTROEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������������� (��)', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'VCP'
EXEC sp_addextendedproperty 'MS_Description', N'������ ��������������� ������', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'VP'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������� (���)', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'SHT'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� ���', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'UOMSHTEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����������� (���)', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'TPN'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� ���', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'UOMTPNEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������������� ������������ (���)', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'MOV'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� ���', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'UOMMOVEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ - ��������������� ���������� (���-��)', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'TSK'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� ���-��', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'UOMTSKEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'�����.��������� ���������� ����������', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'FIL'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ������������� ���������� ������������ ������ �� ������� ������; Null,0 - �����; 1-������', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� ���������� �� ���������������� ������ Null,1 - �����, 0-������', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'SPLITPARTIES'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����������� ��������', N'schema', N'dbo', N'table', N'OKP_KTO', N'column', N'AUTOUOP'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'DESCR'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'COMM'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������� ���', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'verify_need'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'shelflife'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����� ��������', 'schema', 'dbo', 'table', 'OKP_KTO', 'column', 'shelflife_eizid'
GO

--
-- Definition for table OKP_NOM_KTO : 
--
CREATE TABLE OKP_NOM_KTO(
	ID int NOT NULL identity(1,1),
	KTO_ID int NOT NULL,
	NOM_ID int NOT NULL,
	EIZ varchar(3) COLLATE DATABASE_DEFAULT NOT NULL,
	MET varchar(1) COLLATE DATABASE_DEFAULT ,
	QTY float NOT NULL,
	PRIMARY KEY CLUSTERED (ID)
)
GO 

EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� �����', 'schema', 'dbo', 'table', 'OKP_NOM_KTO', 'column', 'ID';
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ������� ��������', 'schema', 'dbo', 'table', 'OKP_NOM_KTO', 'column', 'KTO_ID';
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ���������', 'schema', 'dbo', 'table', 'OKP_NOM_KTO', 'column', 'NOM_ID';
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ���������', 'schema', 'dbo', 'table', 'OKP_NOM_KTO', 'column', 'EIZ';
GO

EXEC sp_addextendedproperty 'MS_Description', N'�����', 'schema', 'dbo', 'table', 'OKP_NOM_KTO', 'column', 'MET';
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ���������', 'schema', 'dbo', 'table', 'OKP_NOM_KTO', 'column', 'QTY';
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
	TimeBegin DATETIME CONSTRAINT df__okp_wcr__timebegin DEFAULT 0.33333333333333333333333333 NOT NULL,
	CheckPlane bit CONSTRAINT DF_OKP_WCR_CheckPlane DEFAULT 1 NOT NULL,  
	COMMENT varchar(250) COLLATE DATABASE_DEFAULT NULL,
	CONSTRAINT PK_OKP_WCR PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ������', N'schema', N'dbo', N'table', N'OKP_WCR'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'WCR$$$IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ��', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'NMC$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'PRF$$$PRF'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����� ��������� ������ �� ��', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'VOB'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������� ��:  YN', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'TIN'
EXEC sp_addextendedproperty 'MS_Description', N'T�� �������� ������:  DPS', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'TRC'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'SRC'
EXEC sp_addextendedproperty 'MS_Description', N'����������������� �����', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'PSM'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������� ���������� �������', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'OZD'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������): M = �������, ���� ����������� ����', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'True = �������� � ��������/���������', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'Holidays'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ �������� ���', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'TimeBegin'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ��� ������������', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'CheckPlane'
EXEC sp_addextendedproperty 'MS_Description', N'����������� �������', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'RES$$$IDN'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_WCR', N'column', N'COMMENT'
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

EXEC sp_addextendedproperty 'MS_Description', N'��������������� ��������', N'schema', N'dbo', N'table', N'OKP_ROUTES'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'NOM_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ��������', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'MAINROUTE'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'ACTIVE'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'BUREAU'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������ ������� ��������', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'STARTPERIOD'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������� ��������', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'ENDPERIOD'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������������� �� (OKP_users.FIO)', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'ACTIVATEBY_FIO'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'ACTIVATEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'����������� � ��������', N'schema', N'dbo', N'table', N'OKP_ROUTES', N'column', N'COMMENT'
GO

--
-- Definition for table OKP_PRF : 
--
CREATE TABLE OKP_PRF(
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
	CONSTRAINT PK_OKP_PRF PRIMARY KEY CLUSTERED (ID));
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������', N'schema', N'dbo', N'table', N'OKP_PRF'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'ID';
EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'PRFIDN';
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'NMFNAM';
EXEC sp_addextendedproperty 'MS_Description', N'������ ������������ ���������', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'L_NMFNAM';
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'MET';
EXEC sp_addextendedproperty 'MS_Description', N'������', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'GRP_ID';
EXEC sp_addextendedproperty 'MS_Description', N'���. ������ ���������', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'TRMIN';
EXEC sp_addextendedproperty 'MS_Description', N'����. ������ ���������', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'TRMAX';
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'ETKS';
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������', 'schema', 'dbo', 'table', 'OKP_PRF', 'column', 'OKZ';
GO

/*
** �������� ��������������� ���������
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
	autouop BIT CONSTRAINT df_okp_rut_autouop DEFAULT (0) NOT NULL,
	useKOID TINYINT CONSTRAINT DK_OKP_RUT_USEKOID DEFAULT (1) NOT NULL,	
	verify_need BIT CONSTRAINT df__rut__verify_need DEFAULT (0) NOT NULL,
	shelflife FLOAT(53) CONSTRAINT df__okp_rut__shelflife DEFAULT (0) NOT NULL,
	shelflife_eizid INT CONSTRAINT df__okp_rut__shelflife_eizid DEFAULT 9 NOT NULL,
	CONSTRAINT PK_OKP_RUT PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������������� ��������', N'schema', N'dbo', N'table', N'OKP_RUT'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �������������', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'WCR$$$WCR'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������������� ��������', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'TOP$$$KTO'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������ �������������� �������', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'OOD'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���� ������������', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'NOR'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������������� - �������������� (���)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'PZV'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������ �����������', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'VP'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������������ ������ � ��������', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'FLX'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� ���', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'UOMPZVEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� (��)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'TMO'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� �� � ��', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'UOMTMOEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ - ��������������� (���)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� ��� � ���-��', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'UOMTROEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� ����� (���)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'MOV'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� ���', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'UOMMOVEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����������������:  YN', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'TIN'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'PRF_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'TDDOC'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������� ������������ ������ �� ��: 0-�� 1-���', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����������� (���)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'TPN'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� ���', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'UOMTPNEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ - ��������������� ���������� (���-��)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'TSK'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �� ���������������� ������', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'SPLITPARTIES'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� ����� (��)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'VCP'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������� (���)', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'SHT'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� ���', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'UOMSHTEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� ��������', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'TU'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������������� �������', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'ROUTES_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �����', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'FILES_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ����������� � �������� ��������', N'schema', N'dbo', N'table', N'OKP_RUT', N'column', N'COMMENT'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������������', N'schema', N'dbo', N'table', N'okp_rut', N'column', N'autouop'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���� ��� ������� �����������', N'schema', N'dbo', N'table', N'okp_rut', N'column', N'useKOID'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������� ���', 'schema', 'dbo', 'table', 'OKP_RUT', 'column', 'verify_need'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', 'schema', 'dbo', 'table', 'OKP_RUT', 'column', 'shelflife'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����� ��������', 'schema', 'dbo', 'table', 'OKP_RUT', 'column', 'shelflife_eizid'
GO

--
-- ������� ������ ����� �� � ��������� ���������������� ��������
--
CREATE TABLE dbo.OKP_RUT_WPL (
  ID int identity(1,1) NOT NULL,
  RUT_ID int NOT NULL,
  WPL_ID int NOT NULL,
  CONSTRAINT PK_OKP_RUT_WPL PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� �������� ���������������� �������� � ������� ������', N'schema', N'dbo', N'table', N'OKP_RUT_WPL'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_RUT_WPL', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� ���������������� ��������', N'schema', N'dbo', N'table', N'OKP_RUT_WPL', N'column', N'RUT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� �����', N'schema', N'dbo', N'table', N'OKP_RUT_WPL', N'column', N'WPL_ID'
GO

--
-- ������� ������ ����� �� � ���������������� ���������
--
CREATE TABLE dbo.OKP_TOZ_WPL (
  ID int identity(1,1) NOT NULL,
  TOZ_ID int NOT NULL,
  WPL_ID int NOT NULL,
  CONSTRAINT PK_OKP_TOZ_WPL PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������������� �������� � ������� ������', N'schema', N'dbo', N'table', N'OKP_TOZ_WPL'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_TOZ_WPL', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� ���������������� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ_WPL', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� �����', N'schema', N'dbo', N'table', N'OKP_TOZ_WPL', N'column', N'WPL_ID'
GO

/*
** ������������ �������� ����������
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

EXEC sp_addextendedproperty 'MS_Description', N'������������ �������� ����������', N'schema', N'dbo', N'table', N'OKP_ENGALT'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������������', N'schema', N'dbo', N'table', N'OKP_ENGALT', N'column', N'PRTNOM'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������� ������������', N'schema', N'dbo', N'table', N'OKP_ENGALT', N'column', N'SUBSTITUDE_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������ ������� ������', N'schema', N'dbo', N'table', N'OKP_ENGALT', N'column', N'DateBegin'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������� ������', N'schema', N'dbo', N'table', N'OKP_ENGALT', N'column', N'DateEnd'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������', 'schema', 'dbo', 'table', 'okp_engalt', 'column', 'amount'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��� �������', 'schema', 'dbo', 'table', 'okp_engalt', 'column', 'eiz_id'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������', N'schema', N'dbo', N'table', N'okp_engalt', N'column', N'sizes'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������', N'schema', N'dbo', N'table', N'okp_engalt', N'column', N'value_weight'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����� ���������', N'schema', N'dbo', N'table', N'okp_engalt', N'column', N'eiz_weight'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������������� ���������', N'schema', N'dbo', N'table', N'okp_engalt', N'column', N'kim'
GO

/*
** ���������� ������ 
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

EXEC sp_addextendedproperty 'MS_Description', N'���������� ������', N'schema', N'dbo', N'table', N'OKP_ENG'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �����', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'DRW'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������������', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'PRTNOM'
EXEC sp_addextendedproperty 'MS_Description', N'����������� - ������ 1', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'OBO1'
EXEC sp_addextendedproperty 'MS_Description', N'����������� - ������ 2', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'OBO2'
EXEC sp_addextendedproperty 'MS_Description', N'����������� - ������ 3', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'OBO3'
EXEC sp_addextendedproperty 'MS_Description', N'����������� - ������ 4', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'OBO4'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� �����', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'UOMUMWEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� ��������', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'UOMUMREIZ'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������� ���������', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'PRTMATNOM'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������������� ����������', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'KIM'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'ZAGLGH'
EXEC sp_addextendedproperty 'MS_Description', N'�������\������ ���������', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'ZAGDMR'
EXEC sp_addextendedproperty 'MS_Description', N'������ ���������', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'ZAGHGH'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������', N'schema', N'dbo', N'table', N'OKP_ENG', N'column', N'ZAGM'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', 'schema', 'dbo', 'table', 'okp_eng', 'column', 'size_length'
EXEC sp_addextendedproperty 'MS_Description', N'������ (�������) ��������', 'schema', 'dbo', 'table', 'okp_eng', 'column', 'size_width'
EXEC sp_addextendedproperty 'MS_Description', N'������ (�������) ��������', 'schema', 'dbo', 'table', 'okp_eng', 'column', 'size_height'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������', 'schema', 'dbo', 'table', 'okp_eng', 'column', 'sizes'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������', 'schema', 'dbo', 'table', 'okp_eng', 'column', 'amount_required'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', 'schema', 'dbo', 'table', 'okp_eng', 'column', 'value_weight'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����', 'schema', 'dbo', 'table', 'okp_eng', 'column', 'FILES_ID'
GO

/*
** ������� �����
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������������', N'schema', N'dbo', N'table', N'OKP_RES'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������', 'schema', 'dbo', 'table', 'OKP_RES', 'column', 'ID';
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_RES', N'column', N'RES$$$IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'OKP_RES', N'column', N'NMR$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������� ���������', N'schema', N'dbo', N'table', N'OKP_RES', N'column', N'UOM$$$EIZ'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ������� �������', N'schema', N'dbo', N'table', N'OKP_RES', N'column', N'PRC'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'OKP_RES', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������', N'schema', N'dbo', N'table', N'OKP_RES', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��� % �������������', N'schema', N'dbo', N'table', N'OKP_RES', N'column', N'MINNPERC'
EXEC sp_addextendedproperty 'MS_Description', N'���� % �������������', N'schema', N'dbo', N'table', N'OKP_RES', N'column', N'MAXNPERC'
GO

/*
** ������� ���������
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ���������', N'schema', N'dbo', N'table', N'OKP_EIZ'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ���������', N'schema', N'dbo', N'table', N'OKP_EIZ', N'column', N'UOMIDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ������� ���������', N'schema', N'dbo', N'table', N'OKP_EIZ', N'column', N'NAENAM'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_EIZ', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��� (��� ��� ������������� �� �������, ������ ����� ������������ �������������� ��� ��������)', N'schema', N'dbo', N'table', N'OKP_EIZ', N'column', N'BASE'
EXEC sp_addextendedproperty 'MS_Description', N'����������� �������������� � ������� ���', N'schema', N'dbo', N'table', N'OKP_EIZ', N'column', N'KOEF'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_EIZ', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_EIZ',  N'column', N'GRP_ID'
GO

--
-- Definition for table OKP_TRN : 
--

CREATE TABLE dbo.OKP_TRN (
  TRN_ID bigint IDENTITY(1, 1) NOT NULL,
  WRH_IDN dbo.WRH_LEN NOT NULL,
  WRH_NAM dbo.WRH_NAM DEFAULT '' NOT NULL,
  PRS varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
  TRN_TSO varchar(2) COLLATE DATABASE_DEFAULT NOT NULL,
  NUM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  PRT_INV dbo.PRT_LEN NOT NULL,
  DOC dbo.DOC_LEN NOT NULL,
  DKD dbo.D_DATE NOT NULL,
  DTA datetime null,
  DTR varchar(2) COLLATE DATABASE_DEFAULT NULL,
  LIN dbo.G_COUNT NOT NULL,
  FACTUR varchar(20) COLLATE DATABASE_DEFAULT NULL,
  DTF datetime NULL,
  DTE dbo.D_DATE NOT NULL,
  CCC dbo.CCC_LEN NULL,
  CCC_NAM varchar(50) COLLATE DATABASE_DEFAULT NULL,
  PDR_NAM varchar(100) COLLATE DATABASE_DEFAULT NULL,
  PRC float NOT NULL,
  PRC_D float NOT NULL,
  QTY float NULL,
  ART dbo.ART_LEN NULL,
  INV dbo.G_CODE NOT NULL,
  UPD dbo.G_CODE NOT NULL,
  ACC dbo.G_CODE NOT NULL,
  EIZ_RASH varchar(10) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_TRN_EIZ_RASH DEFAULT '166' NOT NULL,
  PRR dbo.G_CODE NOT NULL,
  MET dbo.G_CODE NULL,
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��������� ��������)', N'schema', N'dbo', N'table', N'OKP_TRN'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'TRN_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'WRH_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'PRS'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���� ����������  (�� TSO)', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'TRN_TSO'
EXEC sp_addextendedproperty 'MS_Description', N'� ������/�������� �� ���', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� �� INV', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'PRT_INV'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������� ���������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'DOC'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ���������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'DKD'
EXEC sp_addextendedproperty 'MS_Description', N'���� �����������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'DTA'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'DTR'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ������ ���������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'LIN'
EXEC sp_addextendedproperty 'MS_Description', N'� �������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'FACTUR'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'DTF'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������� ��������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'CCC'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ������������� ��������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'CCC_NAM'
EXEC sp_addextendedproperty 'MS_Description', N'������������  �������������, �������\����������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'PDR_NAM'
EXEC sp_addextendedproperty 'MS_Description', 
N'��������� ���� ��� �� ��������� (��� ����� ���). 
� ���������� "������ ��������" � �������� ����� ���� �������� ��������� ��������.', 
N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'PRC'
EXEC sp_addextendedproperty 'MS_Description', 
N'���� �� ���������. 
��� ����������� ���������� ������ (����� "������� ��������") PRC = PRC_D.
� ���������� ��������, ��� �������, ����������� ���, � � ���� ���������� ��� �����.
��� �� � ���������� �� �������� ����� �������� ����������� ���� ��������.
������ �� ����� � ������� ������� ��������� ����������� ��������� ���� (PRC) � 
���� �� ��������� (PRC_D):
  - ���� � �������� ��������� ������ �������� "��������� ��������" ������ ���������, ��
    PRC = OKP_RZP_TRN_DATA.PRC_RECALC
  - ���� ��������-��������� �� ������ � ��� �����������, �� � ����������� �� ����� OKP_TRN.NDS_Included:
      * 0 (��� �� ������� � ���� PRC_D) -> PRC = PRC_D
      * 1 (��� ������� � ���� PRC_D) -> PRC = PRC_D / (1 + ���)
  - ���� ��������-��������� �� ������ � ��� �� �����������, �� PRC = PRC_D', 
N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'PRC_D'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ����������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����. �����', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'ART'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���. � ���� ����� �������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'INV'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���. � ���� ����� ������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'UPD'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���. � ���� ��� �����������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'ACC'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� �������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'EIZ_RASH'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� ������', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'PRR'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������. �������� ��������� ������ � ����������� �� �������� ���� TRN_TSO:
 - TRN_TSO = "IN" (���������� ��������������)
   1) isNull(met, 0) <> 1 - ��� ���� � �������������� 
   2) 1 - ��� ��������� �� �������������� 
 - TRN_TSO = "IR" (���������� ���������� ������ �� ������ � ������������)
   1) 0 - ������ ��� (������ �������� �� ����)
   2) isNull(met, 1) <> 0 - ����� �������
', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������� ���������� (OKP_TRN.QTY) �� ��� ���������� (OKP_TRN.EIZ_RASH) � ��������� ��� ������� �������� (��. �������� OKP_INV.QTY)', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'CNT'
EXEC sp_addextendedproperty 'MS_Description', N'���, � ������� ������� h_prc, h_qty', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'H_EIZH'
EXEC sp_addextendedproperty 'MS_Description', 
N'���� ������ �������� ������� (� ��� ������� ������ ������ ���������� - "������� ���������"), �� ���� �������� �������� "��������" ����������
  (������������� ���������� �� ���� ��������� ������� ������� ����������) � ��������� ��� ������� �������� (��. �������� OKP_INV.QTY)', 
N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'QTY_F'
EXEC sp_addextendedproperty 'MS_Description', N'������ QTY_F', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'Fold_Q'
EXEC sp_addextendedproperty 'MS_Description', N'���� �� ������� ����������� ��������� (����� OKP_INV.PRC)', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'H_PRC'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �� ������� ����������� ��������� (����� OKP_INV.QTY)', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'H_QTY'
EXEC sp_addextendedproperty 'MS_Description', N'������ ��� (� %)', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'NDS'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� � ����:
0 - �������� ����� ������������ �� ����� ��� ���� ���
1 - ��� �� ������ �� �������� �����
', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'NDS_Included'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� ������������� �������� �� ������� (OKP_WRH_SUBJECTS.ID)', N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'SUB_ID'
EXEC sp_addextendedproperty 'MS_Description', 
N'������ ������� ������:
  - null, 0 - ������ �� ������������
  - 1 - ������ ��������� ������������ (�� � ���������� ������ ����������� �������������)', 
  N'schema', N'dbo', N'table', N'OKP_TRN', N'column', N'STS'
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

EXEC sp_addextendedproperty 'MS_Description', N'���� ������������� ���', N'schema', N'dbo', N'table', N'OKP_TRNDOC', N'column', N'UseNDS'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ��������� (���, ��� ������ ��������)', N'schema', N'dbo', N'table', N'OKP_TRNDOC', N'column', N'OwnerFIO'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������� ���������:
  0 - �� �������� - �������� �������� "����������", �.�. �� � ������� "�� ����������" � ��
                     ��������� ������ �� � ������ (�� ����������� ���������� "����� ��������")
  10 - ��������',
  'schema', 'dbo', 'table', 'OKP_TRNDOC', 'column', 'Status'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������:
  NULL ��� 0 - ����������� ��������
  <> 0 - ���������������� �������� ', 
  N'schema', N'dbo', N'table', N'OKP_TRNDOC', N'column', N'Mode'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������� ���������:
0 - �������� ��������� ���
> 0 - ��. OKP_sysObjects.ID
', N'schema', N'dbo', N'table', N'OKP_TRNDoc', N'column', N'MasterLink'
EXEC sp_addextendedproperty 'MS_Description', N'���� �����������', N'schema', N'dbo', N'table', N'OKP_TRNDOC', N'column', N'DTA'
GO
--
-- Definition for table OKP_WRH : 
--
CREATE TABLE dbo.OKP_WRH (
  WRH_ID int IDENTITY(1, 1) NOT NULL,
  WRH_IDN dbo.WRH_LEN NOT NULL,
  NAM dbo.WRH_NAM NOT NULL,
  KTP_KTP tinyint NULL,
  PIN dbo.PIN_LEN NULL,
  PLK dbo.G_CODE NULL,
  REX dbo.G_CODE NULL,
  DDD dbo.G_CODE NULL,
  NPW varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_WRH_NPW DEFAULT '0000000000' NULL,
  DTW dbo.D_DATE NULL,
  NNN varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_WRH_NNN DEFAULT '0000000000' NULL,
  DTR dbo.D_DATE NULL,
  NPF varchar(20) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_WRH_NPF DEFAULT '0000000000' NULL,
  DTF dbo.D_DATE NULL,
  DTE dbo.D_DATE NULL,
  MET dbo.G_CODE NULL,
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

EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'OKP_WRH'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'WRH_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'WRH_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ������', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'NAM'
EXEC sp_addextendedproperty 'MS_Description', N'��� (���) ������: gpmspscspx', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'KTP_KTP'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� ������ ������', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'PIN'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����� ��� ������������: Y,N', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'PLK'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������������ ������ "�����" LMN', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'REX'
EXEC sp_addextendedproperty 'MS_Description', N'������� �����������', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'DDD'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� ������������. ���������', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'NPW'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������������. ���������', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'DTW'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������� ���������� ��������� (��. OKP_TRN.DOC)', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'NNN'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ���������� ��������� (��. OKP_TRN.DKD)', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'DTR'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� �������', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'NPF'
EXEC sp_addextendedproperty 'MS_Description', N'����  ��������� �������', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'DTF'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ������', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'PREF_DOC'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������� �������������� ��������� ����������', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'DISEDITDATE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� ������� - ���, ����� � �.�. YBQMWDG', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'PLANPERIOD'
EXEC sp_addextendedproperty 'MS_Description', 
N'������ ������� ���� ��������. ���������:
  - ����������� ������ - char(1)
  - ������ ���� - ��������� - ��� �����:
    -- ������ ����� - ���� ��������:
     0 - ������ �������� ���� - ������� (��������, "�������-�����-������")
     1 - ������ �������� ���� - ������� (��������, "������-�����-�������") 
    -- ������ ����� - ���� ���������� ����������� ������ � ������ ����������� ����� �������� (v_WPlaces.FullAddr):
     0 - �� ���������
     1 - ��������� � ������������ � ��������� (��. ����. ����):
         0 - ����������� ������ ����������� ������ ������
         1 - ����������� ������ ����������� ��������� ������
  - ������ � ����������� ����� - ��������:
    -- ������ ���� ������� �� 4-� ��������� (��������, "�::������:2"):
      1 - �������
      2 - �������
      3 - ��� �����
      4 - �����������
  ������ ����������� � ������������ � ��������� ���� �������� - "�01" ', 
  'schema', 'dbo', 'table', 'OKP_WRH', 'column', 'WPTemplate'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������� ������ ���� ��������. ���� �� ������, �� "."', 
  'schema', 'dbo', 'table', 'OKP_WRH', 'column', 'WPSeparator'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������������� ���������� "����� ��������":
  0 - �� ������������ - ������ "���������" ��������������� ������������� ��� ��������; ���������� 
                        "����� ��������" �� ��������
  1 - ��������� -       ������ "���������" ��������������� ������������� ��� ��������; ����������
                        "����� ��������" ��������
  2 - ������������ -    ������ "���������" ��������������� ������������� ��� ��������� �������������� 
                        ���������; ���������� "����� ��������" �������� ',
    'schema', 'dbo', 'table', 'OKP_WRH', 'column', 'WPType'
EXEC sp_addextendedproperty 'MS_Description', N'����������� � ������', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'COMMENT'    
EXEC sp_addextendedproperty 'MS_Description', N'��������� �������������� ������������ ���������� ������ ��� ��� ����� ��������', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'AutoUOPDOC'
EXEC sp_addextendedproperty 'MS_Description', N'���� "����� ����������": 
0, null - �� �������� ������� ����������;
1 - �������� ������� ����������.', N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'isForDefective'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������������� ���������-��������� ��� ������ ��������:
  - 2 - �� ���������� - ��������� ���� "������ ��������" ����� ���� ������� ������ �� ���������
      ���������� ����� ��������, ���������� � ������ "���������"
  - 1 - ��� ���������� - ��������� ���� "������ ��������" ����� ���� ������� ������ ����
      ��������� �� ������
  - 0 - ��������� ����� - ��������� ���� "������ ��������" ����� ���� ������� ��� � ���������
      ���������, ��� � ��� ����',
    'schema', 'dbo', 'table', 'OKP_WRH', 'column', 'RPType'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ������������ IM-��������� (��. OKP_TRNDOC.Mode):
  0 - ����������� �������� - ������ ����������� ��������
  1 - ����������� �������� - �������� ����� ���� ������ ����� ����� � ������������ (�� �����), � �� �� (��� �����������)', 
  N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'IMType'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� "������ ��� ������������ �� ������", ������������� ���������� �� ������ �������� ���������� ��� ������� � ��������� �������', 
  N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'IMOverReserv'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ���������� ��������� ����������', 
  N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'DocSTS'
EXEC sp_addextendedproperty 'MS_Description', 
N'���� ������������� ������ ����-������� ��������:
  - 0 - �� ������������ - ����-������� �� ���������; ��������������� ���� � ��������� �������� �� �������� 
  - 1 - ��������� - ����-������� �� ���������; ��������������� ���� � ��������� �������� �������� 
  - 2 - ������������ - � ���������� �������� ����-������� ������ ���� �������; ��������������� ���� � ��������� �������� ��������', 
N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'SPLFacturType'
EXEC sp_addextendedproperty 'MS_Description', 
N'���� ������������� ������ ������� ��������� ��������:
  - 0 - �� ������������ - ������� ��������� �� ���������; ��������������� ���� � ��������� �������� �� �������� 
  - 1 - ��������� - ������� ��������� �� ���������; ��������������� ���� � ��������� �������� �������� 
  - 2 - ������������ - � ���������� �������� ������� ��������� ������ ���� �������; ��������������� ���� � ��������� �������� ��������', 
N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'SPLBillType'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������������� �������� ������� � �������� ������ ��� ���������� ��� � ��������', 
N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'AutoDistribObj'
EXEC sp_addextendedproperty 'MS_Description', 
N'���� ��������� "������ �� ������������", ������������� ���������� �� ���� ������ � ������������:
  - �� - ���������� �������� (��������� ��������� ������ � ������������)
  - ��� - ���������� ��������� (��������� ������ � ������������ ������)', 
  N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'RMOverrunEnable'
EXEC sp_addextendedproperty 'MS_Description', 
N'���� ���������� ������ � ������������, ������������ �������� ����� ��������: 
  - �� - �������� �������, ��� ������ �������������� �������� ����������� ����� ��������
  - ��� - �������� ��������', 
  N'schema', N'dbo', N'table', N'OKP_WRH', N'column', N'RMPermControl'
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
  IsRole bit CONSTRAINT DF_OKP_USERS_ISROLE DEFAULT '0' NOT NULL
  CONSTRAINT PK_OKP_USERS PRIMARY KEY CLUSTERED (USERNAME)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'OKP_USERS'
EXEC sp_addextendedproperty 'MS_Description', N'�����', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'USERNAME'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'USERFIO'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'USERPSSW'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'PERMISSIONS'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������ Active Directory ������������', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'Domain'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ����������� �� �������, ��� 1 - �������� Windows, � 0 - �������� SQL', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'ServerAUTH'
EXEC sp_addextendedproperty 'MS_Description', N'������ ��� ������ ������������', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'FirstName'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������������', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'LastName'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������������', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'SurName'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������������ (����������� � ������������)', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'Description'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����� � ���� OKP_Files, ��� �������� ���� �����������', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'Files_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ - ����?', N'schema', N'dbo', N'table', N'OKP_USERS', N'column', N'IsRole'
GO

--
-- Definition for table OKP_WRHU : 
--

CREATE TABLE dbo.OKP_WRHU (
  USER_ID int NOT NULL,
  WRH_WRH int NOT NULL,
  MET dbo.G_CODE NULL,
  CONSTRAINT PK_OKP_WRHU PRIMARY KEY CLUSTERED (USER_ID, WRH_WRH)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ �������', N'schema', N'dbo', N'table', N'OKP_WRHU'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������', N'schema', N'dbo', N'table', N'OKP_WRHU', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������ OKP_WRH.WRH_ID', N'schema', N'dbo', N'table', N'OKP_WRHU', N'column', N'WRH_WRH'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_WRHU', N'column', N'MET'
GO

/*
** Definition for table OKP_INV : 
*/
CREATE TABLE dbo.OKP_INV (
	INV_ID bigint IDENTITY(1, 1) NOT NULL,
	WRH_WRH int NOT NULL,
	USER_ID int NOT NULL,
	PRTIDN dbo.PRT_LEN NOT NULL,
	NM1 varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
	NM2 varchar(255) COLLATE DATABASE_DEFAULT NOT NULL,
	UOMPEIZ dbo.EIZ_LEN NOT NULL,
	UOMHEIZ dbo.EIZ_LEN NOT NULL,
	CNT float CONSTRAINT DF_OKP_INV_CNT DEFAULT 1 NOT NULL,
	PRC float NOT NULL,
	ART varchar(8) null,
	SZP float CONSTRAINT DF_OKP_INV_SZP DEFAULT 0 NOT NULL,
	KTX varchar(4) COLLATE DATABASE_DEFAULT NULL,
	PRG varchar(4) COLLATE DATABASE_DEFAULT NULL,
	ADP dbo.G_CODE NOT NULL,
	LNG dbo.G_NUMB NULL,
	DEV real CONSTRAINT DF_OKP_INV_DEV DEFAULT 0 NULL,
	DAD real CONSTRAINT DF_OKP_INV_DAD DEFAULT 0 NULL,
	KNA dbo.G_CODE CONSTRAINT DF_OKP_INV_KNA DEFAULT 0 NOT NULL,
	LLL dbo.G_CODE NULL,
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
	DIS dbo.D_DATE NULL,
	MAD dbo.G_CODE NULL,
	DTA dbo.D_DATE NULL,
	ADQ float CONSTRAINT DF_OKP_INV_ADQ DEFAULT 0 NOT NULL,
	DTE_NOR dbo.D_DATE NULL,
	OTV float CONSTRAINT DF_OKP_INV_OTV DEFAULT 0 NOT NULL,
	OMP varchar(1) COLLATE DATABASE_DEFAULT NULL,
	MET dbo.G_CODE NULL,
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

EXEC sp_addextendedproperty 'MS_Description', N'������������ �� �������', N'schema', N'dbo', N'table', N'OKP_INV'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������� ������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'INV_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'WRH_WRH'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����������� �������������� ����', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'PRTIDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �������� (�����������)', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'NM1'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �������� (������)', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'NM2'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� �������/������ = OKP_NOM.UOM$$$EIZ - �������, � ������� ������� ����������� � ������������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'UOMPEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� �������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'UOMHEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'����������� �������� ������ ������� (UOMHEIZ) � ������� ������� (UOMPEIZ)', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'CNT'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������� �������� � ��������� ��� �������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'PRC'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������������  �����', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'ART'
EXEC sp_addextendedproperty 'MS_Description', N'������ ���������� ������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'SZP'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������� �������� ��������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'KTX'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������� ������ ����� ��������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'PRG'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� �������������� - ���, ����� � �.�. YBQMWDG', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'ADP'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������� ������������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'LNG'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ���������� ��� �������������� (%)', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'DEV'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ���������� ��� �������������� (������)', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'DAD'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ����������: 01234', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'KNA'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'LLL'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������� ����������. ���������� ������� � ��������� ��� �������.
��������, UOMPEIZ = ����� (������ ��� ����� ��������� �������� ���������), ����� QTY ������� � �����������.
����������: ��������� ��� � ������������ �� �������������� ���������� EV_SYSEIZ ', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'��������. ���������� ��� ��������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'SAL'
EXEC sp_addextendedproperty 'MS_Description', N'��������. ���������� ��� ������������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'QTYMFC'
EXEC sp_addextendedproperty 'MS_Description', N'���������� � ������ ����', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'BGY'
EXEC sp_addextendedproperty 'MS_Description', N'����������� � ������ ����', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'REY'
EXEC sp_addextendedproperty 'MS_Description', N'������ � ������ ����', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'ISY'
EXEC sp_addextendedproperty 'MS_Description', N'������������� � ������ ����', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'ADY'
EXEC sp_addextendedproperty 'MS_Description', N'���������� � ������ �������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'BEG'
EXEC sp_addextendedproperty 'MS_Description', N'����������� � ������ �������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'REC'
EXEC sp_addextendedproperty 'MS_Description', N'������ � ������ �������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'ISS'
EXEC sp_addextendedproperty 'MS_Description', N'������������� � ������ �������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'ADJ'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ������: ���������� � ������ �������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FS_BEG'	
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ������: ����������� � ������ �������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FS_REC'	
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ������: ������ � ������ �������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FS_ISS'	
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ������: ���������� � ������ ����', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FS_BGY'	
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ������: ����������� � ������ ����', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FS_REY'	
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ������: ������ � ������ ����', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FS_ISY'	
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ������: ���� ��������������� ������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FS_DKD'	
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� �������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'DIS'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'MAD'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ��������������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'DTA'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ��� ��������� ��������������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'ADQ'
EXEC sp_addextendedproperty 'MS_Description', N'���� � ����� ��������� ���������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'DTE_NOR'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �� ������������� ��������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'OTV'
EXEC sp_addextendedproperty 'MS_Description', N'������ ����������� ���. ������: PD', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'OMP'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������: "1" - �� ��������������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ���� ������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'TAG'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'GRP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���(���) ��������: ������(D)\�������(I)\����(U)\���������(B)\��������(S)\��������(M)', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'TYP'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'DATESALDO'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ������ �� ������ ����', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'CEY'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ������ �� ������ �������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'CEJ'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������� ���������� �� ��������� ��� ������� (��. �������� QTY) � ��� �������� (UOMHEIZ)', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'HCNT'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������������: 1-�����������, 0- �� �����������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'ISACTIVE'
EXEC sp_addextendedproperty 'MS_Description', N'������?', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'CELL'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'COMMENT'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� ������ ��� OKP_WRHFOLDS.ID', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FOLD_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������� ������ ���', N'schema', N'dbo', N'table', N'OKP_INV', N'column', N'FOLD_DKD'
GO

--
-- Definition for table OKP_sysLogins : 
--

CREATE TABLE dbo.OKP_sysLogins (
  ID smallint NOT NULL,
  Modul varchar(100) COLLATE DATABASE_DEFAULT NULL,
  UserName varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
  LogDateTime datetime NOT NULL,
  HostName nchar(128) COLLATE DATABASE_DEFAULT NOT NULL,
  CONSTRAINT PK_OKP_sysLogins PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ������� ������������������ �������������', N'schema', N'dbo', N'table', N'OKP_sysLogins'
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
  CONSTRAINT PK_OKP_PLN PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ � ������������', N'schema', N'dbo', N'table', N'OKP_PLN'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', 'schema', 'dbo', 'table', 'OKP_PLN', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������������', 'schema', 'dbo', 'table', 'OKP_PLN', 'column', 'PRT$$$NOM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �����������', 'schema', 'dbo', 'table', 'OKP_PLN', 'column', 'USERFIO'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������ ������', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'QCYFLX'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������ ������', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'QCYMIN'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ������ ������', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'QCYMAX'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ������� ������', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'QCYRAT'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������ ��������', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'QCYDMN'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������� �������� � ����      =1', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'RTM'
EXEC sp_addextendedproperty 'MS_Description', N'����������������� ���', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'ABC'
EXEC sp_addextendedproperty 'MS_Description', N'������ ���������� ������', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'QCYSZP'
EXEC sp_addextendedproperty 'MS_Description', N'������ �����������', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'PMK'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������� ������������: YN', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'OBD'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������������ (�-�� ������������, Z-�� ������ �������)', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'KMU'
EXEC sp_addextendedproperty 'MS_Description', N'���� �����������', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'LTM'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'PRI'
EXEC sp_addextendedproperty 'MS_Description', N'O���������e ������:  FPLG  ', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'CMP'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� �� ��������� (���)', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'OJD'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������� �����', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'NAL'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����� ��������� - ������.����', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'OBR'
EXEC sp_addextendedproperty 'MS_Description', N'������ ���������� ������� � ���', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'FOB'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����.������ ���������', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'GOD'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������������� ������', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'OMP'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������������:  YN', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'TIN'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������������', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'EditDate'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������� ������ (0-�� �������, 1-������� �����, 2-������� �����)', N'schema', N'dbo', N'table', N'OKP_PLN', N'column', N'NRP'
EXEC sp_addextendedproperty N'MS_Description', '����������� �������','SCHEMA',N'dbo','TABLE',N'OKP_PLN','COLUMN',N'VI'
EXEC sp_addextendedproperty N'MS_Description', 'ID ������','SCHEMA',N'dbo','TABLE',N'OKP_PLN','COLUMN',N'GRP_ID'
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
EXEC sp_addextendedproperty 'MS_Description', N'������ � ������������ ������������', N'schema', N'dbo', N'table', N'OKP_MNF'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������������', N'schema', N'dbo', N'table', N'OKP_MNF', N'column', N'DEP'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'OKP_MNF', N'column', N'PRTIDN'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������� �������� ������', N'schema', N'dbo', N'table', N'OKP_MNF', N'column', N'TOZ'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������������� ������', N'schema', N'dbo', N'table', N'OKP_MNF', N'column', N'OMP'
EXEC sp_addextendedproperty 'MS_Description', N'������ �������� ������������������', N'schema', N'dbo', N'table', N'OKP_MNF', N'column', N'OPN'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������', N'schema', N'dbo', N'table', N'OKP_MNF', N'column', N'UPR'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� ������������ (1=����, 2 = ������) ', N'schema', N'dbo', N'table', N'OKP_MNF', N'column', N'PAK'
GO

/* @NAME:  OKP_NOM
** @DESCR: ������������
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
	SUMTRO float CONSTRAINT df__okp_nom__sumtro DEFAULT 0 NULL,
	SUMMOV float CONSTRAINT DF_OKP_NOM_SUMMOV DEFAULT 0 NULL,
	RELWEIGHT float NULL,
	WRH_IDN varchar(10) COLLATE DATABASE_DEFAULT NULL,
	ConfirmDate datetime CONSTRAINT DF_OKP_NOM_ConfirmDate DEFAULT getdate() NULL,
	RWC int IDENTITY(1, 1) NOT NULL,
	SUMBOM float CONSTRAINT df__okp_nom__sumbom DEFAULT 0 NOT NULL,
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
	IS_VALID bit CONSTRAINT DF__OKP_NOM__IS_VALID DEFAULT (1) NOT NULL,
	tmz_type_id INT NULL,
	status INT CONSTRAINT df__okp_nom__status DEFAULT(0) NOT NULL,
	CONSTRAINT PK_OKP_NOM PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'OKP_NOM'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'PRT$$$IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ��������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'NMP$$$NAM'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� ������������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'UOM$$$EIZ'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������� ��������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'PRC'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���� ��������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'TYP'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ������ � ���������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'LLC'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ���������� ������ ��������. �������� ������� � ������. 
���������� �� ������� �� ��������� ����� �������� ����������� ����� ������������ �������� � ������������ ����� ���������.', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'PermPeriod'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������� �� ����� ��������, ����� ��������� ��� ��������: 0 - ���, 1 - ��', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'PermControl'
EXEC sp_addextendedproperty 'MS_Description', N'�������.������� ������� ����������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'PRTFSTNOM'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'TDDOC'
EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'ROUTE'
EXEC sp_addextendedproperty 'MS_Description', N'����������� �������������-����������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'DEP$$$DEP'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ����������� (�/���)', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'SUMTRO'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������������� ����� (� �����)', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'SUMMOV'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ��� ��������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'RELWEIGHT'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ����� ��������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'WRH_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������������/�����������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'ConfirmDate'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ������������ ������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'SUMBOM'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'BYUSER'
EXEC sp_addextendedproperty 'MS_Description', N'������ ��� (� %)', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'NDS'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������������� �����������, �/���', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'SUMBOM_TRO'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� ������ ���������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'PRC_VO'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������� �������� �� �������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'PRC_st'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� ��������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'EIZ_S'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ����������� �� ��� ������������ � ��� ��������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'K'
EXEC sp_addextendedproperty 'MS_Description', N'����������� � ������������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'COMMENT'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'CREATE_USER'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'CREATE_DATE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'CHANGE_USER'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'CHANGE_DATE'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������ ������������', 'schema', 'dbo', 'table', 'OKP_NOM', 'column', 'GRP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'ESKIZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'IS_VALID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���� ���', N'schema', N'dbo', N'table', N'okp_nom', N'column', N'tmz_type_id'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'OKP_NOM', N'column', N'status'
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
	[Q�Y_RP] float NULL,
	[Q�Y_PN] float NULL,
	[Q�Y_ON] float NULL,
	[Q�Y_RK] float NULL,
	SCR float NULL,
	[Q�Y_BN] float NULL,
	DTEOBN datetime CONSTRAINT DF_OKP_ZPR_DTEOBN DEFAULT getdate() NULL,
	QTY_NK float NULL,
	QTY_KK float NULL,
	PRP int NULL,
	RWC bigint IDENTITY(1, 1) NOT NULL,
	CONSTRAINT PK_OKP_ZPR PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'OKP_ZPR'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'PRTIDN'
EXEC sp_addextendedproperty 'MS_Description', N'����� �����������', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'ZPR'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'OBR'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������� � �������������', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'VPP'
EXEC sp_addextendedproperty 'MS_Description', N'������ �������� � ������ �������', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'Q�Y_RP'
EXEC sp_addextendedproperty 'MS_Description', N'����������� � ������ �������', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'Q�Y_PN'
EXEC sp_addextendedproperty 'MS_Description', N'������� � ������ �������', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'Q�Y_ON'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ �������������', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'Q�Y_RK'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������������ �����', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'SCR'
EXEC sp_addextendedproperty 'MS_Description', N'���� � ������ �������', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'Q�Y_BN'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'DTEOBN'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������������', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'PRP'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ���������������� ����', N'schema', N'dbo', N'table', N'OKP_ZPR', N'column', N'RWC'
GO

/* @NAME: okp_cost_item
** @DESCR: ������ ������, ������� ���������� � ����������� �� �������� ManyToMany
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ������', N'schema', N'dbo', N'table', N'okp_cost_item'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'okp_cost_item', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'���', N'schema', N'dbo', N'table', N'okp_cost_item', N'column', N'idn'
EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'okp_cost_item', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'���', N'schema', N'dbo', N'table', N'okp_cost_item', N'column', N'Typ'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', 'schema', 'dbo', 'table', 'okp_cost_item', 'column', 'grp_id'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', 'schema', 'dbo', 'table', 'okp_cost_item', 'column', 'descr'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��� ��������� ������', 'schema', 'dbo', 'table', 'okp_cost_item', 'column', 'formula'
EXEC sp_addextendedproperty 'MS_Description', N'���������', 'schema', 'dbo', 'table', 'okp_cost_item', 'column', 'system'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ �����������', N'schema', N'dbo', N'table', N'OKP_STK'
GO
EXEC sp_addextendedproperty 'MS_Description', N'��� ������ ����������� ', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'STKIDN'
GO
EXEC sp_addextendedproperty 'MS_Description', N'��� ���� �������������', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'STKBAS'
GO
EXEC sp_addextendedproperty 'MS_Description', N'������ �����������', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'STV'
GO
EXEC sp_addextendedproperty 'MS_Description', N'������� �������', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'NRM'
GO
EXEC sp_addextendedproperty 'MS_Description', N'��������� �� ���������� ������', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'SNV'
GO
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'MET'
GO
EXEC sp_addextendedproperty 'MS_Description', N'0-�����, 1-�� �������', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'AFlag'
GO
EXEC sp_addextendedproperty 'MS_Description', N'��� ������', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'TZ'
GO
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������', N'schema', N'dbo', N'table', N'OKP_STK', N'column', N'DEP_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'���� ������������� ������', N'schema', N'dbo', N'table', N'OKP_ZatBase'
GO
EXEC sp_addextendedproperty 'MS_Description', N'��� ���� ������������� ������', N'schema', N'dbo', N'table', N'OKP_ZatBase', N'column', N'ZBaseCode'
GO
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ������������� ������', N'schema', N'dbo', N'table', N'OKP_ZatBase', N'column', N'ZBaseName'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ������', N'schema', N'dbo', N'table', N'OKP_ZatCodes'
GO
EXEC sp_addextendedproperty 'MS_Description', N'��� ������ ������', N'schema', N'dbo', N'table', N'OKP_ZatCodes', N'column', N'ZatCode'
GO
EXEC sp_addextendedproperty 'MS_Description', N'������������ ������ ������', N'schema', N'dbo', N'table', N'OKP_ZatCodes', N'column', N'ZatName'
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

EXEC sp_addextendedproperty 'MS_Description', N'���� �����', N'schema', N'dbo', N'table', N'OKP_UBR'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'NOS'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� ���� � �����', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������������-������������, nil -  �������, �������� ����������. ', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'DEPDOB'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �� ������������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'WCRWCT'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������������ ������������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'ZPRZOB'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� ������������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'NOPNOB'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������������ �������������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'ZPRZOZ'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� �������������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'NOPNOW'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� �����', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'KBR'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� ����������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'REJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� �����', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'VINDEP'
EXEC sp_addextendedproperty 'MS_Description', N'�����, ���������� � ���������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'PRCSVN'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ����������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'SEBSVO'
EXEC sp_addextendedproperty 'MS_Description', N'������� (�������� ��������)', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'SEBZMT'
EXEC sp_addextendedproperty 'MS_Description', N'������� (��������)', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'SEBZZT'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'QTYBQY'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� �����', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'RetDTE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������������� ������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'ZATID'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����� 0-�������������, 1-���������������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'RETRIEVABLE'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �������� ���������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'NAMENOW'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �������� ������������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'NAMENOB'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� ��������������� ��������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'SEBZMV'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� �������� �� ����������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'SEBZMK'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� ������ �� ����������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'SEBZZK'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� ��������: '''' - �������� ������, ''3'' - ������������� ������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� toz', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'Rwc_toz'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� cpl', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'rwc_cpl'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'TZ'
EXEC sp_addextendedproperty 'MS_Description', N'���������	�����', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'Tab'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'FIO_K'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� �����������', 'schema', 'dbo', 'table', 'OKP_UBR', 'column', 'SEBZI'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������� �� �������� ���������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'SEBZZT_v'
EXEC sp_addextendedproperty 'MS_Description', N'K�������� �������', N'schema', N'dbo', N'table', N'OKP_UBR', N'column', N'SEBZKOS'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���� �����', N'schema', N'dbo', N'table', N'okp_ubr', N'column', N'eskiz_id'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'okp_ubr', N'column', N'REM'
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

EXEC sp_addextendedproperty 'MS_Description', N'���� ����� �� ��������������', N'schema', N'dbo', N'table', N'OKP_UBRDEP'
EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����� ����', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'N_Act'
EXEC sp_addextendedproperty 'MS_Description', N'������� (�������� ��������)', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'SEBZMT'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� ��������������� ��������', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'SEBZMV'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� �������� �� ����������', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'SEBZMK'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� �����������', 'schema', 'dbo', 'table', 'OKP_UBRDEP', 'column', 'SEBZI'
EXEC sp_addextendedproperty 'MS_Description', N'������� (��������)', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'SEBZZT'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� ������ �� ����������', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'SEBZZK'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ����������', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'SEBSVO'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������������', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'DEP_Id'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �������', N'schema', N'dbo', N'table', N'OKP_UBRDEP', N'column', N'SEBZKOS'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������ ������������� �� ��������', N'schema', N'dbo', N'table', N'OKP_WRH_DEP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����', N'schema', N'dbo', N'table', N'OKP_WRH_DEP', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����� OKP_WRH.WRH_ID', N'schema', N'dbo', N'table', N'OKP_WRH_DEP', N'column', N'WRH_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������� (OKP_DEP.RWC)', N'schema', N'dbo', N'table', N'OKP_WRH_DEP', N'column', N'DEP_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ��������� �� ������������', N'schema', N'dbo', N'table', N'OKP_RAM'
EXEC sp_addextendedproperty 'MS_Description', N'�������������-������������', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'DEP'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����������', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'PRTIDN'
EXEC sp_addextendedproperty 'MS_Description', N'����p ������', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����������', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'���� p������', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'��� �p�������������� ���p��', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'CPZ'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �p����������� ����������', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'QTYRQY'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �p����������� ����������', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'QTYINR'
EXEC sp_addextendedproperty 'MS_Description', N'��� �p����� ����������', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'PRO'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� ����������', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'VIN'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ��������� �� �����', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'QTYPOL'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� (����� � OKP_UOP)', N'schema', N'dbo', N'table', N'OKP_RAM', N'column', N'NOS'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ (��������)', N'schema', N'dbo', N'table', N'OKP_Order'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ �� ������ (�����)', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'Order_Count'
EXEC sp_addextendedproperty 'MS_Description', N'����', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������������', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'PRT$$$NOM'
EXEC sp_addextendedproperty 'MS_Description', N'������ ��������', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'���', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������, �/�', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'GRADRATE'
EXEC sp_addextendedproperty 'MS_Description', N'����������', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'QTYGQY'
EXEC sp_addextendedproperty 'MS_Description', N'���������, �/�', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'TOTTIME'
EXEC sp_addextendedproperty 'MS_Description', N'�����, ���.', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'TOTSUM'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����� ��������', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'NOS'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_Order', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������', N'schema', N'dbo', N'table', N'OKP_ORDER', N'column', N'DEP_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'������������� ������������', N'schema', N'dbo', N'table', N'OKP_NZP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� �������������', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'DEP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������ 11122122', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'TYP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ������������', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'ZPR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'CPLNUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ������', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'CQY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������ 1-14', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'VID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ������', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'SEB'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ���������������� ������', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'CPZ'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ������', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'VQY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� ���������', N'schema', N'dbo', N'table', N'OKP_NZP', N'column', N'DTE'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ (�����)', N'schema', N'dbo', N'table', N'OKP_OrderSum'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_OrderSum', N'column', N'Order_Count'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������������', N'schema', N'dbo', N'table', N'OKP_OrderSum', N'column', N'Date_form'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������ �������', N'schema', N'dbo', N'table', N'OKP_OrderSum', N'column', N'Date_begin'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� �������', N'schema', N'dbo', N'table', N'OKP_OrderSum', N'column', N'Date_end'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_OrderSum', N'column', N'TotSum'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_OrderSum', N'column', N'Order_S'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������', N'schema', N'dbo', N'table', N'OKP_OrderSum', N'column', N'UserId'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����������', N'schema', N'dbo', N'table', N'OKP_OrderSum', N'column', N'fio_id'
GO

/*
** ���������� �����������
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
	CONSTRAINT PK_OKP_FIO PRIMARY KEY CLUSTERED (TBLIDN)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_FIO'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �����', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'TBLIDN'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'NMFNAM'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'PRFIDN'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'Dis_Date'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���������� � OKP_FILES', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'ID_PHOTO'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'DTE_HIRING'
EXEC sp_addextendedproperty 'MS_Description', N'������ � ��������������� (������ �� OKP_DOC.ID)', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'ID_DOC_HIRING'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���������� (������ �� OKP_DOC.ID)', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'ID_DOC_DIS'
EXEC sp_addextendedproperty 'MS_Description', N'���', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'INN'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������ ��������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'DTE_ISSUED'
EXEC sp_addextendedproperty 'MS_Description', N'������� �����', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'PASS_ISSUED'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'PASS_NUM'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'PASS_SERIES'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������������, ��������� �������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'PASS_KP'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'REG_ADDRESS'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'PLACE_OF_BURN'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'DTE_BURN'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'PASS'
EXEC sp_addextendedproperty 'MS_Description', N'0 - ������ �� �������, 1 - �� ������-��������� �������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'WORK_BY_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'������������� (OKP_FIO.RWC) ����������� ���� �������� ����� ��������� ������ ', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'TRUSTED'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �� ���� �������� �� ���������� � ������� ���������� �� ������', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'AUTOGIVE'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �� ���� ��� ��� (������������)', N'schema', N'dbo', N'table', N'OKP_FIO', N'column', N'self_control'
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

EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_DEP'
EXEC sp_addextendedproperty 'MS_Description', N'ID', N'schema', N'dbo', N'table', N'OKP_DEP', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'����������� �������������', N'schema', N'dbo', N'table', N'OKP_DEP', N'column', N'DEP'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �������������', N'schema', N'dbo', N'table', N'OKP_DEP', N'column', N'NMDNAM'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������������', N'schema', N'dbo', N'table', N'OKP_DEP', N'column', N'PER'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_DEP', N'column', N'PRODTYPE'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'OKP_DEP', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_DEP', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_DEP', N'column', N'GRP_ID'
GO

/* @NAME:  OKP_PRF_DEP
** @DESCR: ��������� � ��������������
*/
CREATE TABLE OKP_PRF_DEP (
	ID int NOT NULL identity(1,1),
	DEP_ID int NOT NULL,
	PRF_ID int NOT NULL,
	CONSTRAINT PK_OKP_PRF_DEP PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� � ��������������', N'schema', N'dbo', N'table', N'OKP_PRF_DEP'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����', 'schema', 'dbo', 'table', 'OKP_PRF_DEP', 'column', 'ID';
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������', 'schema', 'dbo', 'table', 'OKP_PRF_DEP', 'column', 'DEP_ID';
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������', 'schema', 'dbo', 'table', 'OKP_PRF_DEP', 'column', 'PRF_ID';
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

EXEC sp_addextendedproperty 'MS_Description', N'������ �������', N'schema', N'dbo', N'table', N'OKP_BOM'
EXEC sp_addextendedproperty 'MS_Description', N'����������� �������� �������������', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'PRTPARNOM'
EXEC sp_addextendedproperty 'MS_Description', N'����������� �������� ����������', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'PRTCHLNOM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����������', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'QTY_PC'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��� ����������', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'UOMCHLEIZ'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'KSP'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ���������', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'PRTALTNOM'
EXEC sp_addextendedproperty 'MS_Description', N'����������� �������� �������������', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'QTYFAC'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������� (������ ������������)', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'RAZ'
EXEC sp_addextendedproperty 'MS_Description', N'����������� �������������-�����������', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'DEP$$$IDN'
EXEC sp_addextendedproperty 'MS_Description', N'����������', N'schema', N'dbo', N'table', N'OKP_BOM', N'column', N'COMMENT'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'okp_bom', N'column', N'form'
EXEC sp_addextendedproperty 'MS_Description', N'����', N'schema', N'dbo', N'table', N'okp_bom', N'column', N'area'
EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'okp_bom', N'column', N'position'
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


EXEC sp_addextendedproperty 'MS_Description', N'����� ������� ������� � �������', N'schema', N'dbo', N'table', N'OKP_BufLog'
EXEC sp_addextendedproperty 'MS_Description', N'���� � ����� �������� ������ � ������', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'LOGDateTime'
GO

EXEC sp_addextendedproperty 'MS_Description', N'SQL-������������� ������������', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'UserID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ������������', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'UserName'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ����������', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'CompName'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� ������: 
T - �������� 
A - ����� 
P - �������� 
D - ��������� 
R - ����� 
S - ����� 
M - ������������ 
E - ��������� 
C - UpdateStatuses (������� �� �������) 
B - RecalcBalans (������� �� �������) ', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'Modul'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'TblName'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������������� ��������: 
Update - ���������� ��������� ������� 
Delete - �������� �� ��������� ������� 
Insert - ������� � ��������� ������� ', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'Act'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������������� ��������', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'Mess'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ���������������� �������� (����� � �������� �������, ��������������� �������)', N'schema', N'dbo', N'table', N'OKP_BufLog', N'column', N'Params'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ����������� ����', N'schema', N'dbo', N'table', N'OKP_CFREE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� ����', N'schema', N'dbo', N'table', N'OKP_CFREE', N'column', N'FREEDATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'OKP_CFREE', N'column', N'MET'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ����������', N'schema', N'dbo', N'table', N'OKP_CGM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_CGM', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������ (OKP_NOM.RWC)', N'schema', N'dbo', N'table', N'OKP_CGM', N'column', N'NOM_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� �����������', N'schema', N'dbo', N'table', N'OKP_CGM', N'column', N'IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ������� ���������� ���������� �����������', N'schema', N'dbo', N'table', N'OKP_CGM', N'column', N'QTYMin'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ������� ���������� ���������� �����������', N'schema', N'dbo', N'table', N'OKP_CGM', N'column', N'QTYMax'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ����������� 
  0 - �� ��������� 
  1 - ��������� ', N'schema', N'dbo', N'table', N'OKP_CGM', N'column', N'STATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ����������� (��������, ����������)', N'schema', N'dbo', N'table', N'OKP_CGM', N'column', N'Describe'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������� ����������', N'schema', N'dbo', N'table', N'OKP_CGMData'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� "������������" ������ (OKP_CGMData.ID)', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'IDP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������� �����������', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'CGM_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������ (OKP_NOM.RWC)', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'NOM_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'"����" �������� ��������', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'NOM_IDX'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ���������: 
0 - ������ ������ � ������ �����������
1 - ������ ��������� �� ������� � ���������� � �����������
2 - ������ ��������� �� ������� � ���������� � �����
3 - ������ ��������� �� �������', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'SHIFT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ������������ ������������ NOM_ID', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'DB'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ������������ ������������ NOM_ID', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'DE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� (OKP_ROUTES.ID)', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'ROUTE_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� �� ������� "��������" �������', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'QTY_PC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� �� ������� "��������" �������', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'QTY_PCO'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'PlanType'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ������������ ������', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'PartySize'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������, ���������/���������� ������ (OKP_USERS.USER_ID)', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'USER_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ���� ���������', N'schema', N'dbo', N'table', N'OKP_CGMData', N'column', N'DEC'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� ���������� ���', N'schema', N'dbo', N'table', N'OKP_CONTACT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_CONTACT', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���������� ���� (OKP_PERSON.ID)', N'schema', N'dbo', N'table', N'OKP_CONTACT', N'column', N'PERSON_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ ��������. ��������, "��������� �������", "������� �������", "������� �����", "������ �����" � � .�.', N'schema', N'dbo', N'table', N'OKP_CONTACT', N'column', N'NAME'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ��������:
 1 - �������,
 2 - �����,
 3 - E-mail', N'schema', N'dbo', N'table', N'OKP_CONTACT', N'column', N'TYP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� (��������) ��������. ��������, ���������� ����� � �.�.', N'schema', N'dbo', N'table', N'OKP_CONTACT', N'column', N'VALUE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����: 1 - �������� �������, 0 - ��������������', N'schema', N'dbo', N'table', N'OKP_CONTACT', N'column', N'IsBase'
GO

/*
** @DESCR: ��������
** @Comm:  1. ���� CTR_CONTRACT_ID �������� ���������� �������� ������� OKP_CTR_CONTRACT, ����� ��������� ������ API
**            ���� ����� ��������, ���� ���� ��������������� ����� ����� CTR � CONTRACT �� ������ �������� OKP_CTR_CONTRACT
**            ������ ��� �������� � ������������ � API. ��� ����� ������� � OKP_CONTRACT ������������ ����� ID.
**            ����� �������, ����� ���������� ����������, ��� ������ API �� ���������
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
	IsBase bit CONSTRAINT DF_OKP_CONTRACT_ISBASE DEFAULT(0) NOT NULL,
	CTR_ID int,
	CTR_CONTRACT_ID int NULL,
	CURRENCY_ID int NULL,
	CONSTRAINT PK_CONTRACT PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_CONTRACT'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������� �����������', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'GRP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'���', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'TPD'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'OPL'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'DTE_CT'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ��������', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'DTE_FN'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������� ������', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'DTE_CR'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� � ��������', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'IsBase'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����������', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'CTR_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����� ����������� � ��������', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'CTR_CONTRACT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ������', N'schema', N'dbo', N'table', N'OKP_CONTRACT', N'column', N'CURRENCY_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ��������� �� �����', N'schema', N'dbo', N'table', N'OKP_CONTRACT_FILES'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ����� (OKP_FILES.ID)', N'schema', N'dbo', N'table', N'OKP_CONTRACT_FILES', N'column', N'FILE_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������� ��������� ��� � ��������� ��', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������� ���', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'CPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��� ������ ��������� ���������', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'CPLPARENT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����� ��', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'PPP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �� ������ ����������� ���������', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'PPPParent_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������� ���', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��� ������ ��������� ���������', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'NUMPARENT'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����� ��', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'����� �� ������ ��������� ���������', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'PPPNUMParent'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'EXTR_DATE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� ���������', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'EXTR_BY'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �� ��������� OKP_POT.RWC', N'schema', N'dbo', N'table', N'OKP_CPLEXTRACTED', N'column', N'POT_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ������� ���', N'schema', N'dbo', N'table', N'OKP_CPLLOG'
EXEC sp_addextendedproperty 'MS_Description', N'RWC ���', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'CPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'RWC ��', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'PPP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'CHANGEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'IDN ���', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'IDN ��', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'UserName'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'Comment'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����������', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'HostName'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'OKP_CPLLOG', N'column', N'MODUL'
GO

/* @NAME:  OKP_CTR
** @DESCR: �����������
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
	IsConsignee bit CONSTRAINT DF_OKP_ISCONSIGNEE DEFAULT(0) NOT NULL,
	OGRN varchar(30) COLLATE DATABASE_DEFAULT NULL,
	CONSTRAINT PK_OKP_CTR PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_CTR'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'NAM'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'��� (0 - �� ����������, 1 - ����������� ����, 2 - ���������� ����)', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'KIND'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'GRP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�����', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'ADDR'
EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'PHONE'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������) ��� 0 - ������������', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'���� � ����� �����������', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������� �����������', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'OWNER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������������', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'IsConsignee'
EXEC sp_addextendedproperty 'MS_Description', N'����', N'schema', N'dbo', N'table', N'OKP_CTR', N'column', N'OGRN'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ����, ������������ �� ������� ��� �����������, �� ����������� ��������', N'schema', N'dbo', N'table', N'OKP_CWORK'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ����, ������������ �� ���/���', N'schema', N'dbo', N'table', N'OKP_CWORK', N'column', N'WORKDATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'OKP_CWORK', N'column', N'MET'
GO

/*
** OKP_DataExport
*/
CREATE TABLE dbo.OKP_DataExport (
	UID uniqueidentifier CONSTRAINT df__okp_dataexport__uid DEFAULT newid() NOT NULL,
	Name varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	Comment varchar(255) COLLATE DATABASE_DEFAULT NULL,
	Query ntext COLLATE DATABASE_DEFAULT CONSTRAINT df__okp_dataexport__query DEFAULT '' NOT NULL,
	RepUID uniqueidentifier NULL,
	RWC bigint IDENTITY(1, 1) NOT NULL,
	IMAGE_ID int NULL,
	CONSTRAINT PK_OKP_DataExport PRIMARY KEY CLUSTERED (RWC)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ��������� �������� ������', N'schema', N'dbo', N'table', N'OKP_DataExport'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������� ', N'schema', N'dbo', N'table', N'OKP_DataExport', N'column', N'UID'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������� ��������', N'schema', N'dbo', N'table', N'OKP_DataExport', N'column', N'Name'
EXEC sp_addextendedproperty 'MS_Description', N'���������� � ��������', N'schema', N'dbo', N'table', N'OKP_DataExport', N'column', N'Comment'
EXEC sp_addextendedproperty 'MS_Description', N'SQL ������� ��������', N'schema', N'dbo', N'table', N'OKP_DataExport', N'column', N'Query'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� ������', N'schema', N'dbo', N'table', N'OKP_DataExport', N'column', N'RepUID'
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

EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������� �������� ������', N'schema', N'dbo', N'table', N'OKP_DataExportParameters'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� ��������', N'schema', N'dbo', N'table', N'OKP_DataExportParameters', N'column', N'DataExpUID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������', N'schema', N'dbo', N'table', N'OKP_DataExportParameters', N'column', N'ParamType'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������', N'schema', N'dbo', N'table', N'OKP_DataExportParameters', N'column', N'ParamAdditional'
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

EXEC sp_addextendedproperty 'MS_Description', N'SQL-�������� ��� ��������� ����������������� ������������� (IDN) ������ �����������
  ��������, 
    select UOMIDN+'' - ''+NAENAM from OKP_EIZ where RWC = [ID], ���
  [ID] - �������� �������,������������ ���������� ������������� ������ �����������
  ', N'schema', N'dbo', N'table', N'OKP_Directories', N'column', N'GetIDNCommand'
EXEC sp_addextendedproperty 'MS_Description', N'OKP_SYSOBJECTS.ID', N'schema', N'dbo', N'table', N'OKP_DIRECTORIES',  N'column', N'SYSOBJ_ID'
EXEC sys.sp_addextendedproperty 
  @name=N'MS_Description', 
  @value=N'������������� ��������� ����������� (������������� ��������� ��������� � �������� ���� �������)', 
  @level0type=N'SCHEMA',  @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'OKP_Directories', @level2type=N'COLUMN', @level2name=N'UID'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������', N'schema', N'dbo', N'table', N'OKP_DIRECTORIES',  N'column', N'HINT_TITLE'
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

EXEC sp_addextendedproperty 'MS_Description', N'���������', N'schema', N'dbo', N'table', N'OKP_DOC'
GO
EXEC sp_addextendedproperty 'MS_Description', N'����������������� ��� ���������', N'schema', N'dbo', N'table', N'OKP_DOC', N'column', N'ID'
GO
EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������', 'schema', 'dbo', 'table', 'OKP_DOC', 'column', 'IDN$$$DOC';
GO
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������', 'schema', 'dbo', 'table', 'OKP_DOC', 'column', 'NAMDOC';
GO
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', 'schema', 'dbo', 'table', 'OKP_DOC', 'column', 'GRP_ID';
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ���������� �������', N'schema', N'dbo', N'table', N'OKP_DOCs'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ���������', N'schema', N'dbo', N'table', N'OKP_DOCs', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ���������', N'schema', N'dbo', N'table', N'OKP_DOCs', N'column', N'IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� �������� (��������������)', N'schema', N'dbo', N'table', N'OKP_DOCs', N'column', N'DTE_CR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� �������� (������)', N'schema', N'dbo', N'table', N'OKP_DOCs', N'column', N'DTE_DR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ������������ (OKP_USERS.USER_ID)', N'schema', N'dbo', N'table', N'OKP_DOCs', N'column', N'USER_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ������  (OKP_GROUPS.ID)', N'schema', N'dbo', N'table', N'OKP_DOCs', N'column', N'GRP_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ���� ������� (��. ������� OKP_sysObjects)', N'schema', N'dbo', N'table', N'OKP_DOCs', N'column', N'ObjectTypeID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ������ (��� ���������)', N'schema', N'dbo', N'table', N'OKP_DOCs', N'column', N'MET'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ������������� ������� (DepartmentStock Transfer)', N'schema', N'dbo', N'table', N'OKP_DST'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� DST', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� (IntFormat)', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'DT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� ���/MM-��-WRH_IDN', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'DSTNUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� - �����������', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'DEP_SENDER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� - ���������� (WRH_IDN)', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'WRH_RECEIVER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'CREATEBY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'CREATEDATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� �� �����', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'INTNUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'0-�����, 1-����������, 2-�������', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'STATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������� "1 ����������"', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'STATE1DATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������� "2 �������"', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'STATE2DATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ���������� ������ "1 ����������"', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'STATE1BY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ���������� ������ "2 �������"', N'schema', N'dbo', N'table', N'OKP_DST', N'column', N'STATE2BY'
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

EXEC sp_addextendedproperty 'MS_Description', N'�������� ��������� "������� �������� �� �����"', N'schema', N'dbo', N'table', N'OKP_DST_ELEM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� DST', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'DST_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ��� ��������', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������-���������', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'TOZ_RWC_SENDER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'CREATEBY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ������������', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'CREATEDATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������� �� ����� ���������� �� ������� ������ ���������', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'QTY_R'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������� ��������� ������ �� �����', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'RECEIVEBY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������ �� �����', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'RECEIVEDATA'
GO

EXEC sp_addextendedproperty N'MS_Description', N'��������������� ���� �������������', 'schema', 'dbo', 'table', 'OKP_DST_ELEM', 'column', 'UID'
go

EXEC sp_addextendedproperty 'MS_Description', N'������ QTY_R', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'Fold_I'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ RECEIVEDATA', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'Fold_D'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ RECEIVEBY', N'schema', N'dbo', N'table', N'OKP_DST_ELEM', N'column', N'Fold_U'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ��� ������������ �������', N'schema', N'dbo', N'table', N'OKP_EskizList'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID �������', N'schema', N'dbo', N'table', N'OKP_EskizList', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ����� (������)', N'schema', N'dbo', N'table', N'OKP_EskizList', N'column', N'Filename'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� �����', N'schema', N'dbo', N'table', N'OKP_EskizList', N'column', N'Data'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� ������������', N'schema', N'dbo', N'table', N'OKP_EskizList', N'column', N'RWC_toz'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ������', N'schema', N'dbo', N'table', N'OKP_EskizList', N'column', N'Flag'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ������ �� ������� �����', N'schema', N'dbo', N'table', N'OKP_EskizList', N'column', N'Puth'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ������������', N'schema', N'dbo', N'table', N'OKP_EskizList', N'column', N'UserId'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ���������������� ������', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST', N'column', N'DATECREATION'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST', N'column', N'CREATOR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'RWC �������� �������', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST', N'column', N'PPPNUM_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'RWC CPL', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST', N'column', N'CPLNUM_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ : 1-�����������, 0 - �����������', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST', N'column', N'STATUS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� �������������', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST', N'column', N'DATENULLIFICATION'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������������', N'schema', N'dbo', N'table', N'OKP_ESKORTLIST', N'column', N'NULLIFICATOR'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ����������� ��������', N'schema', N'dbo', N'table', N'OKP_FILTERS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID �������', N'schema', N'dbo', N'table', N'OKP_FILTERS', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������� ����� ���������� �������', N'schema', N'dbo', N'table', N'OKP_FILTERS', N'column', N'PLACE_UID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ������������-������� �������, Null - ������ ������ ����������', N'schema', N'dbo', N'table', N'OKP_FILTERS', N'column', N'user_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ ��� �������', N'schema', N'dbo', N'table', N'OKP_FILTERS', N'column', N'FILTERNAME'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ������������� �������', N'schema', N'dbo', N'table', N'OKP_FILTERS', N'column', N'LASTUSEDATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� �������', N'schema', N'dbo', N'table', N'OKP_FILTERS', N'column', N'FILTERBODY'
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

EXEC sp_addextendedproperty 'MS_Description', N'���������� ������ �����������', N'schema', N'dbo', N'table', N'OKP_FIO_CONTACTS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ����������', N'schema', N'dbo', N'table', N'OKP_FIO_CONTACTS', N'column', N'ID_FIO'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ ��������. ��������, "��������� �������", "������� �������", "������� �����", "������ �����" � � .�.', N'schema', N'dbo', N'table', N'OKP_FIO_CONTACTS', N'column', N'NAME'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ��������:
   1 - �������,
   2 - �����,
   3 - E-mail,
   4 - ICQ
   5 - Skype 
   6 - ���. ����
   7 - ������', N'schema', N'dbo', N'table', N'OKP_FIO_CONTACTS', N'column', N'TYP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_FIO_CONTACTS', N'column', N'VALUE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_FIO_CONTACTS', N'column', N'IsBase'
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
	IsSystem bit CONSTRAINT DF_OKP_GROUPS_IsSystem DEFAULT (0) NULL,
	CONSTRAINT PK_OKP_GROUPS PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ��������', N'schema', N'dbo', N'table', N'OKP_GROUPS'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_GROUPS', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ������', N'schema', N'dbo', N'table', N'OKP_GROUPS', N'column', N'P_GROUPS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ������', N'schema', N'dbo', N'table', N'OKP_GROUPS', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ����������', N'schema', N'dbo', N'table', N'OKP_GROUPS', N'column', N'INFO'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ������', N'schema', N'dbo', N'table', N'OKP_GROUPS', N'column', N'SYSOBJECTS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_GROUPS', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ ������', N'schema', N'dbo', N'table', N'OKP_GROUPS', N'column', N'FILES_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ ���������', N'schema', N'dbo', N'table', N'OKP_GROUPS', N'column', N'IsSystem'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������ �� ��������������', N'schema', N'dbo', N'table', N'OKP_InventoryData'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� �������������� (OKP_TRNDOC.ID) ', N'schema', N'dbo', N'table', N'OKP_InventoryData', N'column', N'INVENTORY_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��� (OKP_INV.ID) ', N'schema', N'dbo', N'table', N'OKP_InventoryData', N'column', N'INV_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������� �������� (OKP_WRH_SUBJECTS.ID) ', N'schema', N'dbo', N'table', N'OKP_InventoryData', N'column', N'SUB_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� �� �����. ���������� ������� � ��������� ��� ������� (��. �������� OKP_INV.QTY) ', N'schema', N'dbo', N'table', N'OKP_InventoryData', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� �� �����. ���������� ������� � ��������� ��� ������� (��. �������� OKP_INV.QTY) ', N'schema', N'dbo', N'table', N'OKP_InventoryData', N'column', N'QTY_OLD'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ������� � ��������� ��� ������� (��. �������� OKP_INV.PRC) ', N'schema', N'dbo', N'table', N'OKP_InventoryData', N'column', N'PRC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ���������: 0 - ����� � ��������������, 1 - ���������� �� �������������� ', N'schema', N'dbo', N'table', N'OKP_InventoryData', N'column', N'State'
GO

/*
** OKP_INVGRP
*/
CREATE TABLE dbo.OKP_INVGRP (
	GRP_ID int IDENTITY(1, 1) NOT NULL,
	WRH_WRH int NOT NULL,
	PARNT_GRP_ID int NULL,
	GRP_NAME varchar(50) COLLATE DATABASE_DEFAULT CONSTRAINT df__okp_invgrp__grp_name DEFAULT '����� ������' NOT NULL,
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ���������� ������� (InterPlant Transfer)', N'schema', N'dbo', N'table', N'OKP_IPT'
EXEC sp_addextendedproperty 'MS_Description', N'������������� IPT', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� (IntFormat)', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'DT'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� ���/MM-��-DEP', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'IPTNUM'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ��������� �� �����', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'INTNUM'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������-�����������', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'DEP_ID_SENDER'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������-����������', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'DEP_ID_RECEIVER'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'CREATEBY'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'CREATEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'0-�����, 1-����������, 2-�������', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'STATE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������� "1 ����������"', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'STATE1DATE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������� "2 �������"', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'STATE2DATE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������� ������ "1 ����������"', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'STATE1BY'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������� ������ "2 �������"', N'schema', N'dbo', N'table', N'OKP_IPT', N'column', N'STATE2BY'
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

EXEC sp_addextendedproperty 'MS_Description', N'�������� ��������� "���������� ��������"', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� IPT', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'IPT_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ��� ��������', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������-���������', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'TOZ_RWC_SENDER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������-���������', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'TOZ_RWC_RECEIVER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'CREATEBY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ������������', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'CREATEDATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ������
0- �����������
1- �������� ������
2- ��������� ������', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'STATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������������� �������� ���������� ����� �������� � ������ "�������"', N'schema', N'dbo', N'table', N'OKP_IPT_ELEM', N'column', N'QTY_CLOSED'
GO

EXEC sp_addextendedproperty N'MS_Description', N'��������������� ���� �������������', 'schema', 'dbo', 'table', 'OKP_IPT_ELEM', 'column', 'UID'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������ �������� ���������� �������', N'schema', N'dbo', N'table', N'OKP_IPT_RECEIVE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��', N'schema', N'dbo', N'table', N'OKP_IPT_RECEIVE', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� ��������� ���������� ��������', N'schema', N'dbo', N'table', N'OKP_IPT_RECEIVE', N'column', N'IPT_ELEM_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ��������������� ������', N'schema', N'dbo', N'table', N'OKP_IPT_RECEIVE', N'column', N'QCY_RECEIVE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'OKP_IPT_RECEIVE', N'column', N'RECEIVEBY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� �������', N'schema', N'dbo', N'table', N'OKP_IPT_RECEIVE', N'column', N'RECEIVEDATA'
GO

EXEC sp_addextendedproperty N'MS_Description', N'��������������� ���� �������������', 'schema', 'dbo', 'table', 'OKP_IPT_RECEIVE', 'column', 'UID'  
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

EXEC sp_addextendedproperty 'MS_Description', N'������ �������������� �������������', N'schema', N'dbo', N'table', N'OKP_IPTDEPS'
EXEC sp_addextendedproperty 'MS_Description', N'��', N'schema', N'dbo', N'table', N'OKP_IPTDEPS', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������-�����������', N'schema', N'dbo', N'table', N'OKP_IPTDEPS', N'column', N'DEP_ID_SENDER'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������-����������', N'schema', N'dbo', N'table', N'OKP_IPTDEPS', N'column', N'DEP_ID_RECEIVER'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_IPTDEPS', N'column', N'CREATEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ����� �����', N'schema', N'dbo', N'table', N'OKP_IPTDEPS', N'column', N'can_use_wrh'
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

EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_KIM'
GO  
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���', N'schema', N'dbo', N'table', N'OKP_KIM', N'column', N'PRTIDN'
GO  
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_KIM', N'column', N'DEP'
GO
EXEC sp_addextendedproperty 'MS_Description', N'���� K��', N'schema', N'dbo', N'table', N'OKP_KIM', N'column', N'PRC'
GO
EXEC sp_addextendedproperty 'MS_Description', N'���� �������������� ���', N'schema', N'dbo', N'table', N'OKP_KIM', N'column', N'Date_KIM'
GO
EXEC sp_addextendedproperty 'MS_Description', N'��������� ����-�������', N'schema', N'dbo', N'table', N'OKP_KIM', N'column', N'RWC'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ������� � �������', N'schema', N'dbo', N'table', N'OKP_Logs'
EXEC sp_addextendedproperty 'MS_Description', N'���� � ����� �������� ������ � ������', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'LOGDateTime'
EXEC sp_addextendedproperty 'MS_Description', N'SQL-������������� ������������', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'UserID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������������', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'UserName'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����������', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'CompName'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������:
T - ��������
A - �����
P - ��������
D - ���������
R - �����
S - �����
M - ������������
E - ���������
C - UpdateStatuses (������� �� �������)
B - RecalcBalans (������� �� �������)
I - ������ �������', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'Modul'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'TblName'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������������� ��������: 
Update - ���������� ��������� ������� 
Delete - �������� �� ��������� ������� 
Insert - ������� � ��������� ������� ', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'Act'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������������� ��������', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'Mess'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ���������������� �������� (����� � �������� �������, ��������������� �������)', N'schema', N'dbo', N'table', N'OKP_Logs', N'column', N'Params'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ���������������� ���������', N'schema', N'dbo', N'table', N'OKP_Messages'
EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_Messages', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������� ���������. ������ ������� �� ���� ������: 
 <000-00> 
 1) ������ ��������� (3 �����) 
 2) ����� ��������� � ������ (2 �����) 
������: 001-01', N'schema', N'dbo', N'table', N'OKP_Messages', N'column', N'IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', 
N'
�������� ����� ���������. ����������� ��� ������ ��������� � ������ �������
� ��������� ������ (����������), ����� ��� ���� �������, � ������ ���������.
�������� ���������� ����������� �������� � ������� �� ���� ������: 
 1) ��� ��������� (������ �� ������, ��������������� � ���� PARAMS) 
 2) ����������� ���� ��������� (":") 
 3) ����: 1 = � ������ ������� ������ ��� ��������� 
          2 = � ������ ������� ������ �������� ��������� 
          3 = � ������ ������� � ��� � �������� ��������� 
������: "������ ����� ��������� [TMC:2] ������ ����� ��������� [Nal:3]" 
', 
'schema', 'dbo', 'table', 'OKP_Messages', 'column', 'Mess'
GO

EXEC sp_addextendedproperty 'MS_Description', 
N'
����������� ����� ���������. ����������� ��� ������ ��������� � ���������
������ � ��������� � �������� ������ (����������) � ������ ���������.
�������� ���������� ����������� �������� � ������� �� ���� ������: 
 1) ��� ��������� (������ �� ������, ��������������� � ���� PARAMS) 
 2) ����������� ���� ��������� (":") 
 3) ����: 1 = � ������ ������� ������ ��� ��������� 
          2 = � ������ ������� ������ �������� ��������� 
          3 = � ������ ������� � ��� � �������� ��������� 
������: "������ ����� ��������� [TMC:2] ������ ����� ��������� [Nal:3]" 
', 
'schema', 'dbo', 'table', 'OKP_Messages', 'column', 'MessExt'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ���������. ��������� ������������� ����� ����� � ������� (";"). 
������ �������� ������� �� ���� ������ ����������� ���������� (":"): 
 1) ��� ��������� 
 2) �������� ��������� 
 3) ������������� ��������� ��������� � ����� ������ (0 - �� ����������; 1 - ����������)
������: TMC:�������-������������ ��������:0;Nal:� �������:1', N'schema', N'dbo', N'table', N'OKP_Messages', N'column', N'PARAMS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ������������ �� ���������� ������', 
	'schema', 'dbo', 'table', 'OKP_Messages', 'column', 'Recommendation'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ � �����������', 
	'schema', 'dbo', 'table', 'OKP_Messages', 'column', 'HelpContext'
GO

/* @BLOCK: ������� �������
** @DESCR: ������ ���
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ���', N'schema', N'dbo', N'table', N'OKP_NDS'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_NDS', N'column', N'NAM'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_NDS', N'column', N'NDS'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������� ���', N'schema', N'dbo', N'table', N'OKP_NDS', N'column', N'INCLUDED'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��� ����������', N'schema', N'dbo', N'table', N'OKP_NDS', N'column', N'NUM'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_NDS', N'column', N'GRP_ID'
GO

/* @NAME:  OKP_NKL_LIST
** @DESCR: �����������
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

EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'RWC'
EXEC sp_addextendedproperty 'MS_Description', N'����� �����������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'creator'
EXEC sp_addextendedproperty 'MS_Description', N'������������, ���������� �����������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'UserFIO'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'SUMPrice'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'SUMPrice_st'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���� ������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'TZ_n'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������������� �����������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'dte'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���� �����������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'calctype'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'qtywgh'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������� � ��', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'qtypqy'
EXEC sp_addextendedproperty 'MS_Description', N'����������� �����������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'calcidn'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'zakaz'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������ ��������� � �������������� ������������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'Doc'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������������� �����������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'Main'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������� �������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'RWC_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������� �����������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'create_date'
EXEC sp_addextendedproperty 'MS_Description', N'C������ ���������� �������� ������� ��� ������� �����������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'SD_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'grp_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������������� ������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'RWC_CPL'
EXEC sp_addextendedproperty 'MS_Description', N'������ 86 - ������������ ���, 5 - ��, 7 - ������', N'schema', N'dbo', N'table', N'OKP_NKL_LIST', N'column', N'SysObject_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'���������� �����', N'schema', N'dbo', N'table', N'OKP_NNUM', N'column', N'BCOUNT'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������ ��������', N'schema', N'dbo', N'table', N'OKP_OBJLINKS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID �������� ���������', N'schema', N'dbo', N'table', N'OKP_OBJLINKS', N'column', N'M_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������� ���������.
���� ���������� - ��. OKP_SYSOBJECTS, ��������:
  1	(������� OKP_NOM) - �������� "����� ������������"
  2	(������� OKP_INV) - �������� "��������� ������������"
  ...
  5	(������� OKP_PPP) - ��������� "�������� �������"
  6	(������� OKP_TRN) - ��������� "�������� ������"
� �.�.', N'schema', N'dbo', N'table', N'OKP_OBJLINKS', N'column', N'M_Type'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID �������� ���������', N'schema', N'dbo', N'table', N'OKP_OBJLINKS', N'column', N'S_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������� ���������.
���� ���������� - ��. ������� OKP_SYSOBJECTS, ��������:
  1	(������� OKP_NOM) - �������� "����� ������������"
  2	(������� OKP_INV) - �������� "��������� ������������"
  ...
  5	(������� OKP_PPP) - ��������� "�������� �������"
  6	(������� OKP_TRN) - ��������� "�������� ������"
� �.�.', N'schema', N'dbo', N'table', N'OKP_OBJLINKS', N'column', N'S_Type'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ������������� ���������� ���������:
  0 - ������� ������ ��������
  1 - ������� ������ ������������� ������������ � �������', N'schema', N'dbo', N'table', N'OKP_OBJLINKS', N'column', N'isAuto'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� �����:
  0 - ����� ����������
  1 - ����� �� ����������', N'schema', N'dbo', N'table', N'OKP_OBJLINKS', N'column', N'LinkLevel'
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
EXEC sp_addextendedproperty 'MS_Description', N'��������������',N'SCHEMA',N'dbo','TABLE',N'OKP_OBSP'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������ �� OKP_NOM.RWC', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'RWC_NOM'
EXEC sp_addextendedproperty 'MS_Description', N'����� OKP_WRH.WRH_ID', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'WRH_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'EIZ'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �����', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_SZP'
EXEC sp_addextendedproperty 'MS_Description', N'����� �� ������', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_WRH'
EXEC sp_addextendedproperty 'MS_Description', N'��� �����������', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_TI'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� �������', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_MFC'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_INVALID'
EXEC sp_addextendedproperty 'MS_Description', N'�� �������������', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_OTV'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� ������', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_DEFICIT'
EXEC sp_addextendedproperty 'MS_Description', N'���� �� ���', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'PRC'
EXEC sp_addextendedproperty 'MS_Description', N'1 - �� ��������������; 0 - ���', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'ON_INV'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �����������', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_PLAN_POT'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ����������� �� ����������� ������������� ���', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_PLAN_POT_MINUS_STOPED'
EXEC sp_addextendedproperty 'MS_Description', N'���������������� ������ �� ������', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_RESERV'
EXEC sp_addextendedproperty 'MS_Description', N'���������������� ������ �����', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_TOTAL_RESERV'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� ������� �����', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_TOTAL_MFC'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ����� �����', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_TOTAL_SZP'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �� �������', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_TOTAL_WRH'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����������� �����', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_TOTAL_TI'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������� ���������', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_TOTAL_INVALID'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� (�������������� + ����������������) (�� ����������� ������������)', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_FROM_RZP'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ��������', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_CONFIRMED'
EXEC sp_addextendedproperty 'MS_Description', N'��������������', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_UNCONFIRMED'
EXEC sp_addextendedproperty 'MS_Description', N'����������� (�� �������������� �������)', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_UNSHIPPED'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� (�� ���� �������)', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_DELIVERED'
EXEC sp_addextendedproperty 'MS_Description', N'������������ (�� �������������� �������)', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_UNDELIVERED'
EXEC sp_addextendedproperty 'MS_Description', N'� ����', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_INPTH'
EXEC sp_addextendedproperty 'MS_Description', N'����������� �� ���� (�����)', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_OMTS'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ����������� (� ������ ���� ������ � ��.)', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_REAL_POT'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����� (�� ���� �������)', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'QTY_TOTAL_DEFICIT'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ���� �������', N'schema', N'dbo', N'table', N'OKP_OBSP', N'column', N'LAST_PRC'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ���������������� ������', N'schema', N'dbo', N'table', N'OKP_OPLAN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ����-���������', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'DEP_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'PNAME'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'DATECREATION'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'CREATOR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ���������', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'DATEMODIFICATION'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ��������', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'MODIFICATOR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ������� ���������', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'L_LIM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ������� ���������', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'R_LIM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ : 1-�����������, 0 - �������������', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'STATUS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� �������������', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'DATENULLIFICATION'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������������', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'NULLIFICATOR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� �������� ������ 0-��������, 1- �������� ���', N'schema', N'dbo', N'table', N'OKP_OPLAN', N'column', N'NR'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ������� ���������������� ������', N'schema', N'dbo', N'table', N'OKP_OPLAN_DATA'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������ �������', N'schema', N'dbo', N'table', N'OKP_OPLAN_DATA', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� �����', N'schema', N'dbo', N'table', N'OKP_OPLAN_DATA', N'column', N'OPLAN_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'OKP_OPLAN_DATA', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� � ���������', N'schema', N'dbo', N'table', N'OKP_OPLAN_DATA', N'column', N'ORDERNUM'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� - ������ ��������', N'schema', N'dbo', N'table', N'OKP_PaspList'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ����-�������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'RWC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ������� ', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'PPPNUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� ����������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'NPR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ������� ', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'DTZ'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ������� ', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'DTV'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� �������� �������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'PRT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ �������� �������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'NMP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ����������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'QCYPQY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� ����������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'QCYFQY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ���. �������� � ��������������� ����', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'ConfirmDate'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ������������ �������� �������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'FPDTE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ���. �������� �������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'DTEU'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�����', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'Zakaz'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ������������ ����������������� �����', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'dateEsc'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ����� �� �����', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'dtes'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� � ������ � ������������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'INR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ����� ��� � ���', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'ReplaceDocNum'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� � ���������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'Protsh'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ������ � �����', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'UBR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ���. ���������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'FIO_UPR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ���������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'FIO_PPP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ���������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'FIO_UPP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ����������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'FIO_DISP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'PRS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �������� ������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'NUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ������������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'Status'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������ �������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'CREATOR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_PaspList', N'column', N'DateCreation'
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

EXEC sp_addextendedproperty 'MS_Description', N'���������� ����', N'schema', N'dbo', N'table', N'OKP_PERSON'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������', N'schema', N'dbo', N'table', N'OKP_PERSON', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���', N'schema', N'dbo', N'table', N'OKP_PERSON', N'column', N'FIO'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ����������', N'schema', N'dbo', N'table', N'OKP_PERSON', N'column', N'EXTENTION'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_PERSON', N'column', N'STATE'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����������', N'schema', N'dbo', N'table', N'OKP_PERSON', N'column', N'CTR_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_PERSON', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������', N'schema', N'dbo', N'table', N'OKP_PERSON', N'column', N'job_id'
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

EXEC sp_addextendedproperty 'MS_Description', N'���������� ������� ("����")', N'schema', N'dbo', N'table', N'OKP_PLO'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ������ � ������� (OKP_DOCs.ID)', N'schema', N'dbo', N'table', N'OKP_PLO', N'column', N'DOC_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������:
1 - ���������������� �����
2 - ����� �� �������
3 - ����� �� ����������
', N'schema', N'dbo', N'table', N'OKP_PLO', N'column', N'VID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������:
0 - �������
1 - ��������', N'schema', N'dbo', N'table', N'OKP_PLO', N'column', N'TYP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������� "�����" - �� 1 �� 100. 
  1 -   ������
  100 - ����� ������', N'schema', N'dbo', N'table', N'OKP_PLO', N'column', N'PRI'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ������:
0 - ��������� (�� ������ ��� �� ����� �������� �������)
1 - � ������ - ���� �� ���� �� �������� ������� ������ ��������� � ����� �� ��������� ��������� (��. OKP_PPP.STS):
      0 - ���������� � ���� (�� ������������)
      1 - ������������
      2 - � ������������
      5 - ����������� ("����������")
    � �� ��������� ������� "���������" (��. ����)
2 - ��������� - ���� �� ���� �� �������� ������� ������ ��������� � ����� �� ��������� ��������� (��. OKP_PPP.STS):
      6 - ���������� (�� ������������)
      3 - � ������������ � ����������
3 - �������� - ��� ��������� �������� ������� ������ ��������� � ����� �� ��������� ��������� (��. OKP_PPP.STS):
      4 - ���������
      8 - ����� �� �����
4 - � ������ - ��� ������� ������ ��������� ����� � �����
����������:
   - �� �������� ������� ������ �� ������ ������ ��� �������� ������� (�� ����������� ������� 0)
', N'schema', N'dbo', N'table', N'OKP_PLO', N'column', N'STS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� ���� ������� ������', N'schema', N'dbo', N'table', N'OKP_PLO', N'column', N'DTE_Z'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� ���� ������� ������', N'schema', N'dbo', N'table', N'OKP_PLO', N'column', N'DTE_V'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_PLO', N'column', N'DESCRIBE'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ����������-������� ("����")', N'schema', N'dbo', N'table', N'OKP_PLOData'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� (������) (OKP_PLO.ID)', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'PLO_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID �������� ������ (OKP_REQDATA.ID)', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'REQData_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID �������������� ������� (OKP_NOMDATA.ID)', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'NOMDATA_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ������� � ���������', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'LIN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ������������ ����������/����������� ������ (OKP_USERS.USER_ID)', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'USER_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� �������� ������ (��������������)', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'DTE_CR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������� �������', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'QTY_P'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ������� ������ (��������� ���������� � ����) - �� 1 �� 100. 
  1 -   ������
  100 - ����� ������', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'PRI'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������� ������� ������:
  0 - ������� (���� �������� ������ � ��)
  1 - ������������ (����� ����� �������� � ���������������� �����)', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'STZ'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� � �������� ��', N'schema', N'dbo', N'table', N'OKP_PLOData', N'column', N'FOLD'
GO


/* OKP_PPPDEP
** ������� ���������� �������������, ����� ������� ������ PPP � ����� TOZ
** � ���� ����� �������� �� f_PppCanSee, �� ��������� �� ����� - ���� � ������� ��������
*/
CREATE TABLE dbo.OKP_PPPDEP (
  ID bigint IDENTITY(1, 1) NOT NULL,
  RWC_PPP bigint NOT NULL,
  RWC_DEP int NOT NULL
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'����� ��� � ����������������', N'schema', N'dbo', N'table', N'OKP_PPPDEP'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����', 'schema', 'dbo', 'table', 'OKP_PPPDEP', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'�� ���', 'schema', 'dbo', 'table', 'OKP_PPPDEP', 'column', 'RWC_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'�� �������������', 'schema', 'dbo', 'table', 'OKP_PPPDEP', 'column', 'RWC_DEP'
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

EXEC sp_addextendedproperty 'MS_Description', N'�������-����������������� ������', N'schema', N'dbo', N'table', N'OKP_PPR'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���', 'schema', 'dbo', 'table', 'OKP_PPR', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', 'schema', 'dbo', 'table', 'OKP_PPR', 'column', 'DateBegin'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����������', 'schema', 'dbo', 'table', 'OKP_PPR', 'column', 'DateEnd'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��', 'schema', 'dbo', 'table', 'OKP_PPR', 'column', 'wpl_id'
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

EXEC sp_addextendedproperty 'MS_Description', N'���������� ��������� �����', N'schema', N'dbo', N'table', N'OKP_PRZ'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ������ � ������� (OKP_DOCs.ID)', N'schema', N'dbo', N'table', N'OKP_PRZ', N'column', N'DOC_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ���� ��������', N'schema', N'dbo', N'table', N'OKP_PRZ', N'column', N'DTE_1'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ��������', N'schema', N'dbo', N'table', N'OKP_PRZ', N'column', N'DTE_2'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ������� ��������. ��� �������:
0 - ���
1 - �������
2 - �����
3 - ������
4 - ������
5 - ����.', N'schema', N'dbo', N'table', N'OKP_PRZ', N'column', N'PRD'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ��������', N'schema', N'dbo', N'table', N'OKP_PRZData'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� �������� (OKP_PRZ.ID)', N'schema', N'dbo', N'table', N'OKP_PRZData', N'column', N'PRZ_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID �������������� ������� (OKP_NOMDATA.ID)', N'schema', N'dbo', N'table', N'OKP_PRZData', N'column', N'NOMDATA_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ������ � ���������', N'schema', N'dbo', N'table', N'OKP_PRZData', N'column', N'LIN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ��������', N'schema', N'dbo', N'table', N'OKP_PRZData', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ���� ��� �� �������', N'schema', N'dbo', N'table', N'OKP_PRZData', N'column', N'PRC'
GO

/*
** �������� ��������
*/
CREATE TABLE dbo.OKP_PUR (
	ID bigint IDENTITY(1, 1) NOT NULL,
	NOM_ID int NOT NULL,
	USR varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	SDDCLE float CONSTRAINT DF_OKP_PUR_SDDCLE DEFAULT 0 NOT NULL,
	SDDCPC float CONSTRAINT DF_OKP_PUR_SDDCPC DEFAULT 0 NOT NULL,
	SDDORG float CONSTRAINT DF_OKP_PUR_SDDORG DEFAULT 0 NOT NULL,
	SDDTME float CONSTRAINT DF_OKP_PUR_SDDTME DEFAULT 0 NOT NULL,
	INS varchar(1) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_PUR_INS DEFAULT 'N' NOT NULL,
	GODPRC dbo.G_QUANT_F CONSTRAINT df__okp_pur__godprc DEFAULT 0 NOT NULL,
	GODDEV dbo.G_QUANT_F CONSTRAINT DF_OKP_PUR_GODDEV DEFAULT 0 NOT NULL,
	FLLIDN varchar(50) COLLATE DATABASE_DEFAULT NULL,
	GODGOD dbo.G_QUANT_F CONSTRAINT DF_OKP_PUR_GODGOD DEFAULT 100 NOT NULL,
	QTYRAB dbo.G_QUANT_F DEFAULT 0 NULL,
	Comment varchar(255) COLLATE DATABASE_DEFAULT NULL,
	MET dbo.G_CODE NULL,
	CONSTRAINT PK_OKP_PUR PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ � �������� ���������', N'schema', N'dbo', N'table', N'OKP_PUR'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������������� ���������', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'USR'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���� �������� (���)', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'SDDCLE'
EXEC sp_addextendedproperty 'MS_Description', N'������ ���������������� (���)', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'SDDCPC'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� ������� (���)', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'SDDORG'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������� �������� (���)', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'SDDTME'
EXEC sp_addextendedproperty 'MS_Description', N'������ �������� �������� (N, P, C): N - �� ����������; P - ����������� ����� ����������; C - ����������� �� ����������', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'INS'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������������ ���������� (���� INS=P)', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'GODPRC'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� ���������� �� ������', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'GODDEV'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������� ��������� ��������', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'FLLIDN'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������ ��� �������� ������', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'GODGOD'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'QTYRAB'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'Comment'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_PUR', N'column', N'MET'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ���������� ��������', N'schema', N'dbo', N'table', N'OKP_RAS'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������� (OKP_TRS.ID)', N'schema', N'dbo', N'table', N'OKP_RAS', N'column', N'TRS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� ������� �������� (OKP_EIZ.ID)', N'schema', N'dbo', N'table', N'OKP_RAS', N'column', N'EIZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'OKP_RAS', N'column', N'GOG'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����� (���� ����)', N'schema', N'dbo', N'table', N'OKP_RAS', N'column', N'NFL'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_RAS', N'column', N'DTE_ARR'
EXEC sp_addextendedproperty 'MS_Description', N'������ �������� (������� � �������� EIZID)', N'schema', N'dbo', N'table', N'OKP_RAS', N'column', N'QTY_D'
GO

/*
** ���������, ����������� � ������
*/
CREATE TABLE dbo.OKP_ReportParameters (
	ID int NOT NULL,
	paramType int NOT NULL,
	paramAdditional varchar(255) COLLATE DATABASE_DEFAULT NULL,
	Gravity int NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ���������� ��� �������', N'schema', N'dbo', N'table', N'OKP_ReportParameters'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� id ������ (OKP_Reports.ID)', N'schema', N'dbo', N'table', N'OKP_ReportParameters', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'id ���������', N'schema', N'dbo', N'table', N'OKP_ReportParameters', N'column', N'paramType'
EXEC sp_addextendedproperty 'MS_Description', N'������������� (��������� ��� ��������� ������ �������)', N'schema', N'dbo', N'table', N'OKP_ReportParameters', N'column', N'paramAdditional'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����������� ���������� ������', N'schema', N'dbo', N'table', N'OKP_ReportParameters', N'column', N'Gravity'
GO

/*
** ������
*/
CREATE TABLE dbo.OKP_Reports (
	ID int IDENTITY(1, 1) NOT NULL,
	Name varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
	scriptFileName varchar(255) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_Reports_spxFileName DEFAULT '' NOT NULL,
	Comment varchar(255) COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_Reports_Comment DEFAULT '' NOT NULL,
	query ntext COLLATE DATABASE_DEFAULT CONSTRAINT DF_OKP_Reports_query DEFAULT '' NOT NULL,
	UID uniqueidentifier DEFAULT newid() NOT NULL,
	Description varchar(250) COLLATE DATABASE_DEFAULT DEFAULT '' NOT NULL,
	File_ID int DEFAULT 1 NOT NULL,
	DTE datetime CONSTRAINT df__okp_reports__dte DEFAULT getdate() NOT NULL, 	
	CONSTRAINT PK_OKP_Reports PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ������������������ �������', N'schema', N'dbo', N'table', N'OKP_Reports'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ������', N'schema', N'dbo', N'table', N'OKP_Reports', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������', N'schema', N'dbo', N'table', N'OKP_Reports', N'column', N'Name'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'OKP_Reports', N'column', N'scriptFileName'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������', N'schema', N'dbo', N'table', N'OKP_Reports', N'column', N'query'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������� ������', N'schema', N'dbo', N'table', N'OKP_Reports', N'column', N'UID'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������', N'schema', N'dbo', N'table', N'OKP_Reports', N'column', N'Description'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����� � ������� OKP_FILES - �������� ��������� ������', N'schema', N'dbo', N'table', N'OKP_Reports', N'column', N'File_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������������� ������', N'schema', N'dbo', N'table', N'OKP_Reports', N'column', N'DTE'
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
EXEC sp_addextendedproperty 'MS_Description', N'����� ������� �������', N'schema', N'dbo', N'table', N'OKP_ReportsBlanks'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� �����', N'schema', N'dbo', N'table', N'OKP_ReportsBlanks', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ������ ������', N'schema', N'dbo', N'table', N'OKP_ReportsBlanks', N'column', N'FileData'
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

EXEC sp_addextendedproperty 'MS_Description', N'�������� ������� �������', N'schema', N'dbo', N'table', N'OKP_ReportsBlanksNames'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ������', N'schema', N'dbo', N'table', N'OKP_ReportsBlanksNames', N'column', N'ReportID'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ������', N'schema', N'dbo', N'table', N'OKP_ReportsBlanksNames', N'column', N'BlankID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ������ ��� ������� ������', N'schema', N'dbo', N'table', N'OKP_ReportsBlanksNames', N'column', N'Number'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����� ������', N'schema', N'dbo', N'table', N'OKP_ReportsBlanksNames', N'column', N'BlankName'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������', N'schema', N'dbo', N'table', N'OKP_ReportsBlanksNames', N'column', N'BlankVersion'
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
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� �������', N'schema', N'dbo', N'table', N'OKP_ReportsScripts'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� �����', N'schema', N'dbo', N'table', N'OKP_ReportsScripts', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ������� ������', N'schema', N'dbo', N'table', N'OKP_ReportsScripts', N'column', N'FileData'
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

EXEC sp_addextendedproperty 'MS_Description', N'���������� ������', N'schema', N'dbo', N'table', N'OKP_REQ'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ������ � ������� (OKP_DOCs.ID)', N'schema', N'dbo', N'table', N'OKP_REQ', N'column', N'DOC_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID �������� (OKP_CONTRACT.ID)', N'schema', N'dbo', N'table', N'OKP_REQ', N'column', N'CONTRACT_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ����������� (OKP_CTR.ID)', N'schema', N'dbo', N'table', N'OKP_REQ', N'column', N'CTR_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������:
0 - �������
1 - ��������', N'schema', N'dbo', N'table', N'OKP_REQ', N'column', N'TYP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������� "������" - �� 1 �� 100. 
  1 -   ������
  100 - ����� ������', N'schema', N'dbo', N'table', N'OKP_REQ', N'column', N'PRI'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_REQ', N'column', N'DESCRIBE'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ������', N'schema', N'dbo', N'table', N'OKP_REQData'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ������ (OKP_REQ.ID)', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'REQ_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID �������������� ������� (OKP_NOM.RWC)', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'NOMDATA_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ������ � ���������', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'LIN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ���� ��������', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'DTE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ��������', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'DTE_L'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� �������� ��������', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'DTE_IK'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ��������� ������� �������� (�� DTE �� DTE_L):
0 - ���
1 - �������
2 - �����
3 - ������
4 - ������
5 - ����', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'REG'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ��������', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'ORD'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������� ������� ������:
0 - ������� (���� �������� ������ � ��)
1 - ������������ (����� ����� �������� � ������)', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'STZ'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ������� ������ (��������� ���������� � ����) - �� 1 �� 100. 
  1 -   ������
  100 - ����� ������', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'PRI'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ���� ��� �� �������', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'PRC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ����������', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'QTY_Z'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ����������', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'QTY_O'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� ����������', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'QTY_IK'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ������������ ����������/����������� ������ (OKP_USERS.USER_ID)', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'USER_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ QTY_IK', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'Fold_I'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ DTE_IK', N'schema', N'dbo', N'table', N'OKP_REQData', N'column', N'Fold_D'
GO

--
-- Definition for table OKP_RZP : 
--

CREATE TABLE OKP_RZP(
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
 CONSTRAINT PK_OKP_RZP PRIMARY KEY CLUSTERED (ID))
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'������ ������ �� ��������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP'
EXEC sys.sp_addextendedproperty N'MS_Description', N'��� ������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'ID'
EXEC sys.sp_addextendedproperty N'MS_Description', N'�� ������������� ������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'RZP_IDN'
EXEC sys.sp_addextendedproperty N'MS_Description', N'�� ��������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'CONTRACT_ID'
EXEC sys.sp_addextendedproperty N'MS_Description', N'���� �������� ������' , N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP',N'COLUMN',N'DTE_CRT'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP',N'COLUMN',N'USR'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������ ������: 0 - �� ������������, 1 - ������������, 2 - ��������' ,N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP',N'COLUMN',N'STS'
EXEC sys.sp_addextendedproperty N'MS_Description', N'���� ������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'DTE'
EXEC sys.sp_addextendedproperty N'MS_Description', N'�� ����������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'SUP_IDN'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������������ ����������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'SUP_NAME'
EXEC sys.sp_addextendedproperty N'MS_Description', N'����� ��������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'SUM_DOST'
EXEC sys.sp_addextendedproperty N'MS_Description', N'���� �������� �� �����' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'RZP_MAX_DTE_POST'
EXEC sys.sp_addextendedproperty N'MS_Description', N'���� �������� �� �����' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'DTE_DELIV_FACT'
EXEC sys.sp_addextendedproperty N'MS_Description', N'����������: 0 - �����������; 1 - ����������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'FROZEN'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������������� ���������� ' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'SUP_ID'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������������� ��������������� ' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'CONSIGNEE_ID'
EXEC sys.sp_addextendedproperty N'MS_Description', N'���������� ��������� ���� ' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'GUID'
EXEC sys.sp_addextendedproperty N'MS_Description', N'��� ����������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'UPUTRS'
EXEC sys.sp_addextendedproperty N'MS_Description', N'��������� ���� �������� �� �����' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'RZP_MIN_DTE_POST'
EXEC sys.sp_addextendedproperty N'MS_Description', N'����� �� ���' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'SUM_PUR'
EXEC sys.sp_addextendedproperty N'MS_Description', N'����� �����' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'SUM_ALL'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������������� ������� ���������� ������ �������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'CLOSE_REJECT_ID'
EXEC sys.sp_addextendedproperty N'MS_Description', N'����������� ������� ���������� ������ �������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'CLOSE_COMMENT'
EXEC sys.sp_addextendedproperty N'MS_Description', N'�����������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP', N'COLUMN',N'COMMENT'
GO

--
-- Definition for table OKP_RZP_DATA : 
--
--������ ������ �� ��������
CREATE TABLE OKP_RZP_DATA(
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
 CONSTRAINT PK_OKP_RZP_DATA PRIMARY KEY CLUSTERED (ID))
GO

EXEC sp_addextendedproperty N'MS_Description',N'������ ������ �� ��������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA'
EXEC sp_addextendedproperty N'MS_Description',N'�������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'ID'
EXEC sp_addextendedproperty N'MS_Description',N'������ �� ������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'ID_RZP'
EXEC sp_addextendedproperty N'MS_Description',N'���������� (��������)',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTYPOT'
EXEC sp_addextendedproperty N'MS_Description',N'����',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'PRC_PUR'
EXEC sp_addextendedproperty N'MS_Description',N'���� �������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'DTE_CONFIRMED'
EXEC sp_addextendedproperty N'MS_Description',N'������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'STS'
EXEC sp_addextendedproperty N'MS_Description',N'�����',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'MET'
EXEC sp_addextendedproperty N'MS_Description',N'���������� (������������) � ��� �������� ',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTY'
EXEC sp_addextendedproperty N'MS_Description',N'�� ������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'RWC_NOM'
EXEC sp_addextendedproperty N'MS_Description',N'���� �����������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'MIN_DTE_POT'
EXEC sp_addextendedproperty N'MS_Description',N'���� �������� �� �����',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'MIN_PLN_DTE_POST'
EXEC sp_addextendedproperty N'MS_Description',N'�� ������� ��������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'UPU_ID'
EXEC sp_addextendedproperty N'MS_Description',N'���������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'FROZEN'
EXEC sp_addextendedproperty N'MS_Description',N'���� ��������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'DTE_SHP'
EXEC sp_addextendedproperty N'MS_Description',N'��������� � ��� �������� ',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTY_SHP'
EXEC sp_addextendedproperty N'MS_Description',N'GUID-������������� (��������� ��� ������������� ������ �� ��������� ��������)',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'GUID'
EXEC sp_addextendedproperty N'MS_Description',N'������ �� ����������� �����',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'WRH_id'
EXEC sp_addextendedproperty N'MS_Description',N'��������� ���� - ���������� �� �����������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTY_FROM_POT'
EXEC sp_addextendedproperty N'MS_Description',N'��������� ���� - ����������� �� c��������� ������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTY_FROM_SZP'
EXEC sp_addextendedproperty N'MS_Description',N'��������� ���� - ��� ������ �����',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTY_FOR_OTHER'
EXEC sp_addextendedproperty N'MS_Description',N'��������� ���� - ��������������� ������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'IS_GENERATED'
EXEC sp_addextendedproperty N'MS_Description',N'������ �� ������ �������� - ������� �� �������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTYMFC'
EXEC sp_addextendedproperty N'MS_Description',N'������ �� ������ �������� - ��������� �����',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTYSZP'
EXEC sp_addextendedproperty N'MS_Description',N'������ �� ������ �������� - � ������� �� ������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTYWRH'
EXEC sp_addextendedproperty N'MS_Description',N'������ �� ������ �������� - �������� �� ������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTYINV'
EXEC sp_addextendedproperty N'MS_Description',N'������ �� ������ �������� - ������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTYUNDELIVERED'
EXEC sp_addextendedproperty N'MS_Description',N'������� �� �������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTYDEFICIT'
EXEC sp_addextendedproperty N'MS_Description',N'������ �� ������ �������� - ��������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'QTYUNCONFIRMED'
EXEC sp_addextendedproperty N'MS_Description',N'�������� ���� �������� ����������� ��� ���������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'DTE_SHP_PLN'
EXEC sp_addextendedproperty N'MS_Description',N'��������� �������� �� ���',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'PRC_DOST'
EXEC sp_addextendedproperty N'MS_Description',N'�������� ���� ������� ������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'MAX_DTE_POT'
EXEC sp_addextendedproperty N'MS_Description',N'�������� ���� ���������� ������� ��������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'MAX_PLN_DTE_POST'
EXEC sp_addextendedproperty N'MS_Description',N'��� �����������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'EIZ_POT'
EXEC sp_addextendedproperty N'MS_Description',N'��� ��������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'EIZ_POST'
EXEC sp_addextendedproperty N'MS_Description',N'����������� �������� � ��� ��������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'K_TO_POST'
EXEC sp_addextendedproperty N'MS_Description',N'��� ����������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'UPUTRS'
EXEC sp_addextendedproperty N'MS_Description',N'����� ���������� ����� �������� (���)',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'TNP'
EXEC sp_addextendedproperty N'MS_Description',N'���������� ���',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'TNP_COUNT'
EXEC sp_addextendedproperty N'MS_Description',N'����� ���������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'SUM_PUR'
EXEC sp_addextendedproperty N'MS_Description',N'�����  ��������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'SUM_DOST'
EXEC sp_addextendedproperty N'MS_Description',N'����� ���������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'TOTAL'
EXEC sp_addextendedproperty N'MS_Description',N'���������� ��������� � ������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_RZP_DATA',N'COLUMN',N'IMQTY'
EXEC sp_addextendedproperty N'MS_Description',N'������ �� ������� OKP_EXTNOM' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_DATA', N'COLUMN',N'EXTNOM_ID'
EXEC sp_addextendedproperty N'MS_Description',N'���� ��������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_DATA', N'COLUMN',N'SDDPER'
GO



--
-- Definition for table OKP_RZP_POT : 
--

--������� �������� ������ � ��� �� ����� ������������ ������� ������� ������� ������
CREATE TABLE OKP_RZP_POT(
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

EXEC sp_addextendedproperty N'MS_Description', N'����� �����������-������ ������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT'
EXEC sp_addextendedproperty N'MS_Description', N'�� �����������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'ID_POT'
EXEC sp_addextendedproperty N'MS_Description', N'�� ������� ������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'ID_RZPDATA'
EXEC sp_addextendedproperty N'MS_Description', N'���������� � ��� �����������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'QTY'
EXEC sp_addextendedproperty N'MS_Description', N'��������� ������������� �����������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'USR_SEL_POT'
EXEC sp_addextendedproperty N'MS_Description', N'������ �� ������������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'RWC_NOM'
EXEC sp_addextendedproperty N'MS_Description', N'���� �����������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'DTE_POT'
EXEC sp_addextendedproperty N'MS_Description', N'�������� �����������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'QTYPOT'
EXEC sp_addextendedproperty N'MS_Description', N'������� �����������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'QTYTQY'
EXEC sp_addextendedproperty N'MS_Description', N'������ �� ������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'RWC_TOZ'
EXEC sp_addextendedproperty N'MS_Description', N'����� �������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'WRH_ID'
EXEC sp_addextendedproperty N'MS_Description', N'����� ��������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'NOP'
EXEC sp_addextendedproperty N'MS_Description', N'������ �� ���������� ��������������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'TRN_ID'
EXEC sp_addextendedproperty N'MS_Description', N'������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'imQTY'
EXEC sp_addextendedproperty N'MS_Description', N'������� �������� ������ = �������� ����������� - ������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'TQY'
EXEC sp_addextendedproperty N'MS_Description', N'���������� �� ������� �� �������������� �����������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'OLDWRH'
EXEC sp_addextendedproperty N'MS_Description', N'��������� ��������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'SUPPLY'
EXEC sp_addextendedproperty N'MS_Description', N'����������� ����� �������������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'NEWPOT'
EXEC sp_addextendedproperty N'MS_Description', N'������ �� ����������� ������� ��������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'UPU_ID'
EXEC sp_addextendedproperty N'MS_Description', N'������ �� �����', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'PLO_ID'
EXEC sp_addextendedproperty N'MS_Description', N'�� ��������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_POT', 'COLUMN', N'ID_VAR'

GO


--
-- Definition for table OKP_RZP_TRN : 
--
--������ ����� ��������
CREATE TABLE OKP_RZP_TRN(
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
 CONSTRAINT PK_OKP_RZP_TRN PRIMARY KEY CLUSTERED (ID))
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'�������������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'ID'
EXEC sys.sp_addextendedproperty N'MS_Description', N'���� ����������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'DTE_RZP_TRN'
EXEC sys.sp_addextendedproperty N'MS_Description', N'����� ����������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'TRN_NUM'
EXEC sys.sp_addextendedproperty N'MS_Description', N'����������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'ID_CTR'
EXEC sys.sp_addextendedproperty N'MS_Description', N'��������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'ID_CONTRACT'
EXEC sys.sp_addextendedproperty N'MS_Description', N'����������������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'ID_CTR_SHIPPER'
EXEC sys.sp_addextendedproperty N'MS_Description', N'���������������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'ID_CTR_CONSIGNEE'
EXEC sys.sp_addextendedproperty N'MS_Description', N'�������������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'RESPONSIBLE_USERNAME'
EXEC sys.sp_addextendedproperty N'MS_Description', N'�������� �����' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'INCOMING_NUMBER'
EXEC sys.sp_addextendedproperty N'MS_Description', N'�������� ���� ' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'INCOMING_DATE'
EXEC sys.sp_addextendedproperty N'MS_Description', N'����������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'DESCRIPTION'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������: 0 - �� ��������; 1 - ��������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'STS'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������ ���������� �� �������� (0 - �� �������, 1 - �������) ' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN', N'COLUMN',N'DELETED'
EXEC sys.sp_addextendedproperty N'MS_Description', N'���������� ����� �������� (���������)' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN'
EXEC sys.sp_addextendedproperty N'MS_Description', N'����� ��������� ��������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_TRN', 'COLUMN', N'TOTAL_DELIVERY_COST'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������������ ������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_TRN', 'COLUMN', N'CURRENCY_ID'
EXEC sys.sp_addextendedproperty N'MS_Description', N'��������� ���', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_TRN', 'COLUMN', N'NDS'
EXEC sys.sp_addextendedproperty N'MS_Description', N'��� �������� � ���������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_TRN', 'COLUMN', N'NDS_INCLUDED_IN_PRC'
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
  NDS_INCLUDED bit CONSTRAINT DF_OKP_RZP_TRN_DATA_NDS_INCLUDED DEFAULT(0), 	
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

EXEC sys.sp_addextendedproperty N'MS_Description', N'�������������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'ID'
EXEC sys.sp_addextendedproperty N'MS_Description', N'�� ����������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'ID_RZP_TRN'
EXEC sys.sp_addextendedproperty N'MS_Description', N'�� �������� ��������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'ID_PUR'
EXEC sys.sp_addextendedproperty N'MS_Description', N'�� �����' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'ID_WRH'
EXEC sys.sp_addextendedproperty N'MS_Description', N'�� ������� ������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'ID_RZP_DATA'
EXEC sys.sp_addextendedproperty N'MS_Description', N'���������� �����������������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'QTY'
EXEC sys.sp_addextendedproperty N'MS_Description', N'���� �� ��' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'PRC'
EXEC sys.sp_addextendedproperty N'MS_Description', N'��� � %' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'NDS'
EXEC sys.sp_addextendedproperty N'MS_Description', N'����� ������ (��� ���������� � �������������� �����)' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'ROW_NUM'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������� ��������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'DESCRIPTION'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������ �� OKP_NOM' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'NOM_ID'
EXEC sys.sp_addextendedproperty N'MS_Description', N'��� ��� ������ �� �����/������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'NDS_NAM'
EXEC sys.sp_addextendedproperty N'MS_Description', N'���������� ��������� �� ������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'QTY_POSTAV'
EXEC sys.sp_addextendedproperty N'MS_Description', N'��� �������� � ����', N'schema', N'dbo', N'table', N'OKP_RZP_TRN_DATA', N'column', N'NDS_INCLUDED'
EXEC sys.sp_addextendedproperty N'MS_Description', N'���� �������� ' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'DTE_POSTAV'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������� �� �����' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'SUM_POSTAV'
EXEC sys.sp_addextendedproperty N'MS_Description', N'��� ������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'NDS_SUM'
EXEC sys.sp_addextendedproperty N'MS_Description', N'����� � ���' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'SUM_WITH_NDS'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������ QTY_POSTAV' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'Fold_I'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������ ���� QTY_POSTAV' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'Fold_S'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������ DTE_POSTAV' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA', N'COLUMN',N'Fold_D'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������ ���������� ���������' , N'SCHEMA',N'dbo', N'TABLE',N'OKP_RZP_TRN_DATA'
EXEC sys.sp_addextendedproperty N'MS_Description', N'��������� ��������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_TRN_DATA', 'COLUMN', N'DELIVERY_COST'
EXEC sys.sp_addextendedproperty N'MS_Description', N'���������� ����� �������� �� ������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_TRN_DATA', 'COLUMN', N'TNP'
EXEC sys.sp_addextendedproperty N'MS_Description', N'��������� �������� ����� ���', 'SCHEMA', N'dbo', 'TABLE', N'OKP_RZP_TRN_DATA', 'COLUMN', N'TNP_DEL_COST'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������������� ������', N'schema', N'dbo', N'table', N'OKP_RZP_TRN_DATA', N'column', N'CURRENCY_ID'
EXEC sys.sp_addextendedproperty N'MS_Description', N'�������� ��������� �������� � ���� 0 - �� ��������, 1 - ��������', N'schema', N'dbo', N'table', N'OKP_RZP_TRN_DATA', N'column', N'INCLUDE_DELIVERY_IN_PRICE'
EXEC sys.sp_addextendedproperty N'MS_Description', N'���� ����� ���������', N'schema', N'dbo', N'table', N'OKP_RZP_TRN_DATA', N'column', N'PRC_RECALC'
EXEC sys.sp_addextendedproperty N'MS_Description', N'����� ����� ���������', N'schema', N'dbo', N'table', N'OKP_RZP_TRN_DATA', N'column', N'SUM_RECALC'
EXEC sys.sp_addextendedproperty N'MS_Description', N'���� ������', N'SCHEMA' ,N'dbo', N'TABLE' ,N'OKP_RZP_TRN_DATA', N'COLUMN' ,N'CURRENCY_RATE'
EXEC sys.sp_addextendedproperty N'MS_Description', N'C����� �� ������� OKP_EXTNOM', N'SCHEMA' ,N'dbo', N'TABLE' ,N'OKP_RZP_TRN_DATA', N'COLUMN' ,N'EXTNOM_ID'
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
	COMMENT varchar(500) COLLATE DATABASE_DEFAULT NULL
	CONSTRAINT PK_OKP_SDT_ PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������-�������� �������', N'schema', N'dbo', N'table', N'OKP_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'MSTS'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� �������', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'DT'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'DEP'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������� �����', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'SHIFT'
EXEC sp_addextendedproperty 'MS_Description', N'����������������� �����, �', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'SH_DURATION'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �� ����� � �/�', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'FULL_CAPACITY'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'CREATEBY'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'CREATEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����������� ��������� ��������', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'CLOSEBY'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ��������', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'CLOSEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����������� ��������� ������������', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'REOPENBY'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ������������', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'REOPENDATE'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_SDT', N'column', N'COMMENT'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ���', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� ��', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'SDT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'TOZ_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'DEP$$$DEP'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'WCR$$$WCR'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� � ��������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'DTEPDZ'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'DTEPDV'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �� �����', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'QTYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� (����������)', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'QTYPWO_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'��������.-�������������� ����� �� �������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'QTYPZV'
EXEC sp_addextendedproperty 'MS_Description', N'������� �����', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'QTYEDV'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� �����', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'MOV'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������������� ������� (��. OKP_KTO.TOPIDN)', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'TOP$$$KTO'
EXEC sp_addextendedproperty 'MS_Description', N'����', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'OOD'
EXEC sp_addextendedproperty 'MS_Description', N'���������������-����������.�����', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'PZV'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'VP'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ����� ���������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'TMO'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����� ���������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'������ �����', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'PRF$$$PRF'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'TDDOC'
EXEC sp_addextendedproperty 'MS_Description', N'����� �����������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'TPN'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������ 0-����������� ,  1-����������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'PRODTYPE'
EXEC sp_addextendedproperty 'MS_Description', N'������-��������������� �����', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'TSK'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� ���������� �� ���������������� ������ Null,1 - �����, 0-������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'SPLITPARTIES'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'M_DB'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ���������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'M_DE'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ������ ��� �������� ������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'M_DB_NR'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ��������� ��� �������� ������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'M_DE_NR'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� �������� ������ 0-��������, 1- �������� ���', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'NR'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� ��������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'TU'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������ �������������� ������� ��� ��������� ', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'normtaskDate_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �� �������� (� �������� ��)', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'QTYCQY_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �� �������� �� ��������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'CAPACITY_PLAN'
EXEC sp_addextendedproperty 'MS_Description', N'����������� � ������', N'schema', N'dbo', N'table', N'OKP_SDT_ELEM', N'column', N'COMMENT'
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

EXEC sp_addextendedproperty 'MS_Description', N'�������� ������ �� ������-��������� ��������� (��)', N'schema', N'dbo', N'table', N'OKP_SDT_LOG'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ �������������� ����� � ������� �� ��������', N'schema', N'dbo', N'table', N'OKP_SDTUOP'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��', N'schema', N'dbo', N'table', N'OKP_SDTUOP', N'column', N'SDT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�� ������ ID', N'schema', N'dbo', N'table', N'OKP_SDTUOP', N'column', N'SDT_ELEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����', N'schema', N'dbo', N'table', N'OKP_SDTUOP', N'column', N'UOP_NOS'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ � ��������', N'schema', N'dbo', N'table', N'OKP_SLS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID �������������� ������� (OKP_NOMDATA.ID)', N'schema', N'dbo', N'table', N'OKP_SLS', N'column', N'NOMDATA_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ����������� ������', N'schema', N'dbo', N'table', N'OKP_SLS', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ������������ ��������', N'schema', N'dbo', N'table', N'OKP_SLS', N'column', N'LIM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������� ��������', N'schema', N'dbo', N'table', N'OKP_SLS', N'column', N'KTX'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ���� ��� ���������������� ����������.
���� ������������ ����� ��������� � ������������ � ���������, 
��������� � ������� ��� (��. �������� ������� OKPStruct)', N'schema', N'dbo', N'table', N'OKP_SLS', N'column', N'PRC'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������ �������������� ������������� ����������, �����, ������� � ����. �� �������', N'schema', N'dbo', N'table', N'OKP_SReserv'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������ ��������������', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���������������� ������ (OKP_CPL.RWC), ��� ������� ������������ ������ ��������������', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'CPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������� ������������ (OKP_INV.ID), �� ������� ������������ ������ ��������������', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'INV_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����� (OKP_WRH.WRH_ID), �� ������� ������������ ������ ��������������', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'WRH_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������������-���������� (OKP_DEP.RWC), ��� �������� ������������ ������ ��������������', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'DEP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������, ��� ������� ������������ ������ ��������������', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������� ������ ��������������', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �������������� � ��������� ��� (EV_SYSEIZ.SYSIDN), ��������������� ��� ������������ 
  (OKP_NOM.UOM$$$EIZ) �� ����������� �������������� �������', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �� ������ ���������� � ��������� ��� (��. �������� OKP_SReserv.QTY)', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'QTY_F'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ���������� (������ � �������) � ��������� ��� (��. �������� OKP_SReserv.QTY)', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'QTY_A'
EXEC sp_addextendedproperty 'MS_Description', N'������ QTY_F', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'Fold_Q'
EXEC sp_addextendedproperty 'MS_Description', N'������ QTY_A', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'Fold_A'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������:
 0 - ����� �����������
 1 - ����� �������', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'isActive'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������, ���������� ������', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'User_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'Comment'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������', N'schema', N'dbo', N'table', N'OKP_SReserv', N'column', N'DKD'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� ���������� ������ �� �������� ��� ���', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��� (OKP_SDT_ELEM.ID), ��� ������� ������������ ������', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'SDTElem_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������� ������������ (OKP_INV.ID), �� ������� ������������ ������', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'INV_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� �������� ������', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'DTE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� �������������� �� ��� � ��������� ��� (EV_SYSEIZ.SYSIDN), ��������������� ��� ������������ 
  (OKP_NOM.UOM$$$EIZ) �� ��������� �������������� ������� ������', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� �������� �� ������ ���������� �� ������� ������ ���. ��� - ��. QTY', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'QTY_I'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������ �� ������', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'LDATA'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ QTY_I', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'Fold_I'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ LDATA', N'schema', N'dbo', N'table', N'OKP_SDT_SReserv', N'column', N'Fold_D'
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
	MET dbo.G_CODE NULL,
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

EXEC sp_addextendedproperty 'MS_Description', N'����������', N'schema', N'dbo', N'table', N'OKP_SUP'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����������', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �����������', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'CTR_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� � ������������ (A, S, U): A - ��������; S -  �������� ������������; U - ������������', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'COC'
EXEC sp_addextendedproperty 'MS_Description', N'���� �� ������� ���������� ���������', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'DTECOC'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����������: F - ��������������; P - ���������; K - �������������� ���������', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'TIS'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ����������', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'PRI'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������������� (� �����)', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'SDD'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'NPR'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ����������� ��������', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'GOG'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����������', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'TYP_TRAN'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������������', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'SUP_FON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'���������������� ���� (� ����������)', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'PERSON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ������', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'created_by'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������� ������', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'edited_by'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������� ������', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'created_date'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� ������', N'schema', N'dbo', N'table', N'OKP_SUP', N'column', N'edited_date'
EXEC sys.sp_addextendedproperty N'MS_Description', N'������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_SUP', 'COLUMN', N'GRP_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ��������-���������', N'schema', N'dbo', N'table', N'OKP_sysCounters'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� �������-��������', N'schema', N'dbo', N'table', N'OKP_sysCounters', N'column', N'IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ����� �������-��������', N'schema', N'dbo', N'table', N'OKP_sysCounters', N'column', N'Counter'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ���������� ��������', N'schema', N'dbo', N'table', N'OKP_sysCounters', N'column', N'Step'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� �������-��������', N'schema', N'dbo', N'table', N'OKP_sysCounters', N'column', N'Prefix'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� ����� �������-��������', N'schema', N'dbo', N'table', N'OKP_sysCounters', N'column', N'Sufix'
GO

EXEC sp_addextendedproperty 'MS_Description', N'    
����� �������. � ������ �������, � ����� ������, ������ ���������
  �������� (�������� ������ ��� ���������):
   - �����������
       1) [d], [dd] -    ������������� ����� ���
       2) [m], [mm] -    ������������� ����� ������
       3) [yy], [yyyy] - ������������� ����� ����
       4) [hh] -         ������������� ����� ����
       5) [nn] -         ������������� ����� ������
       6) [ss] -         ������������� ����� �������
       7) [ms] -         ������������� ����� �����������
       8) [0] -          ������������� �������� �������� -
                           ���� ��������� ������������� �������� �������� ������
                           �������, �� ��� ������� ����� ��� ����������� ������
       9) [9] -          ������������� �������� �������� -
                           ���� ��������� ������������� �������� �������� ������
                           �������, �� ������ ��������������� �������� ��������
                           �����������
   - OKP-��������� (��. TOKPParameter) � ���������� �������
   - ���������������� - ����� ����� � ���������� �������
����� ����, ������ ����� ��������� �����, ������� �� ���������
  ���������� ������ - ����� ����� ������ �� �������� � �������������
  � ���������� ��� ��������� ��� ����.
������:
  ��� Counter = 1, 
      Step = 10, 
      Prefix = '''', 
      Suffix = '''', 
      Format = "�� [dd].[mm].[yy] [hh]:[mm]:[ss] ������� ����� [000] ������"
  ��������� ������� �����
      "�� 1.2.2013 17:2:57 ������� ����� 011 ������"
', N'schema', N'dbo', N'table', N'OKP_sysCounters', N'column', N'Format'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������, ���������, �����������...', N'schema', N'dbo', N'table', N'OKP_sysCounters', N'column', N'Describe'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� �������� �������� (�������� ��� ������)', N'schema', N'dbo', N'table', N'OKP_sysCounters', N'column', N'pCounter'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������������� ����������� �������', N'schema', N'dbo', N'table', N'OKP_sysJobs'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� �������', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'Nomer'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'Name'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���������� (OKP_sysSchedules.ID)', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'ScheduleID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ������ �������� �������', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'ActiveFrom'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� �������� �������', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'ActiveTo'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� �����������', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'isStopped'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� �������', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'isSystem'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� � ����� ���������� ����������', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'LastExecuted'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_sysJobs', N'column', N'Describe'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ���������� ������������� ����������� �������', N'schema', N'dbo', N'table', N'OKP_sysJobsLog'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_sysJobsLog', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ����������', N'schema', N'dbo', N'table', N'OKP_sysJobsLog', N'column', N'DateExecute'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������������ �������', N'schema', N'dbo', N'table', N'OKP_sysJobsLog', N'column', N'JobName'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� 0 - �������, 1 - ������', N'schema', N'dbo', N'table', N'OKP_sysJobsLog', N'column', N'Successful'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ���������', N'schema', N'dbo', N'table', N'OKP_sysJobsLog', N'column', N'Message'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ����� ������������� ����������� �������', N'schema', N'dbo', N'table', N'OKP_sysJobSteps'
EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_sysJobSteps', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����', N'schema', N'dbo', N'table', N'OKP_sysJobSteps', N'column', N'Nomer'
EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'OKP_sysJobSteps', N'column', N'Name'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� (OKP_sysJobs.ID)', N'schema', N'dbo', N'table', N'OKP_sysJobSteps', N'column', N'JobID'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������', N'schema', N'dbo', N'table', N'OKP_sysJobSteps', N'column', N'Context'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_sysJobSteps', N'column', N'Describe'
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
EXEC sp_addextendedproperty 'MS_Description', N'��������� ������� ����������', N'schema', N'dbo', N'table', N'OKP_sysLocks'
EXEC sp_addextendedproperty 'MS_Description', 
N'������������� �������� ������������', 
N'schema', N'dbo', N'table', N'OKP_sysLocks', N'column', N'UID'
EXEC sp_addextendedproperty 'MS_Description', 
N'������������� ������������', 
N'schema', N'dbo', N'table', N'OKP_sysLocks', N'column', N'SUID'
EXEC sp_addextendedproperty 'MS_Description', 
N'��� ���������������� ������� (��. OKP_sysObjects.ID)', 
N'schema', N'dbo', N'table', N'OKP_sysLocks', N'column', N'ObjectID'
EXEC sp_addextendedproperty 'MS_Description', 
N'������������� ���������������� ������� (� ������������ �� ��������� ���� OKP_sysObjects.PARAMETERS)', 
N'schema', N'dbo', N'table', N'OKP_sysLocks', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', 
N'������������� ������������, �� ����� �������� ������ ������������ (��. OKP_sysLogins.ID)', 
N'schema', N'dbo', N'table', N'OKP_sysLocks', N'column', N'LoginID'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������ �������������� ����������� 
''9CE20B99-D254-4C62-BC37-57CE93413CD2'' - ����������. 
������ ���������� ����� ���� ��������� ������������,
����������� ���������� ���� FileName-FunctionName, 
��� ���� ����������� �������������� ��������.', N'schema', N'dbo', N'table', N'OKP_sysLOGISTICS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_sysLOGISTICS', N'column', N'UID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_sysLOGISTICS', N'column', N'IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'OKP_sysLOGISTICS', N'column', N'Name'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ����� ����������', N'schema', N'dbo', N'table', N'OKP_sysLOGISTICS', N'column', N'FileName'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'OKP_sysLOGISTICS', N'column', N'FunctionName'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_sysLOGISTICS', N'column', N'Comment'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ����������, ������������ ��� �������������� � �������������', N'schema', N'dbo', N'table', N'OKP_sysParameters'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�����', N'schema', N'dbo', N'table', N'OKP_sysParameters', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������', N'schema', N'dbo', N'table', N'OKP_sysParameters', N'column', N'IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ����������', N'schema', N'dbo', N'table', N'OKP_sysParameters', N'column', N'GRP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ���������', N'schema', N'dbo', N'table', N'OKP_sysParameters', N'column', N'NICK'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������', N'schema', N'dbo', N'table', N'OKP_sysParameters', N'column', N'DESCRIBE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������������� ������', N'schema', N'dbo', N'table', N'OKP_sysParameters', N'column', N'ADDINFO'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ �������������� ����������� ���������', N'schema', N'dbo', N'table', N'OKP_sysPrmStruct'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_sysPrmStruct', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ���������', N'schema', N'dbo', N'table', N'OKP_sysPrmStruct', N'column', N'Prm_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������������� ��������� ���������', N'schema', N'dbo', N'table', N'OKP_sysPrmStruct', N'column', N'NICK'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ��������������� ���������� ���������', N'schema', N'dbo', N'table', N'OKP_sysPrmStruct', N'column', N'DESCRIBE'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� ����� ��������', N'schema', N'dbo', N'table', N'OKP_sysSampleTypes'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ����', N'schema', N'dbo', N'table', N'OKP_sysSampleTypes', N'column', N'GUID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ������������ �������-�������� OKP_sysCounters.ID', N'schema', N'dbo', N'table', N'OKP_sysSampleTypes', N'column', N'CounterID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������, ���������, �����������...', N'schema', N'dbo', N'table', N'OKP_sysSampleTypes', N'column', N'Describe'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ ������������� �������', N'schema', N'dbo', N'table', N'OKP_sysSampleTypes', N'column', N'ColumnName'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ����������', N'schema', N'dbo', N'table', N'OKP_sysSchedules'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_sysSchedules', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �������� ���� ������ (������������ ������ ���� IntervalBase = ��� ��� ����). 
 1 - �����������,
 2 - �������,
 ...
 7 - �����������,
 8 - ��� ������.
�������� ������������� ����� �������.', N'schema', N'dbo', N'table', N'OKP_sysSchedules', N'column', N'ActiveWeekDays'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� [�����]/[���� ������ + �����]/[���� ���� + �����]. 
  - ��� IntervalBase = ���   - �� ����� ��������
  - ��� IntervalBase = ����  - ������������ �������� �������
  - ��� IntervalBase = ����� - ������������ �������� ��� + �������
  - ��� IntervalBase = ���   - ������������ �������� ��� + ������ + �������', N'schema', N'dbo', N'table', N'OKP_sysSchedules', N'column', N'ActiveDay'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ������������. 
 1 - ���,
 2 - ����,
 3 - �����,
 4 - ���', N'schema', N'dbo', N'table', N'OKP_sysSchedules', N'column', N'IntervalBase'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ������ ������������
  - ��� IntervalBase = ���   - ���������� �����
  - ��� IntervalBase = ����  - ���������� ����
  - ��� IntervalBase = ����� - ���������� �������
  - ��� IntervalBase = ���   - ���������� ���', N'schema', N'dbo', N'table', N'OKP_sysSchedules', N'column', N'IntervalVal'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� �������� ������������ ������ ', N'schema', N'dbo', N'table', N'OKP_TECHDOUBLES'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� �������', N'schema', N'dbo', N'table', N'OKP_TECHDOUBLES', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'����� - ��������', N'schema', N'dbo', N'table', N'OKP_TECHDOUBLES', N'column', N'NUM_ORIGIN'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ������', N'schema', N'dbo', N'table', N'OKP_TECHDOUBLES', N'column', N'NUM_DEPENDINGS'
EXEC sp_addextendedproperty 'MS_Description', N'�� ���', N'schema', N'dbo', N'table', N'OKP_TECHDOUBLES', N'column', N'RWC_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'�� ��� ���������', N'schema', N'dbo', N'table', N'OKP_TECHDOUBLES', N'column', N'RWC_CPL_ORIG'
EXEC sp_addextendedproperty 'MS_Description', N'�� ��������� ���', N'schema', N'dbo', N'table', N'OKP_TECHDOUBLES', N'column', N'RWC_CPL_DEPEND'

GO

/*
** ��������� ������������ ���������
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

EXEC sp_addextendedproperty N'MS_Description',N'������������ ���������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR'
EXEC sp_addextendedproperty N'MS_Description',N'�������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'ID'
EXEC sp_addextendedproperty N'MS_Description',N'������ ������ ����������� ��������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'ID_FIO'
EXEC sp_addextendedproperty N'MS_Description',N'����������� �������� ������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'WCRIDN'
EXEC sp_addextendedproperty N'MS_Description',N'����� �� ���� ��������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'REG_OP'
EXEC sp_addextendedproperty N'MS_Description',N'����� �� ��������� �������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'EditRZO'
EXEC sp_addextendedproperty N'MS_Description',N'����� �� ��������� ���',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'EditTRO'
EXEC sp_addextendedproperty N'MS_Description',N'����� �� ��������� ���-��',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'EditTSK'
EXEC sp_addextendedproperty N'MS_Description',N'���������� ��������� ������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'ShowCost'
EXEC sp_addextendedproperty N'MS_Description',N'���� �� ��������� ������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_TERMINAL_USR',N'COLUMN',N'REG_BY_SN'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� �������� ����������������� ����� �� ������ ���������� (T_emp P_lans based on C_yclogramm)', N'schema', N'dbo', N'table', N'OKP_TPC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ������� ������������', N'schema', N'dbo', N'table', N'OKP_TPC', N'column', N'DB'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ������� ������������', N'schema', N'dbo', N'table', N'OKP_TPC', N'column', N'DE'
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
	autouop BIT CONSTRAINT df_okp_tpc_toz_autouop DEFAULT (0) NOT NULL,
	useKOID tinyint CONSTRAINT df_okp_tpc_toz_useKOID DEFAULT (1) NOT NULL,
	verify_need bit CONSTRAINT df_okp_tpc_toz_VERIFY_NEED DEFAULT (0) NOT NULL,
        SHELFLIFE float CONSTRAINT df_okp_tpc_toz_SHELFLIFE DEFAULT 0 NOT NULL,
        SHELFLIFE_EIZID INT CONSTRAINT df_okp_tpc_toz_SHELFLIFE_EIZID DEFAULT 9 NOT NULL,
        SHELFLIFE_STS INT CONSTRAINT df_okp_tpc_toz_SHELFLIFE_STS DEFAULT 0 NOT NULL,
        SHT float CONSTRAINT df_okp_tpc_toz_SHT DEFAULT 0 NOT NULL

)
GO

/* @NAME: OKP_TPC_WCRCapacity
** @COMM: 1. WPL_ID �������� ��������� NULL, ������ ��� ��� �������� �� ������ ���� �������� ����� � ���� �������
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������ �������� ����������������� ����� �� ������ ����������', N'schema', N'dbo', N'table', N'OKP_TPCData'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� "������������" ������ (OKP_TPCData.ID)', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'IDP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ ����� (OKP_TPC.ID)', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'TPC_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������������, ����������� �� �������������� � ����� �������', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'ITEM_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������ (OKP_NOM.RWC)', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'NOM_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ������� (��. f_FullBom)', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'NOM_IDX'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ���������: 
0 - ������ ������ � ������ �����������
1 - ������ ��������� �� ������� � ���������� � �����������
2 - ������ ��������� �� ������� � ���������� � �����
3 - ������ ��������� �� �������
4 - ������ ��������� �� ������� � �������� � ��������� ��
5 - ������ ��������� �� ������� � �������� ��������� ������ ������, ���������� � ��������� ��', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'SHIFT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ������������ ������������ NOM_ID', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'DB'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ������������ ������������ NOM_ID', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'DE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� (OKP_ROUTES.ID)', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'ROUTE_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� �� ������� "��������" �������', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'QTY_PC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� �� ������� "��������" �������', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'QTY_PCO'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ������', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����������� (OKP_CGM.ID) - ������ ��� TOP-��������', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'CGM_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'PlanType'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ������������ ������', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'PartySize'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ������ (����� �������� ������ ��� �������, � ������� IDP is null)
  0 - �� �������� 
  1 - �������� 
  2 - ��������� � ����', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'STATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������, ���������/���������� ������ (OKP_USERS.USER_ID)', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'USER_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ������� � ���������������� ����� (OKP_PPP.RWC)', N'schema', N'dbo', N'table', N'OKP_TPCData', N'column', N'PPP_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ � ������ (OKP_PLOData.ID)', 'schema', 'dbo', 'table', 'OKP_TPCData', 'column', 'PLOData_ID'
go

EXEC sp_addextendedproperty 'MS_Description', N'���� ������� ������ (OKP_TPCData.ITEM_ID)', 'schema', 'dbo', 'table', 'OKP_TPCData', 'column', 'Master_ITEM_ID'
go

EXEC sys.sp_addextendedproperty N'MS_Description', N'���� ������� ������ (OKP_TPCData.ITEM_ID)', N'SCHEMA', N'dbo', N'TABLE', N'OKP_TPCData', N'COLUMN', N'Slave_ITEM_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� �������� ��������������� ���������', N'schema', N'dbo', N'table', N'OKP_TPSample'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� � OKP_NOM', N'schema', N'dbo', N'table', N'OKP_TPSample', N'column', N'NOMDATA_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������ �������', N'schema', N'dbo', N'table', N'OKP_TPSample', N'column', N'DOC_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ����', N'schema', N'dbo', N'table', N'OKP_TPSample', N'column', N'OFFICE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ����������� (OKP_users.FIO)', N'schema', N'dbo', N'table', N'OKP_TPSample', N'column', N'A_FIO'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� �����������', N'schema', N'dbo', N'table', N'OKP_TPSample', N'column', N'A_DTE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� �������', N'schema', N'dbo', N'table', N'OKP_TPSample', N'column', N'DESCRIBE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� "������ ��������". 0 - �� ��������, 1 - ��������', N'schema', N'dbo', N'table', N'OKP_TPSample', N'column', N'isAgreed'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� "������ �� ���������". �� ��������� ����� ���� ������ ����.
�������� �� ��������� ����� ���� � ����������� � ������������� ������.
0 - �� �������� �������� �� ���������, 1 - �������� �������� �� ���������', N'schema', N'dbo', N'table', N'OKP_TPSample', N'column', N'isDefault'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� ������ ��������������� ���������', N'schema', N'dbo', N'table', N'OKP_TPSampleData'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ �� � OKP_TPSample.ID', N'schema', N'dbo', N'table', N'OKP_TPSampleData', N'column', N'TPS_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� �����', N'schema', N'dbo', N'table', N'OKP_TPSampleData', N'column', N'N'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ �����', N'schema', N'dbo', N'table', N'OKP_TPSampleData', N'column', N'NAME'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���� (OKP_TPSampleData.ID), �������� ������ (����� ���������)', N'schema', N'dbo', N'table', N'OKP_TPSampleData', N'column', N'BEGIN_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���� (OKP_TPSampleData.ID), �������� ��������� (����� ������)', N'schema', N'dbo', N'table', N'OKP_TPSampleData', N'column', N'END_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� �������� ����� ������� ��', N'schema', N'dbo', N'table', N'OKP_TPSampleData', N'column', N'DESCRIBE'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� ������������ �� �������� ��������������� ���������', N'schema', N'dbo', N'table', N'OKP_TPSampleQTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ �� (OKP_TPSample.ID)', N'schema', N'dbo', N'table', N'OKP_TPSampleQTY', N'column', N'TPS_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������ �� �������', N'schema', N'dbo', N'table', N'OKP_TPSampleQTY', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������������� ����� ������� ��� ���������� ���������� ������������', N'schema', N'dbo', N'table', N'OKP_TPSampleQTY', N'column', N'EIZ_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������������� ��������� ������ ��������������� ���������', N'schema', N'dbo', N'table', N'OKP_TPSampleQTYData'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� ���������� ������������ �� ������� �� (OKP_TPSampleQTY.ID)', N'schema', N'dbo', N'table', N'OKP_TPSampleQTYData', N'column', N'TPQ_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���� ������� �� (OKP_TPSampleData.ID)', N'schema', N'dbo', N'table', N'OKP_TPSampleQTYData', N'column', N'TPD_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ �����', N'schema', N'dbo', N'table', N'OKP_TPSampleQTYData', N'column', N'CYCLE'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������� ��������� ������ ��������������� ���������', N'schema', N'dbo', N'table', N'OKP_TPSampleSostav'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���� ������� �� (OKP_TPSampleData.ID)', N'schema', N'dbo', N'table', N'OKP_TPSampleSostav', N'column', N'TPD_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ �� (OKP_TPSample.ID) (��� ��������)', N'schema', N'dbo', N'table', N'OKP_TPSampleSostav', N'column', N'TPS_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� ������ �� ������������ � ������� (f_FullBom.GRP_IDN+'',''+f_FullBom.ID)', N'schema', N'dbo', N'table', N'OKP_TPSampleSostav', N'column', N'NOM_IDX'
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

EXEC sp_addextendedproperty 'MS_Description', N'���� ����������', N'schema', N'dbo', N'table', N'OKP_TSO'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ���� ����������', N'schema', N'dbo', N'table', N'OKP_TSO', N'column', N'TSO_IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ ����������', N'schema', N'dbo', N'table', N'OKP_TSO', N'column', N'TSO_NAM'
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

EXEC sp_addextendedproperty 'MS_Description', N'�������� ������ ���� � �����', N'schema', N'dbo', N'table', N'OKP_UBRNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��� � �����', N'schema', N'dbo', N'table', N'OKP_UBRNUMS', N'column', N'N_Act'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������������� �������� OKP_TOZ.RWC', N'schema', N'dbo', N'table', N'OKP_UBRNUMS', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���������� ����������������� ����� (OKP_UNOM.ID/OKP_UKIM.ID)', N'schema', N'dbo', N'table', N'OKP_UBRNUMS', N'column', N'UNOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��� ������ (OKP_sysObjects.ID)', N'schema', N'dbo', N'table', N'OKP_UBRNUMS', N'column', N'N_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������� � ������', N'schema', N'dbo', N'table', N'OKP_UBRNUMS', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������', N'schema', N'dbo', N'table', N'OKP_UBRNUMS', N'column', N'EditDate'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������ ������ � ���������� ����������������� ������� �������', N'schema', N'dbo', N'table', N'OKP_UOPNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'����', N'schema', N'dbo', N'table', N'OKP_UOPNUMS', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������������� �������� OKP_TOZ.RWC', N'schema', N'dbo', N'table', N'OKP_UOPNUMS', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���������� ����������������� ����� (OKP_UNOM.ID)', N'schema', N'dbo', N'table', N'OKP_UOPNUMS', N'column', N'UNOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ ����� (OKP_UOP.GrIDN)', N'schema', N'dbo', N'table', N'OKP_UOPNUMS', N'column', N'UOP_GrUID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��� ������ (OKP_sysObjects.ID)', N'schema', N'dbo', N'table', N'OKP_UOPNUMS', N'column', N'N_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'���������� � ����������������� ������', N'schema', N'dbo', N'table', N'OKP_UOPNUMS', N'column', N'QTY'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ������������ ������ ���', N'schema', N'dbo', N'table', N'OKP_UKIM'
EXEC sp_addextendedproperty 'MS_Description', N'����', N'schema', N'dbo', N'table', N'OKP_UKIM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'����������������� ����. ������ �� OKP_NOM.RWC', N'schema', N'dbo', N'table', N'OKP_UKIM', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ��������������� ������������� ������ ���', N'schema', N'dbo', N'table', N'OKP_UKIM', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������������� ������ ���', N'schema', N'dbo', N'table', N'OKP_UKIM', N'column', N'EXT_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'����������', N'schema', N'dbo', N'table', N'OKP_UKIM', N'column', N'CERTIFICATE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ����� ��������', N'schema', N'dbo', N'table', N'OKP_UKIM', N'column', N'PermDate'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������ ���', N'schema', N'dbo', N'table', N'OKP_UKIM', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� OKP_EXTNOM.ID (��������� ����� � �������� ������� ����������� ������������)', N'schema', N'dbo', N'table', N'OKP_UKIM', N'column', N'EXTNOM_ID'
GO

/*
** ���������� �� ����������� ���
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� �� ������������ ���������������� ������', N'schema', N'dbo', N'table', N'OKP_UNIONCPL'
EXEC sp_addextendedproperty 'MS_Description', N'ID', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'OLD_NUM'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ����������', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'OLD_QTY'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��� - ��������� ������', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'OLD_PARNUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��� ���������', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'OLD_PARRWC'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� ������', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'OLD_PLODATAID'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����� ������������ ������', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'NEW_NUM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������ ����� ������������ ������ ���', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'NEW_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'����� �� ����� ������', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'NEW_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'OLD_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'OLD_REM'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ����������', N'schema', N'dbo', N'table', N'OKP_UNIONCPL', N'column', N'OLD_NPR'
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� �������� �������� (������������� �������� �� �������)', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� �������� (OKP_WRH_SUBJECTS.ID) ', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS', N'column', N'IDP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������������� ��������� ����. ������ �� OKP_INV.INV_ID', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS', N'column', N'INV_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� �������. ������ �� OKP_UNOM.ID/OKP_KIM.ID', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS', N'column', N'S_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������. ������ �� OKP_sysObjects.ID', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS', N'column', N'ObjectTypeID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� ������� � ��������. ���������� ������� � ��������� ��� ������� (��. �������� OKP_INV.QTY)', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ������� �������� � ��������� ��� ������� (��. �������� OKP_INV.PRC)', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS', N'column', N'PRC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� (������������� OKP_TRN.DKD ��������� ������� �� �����)', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS', N'column', N'DKD'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� �������� ��������', N'schema', N'dbo', N'table', N'OKP_WRH_SUBJECTS', N'column', N'DTE'
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

EXEC sp_addextendedproperty 'MS_Description', N'�������� ������', N'schema', N'dbo', N'table', N'OKP_UNOM'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'����������������� ����. ������ �� OKP_NOM.RWC', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �����', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������� �������� �����', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'EXT_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'����������', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'CERTIFICATE'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'DESCRIBE'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� OKP_CPL.RWC (��������� �������������� � ������ ������������)', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'CPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� OKP_EXTNOM.ID (��������� ����� � �������� ������� ����������� ������������)', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'EXTNOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ����� ��������', N'schema', N'dbo', N'table', N'OKP_UNOM', N'column', N'PermDate'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������ ������ � ���������� ����������������� ������� ���', N'schema', N'dbo', N'table', N'OKP_UOPKIMNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ ����� (OKP_UOP.GrUID)', N'schema', N'dbo', N'table', N'OKP_UOPKIMNUMS', N'column', N'UOP_GrUID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������� �������� ������ (OKP_WRH_SUBJECTS.ID)', N'schema', N'dbo', N'table', N'OKP_UOPKIMNUMS', N'column', N'WRHSUBJ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ���-�� � �������� ��������� ����������� OKP_POT.QTYPOT', N'schema', N'dbo', N'table', N'OKP_UOPKIMNUMS', N'column', N'QTY_USED'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������ (0 �� ������; 1 � ������������)', N'schema', N'dbo', N'table', N'OKP_UOPKIMNUMS', N'column', N'TK'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ������������� ������ �� ������������ �������� ', N'schema', N'dbo', N'table', N'OKP_UOPUNION'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� �����', N'schema', N'dbo', N'table', N'OKP_UOPUNION', N'column', N'NOS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� �������� �� �������� �������', N'schema', N'dbo', N'table', N'OKP_UOPUNION', N'column', N'L_QTYGQY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� �� �� �����������', N'schema', N'dbo', N'table', N'OKP_UOPUNION', N'column', N'OLD_PPP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ��� �� �����������', N'schema', N'dbo', N'table', N'OKP_UOPUNION', N'column', N'OLD_CPL'
GO

--
-- Definition for table OKP_UPU : 
--

CREATE TABLE dbo.OKP_UPU (
  ID bigint IDENTITY(1, 1) NOT NULL,
  UPU_IDN varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  SUP_IDN varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
  PRC dbo.G_PRICE NULL,
  REG int DEFAULT 0 NOT NULL,
  SDDPER float DEFAULT 0 NOT NULL,
  QTYTNP dbo.G_QUANT_F DEFAULT 0 NOT NULL,
  EIZ_IDN varchar(3) COLLATE DATABASE_DEFAULT NOT NULL,
  UPUCPP dbo.G_QUANT_F DEFAULT 0 NOT NULL,
  UPUGPP dbo.G_QUANT_F DEFAULT 0 NOT NULL,
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������� ����������� � ���������� ��������', N'schema', N'dbo', N'table', N'OKP_UPU'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'UPU_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'SUP_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������������� ����� ���', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'PRC'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'REG'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'SDDPER'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ��������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'QTYTNP'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� �������� ������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'EIZ_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'UPUCPP'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������ ��������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'UPUGPP'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ��� ����������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'UPUTRS'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������� ���������������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'FLLINT'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������� ��������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'FLLINU'
EXEC sp_addextendedproperty 'MS_Description', N'�����', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ����������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'PRIORITY'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����� �������� (OKP_WRH)', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'WRH_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ����������� �� ��� ������������ � ��� ��������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'K'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'WKL_BARCODE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� (�� ���)', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'PRC_PUR'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������� ��������: 0-�� �����������, 1-�����������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'ISACTIVE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'created_by'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������� ������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'edited_by'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������� ������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'created_date'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� ������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'edited_date'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������� ������������', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ���������� ����', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'dte_prc_updated'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� OKP_EXTNOM', N'schema', N'dbo', N'table', N'OKP_UPU', N'column', N'EXTNOM_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ������������� �� ������ �������', N'schema', N'dbo', N'table', N'OKP_UserReports'

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

EXEC sp_addextendedproperty 'MS_Description', N'����������� �����', N'schema', N'dbo', N'table', N'OKP_VPlan'
EXEC sp_addextendedproperty 'MS_Description', N'����� �� �������, ������������ ��������', N'schema', N'dbo', N'table', N'OKP_VPlan', N'column', N'N'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ��� �����', N'schema', N'dbo', N'table', N'OKP_VPlan', N'column', N'Name'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ������� ������������ (�� �����)', N'schema', N'dbo', N'table', N'OKP_VPlan', N'column', N'LimB'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������� ������������ (�� �����)', N'schema', N'dbo', N'table', N'OKP_VPlan', N'column', N'LimE'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������', N'schema', N'dbo', N'table', N'OKP_VPlan', N'column', N'Comment'
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


EXEC sp_addextendedproperty 'MS_Description', N'������� ����������� ������', N'schema', N'dbo', N'table', N'OKP_VObj'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� ������ OKP_VPlan.ID', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'VID'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������� �������� ��� �����', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'Name'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������ ������������ �������; �������� ����������� 
�� ������������� ����� ��� (��. ������� TWTime_IntAsDateTime)', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'DB'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������������ �������; �������� ����������� 
�� ������������� ����� ��� (��. ������� TWTime_IntAsDateTime)', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'DE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������� ������', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'ZakDTE'
EXEC sp_addextendedproperty 'MS_Description', N'���������', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'Priority'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������� (1 - ��������, 0 - ���)', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'Calced'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'Comment'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� (����������) ������� � �������� �����', N'schema', N'dbo', N'table', N'OKP_VObj', N'column', N'Num'
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
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� ����������� ������', N'schema', N'dbo', N'table', N'OKP_VElem'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� OKP_VElem.ID', N'schema', N'dbo', N'table', N'OKP_VElem', N'column', N'P_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� �������� OKP_VObj.ID', N'schema', N'dbo', N'table', N'OKP_VElem', N'column', N'OID'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������� ��������', N'schema', N'dbo', N'table', N'OKP_VElem', N'column', N'KOL'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �������� �� ������� ��������', N'schema', N'dbo', N'table', N'OKP_VElem', N'column', N'KOLpO'
EXEC sp_addextendedproperty 'MS_Description', N'����� �� ������������ � ��������� ���� �� ������� ��������', N'schema', N'dbo', N'table', N'OKP_VElem', N'column', N'PPPNUM'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������ ��������������� ��', N'schema', N'dbo', N'table', N'OKP_VElem', N'column', N'RegDB'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ��������������� ��', N'schema', N'dbo', N'table', N'OKP_VElem', N'column', N'RegDE'
EXEC sp_addextendedproperty 'MS_Description', N'������ ��������: 0-�� ���������� � ����; 1-�����������', N'schema', N'dbo', N'table', N'OKP_VElem', N'column', N'ST'
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
EXEC sp_addextendedproperty 'MS_Description', N'������� �������� ����������� ������', N'schema', N'dbo', N'table', N'OKP_VOper'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� ��������� OKP_VElem.ID', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'EID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� �������� OKP_VObj.ID (��� ��������� �������)', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'OID'
EXEC sp_addextendedproperty 'MS_Description', N'�� (��. ������� OKP_WRC.WCR$$$IDN)', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'WCR'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'KTO'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ��������', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'KTOName'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'N'
EXEC sp_addextendedproperty 'MS_Description', N'� �������', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'TSH'
EXEC sp_addextendedproperty 'MS_Description', N'� �����������', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'TPN'
EXEC sp_addextendedproperty 'MS_Description', N'� ���������������', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'TMO'
EXEC sp_addextendedproperty 'MS_Description', N'��� � ��������', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'EIZ_TSH'
EXEC sp_addextendedproperty 'MS_Description', N'��� � �����������', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'EIZ_TPN'
EXEC sp_addextendedproperty 'MS_Description', N'��� � ����������������', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'EIZ_TMO'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������ ��������; �������� ����������� 
�� ������������� ����� ��� (��. ������� TWTime_IntAsDateTime)', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'DB'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ��������; �������� ����������� 
�� ������������� ����� ��� (��. ������� TWTime_IntAsDateTime)', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'DE'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �� (��. ������� OKP_WCR.NMC$$$NAM)', N'schema', N'dbo', N'table', N'OKP_VOper', N'column', N'WCRName'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ����� ���������� �������', N'schema', N'dbo', N'table', N'OKP_WASTE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_WASTE', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ���������', N'schema', N'dbo', N'table', N'OKP_WASTE', N'column', N'IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_WASTE', N'column', N'Datecreation'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'OKP_WASTE', N'column', N'creator'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� (TOZ)', N'schema', N'dbo', N'table', N'OKP_WASTE', N'column', N'RWC_toz'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ����������  �������', N'schema', N'dbo', N'table', N'OKP_WASTE', N'column', N'QtyW'
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

EXEC sp_addextendedproperty 'MS_Description', N'�������������� ��', N'schema', N'dbo', N'table', N'OKP_WCRALTER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ��', N'schema', N'dbo', N'table', N'OKP_WCRALTER', N'column', N'WCR_MAIN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������������� ��', N'schema', N'dbo', N'table', N'OKP_WCRALTER', N'column', N'WCR_ALTER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������ ��������� ������������', N'schema', N'dbo', N'table', N'OKP_WCRALTER', N'column', N'USERNAME'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� �������� ������������', N'schema', N'dbo', N'table', N'OKP_WCRALTER', N'column', N'DATE_CREATE'
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

EXEC sp_addextendedproperty 'MS_Description', N'����������� �������� ��', N'schema', N'dbo', N'table', N'OKP_WCRCapEnlarged'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��', N'schema', N'dbo', N'table', N'OKP_WCRCapEnlarged', N'column', N'WCR'
GO

EXEC sp_addextendedproperty 'MS_Description', N'RWC ��������', N'schema', N'dbo', N'table', N'OKP_WCRCapEnlarged', N'column', N'RWC_TOZ'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� �� ��������� � ����� (���.)', N'schema', N'dbo', N'table', N'OKP_WCRCapEnlarged', N'column', N'EMPLOYMENT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_WCRCapEnlarged', N'column', N'DateEMPLOYMENT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���', N'schema', N'dbo', N'table', N'OKP_WCRCapEnlarged', N'column', N'CPLNUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'OKP_WCRCapEnlarged', N'column', N'NOP'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� "������" ��������� ��������', N'schema', N'dbo', N'table', N'OKP_WRHFOLDS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_WRHFOLDS', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����� (OKP_WRH.WRH_ID)', N'schema', N'dbo', N'table', N'OKP_WRHFOLDS', N'column', N'WRH_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ���������', N'schema', N'dbo', N'table', N'OKP_WRHFOLDS', N'column', N'DOC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� ����������� ���������', N'schema', N'dbo', N'table', N'OKP_WRHFOLDS', N'column', N'DTE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� ���������', N'schema', N'dbo', N'table', N'OKP_WRHFOLDS', N'column', N'DKD'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������', N'schema', N'dbo', N'table', N'OKP_WRHFOLDS', N'column', N'DESCRIBE'
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

EXEC sp_addextendedproperty N'MS_Description',N'������ �������� �������������� ��������� � ������ ��� ������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_WRK'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'DTE'
EXEC sp_addextendedproperty 'MS_Description', N'������������� (OKP_FIO) ����, ��� ������� ������', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'WHO_ADD_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �����������', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'RWC_FIO'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'RWC_TOZ'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ����������', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'1 - ������� �� ��������.  �� ���������', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'MET'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� �������� �������', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'ID_SDT_ELEM'
EXEC sp_addextendedproperty 'MS_Description', N'������ ��������', N'schema', N'dbo', N'table', N'OKP_WRK', N'column', N'SEL'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ �� �����������',N'SCHEMA',N'dbo','TABLE',N'OKP_WRK','COLUMN',N'OLD_NUM'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� (������ ��� ����������� �����)',N'SCHEMA',N'dbo','TABLE',N'OKP_WRK','COLUMN',N'TGRP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������',N'SCHEMA',N'dbo','TABLE',N'OKP_WRK','COLUMN',N'IS_SETTED'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �� ��',N'SCHEMA',N'dbo','TABLE',N'OKP_WRK','COLUMN',N'WPL_ID'

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
	��� varchar(1) COLLATE DATABASE_DEFAULT NULL,
	wpl_id INT NULL,
	CONSTRAINT PK_OKP_WRK_ACTIV_ID PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �������������� ����� �� ������� ������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_WRK_ACTIV'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� OKP_WRK', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'WRK_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�� - �����������', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'WCR_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'DTE_ACTIVE'
EXEC sp_addextendedproperty 'MS_Description', N'����������', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ���������', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'QTY_DONE'
EXEC sp_addextendedproperty 'MS_Description', N'������: 0 - ��������������; 1 - ������������', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'STS'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� ������', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'DTE_DEACTIVE'
EXEC sp_addextendedproperty 'MS_Description', N'����� (��������� ����)', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'���'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��', N'schema', N'dbo', N'table', N'OKP_WRK_ACTIV', N'column', N'wpl_id'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� �� ������� �������������� ������ ��� �������� ', N'schema', N'dbo', N'table', N'OKP_XSL'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����', N'schema', N'dbo', N'table', N'OKP_XSL', N'column', N'RWC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������� �����', N'schema', N'dbo', N'table', N'OKP_XSL', N'column', N'UID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'OKP_XSL', N'column', N'NAME'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������', N'schema', N'dbo', N'table', N'OKP_XSL', N'column', N'COMMENT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �����', N'schema', N'dbo', N'table', N'OKP_XSL', N'column', N'FILENAME'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �����', N'schema', N'dbo', N'table', N'OKP_XSL', N'column', N'FILEDATA'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� �� ���������', N'schema', N'dbo', N'table', N'OKP_XSL', N'column', N'EXT'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ������� ��������', N'schema', N'dbo', N'table', N'OKP_ZPU'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ������� ������ (OKP_PLOData.ID)', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'PLOData_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ��������', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'LIN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'PRI'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� ������:
1 - ���� ��������
2 - ������ ��������
3 - � ������� �� ��������', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'STS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ��������', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'DTE_PO'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ���� ��������', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'DTE_TO'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ����� �� �����', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'DTE_DS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������� ��������', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'QTY_PK'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� ��������', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'QTY_TK'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� �� �����', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'QTY_KS'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ����������� ����������', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'QTY_FC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ���� ������� ���', N'schema', N'dbo', N'table', N'OKP_ZPU', N'column', N'PRC'
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ������-�������� �������', N'schema', N'dbo', N'table', N'ARH_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'MSTS'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� �������', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'DT'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'DEP'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������� �����', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'SHIFT'
EXEC sp_addextendedproperty 'MS_Description', N'����������������� �����, �', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'SH_DURATION'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �� ����� � �/�', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'FULL_CAPACITY'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'CREATEBY'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'CREATEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����������� ��������� ��������', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'CLOSEBY'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ��������', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'CLOSEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ����������� ��������� ������������', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'REOPENBY'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ������������', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'REOPENDATE'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'ARH_SDT', N'column', N'COMMENT'
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
EXEC sp_addextendedproperty 'MS_Description', N'����� ����� ���', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� ��', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'SDT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'TOZ_RWC'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'DEP$$$DEP'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'WCR$$$WCR'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� � ��������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'DTEPDZ'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'DTEPDV'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �� �����', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'QTYPQY'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� (����������)', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'QTYPWO_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'��������.-�������������� ����� �� �������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'QTYPZV'
EXEC sp_addextendedproperty 'MS_Description', N'������� �����', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'QTYEDV'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� �����', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'MOV'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������������� ������� (��. OKP_KTO.TOPIDN)', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'TOP$$$KTO'
EXEC sp_addextendedproperty 'MS_Description', N'����', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'OOD'
EXEC sp_addextendedproperty 'MS_Description', N'���������������-����������.�����', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'PZV'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'VP'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ����� ���������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'TMO'
EXEC sp_addextendedproperty 'MS_Description', N'������� ����� ���������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'TRO'
EXEC sp_addextendedproperty 'MS_Description', N'������ �����', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'RZO'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'PRF$$$PRF'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ��', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'TDDOC'
EXEC sp_addextendedproperty 'MS_Description', N'����� �����������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'TPN'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������ 0-����������� ,  1-����������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'PRODTYPE'
EXEC sp_addextendedproperty 'MS_Description', N'������-��������������� �����', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'TSK'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� ���������� �� ���������������� ������ Null,1 - �����, 0-������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'SPLITPARTIES'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'M_DB'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ���������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'M_DE'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ������ ��� �������� ������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'M_DB_NR'
EXEC sp_addextendedproperty 'MS_Description', N'�������� (�����������) ���� ��������� ��� �������� ������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'M_DE_NR'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� �������� ������ 0-��������, 1- �������� ���', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'NR'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� ��������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'TU'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������ �������������� ������� ��� ��������� ', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'normtaskDate_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �� �������� (� �������� ��)', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'QTYCQY_SDT'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �� �������� �� ��������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'CAPACITY_PLAN'
EXEC sp_addextendedproperty 'MS_Description', N'����������� � ������', N'schema', N'dbo', N'table', N'ARH_SDT_ELEM', N'column', N'COMMENT'
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ������ �������������� ����� � ������� �� ��������', N'schema', N'dbo', N'table', N'ARH_SDTUOP'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��', N'schema', N'dbo', N'table', N'ARH_SDTUOP', N'column', N'SDT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�� ������ ID', N'schema', N'dbo', N'table', N'ARH_SDTUOP', N'column', N'SDT_ELEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����', N'schema', N'dbo', N'table', N'ARH_SDTUOP', N'column', N'UOP_NOS'
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ������� ���������� ������� (InterPlant Transfer)', N'schema', N'dbo', N'table', N'ARH_IPT'
EXEC sp_addextendedproperty 'MS_Description', N'������������� IPT', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� (IntFormat)', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'DT'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� ���/MM-��-DEP', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'IPTNUM'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ��������� �� �����', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'INTNUM'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������-�����������', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'DEP_ID_SENDER'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������-����������', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'DEP_ID_RECEIVER'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'CREATEBY'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'CREATEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'0-�����, 1-����������, 2-�������', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'STATE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������� "1 ����������"', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'STATE1DATE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������� "2 �������"', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'STATE2DATE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������� ������ "1 ����������"', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'STATE1BY'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���������� ������ "2 �������"', N'schema', N'dbo', N'table', N'ARH_IPT', N'column', N'STATE2BY'
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
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� ��������� "���������� ��������"', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM'
EXEC sp_addextendedproperty 'MS_Description', N'��', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� IPT', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'IPT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ��� ��������', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������-���������', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'TOZ_RWC_SENDER'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������-���������', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'TOZ_RWC_RECEIVER'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'CREATEBY'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������������', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'CREATEDATE'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������
0- �����������
1- �������� ������
2- ��������� ������', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'STATE'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� �������� ���������� ����� �������� � ������ "�������"', N'schema', N'dbo', N'table', N'ARH_IPT_ELEM', N'column', N'QTY_CLOSED'
EXEC sp_addextendedproperty N'MS_Description', N'��������������� ���� �������������', 'schema', 'dbo', 'table', 'ARH_IPT_ELEM', 'column', 'UID'
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
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ �������� ���������� �������', N'schema', N'dbo', N'table', N'ARH_IPT_RECEIVE'
EXEC sp_addextendedproperty 'MS_Description', N'��', N'schema', N'dbo', N'table', N'ARH_IPT_RECEIVE', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� ��������� ���������� ��������', N'schema', N'dbo', N'table', N'ARH_IPT_RECEIVE', N'column', N'IPT_ELEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ��������������� ������', N'schema', N'dbo', N'table', N'ARH_IPT_RECEIVE', N'column', N'QCY_RECEIVE'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'ARH_IPT_RECEIVE', N'column', N'RECEIVEBY'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������', N'schema', N'dbo', N'table', N'ARH_IPT_RECEIVE', N'column', N'RECEIVEDATA'
EXEC sp_addextendedproperty N'MS_Description', N'��������������� ���� �������������', 'schema', 'dbo', 'table', 'ARH_IPT_RECEIVE', 'column', 'UID'  
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
EXEC sp_addextendedproperty 'MS_Description', N'����� ������� ������������� ������� (DepartmentStock Transfer)', N'schema', N'dbo', N'table', N'ARH_DST'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� DST', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� (IntFormat)', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'DT'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� ���/MM-��-WRH_IDN', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'DSTNUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� - �����������', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'DEP_SENDER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� - ���������� (WRH_IDN)', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'WRH_RECEIVER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'CREATEBY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'CREATEDATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� �� �����', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'INTNUM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'0-�����, 1-����������, 2-�������', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'STATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������� "1 ����������"', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'STATE1DATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������� "2 �������"', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'STATE2DATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ���������� ������ "1 ����������"', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'STATE1BY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ���������� ������ "2 �������"', N'schema', N'dbo', N'table', N'ARH_DST', N'column', N'STATE2BY'
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
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� ��������� "������� �������� �� �����"', N'schema', N'dbo', N'table', N'ARH_DST_ELEM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� DST', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'DST_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ��� ��������', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������-���������', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'TOZ_RWC_SENDER'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'CREATEBY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ������������', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'CREATEDATE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������� �� ����� ���������� �� ������� ������ ���������', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'QTY_R'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� �������� ��������� ������ �� �����', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'RECEIVEBY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ������ �� �����', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'RECEIVEDATA'
GO

EXEC sp_addextendedproperty N'MS_Description', N'��������������� ���� �������������', 'schema', 'dbo', 'table', 'ARH_DST_ELEM', 'column', 'UID'
go

EXEC sp_addextendedproperty 'MS_Description', N'������ QTY_R', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'Fold_I'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ RECEIVEDATA', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'Fold_D'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ RECEIVEBY', N'schema', N'dbo', N'table', N'ARH_DST_ELEM', N'column', N'Fold_U'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� ���� ��������', 
	'schema', 'dbo', 'table', 'OKP_WPlaces'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', 
'schema', 'dbo', 'table', 'OKP_WPlaces', 'column', 'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����� (OKP_WRH.WRH_ID)', 
	'schema', 'dbo', 'table', 'OKP_WPlaces', 'column', 'WRH_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� ����� ��������', 
	'schema', 'dbo', 'table', 'OKP_WPlaces', 'column', 'IDN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ����� ��������', 
	'schema', 'dbo', 'table', 'OKP_WPlaces', 'column', 'Addr'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������', 
	'schema', 'dbo', 'table', 'OKP_WPlaces', 'column', 'Name'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������ ����� ��������', 
	'schema', 'dbo', 'table', 'OKP_WPlaces', 'column', 'IDP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ����������: 0 - ���, 1 - ��', 
	'schema', 'dbo', 'table', 'OKP_WPlaces', 'column', 'Enabled'
GO

EXEC sp_addextendedproperty 'MS_Description', 
	N'���� ������������ ������� ����������� ����� ��������:
	 0 - ����������� �������� (������ ����� ��������)
	 1 - ����������� � ����������� � �������� (��. OKP_WRH.WPTemplate)
	 ����������:
	   "������ �����������" - v_WPlaces.FullIDN', 
	'schema', 'dbo', 'table', 'OKP_WPlaces', 'column', 'IDNFlag'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� ���������� ������������� �� ������ ��������', 
	'schema', 'dbo', 'table', 'OKP_WPDocs'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', 
	'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ (OKP_GROUPS.ID)', 
	'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'GRP_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������', 
'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'DOC'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� 1 - �������������', 
	'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'TYP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����� (OKP_WRH.WRH_ID)', 
	'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'WRH_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� ���������', 
	'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'DKD'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ��������� (���, ��� ������ ��������) - ������ �� OKP_USERS.User_ID', 
	'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'Owner_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������', 
	'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'DESCRIBE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���� �������� ��������� (�� ��������)', 
	'schema', 'dbo', 'table', 'OKP_WPDocs', 'column', 'DTE'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ����������� ���������� ������������� (OKP_WPDocs)', 
	'schema', 'dbo', 'table', 'OKP_WPDocsData'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', 
	'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� (OKP_WPDocs.ID)', 
	'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'DOC_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� ������ � ���������', 
	'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'LIN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��� (OKP_INV.INV_ID)', 
	'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'INV_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������� �������� ������� (OKP_WRH_SUBJECTS.ID)', 
	'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'SUB_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� �����-�������� (OKP_WPlaces.ID)', 
	'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'WP_S_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� �����-������� (OKP_WPlaces.ID)', 
	'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'WP_D_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� � ��� �������� �� ������ ��� (OKP_INV.UOMHEIZ)', 
	'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'QTY'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� "����������" (OKP_TRN.TRN_ID)', 
 	'schema', 'dbo', 'table', 'OKP_WPDocsData', 'column', 'TRN_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', 
N'������ ������:
  - null, 0 - ������ �� �������������
  - 1 - ������ ������������� � ����� � ���, ��� ������� ������ (�� ������ OKP_TRN.TRN_ID) �������� ��������� 
        �������������� ������� ������������ ��������� �������', 
  N'schema', N'dbo', N'table', N'OKP_WPDocsData', N'column', N'STS'
GO

EXEC sp_addextendedproperty 'MS_Description', 
N'������ ������� (STS) ������ (�������� ��. OKP_WPDocsData.STS)', 
  N'schema', N'dbo', N'table', N'OKP_WPDocsData', N'column', N'Fold_S'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������������� ��� �� �������', 
	'schema', 'dbo', 'table', 'OKP_WPInv'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', 
	'schema', 'dbo', 'table', 'OKP_WPInv', 'column', 'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��� (OKP_INV.INV_ID)', 
	'schema', 'dbo', 'table', 'OKP_WPInv', 'column', 'INV_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������� �������� �������� (OKP_WRH_SUBJECTS.ID)', 
	'schema', 'dbo', 'table', 'OKP_WPInv', 'column', 'SUB_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ (OKP_WPlaces.ID)', 
	'schema', 'dbo', 'table', 'OKP_WPInv', 'column', 'WP_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� � ��� �������� �� ������ ��� (OKP_INV.UOMHEIZ)', 
	'schema', 'dbo', 'table', 'OKP_WPInv', 'column', 'QTY'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ����������� ���� �������� ���', 
	'schema', 'dbo', 'table', 'OKP_WPInvDef'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', 
	'schema', 'dbo', 'table', 'OKP_WPInvDef', 'column', 'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��� (OKP_INV.INV_ID)', 
	'schema', 'dbo', 'table', 'OKP_WPInvDef', 'column', 'INV_ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����� (OKP_WPlaces.ID)', 
	'schema', 'dbo', 'table', 'OKP_WPInvDef', 'column', 'WP_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'��������������� ��������� � �����������', N'schema', N'dbo', N'table', N'OKP_NOMRUTADD'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������',   'schema', 'dbo', 'table', 'OKP_NOMRUTADD', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������',   'schema', 'dbo', 'table', 'OKP_NOMRUTADD', 'column', 'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������',   'schema', 'dbo', 'table', 'OKP_NOMRUTADD', 'column', 'RUT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��� �������', 'schema', 'dbo', 'table', 'OKP_NOMRUTADD', 'column', 'eiz_id'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������', 'schema', 'dbo', 'table', 'OKP_NOMRUTADD', 'column', 'amount'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� ��������, ���������� ������� ������������', N'schema', N'dbo', N'table', N'okp_nomrutadd', N'column', N'verifyparam_obj_id'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ���������������� �������', 
	'schema', 'dbo', 'table', 'OKP_sysColumns'
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������', 
	'schema', 'dbo', 'table', 'OKP_sysColumns', 'column', 'ID'
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������', 
	'schema', 'dbo', 'table', 'OKP_sysColumns', 'column', 'NAME'
GO

EXEC sp_addextendedproperty 'MS_Description', 
	N'��� ������: 
	1 - �����
	2 - ����� (������������)
	3 - ����� �����
	4 - �����
	5 - ������
	6 - ����� (��������� �������� �� ������)
	', 
	'schema', 'dbo', 'table', 'OKP_sysColumns', 'column', 'TYPE'
GO

EXEC sp_addextendedproperty 'MS_Description', 
	N'������ ��������������� ��������. �������� ����������� �������� char(1)', 
	'schema', 'dbo', 'table', 'OKP_sysColumns', 'column', 'LIST'
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������', 
	'schema', 'dbo', 'table', 'OKP_sysColumns', 'column', 'DESCRIBE'
GO

--
-- OKP_NOMTechInfo
--
create table OKP_NOMTechInfo(
	ID bigint not null identity(1, 1),
	NOM_ID bigint not null,
	Column_ID int not null,
	Value varchar(8000)  COLLATE DATABASE_DEFAULT null,
	CONSTRAINT PK_OKP_NOMTechInfo PRIMARY KEY CLUSTERED (ID)
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'������� �������������� ����������� ���������� � ������������', 
  'schema', 'dbo', 'table', 'OKP_NOMTechInfo'
GO
EXEC sp_addextendedproperty 'MS_Description', N'�������', 
  'schema', 'dbo', 'table', 'OKP_NOMTechInfo', 'column', 'ID'
GO
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������ (OKP_NOM.RWC)', 
  'schema', 'dbo', 'table', 'OKP_NOMTechInfo', 'column', 'NOM_ID'
GO
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���������������� ��� ������ (OKP_sysColumns.ID)', 
  'schema', 'dbo', 'table', 'OKP_NOMTechInfo', 'column', 'Column_ID'
GO
EXEC sp_addextendedproperty 'MS_Description', N'�������� ��������������', 
  'schema', 'dbo', 'table', 'OKP_NOMTechInfo', 'column', 'Value'
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
	IS_VALID BIT CONSTRAINT DF_OKP_CERT_IS_VALID DEFAULT (1) NOT NULL,
	CONSTRAINT PK_OKP_CERT PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'����������� ��������', N'schema', N'dbo', N'table', N'OKP_CERT'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����������', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �����������', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �����������', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'�������/���������� ����������', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'isOut'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������ ��������', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'beg_date'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ��������', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'end_date'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����������', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'CTR_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'ESKIZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'TMPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ��������������', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'EDIT_DATE'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����������� ������������', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'GRP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������', N'schema', N'dbo', N'table', N'OKP_CERT', N'column', N'IS_VALID'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� (���� ��� ������ ��� OKP_CERT)', N'schema', N'dbo', N'table', N'OKP_TMPL'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������', N'schema', N'dbo', N'table', N'OKP_TMPL', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������', N'schema', N'dbo', N'table', N'OKP_TMPL', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �������', N'schema', N'dbo', N'table', N'OKP_TMPL', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ������� (���� ��� ���� ���������, �� ��������� ��� ����������)', N'schema', N'dbo', N'table', N'OKP_TMPL', N'column', N'OKP_TABLE'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ��������������', N'schema', N'dbo', N'table', N'OKP_TMPL', N'column', N'EDIT_DATE'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����������� ������������', N'schema', N'dbo', N'table', N'OKP_TMPL', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_TMPL', N'column', N'DESCR'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_TMPL', N'column', N'GRP_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_TFLD'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����', N'schema', N'dbo', N'table', N'OKP_TFLD', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ����', N'schema', N'dbo', N'table', N'OKP_TFLD', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_TFLD', N'column', N'DESCR'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_TFLD', N'column', N'GRP_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ������ - ����', N'schema', N'dbo', N'table', N'OKP_TMPL_TFLD'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����', N'schema', N'dbo', N'table', N'OKP_TMPL_TFLD', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������', N'schema', N'dbo', N'table', N'OKP_TMPL_TFLD', N'column', N'TMPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����', N'schema', N'dbo', N'table', N'OKP_TMPL_TFLD', N'column', N'FLD_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_TMPL_TFLD', N'column', N'FLD_ORDER'
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ��������� �� �����������', N'schema', N'dbo', N'table', N'OKP_CERT_TFLD'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����', N'schema', N'dbo', N'table', N'OKP_CERT_TFLD', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �����������', N'schema', N'dbo', N'table', N'OKP_CERT_TFLD', N'column', N'CERT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����', N'schema', N'dbo', N'table', N'OKP_CERT_TFLD', N'column', N'FLD_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_CERT_TFLD', N'column', N'VAL'
GO

--
-- OKP_GROUPColumns
-- 
CREATE TABLE OKP_GROUPColumns(
	ID int IDENTITY(1,1) NOT NULL,
        LIN int NOT NULL,
	GROUP_ID int NOT NULL,
	Column_ID int NOT NULL,
	CONSTRAINT PK_OKP_GROUPColumns PRIMARY KEY CLUSTERED (ID))
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OKP_GROUPColumns', @level2type=N'COLUMN',@level2name=N'ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ �� ������ (OKP_GROUPS.ID)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OKP_GROUPColumns', @level2type=N'COLUMN',@level2name=N'GROUP_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ �� ���������������� ������� (OKP_sysColumns.ID)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OKP_GROUPColumns', @level2type=N'COLUMN',@level2name=N'Column_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������� ������������ ���������������� ������� ������ �������. ��������� ������ ����� �������������
  ������������ ���� ��������, �������� � ������.
  �������, ���� ������ ���������� "fr000101" ������ � ������ "�����", ������� ������������ ������� "����", 
  �� � ����� ����������� ������������� ���������� ����������� �������������� "����" ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OKP_GROUPColumns'
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

EXEC sp_addextendedproperty 'MS_Description', N'��������������� ��������', N'schema', N'dbo', N'table', N'OKP_THO'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������������� ��������', 'schema', 'dbo', 'table', 'OKP_THO', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������', 'schema', 'dbo', 'table', 'OKP_THO', 'column', 'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ��������', 'schema', 'dbo', 'table', 'OKP_THO', 'column', 'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �������� �� ����', 'schema', 'dbo', 'table', 'OKP_THO', 'column', 'NAM_GOST'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������ ��������', 'schema', 'dbo', 'table', 'OKP_THO', 'column', 'GRP_ID'
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ����������', N'schema', N'dbo', N'table', N'OKP_REJECT'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� ����������', 'schema', 'dbo', 'table', 'OKP_REJECT', 'column', 'ID'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ����������', 'schema', 'dbo', 'table', 'OKP_REJECT', 'column', 'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������', 'schema', 'dbo', 'table', 'OKP_REJECT', 'column', 'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', 'schema', 'dbo', 'table', 'OKP_REJECT', 'column', 'GRP_ID'
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
	gravity int CONSTRAINT DF_OKP_SYSGRP_GRAVITY DEFAULT (0) NOT NULL,
	PARENT_ID int,
    IsSystem bit CONSTRAINT DF_OKP_SYSGRP_ISSYSTEM DEFAULT (0) NOT NULL,
	SYSOBJ_ID int CONSTRAINT DF_OKP_SYSGRP_SYSOBJ_ID DEFAULT (0) NOT NULL,
	CONSTRAINT PK_OKP_SYSGRP PRIMARY KEY CLUSTERED (ID)
)
GO
	
EXEC sp_addextendedproperty 'MS_Description', N'������ ��������� ��������', N'schema', N'dbo', N'table', N'OKP_SYSGRP'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������ ��������� ��������', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'ID'	
EXEC sp_addextendedproperty 'MS_Description', N'������������ ������ ��������� ��������', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'NAME'	
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������ ��������� ��������', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'IMAGE_ID'	
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'MODULE_ID'	
EXEC sp_addextendedproperty 'MS_Description', N'ID ���� �������', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'TYPE_ID'	
EXEC sp_addextendedproperty 'MS_Description', N'������� �����������', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'GRAVITY'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ������', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'PARENT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �������� ���������', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'IsSystem'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ������ � ������������ ���� ���������� ������� (0 ��� ������)', 'schema', 'dbo', 'table', 'OKP_SYSGRP', 'column', 'SYSOBJ_ID'
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
	
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ������� � ��������� ������', N'schema', N'dbo', N'table', N'OKP_SYSGRP_ITEM'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ��������������', 'schema', 'dbo', 'table', 'OKP_SYSGRP_ITEM', 'column', 'ID'	
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� ������', 'schema', 'dbo', 'table', 'OKP_SYSGRP_ITEM', 'column', 'SYSGRP_ID'	
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID �������', 'schema', 'dbo', 'table', 'OKP_SYSGRP_ITEM', 'column', 'ITEM_ID'	
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� �����������', 'schema', 'dbo', 'table', 'OKP_SYSGRP_ITEM', 'column', 'GRAVITY'
GO

--
-- ������� ������ ������ (�������, �������, ���������) � �������
--
CREATE TABLE OKP_MODULE_ITEM (
	ID int NOT NULL identity(1,1),
	MODULE_ID int NOT NULL,
    TYPE_ID int NOT NULL,
	ITEM_ID int NOT NULL,
	CONSTRAINT PK_OKP_MODULE_ITEM PRIMARY KEY CLUSTERED (ID)
)
GO
	
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ������� � ������', N'schema', N'dbo', N'table', N'OKP_MODULE_ITEM'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������������', 'schema', 'dbo', 'table', 'OKP_MODULE_ITEM', 'column', 'ID'	
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', 'schema', 'dbo', 'table', 'OKP_MODULE_ITEM', 'column', 'MODULE_ID'	
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� (1 - �������, 2 - �����, 3 - �������)', 'schema', 'dbo', 'table', 'OKP_MODULE_ITEM', 'column', 'TYPE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������', 'schema', 'dbo', 'table', 'OKP_MODULE_ITEM', 'column', 'ITEM_ID'	
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
	
EXEC sp_addextendedproperty 'MS_Description', N'����� "������������-����"', N'schema', N'dbo', N'table', N'OKP_USER_ROLE'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID �����', 'schema', 'dbo', 'table', 'OKP_USER_ROLE', 'column', 'ID'	
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ������������', 'schema', 'dbo', 'table', 'OKP_USER_ROLE', 'column', 'USER_ID'	
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ����', 'schema', 'dbo', 'table', 'OKP_USER_ROLE', 'column', 'ROLE_ID'		
GO

--
-- �������� ������� �������
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

EXEC sp_addextendedproperty 'MS_Description', N'��������� �������', N'schema', N'dbo', N'table', N'OKP_FUNCTION'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID', 'schema', 'dbo', 'table', 'OKP_FUNCTION', 'column', 'ID'	
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������', 'schema', 'dbo', 'table', 'OKP_FUNCTION', 'column', 'NAME'
GO

EXEC sp_addextendedproperty 'MS_Description', N'ID ������������ �������', 'schema', 'dbo', 'table', 'OKP_FUNCTION', 'column', 'PARENT_ID'	
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� �������?', 'schema', 'dbo', 'table', 'OKP_FUNCTION', 'column', 'IS_ACTIVE'	
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������', 'schema', 'dbo', 'table', 'OKP_FUNCTION', 'column', 'COMMENT'		
GO

--
-- ����� ������� � ��������
--
IF OBJECT_ID('OKP_ObjAccess') IS NOT NULL
BEGIN
    DROP TABLE OKP_ObjAccess
END
GO

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

EXEC sp_addextendedproperty 'MS_Description', N'����� ������� � ��������', N'schema', N'dbo', N'table', N'OKP_ObjAccess'
EXEC sp_addextendedproperty 'MS_Description', N'ID', 'schema', 'dbo', 'table', 'OKP_ObjAccess', 'column', 'ID'		
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������� �������', 'schema', 'dbo', 'table', 'OKP_ObjAccess', 'column', 'SYSOBJ_ID'		
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������', 'schema', 'dbo', 'table', 'OKP_ObjAccess', 'column', 'USER_ID'		
GO 

EXEC sys.sp_addextendedproperty 'MS_Description', 
	N'��� ������� ���� �������: 
	0 - ������� �� OKP_AccessType;
	1 - ������ �� OKP_ObjMethod;
	2 - ������������� �� OKP_DEP;
	3 - ��������� �� OKP_ObjAttr;
	4 - ��������������� ��� �������;
	5 - ������ �� OKP_v_sysModules;
	6 - ������ �� OKP_Reports;
	7 - �������� �� OKP_DataExport;
	8 - ������� �� OKP_FUNCTION;
	9 - ������������� �� OKP_DEP (��������);
	10 - �������� �� OKP_MON', 
	'schema', 'dbo', 'table', 'OKP_ObjAccess', 'column', 'OBJ_TYPE'			
GO 
EXEC sp_addextendedproperty 'MS_Description', N'ID �������', 'schema', 'dbo', 'table', 'OKP_ObjAccess', 'column', 'OBJ_ID'		
EXEC sp_addextendedproperty 'MS_Description', N'��� �������', 'schema', 'dbo', 'table', 'OKP_ObjAccess', 'column', 'AccessType_ID'		
EXEC sp_addextendedproperty 'MS_Description', N'����������', 'schema', 'dbo', 'table', 'OKP_ObjAccess', 'column', 'ACCESS'		
GO 

/*
** ������ ��������
*/
CREATE TABLE OKP_ObjMethod (
    ID int IDENTITY(1,1) NOT NULL,
    IDN varchar(20) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(99) COLLATE DATABASE_DEFAULT NOT NULL, 
    SYSOBJ_ID int NOT NULL,
	CONSTRAINT PK_OKP_ObjMethod PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������ ��������', N'schema', N'dbo', N'table', N'OKP_ObjMethod'
EXEC sp_addextendedproperty 'MS_Description', N'����', 'schema', 'dbo', 'table', 'OKP_ObjMethod', 'column', 'ID'		
EXEC sp_addextendedproperty 'MS_Description', N'���������� �������������', 'schema', 'dbo', 'table', 'OKP_ObjMethod', 'column', 'IDN'		
EXEC sp_addextendedproperty 'MS_Description', N'��������', 'schema', 'dbo', 'table', 'OKP_ObjMethod', 'column', 'NAME'		
EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������� �������', 'schema', 'dbo', 'table', 'OKP_ObjMethod', 'column', 'SYSOBJ_ID'
GO

--
-- ��������� ��������
--
CREATE TABLE OKP_ObjAttr (
    ID int IDENTITY(1,1) NOT NULL,
    IDN varchar(25) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(50) COLLATE DATABASE_DEFAULT NOT NULL, 
    SYSOBJ_ID int NOT NULL,
	CONSTRAINT PK_OKP_ObjAttr PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������', N'schema', N'dbo', N'table', N'OKP_ObjAttr'
EXEC sp_addextendedproperty 'MS_Description', N'����', 'schema', 'dbo', 'table', 'OKP_ObjAttr', 'column', 'ID'		
EXEC sp_addextendedproperty 'MS_Description', N'���������� �������������', 'schema', 'dbo', 'table', 'OKP_ObjAttr', 'column', 'IDN'		
EXEC sp_addextendedproperty 'MS_Description', N'��������', 'schema', 'dbo', 'table', 'OKP_ObjAttr', 'column', 'NAME'		
EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������� �������', 'schema', 'dbo', 'table', 'OKP_ObjAttr', 'column', 'SYSOBJ_ID'
GO

--
-- ���� ���� ������� � ��������
--
CREATE TABLE OKP_AccessType (
    ID int IDENTITY(1,1) NOT NULL,
	IDN varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	CONSTRAINT PK_OKP_AccessType PRIMARY KEY CLUSTERED (ID)
)
GO  

EXEC sp_addextendedproperty 'MS_Description', N'���� ���� ������� � ��������', N'schema', N'dbo', N'table', N'OKP_AccessType'
GO

EXEC sp_addextendedproperty 'MS_Description', N'����', 'schema', 'dbo', 'table', 'OKP_AccessType', 'column', 'ID'		
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� �������������', 'schema', 'dbo', 'table', 'OKP_AccessType', 'column', 'IDN'		
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������', 'schema', 'dbo', 'table', 'OKP_AccessType', 'column', 'NAME'		
GO

/*
** ��������� ���������
*/
CREATE TABLE OKP_SysProp(
	ID int identity(1,1) NOT NULL,
	IDN varchar(20) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(75) COLLATE DATABASE_DEFAULT NOT NULL,  
	PARENT_ID int NULL,
	IS_VISIBLE bit CONSTRAINT DF_OKP_SYSPROP_IS_VISIBLE DEFAULT(0) NOT NULL,
	PICK_TYPE int CONSTRAINT DF_OKP_SYSPROP_PICK_TYPE DEFAULT(1) NOT NULL,
	PICK_LIST varchar(8000) COLLATE DATABASE_DEFAULT NULL, 
	DATA_TYPE int NOT NULL,
	VALUE_CHAR varchar(8000) COLLATE DATABASE_DEFAULT NULL,
	VALUE_FLOAT float NULL,
	VALUE_BIT bit NULL,
	VALUE_DATE datetime NULL,
	gravity INT CONSTRAINT df__sysprop__gravity DEFAULT(0) NOT NULL
  CONSTRAINT PK_OKP_SysProp PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� ��������', N'schema', N'dbo', N'table', N'OKP_SysProp'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������������', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �������������', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'PARENT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��������� � �������������� ��� ��������������', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'IS_VISIBLE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ���� ��� �������������� �� TSTInLineEditType', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'PICK_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'������ ��������� �������� (����� ";")', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'PICK_LIST'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������ (�� sys.types)', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'DATA_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'������ (���� ��� - ������)', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'VALUE_CHAR'
EXEC sp_addextendedproperty 'MS_Description', N'������ (���� ��� - �����)', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'VALUE_FLOAT'
EXEC sp_addextendedproperty 'MS_Description', N'������ (���� ��� - ���������� ��������)', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'VALUE_BIT'
EXEC sp_addextendedproperty 'MS_Description', N'������ (���� ��� - ����)', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'VALUE_DATE'
EXEC sp_addextendedproperty 'MS_Description', N'���������', N'schema', N'dbo', N'table', N'OKP_SysProp', N'column', N'gravity'
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
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� �������������� (OKP_TRNDoc.ID)',   
                            'schema', 'dbo', 'table', 'OKP_InventoryWP', 'column', 'DOC_ID'
GO
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��� (OKP_INV.INV_ID)',   
                            'schema', 'dbo', 'table', 'OKP_InventoryWP', 'column', 'INV_ID'
GO
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������� �������� �������� (OKP_WRH_SUBJECTS.ID)',   
                            'schema', 'dbo', 'table', 'OKP_InventoryWP', 'column', 'SUB_ID'
GO
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����� �������� (OKP_WPlaces.ID)',   
                            'schema', 'dbo', 'table', 'OKP_InventoryWP', 'column', 'WP_ID'
GO
EXEC sp_addextendedproperty 'MS_Description', N'���������� �� ��������������.
������� � ��� �������� �� ������ ��� (OKP_INV.UOMHEIZ)',   
                            'schema', 'dbo', 'table', 'OKP_InventoryWP', 'column', 'QTY_OLD'
GO
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ��������������.
������� � ��� �������� �� ������ ��� (OKP_INV.UOMHEIZ)',   
                            'schema', 'dbo', 'table', 'OKP_InventoryWP', 'column', 'QTY_NEW'
GO 
        
--
-- UNIT-������������
-- ������� �������� ������������
--
CREATE TABLE OKP_UTO (
    ID int NOT NULL identity(1,1),
    NAME VARCHAR(50) COLLATE DATABASE_DEFAULT NOT NULL,
    TYP VARCHAR(20) COLLATE DATABASE_DEFAULT NOT NULL,
    CONSTRAINT PK_OKP_UTO PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� unit-������������', N'schema', N'dbo', N'table', N'OKP_UTO'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������������', N'schema', N'dbo', N'table', N'OKP_UTO', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������ �������', N'schema', N'dbo', N'table', N'OKP_UTO', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'OKP_UTO', N'column', N'TYP'
GO

--
-- UNIT-������������
-- ����� ��������
--
CREATE TABLE OKP_UTT (
    ID int NOT NULL identity(1,1),
    IDN VARCHAR(99) COLLATE DATABASE_DEFAULT NOT NULL,
    OBJECT_ID int NOT NULL,
    SQLCMD VARCHAR(999) COLLATE DATABASE_DEFAULT NOT NULL,
    COLUMNS VARCHAR(3000) COLLATE DATABASE_DEFAULT NOT NULL,
    DESCR VARCHAR(199) COLLATE DATABASE_DEFAULT NOT NULL,  
    IsSystem BIT CONSTRAINT DF_OKP_UTT_ISSYSTEM DEFAULT (0) NOT NULL,  
    AVOID varchar(999) COLLATE DATABASE_DEFAULT NULL,
    CONSTRAINT PK_OKP_UTT PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� unit-������������', N'schema', N'dbo', N'table', N'OKP_UTT'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������������', N'schema', N'dbo', N'table', N'OKP_UTT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������������', N'schema', N'dbo', N'table', N'OKP_UTT', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� ������������', N'schema', N'dbo', N'table', N'OKP_UTT', N'column', N'OBJECT_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_UTT', N'column', N'SQLCMD'
EXEC sp_addextendedproperty 'MS_Description', N'����������� � OKP_UTR �������', N'schema', N'dbo', N'table', N'OKP_UTT', N'column', N'COLUMNS'
EXEC sp_addextendedproperty 'MS_Description', N'�������� unit-�����', N'schema', N'dbo', N'table', N'OKP_UTT', N'column', N'DESCR'
EXEC sp_addextendedproperty 'MS_Description', N'���� "���������"', N'schema', N'dbo', N'table', N'OKP_UTT', N'column', N'IsSystem'
EXEC sp_addextendedproperty 'MS_Description', N'������ �������, ������� �� ��������� � ���������', N'schema', N'dbo', N'table', N'OKP_UTT', N'column', N'AVOID'
GO

--
-- UNIT-������������
-- ��������� ������� ������
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ��������� � ������', N'schema', N'dbo', N'table', N'OKP_UTP'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������������', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������� ���������', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��� ��������� �������� ���������', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'SELCOM'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������ (�� sys.types)', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'DATA_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'������ (���� ��� - ������)', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'VALUE_CHAR'
EXEC sp_addextendedproperty 'MS_Description', N'������ (���� ��� - �����)', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'VALUE_FLOAT'
EXEC sp_addextendedproperty 'MS_Description', N'������ (���� ��� - ���������� ��������)', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'VALUE_BIT'
EXEC sp_addextendedproperty 'MS_Description', N'������ (���� ��� - ����)', N'schema', N'dbo', N'table', N'OKP_UTP', N'column', N'VALUE_DATE'
GO

--
-- UNIT-������������
-- ������� ����������� ������
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

EXEC sp_addextendedproperty 'MS_Description', N'������� unit-������������', N'schema', N'dbo', N'table', N'OKP_UTE'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������������', N'schema', N'dbo', N'table', N'OKP_UTE', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����', N'schema', N'dbo', N'table', N'OKP_UTE', N'column', N'TEST_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������ �����������', N'schema', N'dbo', N'table', N'OKP_UTE', N'column', N'LINE_NUM'
GO

/*
** ������� ������������� ��������� ��� ���������
*/
CREATE TABLE OKP_MSRC (
	ID int identity (1,1) NOT NULL,
	NAME varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	GRP_ID int NOT NULL,
	sysobj_id INT NULL,
	caption varchar(256) COLLATE DATABASE_DEFAULT NULL,
	field_auto_inc VARCHAR(64) NULL,
	CONSTRAINT PK_OKP_MSRC PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'��������� ���������', N'schema', N'dbo', N'table', N'OKP_MSRC'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_MSRC', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ������� ��', N'schema', N'dbo', N'table', N'OKP_MSRC', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������� �������', N'schema', N'dbo', N'table', N'OKP_MSRC', N'column', N'sysobj_id'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������������', N'schema', N'dbo', N'table', N'OKP_MSRC', N'column', N'caption'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ����-��������������', N'schema', N'dbo', N'table', N'okp_msrc', N'column', N'field_auto_inc'
GO

/*
** ������� ���������
*/
CREATE TABLE OKP_MON (
	ID int identity (1,1) NOT NULL,
	idn VARCHAR(50) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME_1 varchar(16) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME_2 varchar(16) COLLATE DATABASE_DEFAULT NULL,
	MSRC_ID int NOT NULL,
	AUTHOR_ID int NULL,
	DESCR varchar(999) COLLATE DATABASE_DEFAULT NULL,
	is_system bit CONSTRAINT df__mon__is_system DEFAULT(0) NOT NULL,
	api_getter varchar(32) COLLATE DATABASE_DEFAULT NULL
	CONSTRAINT PK_OKP_MON PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ���������', N'schema', N'dbo', N'table', N'OKP_MON'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_MON', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����������� ��� �������������', N'schema', N'dbo', N'table', N'OKP_MON', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������ (������ 1)', N'schema', N'dbo', N'table', N'OKP_MON', N'column', N'NAME_1'
EXEC sp_addextendedproperty 'MS_Description', N'������������ (������ 2)', N'schema', N'dbo', N'table', N'OKP_MON', N'column', N'NAME_2'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������, �� ������� ����� �������� �������', N'schema', N'dbo', N'table', N'OKP_MON', N'column', N'MSRC_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_MON', N'column', N'AUTHOR_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ��������', N'schema', N'dbo', N'table', N'OKP_MON', N'column', N'DESCR'
EXEC sp_addextendedproperty 'MS_Description', N'���� "���������"', N'schema', N'dbo', N'table', N'OKP_MON', N'column', N'is_system'
EXEC sp_addextendedproperty 'MS_Description', N'������������� API-�������', N'schema', N'dbo', N'table', N'okp_mon', N'column', N'api_getter'
GO

/*
** ������� ����� ��� ���������
*/
CREATE TABLE OKP_MFLD (
	ID int identity (1,1) NOT NULL,
	MSRC_ID int NOT NULL,
	FLD_NAME varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	USER_TYPE_ID int NOT NULL,
	CAPTION varchar(99) COLLATE DATABASE_DEFAULT NULL,
	FORMULA varchar(999) COLLATE DATABASE_DEFAULT NULL,
	IsSystem bit CONSTRAINT DF_OKP_MFLD_IsSystem DEFAULT(1) NOT NULL,
	IsVisible bit CONSTRAINT DF_OKP_MFLD_IsVisible DEFAULT(1) NOT NULL,
	gravity INT NOT NULL,
	CONSTRAINT PK_OKP_MFLD PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ����� ��� ���������', N'schema', N'dbo', N'table', N'OKP_MFLD'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_MFLD', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������, ���������� ����', N'schema', N'dbo', N'table', N'OKP_MFLD', N'column', N'MSRC_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ����', N'schema', N'dbo', N'table', N'OKP_MFLD', N'column', N'FLD_NAME'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������ ����', N'schema', N'dbo', N'table', N'OKP_MFLD', N'column', N'USER_TYPE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ��������', N'schema', N'dbo', N'TABLE', N'OKP_MFLD', N'column', N'CAPTION'
EXEC sp_addextendedproperty 'MS_Description', N'���� ����������� �������� (���������� � �����������������)', N'schema', N'dbo', N'TABLE', N'OKP_MFLD', N'column', N'IsSystem'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������� ��������', N'schema', N'dbo', N'TABLE', N'OKP_MFLD', N'column', N'IsVisible'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������', N'schema', N'dbo', N'TABLE', N'OKP_MFLD', N'column', N'FORMULA'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������', N'schema', N'dbo', N'TABLE', N'OKP_MFLD', N'column', N'gravity'
GO

-- ������� ������ ����� ��������� � ������
CREATE TABLE OKP_MON_MFLD (
	ID int identity (1,1) NOT NULL,
	MON_ID int NOT NULL,
	MFLD_ID int NOT NULL,
	MFLD_PATH varchar(255) COLLATE DATABASE_DEFAULT NULL,
	IDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(999) COLLATE DATABASE_DEFAULT NOT NULL,
	GRAVITY int NOT NULL,
	ALIGN int CONSTRAINT DF_OKP_MON_MFLD_ALIGN DEFAULT(2) NOT NULL,
	IsVisible bit CONSTRAINT DF_OKP_MON_MFLD_ISVISIBLE DEFAULT(1) NOT NULL,
	USER_TYPE_ID int NULL,
	FORMULA varchar(999) COLLATE DATABASE_DEFAULT NULL,
	CONSTRAINT PK_OKP_MON_MFLD PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ������ ����� ��������� � ������', N'schema', N'dbo', N'table', N'OKP_MON_MFLD'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'MON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'MFLD_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� �� ��������� � ���� ����� JOIN', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'MFLD_PATH'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���� � ������ �������', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���� � ��������', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ������� � �����', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'GRAVITY'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������ � �����', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'ALIGN'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �������', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'ISVISIBLE'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������ � ������� (NULL - �� ���������)', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'USER_TYPE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������', N'schema', N'dbo', N'table', N'OKP_MON_MFLD', N'column', N'FORMULA'
GO

-- ������� ������������ ������, ������� ����� ���� ������������� ��� ���������� ��������
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������������ ������, ������� ����� ���� ������������� ��� ���������� ��������', N'schema', N'dbo', N'table', N'OKP_MLINK'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_MLINK', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������ �����, ������� ����� ����������� � ���������� �������', N'schema', N'dbo', N'table', N'OKP_MLINK', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'�������-��������', N'schema', N'dbo', N'table', N'OKP_MLINK', N'column', N'SRC_TAB'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������-���������', N'schema', N'dbo', N'table', N'OKP_MLINK', N'column', N'SRC_FLD'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� ������� �������-���������', N'schema', N'dbo', N'table', N'OKP_MLINK', N'column', N'SRC_FILTR'
EXEC sp_addextendedproperty 'MS_Description', N'�������-�������', N'schema', N'dbo', N'table', N'OKP_MLINK', N'column', N'REF_TAB'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������-��������', N'schema', N'dbo', N'table', N'OKP_MLINK', N'column', N'REF_FLD'
GO  

-- ������� ���������� ���������� ������ �������� �� ���������� �� ���������
CREATE TABLE OKP_MPARM (
  ID int identity (1,1) NOT NULL,
  MON_ID int NOT NULL,
  MON_MFLD_ID int NOT NULL,
  VAL varchar(99) COLLATE DATABASE_DEFAULT NULL,
  IsActive bit CONSTRAINT DF_OKP_MPARM_ISACTIVE DEFAULT (1) NOT NULL,
  OPERAND varchar(15) CONSTRAINT DF_OKP_MPARM_OPERAND DEFAULT '=' NOT NULL,
  CONSTRAINT PK_OKP_MPARM PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� ���������� ������ �������� �� ����������', N'schema', N'dbo', N'table', N'OKP_MPARM'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_MPARM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������', N'schema', N'dbo', N'table', N'OKP_MPARM', N'column', N'MON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����', N'schema', N'dbo', N'table', N'OKP_MPARM', N'column', N'MON_MFLD_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �� ��������� (�������)', N'schema', N'dbo', N'table', N'OKP_MPARM', N'column', N'VAL'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ��������� � ����������', N'schema', N'dbo', N'table', N'OKP_MPARM', N'column', N'IsActive'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������', N'schema', N'dbo', N'table', N'OKP_MPARM', N'column', N'OPERAND'      
GO  

-- ������� ���������� �������� ��� ���������� � ��������
CREATE TABLE OKP_MDIAG (
    ID int identity (1,1) NOT NULL,
    IDN varchar(15) COLLATE DATABASE_DEFAULT NOT NULL,
    NAME varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	DESCR varchar(999) COLLATE DATABASE_DEFAULT NOT NULL,
    CONSTRAINT PK_OKP_MDIAG PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� �������� ��� ���������� � ��������', N'schema', N'dbo', N'table', N'OKP_MDIAG'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_MDIAG', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������ ���������', N'schema', N'dbo', N'table', N'OKP_MDIAG', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������������ ���������', N'schema', N'dbo', N'table', N'OKP_MDIAG', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������', N'schema', N'dbo', N'table', N'OKP_MDIAG', N'column', N'DESCR'
GO

-- ������� ����������� �������� ��� ���������
CREATE TABLE OKP_MON_MDIAG (
	ID int identity (1,1) NOT NULL,
	MON_ID int NOT NULL,
	MDIAG_ID int NOT NULL,
	IDN varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	NAME varchar(999) COLLATE DATABASE_DEFAULT NOT NULL,
	CONSTRAINT PK_OKP_MON_MDIAG PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ����������� �������� ��� ���������', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG', N'column', N'MON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG', N'column', N'MDIAG_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ���������� �������������', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ����������� ���������', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG', N'column', N'NAME'
GO

-- ������� �������� ������ ���������
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
	is_hidden BIT CONSTRAINT df__mdset__is_hidden DEFAULT(0) NOT NULL,
	is_mandatory BIT CONSTRAINT df__mdset__is_mandatory DEFAULT(1) NOT NULL,
	CONSTRAINT PK_OKP_MDSET PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� �������� ������ ���������', N'schema', N'dbo', N'table', N'OKP_MDSET'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� (NULL ��� ����)', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'MDIAG_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'DESCR'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������:
	COLUMN -> OKP_MON_MFLD.IDN, 
	TEXT -> ������� �����,
	HIDDEN -> ������� ���� (���������),
	BIT -> ���������� �������� (��/���)', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������� � ���������� ������', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'GRAVITY'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �� ���������', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'def_value'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ��� ������', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'type_id_need'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'is_hidden'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���������', N'schema', N'dbo', N'table', N'OKP_MDSET', N'column', N'is_mandatory'
GO

-- ������� �������� ������ ��������� ����������� ��������
CREATE TABLE OKP_MON_MDIAG_MDSET (
	ID int identity (1,1) NOT NULL,
	MON_MDIAG_ID int NOT NULL,
	MDSET_ID int NOT NULL,
	VAL varchar(999) COLLATE DATABASE_DEFAULT NOT NULL,
	CONSTRAINT PK_OKP_MON_MDIAG_MDSET PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� �������� ������ ��������� ����������� ��������', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG_MDSET'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG_MDSET', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� ��������', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG_MDSET', N'column', N'MON_MDIAG_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� ���������', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG_MDSET', N'column', N'MDSET_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������', N'schema', N'dbo', N'table', N'OKP_MON_MDIAG_MDSET', N'column', N'VAL'
GO

-- ������� ������ �������������
CREATE TABLE OKP_MCLR (
	ID int identity (1,1) NOT NULL,
	NAME varchar(99) COLLATE DATABASE_DEFAULT NOT NULL,
	MON_ID int NOT NULL,
	COLOR int NOT NULL,
	USER_ID int NULL,
	FORMULA varchar(999) COLLATE DATABASE_DEFAULT NOT NULL,
	GRAVITY int NOT NULL,
	IsActive bit CONSTRAINT DF_OKP_MCLR_ISACTIVE DEFAULT (1) NOT NULL,     
	CONSTRAINT PK_OKP_MCLR PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ������ �������������', N'schema', N'dbo', N'table', N'OKP_MCLR'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_MCLR', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ������� ���������', N'schema', N'dbo', N'table', N'OKP_MCLR', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������', N'schema', N'dbo', N'table', N'OKP_MCLR', N'column', N'MON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �����', N'schema', N'dbo', N'table', N'OKP_MCLR', N'column', N'COLOR'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������', N'schema', N'dbo', N'table', N'OKP_MCLR', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������, ��� ���������� �������� ����� ������� ������� ����', N'schema', N'dbo', N'table', N'OKP_MCLR', N'column', N'FORMULA'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ������������� (0 - ������������)', N'schema', N'dbo', N'table', N'OKP_MCLR', N'column', N'GRAVITY'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �������', N'schema', N'dbo', N'table', N'OKP_MCLR', N'column', N'IsActive'
GO

-- ������ ���������� ��������
CREATE TABLE OKP_MSREQ (
	ID int identity(1,1) NOT NULL,
	MON_ID int NOT NULL,
	USER_ID int NULL,
	TYPE_ID int NOT NULL,
	REQ_TEXT varchar(MAX) COLLATE DATABASE_DEFAULT NOT NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'���������� ������ �������� ��� ���������', N'schema', N'dbo', N'table', N'OKP_MSREQ'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_MSREQ', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������', N'schema', N'dbo', N'table', N'OKP_MSREQ', N'column', N'MON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������', N'schema', N'dbo', N'table', N'OKP_MSREQ', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������ (1 - PARM, 2 - GRID)', N'schema', N'dbo', N'table', N'OKP_MSREQ', N'column', N'TYPE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������', N'schema', N'dbo', N'table', N'OKP_MSREQ', N'column', N'REQ_TEXT'
GO

-- ������� ������ ����������
CREATE TABLE OKP_MFILTR (
  ID int identity (1,1) NOT NULL,
  NAME varchar(99) COLLATE DATABASE_DEFAULT NOT NULL,
	MON_ID int NOT NULL,
	FORMULA varchar(999) COLLATE DATABASE_DEFAULT NOT NULL,
  GRAVITY int NOT NULL,
  IsActive bit CONSTRAINT DF_OKP_MFILTR_ISACTIVE DEFAULT (1) NOT NULL, 
  CONSTRAINT PK_OKP_MFILTR PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ������ ����������', N'schema', N'dbo', N'table', N'OKP_MFILTR'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_MFILTR', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'OKP_MFILTR', N'column', N'NAME'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������', N'schema', N'dbo', N'table', N'OKP_MFILTR', N'column', N'MON_ID'
EXEC sp_addextendedproperty 'MS_Description', N'�������, ��� ���������� �������� ����� ��������� ����������', N'schema', N'dbo', N'table', N'OKP_MFILTR', N'column', N'FORMULA'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������� �� ������ (0 - ������������)', N'schema', N'dbo', N'table', N'OKP_MFILTR', N'column', N'GRAVITY'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �������', N'schema', N'dbo', N'table', N'OKP_MFILTR', N'column', N'IsActive'
GO

CREATE TABLE OKP_MFUNC (
    ID int identity (1,1) NOT NULL,
    IDN varchar(32) COLLATE DATABASE_DEFAULT NOT NULL,
    DESCR varchar(100) COLLATE DATABASE_DEFAULT NOT NULL,
    FUNC_IDN varchar(32) COLLATE DATABASE_DEFAULT NOT NULL,
    CONSTRAINT PK_OKP_MFUNC PRIMARY KEY CLUSTERED (ID)    
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ������� ��������������', N'schema', N'dbo', N'table', N'OKP_MFUNC'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_MFUNC', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������ ������� (� ����� ���������)', N'schema', N'dbo', N'table', N'OKP_MFUNC', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'OKP_MFUNC', N'column', N'DESCR'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������ ������� (� ����� SQL - ����������  "dbo.")', N'schema', N'dbo', N'table', N'OKP_MFUNC', N'column', N'FUNC_IDN'
GO

/* @BLOCK: ������ �������
** @DESCR: ����� ��������� ������������� ������
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ��������� ������������� ������', N'schema', N'dbo', N'table', N'OKP_IMSET'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_IMSET', N'column', N'id' 
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������� �������', N'schema', N'dbo', N'table', N'OKP_IMSET', N'column', N'sysobject_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������� ���������� �������', N'schema', N'dbo', N'table', N'OKP_IMSET', N'column', N'sysobject_parent_id'
EXEC sp_addextendedproperty 'MS_Description', N'����, �������� ������������� �������������', N'schema', N'dbo', N'table', N'OKP_IMSET', N'column', N'idField'
EXEC sp_addextendedproperty 'MS_Description', N'����, �������� ������������ �������������', N'schema', N'dbo', N'table', N'OKP_IMSET', N'column', N'idnField'
EXEC sp_addextendedproperty 'MS_Description', N'����, �������� ������ �� �������������� �����������', N'schema', N'dbo', N'table', N'OKP_IMSET', N'column', N'ownerField'
GO

--
-- @BLOCK: ������ �������
-- @DESCR: ��������� ������ ����� ���������
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

EXEC sp_addextendedproperty 'MS_Description', N'��������� ������ ������ � ������� �������', N'schema', N'dbo', N'table', N'OKP_IMLNK'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'OKP_IMLNK', N'column', N'id' 
EXEC sp_addextendedproperty 'MS_Description', N'�������� �������', N'schema', N'dbo', N'table', N'OKP_IMLNK', N'column', N'MainTable'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ������������� �������� �������', N'schema', N'dbo', N'table', N'OKP_IMLNK', N'column', N'MainField'
EXEC sp_addextendedproperty 'MS_Description', N'����������� �������', N'schema', N'dbo', N'table', N'OKP_IMLNK', N'column', N'RefTable'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������������� ����������� �������', N'schema', N'dbo', N'table', N'OKP_IMLNK', N'column', N'RefField'
EXEC sp_addextendedproperty 'MS_Description', N'����� ����������� ����� LEFT JOIN', N'schema', N'dbo', N'table', N'OKP_IMLNK', N'column', N'IsNullable'
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ������� ��� JOIN', N'schema', N'dbo', N'table', N'OKP_IMLNK', N'column', N'additionCondition'
GO

--
-- @BLOCK: none
-- @DESCR: ����� ����� UID � ������� OKP_reports � ID � ������ �������� (��������, OKP_SYSGRP_ITEM)
--
CREATE TABLE OKP_UID_ID (
	ID int identity(1,1) NOT NULL,
	UID uniqueidentifier NOT NULL,
	CONSTRAINT PK_OKP_UID_ID PRIMARY KEY CLUSTERED (ID)  
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ������ UID � ID', N'schema', N'dbo', N'table', N'OKP_UID_ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID', N'schema', N'dbo', N'table', N'OKP_UID_ID', N'column', N'ID' 
EXEC sp_addextendedproperty 'MS_Description', N'UID', N'schema', N'dbo', N'table', N'OKP_UID_ID', N'column', N'UID'
GO

--
-- Definition for table OKP_IPTNUMS : ������� ��������\���������� ������� �� ���������� ��������
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
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������\���������� ������� �� ���������� ��������', N'schema', N'dbo', N'table', N'OKP_IPTNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� (������) ��������� ��������', N'schema', N'dbo', N'table', N'OKP_IPTNUMS', N'column', N'IPT_ELEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������������� ��������-���������� OKP_TOZ.RWC', N'schema', N'dbo', N'table', N'OKP_IPTNUMS', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���������� ����������������� ����� (OKP_UNOM.ID/OKP_UKIM.ID)', N'schema', N'dbo', N'table', N'OKP_IPTNUMS', N'column', N'UNOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��� ������ (OKP_sysObjects.ID)', N'schema', N'dbo', N'table', N'OKP_IPTNUMS', N'column', N'N_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ���������� �� ������', N'schema', N'dbo', N'table', N'OKP_IPTNUMS', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������������', N'schema', N'dbo', N'table', N'OKP_IPTNUMS', N'column', N'IGNORE'
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
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������\���������� ������� �� ���������� ��������', N'schema', N'dbo', N'table', N'ARH_IPTNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� (������) ��������� ��������', N'schema', N'dbo', N'table', N'ARH_IPTNUMS', N'column', N'IPT_ELEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������������� ��������-���������� OKP_TOZ.RWC', N'schema', N'dbo', N'table', N'ARH_IPTNUMS', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���������� ����������������� ����� (OKP_UNOM.ID/OKP_UKIM.ID)', N'schema', N'dbo', N'table', N'ARH_IPTNUMS', N'column', N'UNOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��� ������ (OKP_sysObjects.ID)', N'schema', N'dbo', N'table', N'ARH_IPTNUMS', N'column', N'N_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ���������� �� ������', N'schema', N'dbo', N'table', N'ARH_IPTNUMS', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������������', N'schema', N'dbo', N'table', N'ARH_IPTNUMS', N'column', N'IGNORE'
GO



CREATE TABLE OKP_IPTNUMSRECEIVE (
  ID bigint IDENTITY(1, 1) NOT NULL,
  IPTRECEIVE_ID bigint NOT NULL,
  IPTNUMS_ID bigint NOT NULL,
  QTY float NOT NULL,
  PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� �� ���������� ��������  �������� ������', N'schema', N'dbo', N'table', N'OKP_IPTNUMSRECEIVE'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������������� ��������', N'schema', N'dbo', N'table', N'OKP_IPTNUMSRECEIVE', N'column', N'IPTRECEIVE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������������/������������ ��������� ������', N'schema', N'dbo', N'table', N'OKP_IPTNUMSRECEIVE', N'column', N'IPTNUMS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �������� �� SN', N'schema', N'dbo', N'table', N'OKP_IPTNUMSRECEIVE', N'column', N'QTY'
GO


CREATE TABLE ARH_IPTNUMSRECEIVE (
  ID bigint  NULL,
  IPTRECEIVE_ID bigint NULL,
  IPTNUMS_ID bigint NULL,
  QTY float NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'����� �������� �� ���������� ��������  �������� �������', N'schema', N'dbo', N'table', N'ARH_IPTNUMSRECEIVE'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������������� ��������', N'schema', N'dbo', N'table', N'ARH_IPTNUMSRECEIVE', N'column', N'IPTRECEIVE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������������/������������ ��������� ������', N'schema', N'dbo', N'table', N'ARH_IPTNUMSRECEIVE', N'column', N'IPTNUMS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �������� �� SN', N'schema', N'dbo', N'table', N'ARH_IPTNUMSRECEIVE', N'column', N'QTY'
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
EXEC sp_addextendedproperty 'MS_Description', N'C������� ������ ��������� "������� �������� �� �����"', N'schema', N'dbo', N'table', N'OKP_DSTNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� (������) ��������� ��������', N'schema', N'dbo', N'table', N'OKP_DSTNUMS', N'column', N'DST_ELEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������������� �������� OKP_TOZ.RWC', N'schema', N'dbo', N'table', N'OKP_DSTNUMS', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���������� ����������������� ����� (OKP_UNOM.ID/OKP_UKIM.ID)', N'schema', N'dbo', N'table', N'OKP_DSTNUMS', N'column', N'UNOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��� ������ (OKP_sysObjects.ID)', N'schema', N'dbo', N'table', N'OKP_DSTNUMS', N'column', N'N_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ���������� �� ������', N'schema', N'dbo', N'table', N'OKP_DSTNUMS', N'column', N'QTY'
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
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� ������ ��������� "������� �������� �� �����"', N'schema', N'dbo', N'table', N'ARH_DSTNUMS'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� (������) ��������� ��������', N'schema', N'dbo', N'table', N'ARH_DSTNUMS', N'column', N'DST_ELEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������������� �������� OKP_TOZ.RWC', N'schema', N'dbo', N'table', N'ARH_DSTNUMS', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���������� ����������������� ����� (OKP_UNOM.ID/OKP_UKIM.ID)', N'schema', N'dbo', N'table', N'ARH_DSTNUMS', N'column', N'UNOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��� ������ (OKP_sysObjects.ID)', N'schema', N'dbo', N'table', N'ARH_DSTNUMS', N'column', N'N_TYPE'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ���������� �� ������', N'schema', N'dbo', N'table', N'ARH_DSTNUMS', N'column', N'QTY'
GO


CREATE TABLE dbo.OKP_TPC_TOZ_WPL (
    WPL_ID int NOT NULL,
    CPL_NUM varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
    NOP int NOT NULL
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� �����', N'schema', N'dbo', N'table', N'OKP_TPC_TOZ_WPL', N'column', N'WPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_TPC_TOZ_WPL', N'column', N'CPL_NUM'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� � ������', N'schema', N'dbo', N'table', N'OKP_TPC_TOZ_WPL', N'column', N'NOP'
GO

CREATE TABLE ARH_TOZ_WPL (
    ID int ,
    TOZ_ID int,
    WPL_ID int
  )
GO
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� ���������������� �������� � ������� ������', N'schema', N'dbo', N'table', N'ARH_TOZ_WPL'
EXEC sp_addextendedproperty 'MS_Description', N'�������������', N'schema', N'dbo', N'table', N'ARH_TOZ_WPL', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� ���������������� ��������', N'schema', N'dbo', N'table', N'ARH_TOZ_WPL', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� �����', N'schema', N'dbo', N'table', N'ARH_TOZ_WPL', N'column', N'WPL_ID'
GO

/*
** ������� ��������� �������� �� �� 
**/
CREATE TABLE OKP_WCRTAR (
	id INT IDENTITY(1,1) NOT NULL,
	wcr_id INT NOT NULL,
	rzo INT NOT NULL,
	CONSTRAINT PK_OKP_WCRTAR PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� �� ��', N'schema', N'dbo', N'table', N'OKP_WCRTAR'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_WCRTAR', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������� ������', N'schema', N'dbo', N'table', N'OKP_WCRTAR', N'column', N'wcr_id'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'OKP_WCRTAR', N'column', N'rzo'
GO

/*
** ���������� � ������� �� �� 
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

EXEC sp_addextendedproperty 'MS_Description', N'������ �������� �� ��', N'schema', N'dbo', N'table', N'OKP_WCRTAR_DATA'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_WCRTAR_DATA', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������� �� ��', N'schema', N'dbo', N'table', N'OKP_WCRTAR_DATA', N'column', N'wcrtar_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������������� �����������', N'schema', N'dbo', N'table', N'OKP_WCRTAR_DATA', N'column', N'owner_id'
EXEC sp_addextendedproperty 'MS_Description', N'���� ������ ��������', N'schema', N'dbo', N'table', N'OKP_WCRTAR_DATA', N'column', N'since'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������', N'schema', N'dbo', N'table', N'OKP_WCRTAR_DATA', N'column', N'tshkzp_val'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���', N'schema', N'dbo', N'table', N'OKP_WCRTAR_DATA', N'column', N'tpn_val'
GO

/*
** @NAME:  OKP_VAR_PARAM
**/
CREATE TABLE OKP_VAR_PARAM(
	id bigint NOT NULL IDENTITY(1,1),
	dte_create datetime NOT NULL CONSTRAINT df_okp_var_param_dte_create DEFAULT (GETDATE()),
	usr_create varchar(50) COLLATE database_default NOT NULL,
	dte_edit datetime NOT NULL CONSTRAINT df_okp_var_param_dte_edit DEFAULT(GETDATE()),
	usr_edit varchar(50) COLLATE DATABASE_DEFAULT NOT NULL,
	FlagDel bit CONSTRAINT df_okp_var_param_flagdel DEFAULT(0) NOT NULL,
	start datetime,
	finish datetime,
	only_confirmed bit,
	autofill_szp bit,
	unified bit NOT NULL CONSTRAINT df_okp_var_param_unified DEFAULT(0),
	for_user smallint NOT NULL CONSTRAINT df_okp_var_param_for_user DEFAULT(0),
	sel_user varchar(50) COLLATE database_default,
	nam varchar(250) COLLATE database_default,
	comment varchar(MAX) COLLATE database_default,
	split_goz bit,
	split_fav bit,
	onlybysupid bigint,
	rzp_guid uniqueidentifier,
        consignee_id bigint,
        review_by INT NOT NULL CONSTRAINT DF_OKP_VAR_PARAM_review_by DEFAULT (0),
	CONSTRAINT PK_OKP_VAR_PARAM PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty N'MS_Description',N'��������� ������� ������������ ��� ����������� ��������� ������ �� ��������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_PARAM'
EXEC sp_addextendedproperty N'MS_Description',N'�������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_PARAM',N'COLUMN',N'id'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'dte_create'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'usr_create'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'dte_edit'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� �������������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'usr_edit'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'FlagDel'
EXEC sp_addextendedproperty 'MS_Description', N'������ �������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'start'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'finish'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ��������������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'only_confirmed'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ��������� �����', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'autofill_szp'
EXEC sp_addextendedproperty 'MS_Description', N'���������������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'unified'
EXEC sp_addextendedproperty 'MS_Description', N'0 - �����; 1 - � ��������� �� ������������� ����������; 2 - ������ �� ���������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'for_user'  
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'sel_user'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'nam'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'comment'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������� �������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'split_goz'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������� �������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'split_fav'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ���������� ����������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'onlybysupid'
EXEC sp_addextendedproperty 'MS_Description', N'GUID', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'rzp_guid'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������������', N'schema', N'dbo', N'table', N'OKP_VAR_PARAM', N'column', N'consignee_id'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������������ (0 - �� ���� ���������������� ���������; 1 - �� ������ ��; 2 - �� ������)', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PARAM', 'COLUMN', N'review_by'
GO

/*
** @NAME:  OKP_VAR_RZP
**/
CREATE TABLE dbo.OKP_VAR_RZP (
	ID bigint IDENTITY(1,1),
	DTE_CALC datetime NOT NULL CONSTRAINT df_okp_var_rzp_dte_calc DEFAULT (GETDATE()),
	ID_VAR bigint NOT NULL,
	SUP_ID int NOT NULL,
	UPUTRS varchar(30) NULL,
	INCLUDE_GOZ bit NOT NULL CONSTRAINT df_okp_var_rzp_include_goz DEFAULT (0),
	MIN_DTE_POST_RZP datetime NULL,
	MAX_DTE_POST_RZP datetime NULL,
	CONSTRAINT PK_OKP_VAR_RZP PRIMARY KEY CLUSTERED (ID)
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'��������������� �������� ������ �� ��������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_RZP'
EXEC sp_addextendedproperty 'MS_Description', N'�������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_RZP',N'COLUMN',N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������', N'schema', N'dbo', N'table', N'OKP_VAR_RZP', N'column', N'DTE_CALC'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� OKP_VAR_PARAM.ID', N'schema', N'dbo', N'table', N'OKP_VAR_RZP', N'column', N'ID_VAR'  
EXEC sp_addextendedproperty 'MS_Description', N'���������', N'schema', N'dbo', N'table', N'OKP_VAR_RZP', N'column', N'SUP_ID'    
EXEC sp_addextendedproperty 'MS_Description', N'���������', N'schema', N'dbo', N'table', N'OKP_VAR_RZP', N'column', N'UPUTRS'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���', N'schema', N'dbo', N'table', N'OKP_VAR_RZP', N'column', N'INCLUDE_GOZ'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ���� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_RZP', N'column', N'MIN_DTE_POST_RZP'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_RZP', N'column', N'MAX_DTE_POST_RZP'    
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

EXEC sp_addextendedproperty N'MS_Description',N'������ ��������������� ������ �� ��������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_RZP_DATA'
EXEC sp_addextendedproperty N'MS_Description',N'�������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_RZP_DATA',N'COLUMN',N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'DTE_CALC'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'ID_VAR'
EXEC sp_addextendedproperty 'MS_Description', N'OKP_VAR_RZP.ID', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'PID'
EXEC sp_addextendedproperty 'MS_Description', N'������� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'UPU_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� �� ���', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'PRC_KIM'
EXEC sp_addextendedproperty 'MS_Description', N'��������� �������� �� ���', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'PRC_DOST'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'NEWPOT'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'TNP'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����������� ��� ��� �������� ������������', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'TNP_COUNT'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ����������', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'QZKZ'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'K'
EXEC sp_addextendedproperty 'MS_Description', N'��� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'EIZ_POST'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ���', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'SUM_COST'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_RZP_DATA', N'column', N'SUM_DOST'    
GO

/*
** @NAME:  OKP_VAR_KIMTYPE
**/
CREATE TABLE dbo.OKP_VAR_KIMTYPE(
	id bigint identity(1,1) not null,
	id_var bigint NOT NULL,
	TYP varchar(1) NOT NULL,
	CONSTRAINT PK_OKP_VAR_KIMTYPE PRIMARY KEY CLUSTERED (ID)		
)
GO

EXEC sp_addextendedproperty N'MS_Description',N'�������� ������. �������� �������� ������������� ����� �����������.',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_KIMTYPE'
EXEC sp_addextendedproperty N'MS_Description',N'�������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_KIMTYPE',N'COLUMN',N'id'
EXEC sp_addextendedproperty N'MS_Description', N'������ �� �������', N'schema', N'dbo', N'table', N'OKP_VAR_KIMTYPE', N'column', N'id_var'
EXEC sp_addextendedproperty N'MS_Description', N'���������� ������������� ���� ������������', N'schema', N'dbo', N'table', N'OKP_VAR_KIMTYPE', N'column', N'TYP'  
GO

/*
** @NAME:  OKP_VAR_PPP
**/
CREATE TABLE OKP_VAR_PPP (ID BIGINT IDENTITY,
id_var BIGINT NOT NULL,
PPPNUM VARCHAR(10) NOT NULL,
CONSTRAINT PK_OKP_VAR_PPP_ID PRIMARY KEY CLUSTERED (ID))
GO

EXEC sp_addextendedproperty N'MS_Description', N'������ �������� �������, ������� ���������� ����������������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PPP'
EXEC sp_addextendedproperty N'MS_Description', N'�������������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PPP', 'COLUMN', N'ID'
EXEC sp_addextendedproperty N'MS_Description', N'����� � ���������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PPP', 'COLUMN', N'id_var'
EXEC sp_addextendedproperty N'MS_Description', N'����� ��', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PPP', 'COLUMN', N'PPPNUM'
GO

/*
** @NAME:  OKP_VAR_PLO
**/
CREATE TABLE OKP_VAR_PLO (ID BIGINT IDENTITY,
id_var BIGINT NOT NULL,
ID_PLO BIGINT NOT NULL,
CONSTRAINT PK_OKP_VAR_PLO_ID PRIMARY KEY CLUSTERED (ID))
GO

EXEC sp_addextendedproperty N'MS_Description', N'������ �������, ������� ���������� ����������������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PLO'
EXEC sp_addextendedproperty N'MS_Description', N'�������������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PLO', 'COLUMN', N'ID'
EXEC sp_addextendedproperty N'MS_Description', N'����� � ���������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PLO', 'COLUMN', N'id_var'
EXEC sp_addextendedproperty N'MS_Description', N'������������� ������', 'SCHEMA', N'dbo', 'TABLE', N'OKP_VAR_PLO', 'COLUMN', N'ID_PLO'
GO

/*
** @NAME:  OKP_VAR_EXWRH
**/
CREATE TABLE OKP_VAR_EXWRH(
	id bigint identity(1,1) not null,
    id_var bigint NOT NULL,
    WRH_IDN varchar(10) COLLATE DATABASE_DEFAULT NOT NULL,
	CONSTRAINT PK_OKP_VAR_EXWRH PRIMARY KEY CLUSTERED (ID)	
)
GO

EXEC sp_addextendedproperty N'MS_Description',N'������ ����������� ������� �� ������� ��������� ������ �� ��������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_EXWRH'
EXEC sp_addextendedproperty N'MS_Description',N'�������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_EXWRH',N'COLUMN',N'id'
EXEC sp_addextendedproperty N'MS_Description',N'������ �� �������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_EXWRH',N'COLUMN',N'id_var'
EXEC sp_addextendedproperty N'MS_Description',N'������  ����������� ������������� �� ������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_EXWRH',N'COLUMN',N'WRH_IDN'
GO

/*
** @NAME:  OKP_VAR_EXWRH
**/
CREATE TABLE OKP_VAR_POTS(
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
	AUTO_SEL_POT bit CONSTRAINT df_okp_var_pots_auto_sel_pot DEFAULT(0),
	USR_SEL_POT bit CONSTRAINT df_okp_var_pots_usr_sel_pot DEFAULT(0),
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

EXEC sp_addextendedproperty N'MS_Description',N'������ ������������ ��������� ������ �� ��������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_POTS'
EXEC sp_addextendedproperty N'MS_Description',N'�������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_POTS',N'COLUMN',N'id'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'id_var'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ���� - ����', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'DN'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ���� - ���������� ����� � �����', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'RN'  
EXEC sp_addextendedproperty 'MS_Description', N'����� - ����������� �� ���', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'GOS_ZAKAZ'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �����', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'PLO_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� - ��������� � OKP_PPP c ����� RZP_MARK=1', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'FAV_CPL'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����������� OKP_RZP_POT.RWC', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'RWC_POT'
EXEC sp_addextendedproperty 'MS_Description', N'���� �����������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'DTE_POT'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �����������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'QTYPOT'
EXEC sp_addextendedproperty 'MS_Description', N'������ �����������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'QTYTQY'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'RWC_TOZ'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� �������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'RWC_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����������� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'PRT_IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'RWC_NOM'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �����', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'WRH_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��� �����������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'TYP'
EXEC sp_addextendedproperty 'MS_Description', N'���������������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'unified'
EXEC sp_addextendedproperty 'MS_Description', N'����� ������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'CPLNUM'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'NOP'
EXEC sp_addextendedproperty 'MS_Description', N'����������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'TRN_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'imQTY'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'TQY'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������� ������������� �� ������ ��������� ����������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'AUTO_SEL_POT'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���������� �������������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'USR_SEL_POT'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� �����������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'PREV_DTE_POT'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������� �� ������ �� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'OLDWRH'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'SUPPLY'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������� �� ������ ����� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'NEWWRH'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ����� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'NEWPOT'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ������� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'UPU_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����������� ���� �����������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'MIN_DTE_POT'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������� �������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'MAX_EXP_DTE'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� �������� - ������ �������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'MIN_PLN_DTE_POST'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� �������� - ����� �������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'MAX_PLN_DTE_POST'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ���� �������� �� ������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'MIN_DTE_POST_RZP'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���� �������� �� ������', N'schema', N'dbo', N'table', N'OKP_VAR_POTS', N'column', N'MAX_DTE_POST_RZP'
GO

CREATE TABLE OKP_VAR_SZP(
  id bigint identity(1,1) not null,
  id_var bigint not null, 
  RWC_NOM int not null, 
  QTY float(53) CONSTRAINT df_okp_var_szp_qty DEFAULT(0),
  UPU_ID bigint NULL,  
  CONSTRAINT PK_OKP_VAR_SZP PRIMARY KEY CLUSTERED (ID)	
)  
GO
EXEC sp_addextendedproperty 'MS_Description',N'���������� �� ����������� ��������� ������� ��� ��������� ��������� ����� �� ��������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_SZP'
EXEC sp_addextendedproperty 'MS_Description',N'�������������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_VAR_SZP',N'COLUMN',N'id'
EXEC sp_addextendedproperty 'MS_Description',N'������ �� �������', N'schema', N'dbo', N'table', N'OKP_VAR_SZP', N'column', N'id_var'
EXEC sp_addextendedproperty 'MS_Description',N'������ �� ������������ �� ������� ��������� ����������� ��', N'schema', N'dbo', N'table', N'OKP_VAR_SZP', N'column', N'RWC_NOM'
EXEC sp_addextendedproperty 'MS_Description',N'������������ ���������� �� ������� ���������� ���������� ��', N'schema', N'dbo', N'table', N'OKP_VAR_SZP', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description',N'����������� ������� ��������', N'schema', N'dbo', N'table', N'OKP_VAR_SZP', N'column', N'UPU_ID'
GO

/* @BLOCK: �������� �����
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

EXEC sp_addextendedproperty 'MS_Description', N'���������� ��������� �����', N'schema', N'dbo', N'table', N'OKP_VPN'
EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_VPN', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'�����������', N'schema', N'dbo', N'table', N'OKP_VPN', N'column', N'IDN'
EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'OKP_VPN', N'column', N'Name'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������� ������������', N'schema', N'dbo', N'table', N'OKP_VPN', N'column', N'DB'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ������� ������������', N'schema', N'dbo', N'table', N'OKP_VPN', N'column', N'DE'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'OKP_VPN', N'column', N'Describe'
GO

/* @BLOCK: �������� �����
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

EXEC sp_addextendedproperty 'MS_Description', N'������ ������� �������� �����', N'schema', N'dbo', N'table', N'OKP_VPNItem'
EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� ����� (OKP_VPN.ID)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'VPN_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� (OKP_NOM.RWC)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� (OKP_ROUTES.ID)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'ROUTE_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������ (OKP_USERS.USER_ID)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'USER_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ����� ������� (��������� ��. SCHEME_Type)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'SCHEME_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������:
  1 - �����
  2 - �����
  3 - �� ����������� (SCHEME_ID - ������ �� ����������� OKP_CGM.ID)
  4 - �� ������� (SCHEME_ID - ������ �� ������ OKP_TPSampleQTY.ID)', 
N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'SCHEME_Type'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� ������� (OKP_PPP.RWC)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'PPP_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������ � ������ (OKP_PLOData.ID)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'PLOData_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� �������', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'N'
EXEC sp_addextendedproperty 'MS_Description', N'����������', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'���� �� ����� (� ����������� �� ����� ������� - ���� ����������, ���� ������)', N'schema', N'dbo', N'table', N'OKP_VPNItem', N'column', N'DTE'
GO

/* @BLOCK: �������� �����
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

EXEC sp_addextendedproperty 'MS_Description', N'���������� �������� �����', N'schema', N'dbo', N'table', N'OKP_VPNItemData'
EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� "������������" ������ (OKP_VPNItemData.ID)', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'IDP'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� (OKP_VPNItem.ID)', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'VPNItemData_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������� (OKP_NOM.RWC)', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������������ ��������', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'DB'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������ ��������', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'DE'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �� ������� "��������" �������', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'QTY_PC'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �� ������� "��������" �������', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'QTY_PCO'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������������', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'PlanType'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������������ ������', N'schema', N'dbo', N'table', N'OKP_VPNItemData', N'column', N'PartySize'
GO

/* @NAME:  OKP_CERT_OBJ
** @DESCR: ����� ������������ �������� � ��������� �������
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ������������ �������� � ��������� �������', N'schema', N'dbo', N'table', N'OKP_NOM_CERT'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_NOM_CERT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������', N'schema', N'dbo', N'table', N'OKP_NOM_CERT', N'column', N'nom_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����������� ��������', N'schema', N'dbo', N'table', N'OKP_NOM_CERT', N'column', N'cert_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������� ������� (��������)', N'schema', N'dbo', N'table', N'OKP_NOM_CERT', N'column', N'sysobj_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������ � ������� ���������� ������� (��������)', N'schema', N'dbo', N'table', N'OKP_NOM_CERT', N'column', N'obj_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������', N'schema', N'dbo', N'table', N'OKP_NOM_CERT', N'column', N'owner_id'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_NOM_CERT', N'column', N'create_date'
GO

/* @NAME:  OKP_CERT_OBJ_SNUM
** @DESCR: ����� ������������ �������� � ��������� ��������
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

EXEC sp_addextendedproperty 'MS_Description', N'����� ������������ �������� � ��������� �������', N'schema', N'dbo', N'table', N'OKP_NOM_CERT_SNUM'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_NOM_CERT_SNUM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������� ����������� �������� � ������������', N'schema', N'dbo', N'table', N'OKP_NOM_CERT_SNUM', N'column', N'NOM_CERT_id'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �����', N'schema', N'dbo', N'table', N'OKP_NOM_CERT_SNUM', N'column', N'snum'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������', N'schema', N'dbo', N'table', N'OKP_NOM_CERT_SNUM', N'column', N'owner_id'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������', N'schema', N'dbo', N'table', N'OKP_NOM_CERT_SNUM', N'column', N'create_date'
GO

/* @NAME:  okp_help
** @DESCR: ����� HelpContext �� ���������� �������
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

EXEC sp_addextendedproperty 'MS_Description', N'����� HelpContext �� ���������� �������', N'schema', N'dbo', N'table', N'okp_help'
EXEC sp_addextendedproperty 'MS_Description', N'�������� HelpContext', N'schema', N'dbo', N'table', N'okp_help', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'PageID �������� � ������������ ���������', N'schema', N'dbo', N'table', N'okp_help', N'column', N'pageid'
EXEC sp_addextendedproperty 'MS_Description', N'������������ �������� � Confluence', N'schema', N'dbo', N'table', N'okp_help', N'column', N'area_name'
EXEC sp_addextendedproperty 'MS_Description', N'Permalink �������� � Confluence', N'schema', N'dbo', N'table', N'okp_help', N'column', N'url_name'
EXEC sp_addextendedproperty 'MS_Description', N'�������� ���������� PDF-�����', N'schema', N'dbo', N'table', N'okp_help', N'column', N'pdf_name'
GO

/* @NAME:  okp_verify
** @DESCR: �������� ��������
** @COMM:  1. �� ���� ���� ������������: toz_id / fio_id / snum_id_verified / verifyParam_obj_id
**         �� ��� �� ����� ������ - ��������� ������������
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
	
EXEC sp_addextendedproperty 'MS_Description', N'�������� ��������', N'schema', N'dbo', N'table', N'okp_verify'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����� ��������', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'uop_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����������', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'fio_id'
EXEC sp_addextendedproperty 'MS_Description', N'���� ���������� ��������', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'time_execute'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������������, ���������� ������', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'user_id'
EXEC sp_addextendedproperty 'MS_Description', N'����� �������� ������', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'time_create'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� ��������', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'verifyParam_obj_id'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'result'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� ������ ����������� ������', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'snum_id_checked'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �����������', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'count_checked'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� ������ ������, ���������� ������', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'snum_id_affected'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'count_verified'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �����������', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'count_defected'
EXEC sp_addextendedproperty 'MS_Description', N'������', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'state'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �� ���� ��� ��� (������������)', N'schema', N'dbo', N'table', N'okp_verify', N'column', N'work_control'
GO

/* @NAME:  okp_verify_snum
** @DESCR: ���������� � ���������� ������ ������� �� ���������� �������� (����� � ������� ����������)
** @COMM:  1. ����� �������� �������������� ����������, ������ ��� ����� ������ ������������� ������� okp_verify
**         � ������ ����, ��� ���� �������� ����� ��������� ���� �������� ��������, � ������ �������� - ������ ��������
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
	
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������ ������� �� ��������', N'schema', N'dbo', N'table', N'okp_verify_snum'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'okp_verify_snum', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� ������', N'schema', N'dbo', N'table', N'okp_verify_snum', N'column', N'snum_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����� ��������', N'schema', N'dbo', N'table', N'okp_verify_snum', N'column', N'uop_id'
EXEC sp_addextendedproperty 'MS_Description', N'����������', N'schema', N'dbo', N'table', N'okp_verify_snum', N'column', N'count_affected'
EXEC sp_addextendedproperty 'MS_Description', N'���� "�������� �������"', N'schema', N'dbo', N'table', N'okp_verify_snum', N'column', N'pass'
GO

/* @NAME:  OKP_VerifyParam_OBJ
** @DESCR: ��������� ����� �������� ��������
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
	gravity INT CONSTRAINT df__okp_verifyparam_obj__gravity DEFAULT 0 NOT NULL,
	auxiliary uniqueidentifier NULL,
	cert_id INT NULL,
	CONSTRAINT pk_okp_verifyparam_obj PRIMARY KEY CLUSTERED (ID) 
)
GO
	
EXEC sp_addextendedproperty 'MS_Description', N'�������������� ���������', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'�����', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'number'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ��������� ��������', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���������� �������', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'sysobj_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID �������', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'obj_id'
EXEC sp_addextendedproperty 'MS_Description', N'�����/������������� ��������', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'volume'
EXEC sp_addextendedproperty 'MS_Description', N'����� ��������', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'tro'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ���������', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'eiz_id_tro'
EXEC sp_addextendedproperty 'MS_Description', N'����� ���������������', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'tvo'
EXEC sp_addextendedproperty 'MS_Description', N'��� ������� ����������������', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'eiz_id_tvo'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �����', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'gravity'
EXEC sp_addextendedproperty 'MS_Description', N'��������������� ����', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'auxiliary'
EXEC sp_addextendedproperty 'MS_Description', N'ID ����������� ��������', N'schema', N'dbo', N'table', N'OKP_VerifyParam_OBJ', N'column', N'cert_id'
GO

/* @NAME:  OKP_TOZ_VERIFYNOM
** @DESCR: ���������� �������� �� �������� � ������������
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ������������ ���������������� ��', N'schema', N'dbo', N'table', N'OKP_TOZ_VERIFYNOM'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ����������� ���������������� ��', N'schema', N'dbo', N'table', N'OKP_TOZ_VERIFYNOM', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������������-�����������', N'schema', N'dbo', N'table', N'OKP_TOZ_VERIFYNOM', N'column', N'NOM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ���������������� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ_VERIFYNOM', N'column', N'TOZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �����������', N'schema', N'dbo', N'table', N'OKP_TOZ_VERIFYNOM', N'column', N'AMOUNT'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������� ���������', N'schema', N'dbo', N'table', N'OKP_TOZ_VERIFYNOM', N'column', N'EIZ_ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� �������� ��������', N'schema', N'dbo', N'table', N'OKP_TOZ_VERIFYNOM', N'column', N'VERIFYPARAM_OBJ_ID'
GO


/* @NAME:  OKP_FORM
** @DESCR: ���������� �����
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

EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ���', N'schema', N'dbo', N'table', N'okp_form'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����', N'schema', N'dbo', N'table', N'okp_form', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����������� �����', N'schema', N'dbo', N'table', N'okp_form', N'column', N'idn'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �����', N'schema', N'dbo', N'table', N'okp_form', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'�������� �����', N'schema', N'dbo', N'table', N'okp_form', N'column', N'comment'
EXEC sp_addextendedproperty 'MS_Description', N'ID �����������', 'schema', 'dbo', 'table', 'okp_form', 'column', 'image_id'
GO

CREATE TABLE okp_tmz_type (
	id INT IDENTITY(1, 1) NOT NULL,
	name VARCHAR(64) COLLATE DATABASE_DEFAULT NOT NULL,
	grp_id INT NULL,
	CONSTRAINT pk_okp_tmz_type PRIMARY KEY CLUSTERED (id)
)
GO
EXEC sp_addextendedproperty 'MS_Description', N'���� �������-������������ �������', N'schema', N'dbo', N'table', N'okp_tmz_type'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���� ���', N'schema', N'dbo', N'table', N'okp_tmz_type', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������ ���� ���', N'schema', N'dbo', N'table', N'okp_tmz_type', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'okp_tmz_type', N'column', N'grp_id'
GO

/* @NAME:  OKP_CURRENCY
** @DESCR: ������
**/
CREATE TABLE OKP_CURRENCY (
  ID int IDENTITY,
  IDN varchar(3) NOT NULL,
  NAME varchar(50) NOT NULL,
  CONSTRAINT PK_OKP_CURRENCY PRIMARY KEY CLUSTERED (ID)
)
GO
EXEC sp_addextendedproperty 'MS_Description',N'������',N'SCHEMA',N'dbo','TABLE',N'OKP_CURRENCY'
EXEC sp_addextendedproperty 'MS_Description',N'������������� ������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_CURRENCY',N'COLUMN',N'ID'
EXEC sp_addextendedproperty 'MS_Description',N'��� ������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_CURRENCY',N'COLUMN',N'IDN'
EXEC sp_addextendedproperty 'MS_Description',N'������������ ������',N'SCHEMA',N'dbo',N'TABLE',N'OKP_CURRENCY',N'COLUMN',N'NAME'
GO


/* @NAME:  OKP_SDT_FIO
** @DESCR: ����������� ������ ���
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

EXEC sp_addextendedproperty 'MS_Description', N'����������� ������ ���', N'schema', N'dbo', N'table', N'OKP_SDT_FIO'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �����', N'schema', N'dbo', N'table', N'OKP_SDT_FIO', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������������� �������� ��', N'schema', N'dbo', N'table', N'OKP_SDT_FIO', N'column', N'SDTELEM_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��. ���������', N'schema', N'dbo', N'table', N'OKP_SDT_FIO', N'column', N'PERS_ID'
EXEC sp_addextendedproperty 'MS_Description', N'��. �������� �����', N'schema', N'dbo', N'table', N'OKP_SDT_FIO', N'column', N'WPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'����, �������� �� �������� ������� (��������)', N'schema', N'dbo', N'table', N'OKP_SDT_FIO', N'column', N'ISGRPFLAG'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ', N'schema', N'dbo', N'table', N'OKP_SDT_FIO', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'���� ��������/���������', N'schema', N'dbo', N'table', N'OKP_SDT_FIO', N'column', N'CREATED'
EXEC sp_addextendedproperty 'MS_Description', N'��� �������/��������, OKP_USERS.USER_ID', N'schema', N'dbo', N'table', N'OKP_SDT_FIO', N'column', N'CREATEBY'
go


/* @NAME:  OKP_OBSP_CALC_SESSIONS
** @DESCR: ������ �������� �������� �������������� ���
**/
CREATE TABLE OKP_OBSP_CALC_SESSIONS (
  ID int IDENTITY,
  DTE datetime NULL,
  USR varchar(50) NULL,
  CONSTRAINT PK_OKP_OBSP_CALC_SESSIONS PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sys.sp_addextendedproperty N'MS_Description','������� ������ �������� �������� �������������� ���','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_CALC_SESSIONS'
EXEC sys.sp_addextendedproperty N'MS_Description','�������������','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_CALC_SESSIONS','COLUMN',N'ID'
EXEC sys.sp_addextendedproperty N'MS_Description','���� ����� �������','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_CALC_SESSIONS','COLUMN',N'DTE'
EXEC sys.sp_addextendedproperty N'MS_Description','��������� �������������','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_CALC_SESSIONS','COLUMN',N'USR'
GO

/* @NAME:  OKP_OBSP_POT
** @DESCR: �������������� ���������� �� �������� �������� �������������� � ���
**/
CREATE TABLE OKP_OBSP_POT (
  RWC_POT bigint NOT NULL,
  QTY_DEFICIT float NULL,
  DAY_RESERV int NULL,
  CONSTRAINT PK_OKP_OBSP_POT PRIMARY KEY CLUSTERED (RWC_POT)
)
GO

EXEC sys.sp_addextendedproperty N'MS_Description','�������� ������ ��� ������� ������� �������������� ���','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_POT'
EXEC sys.sp_addextendedproperty N'MS_Description','������ �� ������ � ������� OKP_POT','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_POT','COLUMN',N'RWC_POT'
EXEC sys.sp_addextendedproperty N'MS_Description','����� ��������','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_POT','COLUMN',N'QTY_DEFICIT'
EXEC sys.sp_addextendedproperty N'MS_Description','������ ������, � ����','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_POT','COLUMN',N'DAY_RESERV'
GO


/* @NAME:  OKP_OBSP_STS
** @DESCR: ������� �������������� � ��� � �������� �� ��������� ��������
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

EXEC sys.sp_addextendedproperty N'MS_Description','������� �������������� ���','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_STS'
EXEC sys.sp_addextendedproperty N'MS_Description','ID','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_STS','COLUMN',N'id'
EXEC sys.sp_addextendedproperty N'MS_Description','ID ���������� �������','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_STS','COLUMN',N'sysobj_id'
EXEC sys.sp_addextendedproperty N'MS_Description','ID �������','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_STS','COLUMN',N'rwc'
EXEC sys.sp_addextendedproperty N'MS_Description','������ �� ��������','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_STS','COLUMN',N'STS_WRH'
EXEC sys.sp_addextendedproperty N'MS_Description','������ �� �������','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_STS','COLUMN',N'STS_RZP'
EXEC sys.sp_addextendedproperty N'MS_Description','������ �� ���������','SCHEMA',N'dbo','TABLE',N'OKP_OBSP_STS','COLUMN',N'STS_IM'
GO

/* @NAME:  OKP_POTUDSE
** @DESCR: ������� ������ ��� � ������������� (����)
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

EXEC sp_addextendedproperty 'MS_Description', N'������� ����, ������ ��� � �������������', N'schema', N'dbo', N'table', N'OKP_POTUDSE'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������', N'schema', N'dbo', N'table', N'OKP_POTUDSE', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������� ����������� OKP_POT.rwc', N'schema', N'dbo', N'table', N'OKP_POTUDSE', N'column', N'ID_POT'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������� ��� OKP_PPP.RWC', N'schema', N'dbo', N'table', N'OKP_POTUDSE', N'column', N'ID_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����', N'schema', N'dbo', N'table', N'OKP_POTUDSE', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������������ ������ (1-���������, 0- ������������ ��� �� ���������� � ���������������� ���������)', N'schema', N'dbo', N'table', N'OKP_POTUDSE', N'column', N'MET'
GO

/* @NAME:  ARH_POTUDSE
** @DESCR: ������� ������ ������ ��� � ������������� (����)
**/
CREATE TABLE dbo.ARH_POTUDSE (
	ID bigint  NULL,
	ID_POT bigint NULL,
	ID_PPP int NULL,
	QTY float NULL,
	MET int  NULL
)

EXEC sp_addextendedproperty 'MS_Description', N'������� ����, ������ ��� � �������������', N'schema', N'dbo', N'table', N'ARH_POTUDSE'
EXEC sp_addextendedproperty 'MS_Description', N'������������� ������', N'schema', N'dbo', N'table', N'ARH_POTUDSE', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������� ����������� OKP_POT.rwc', N'schema', N'dbo', N'table', N'ARH_POTUDSE', N'column', N'ID_POT'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� ������������� ��� OKP_PPP.RWC', N'schema', N'dbo', N'table', N'ARH_POTUDSE', N'column', N'ID_PPP'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����', N'schema', N'dbo', N'table', N'ARH_POTUDSE', N'column', N'QTY'
EXEC sp_addextendedproperty 'MS_Description', N'������� ������������ ������ (1-���������, 0- ������������ ��� �� ���������� � ���������������� ���������)', N'schema', N'dbo', N'table', N'ARH_POTUDSE', N'column', N'MET'
GO

/* @NAME:  okp_person_job
** @DESCR: ������� ����������, ����������� ��� ������� ���������� ��� ������������
**/
CREATE TABLE okp_person_job (
	id INT NOT NULL IDENTITY(1, 1),
	name VARCHAR(128) COLLATE DATABASE_DEFAULT NULL,
	grp_id INT NULL,
	CONSTRAINT pk__okp_person_job PRIMARY KEY CLUSTERED (id)
)

EXEC sp_addextendedproperty 'MS_Description', N'���������', N'schema', N'dbo', N'table', N'okp_person_job'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'okp_person_job', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'okp_person_job', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'okp_person_job', N'column', N'grp_id'
GO

/* @NAME:  okp_imsyn
** @DESCR: ������� ��������� �������
**/
CREATE TABLE okp_imsyn (
	id INT NOT NULL IDENTITY(1, 1),
	tab VARCHAR(32) COLLATE DATABASE_DEFAULT NOT NULL,
	field VARCHAR(32) COLLATE DATABASE_DEFAULT NOT NULL,
	syn VARCHAR(32) COLLATE DATABASE_DEFAULT NOT NULL,
	val VARCHAR(32) COLLATE DATABASE_DEFAULT NOT NULL,
	CONSTRAINT pk__okp_imsyn PRIMARY KEY CLUSTERED (id)
)
	
EXEC sp_addextendedproperty 'MS_Description', N'�������� � �������', N'schema', N'dbo', N'table', N'okp_imsyn'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'okp_imsyn', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'okp_imsyn', N'column', N'tab'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������', N'schema', N'dbo', N'table', N'okp_imsyn', N'column', N'field'
EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'okp_imsyn', N'column', N'syn'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'okp_imsyn', N'column', N'val'
GO

/* @NAME:  OKP_EXTNOM
** @DESCR: ������� ������������ ������������
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

EXEC sys.sp_addextendedproperty N'MS_Description','������� ������������ ������������','SCHEMA',N'dbo','TABLE',N'OKP_EXTNOM'
EXEC sys.sp_addextendedproperty N'MS_Description','������� �����������','SCHEMA',N'dbo','TABLE',N'OKP_EXTNOM','COLUMN',N'idn'
EXEC sys.sp_addextendedproperty N'MS_Description','������� ������������','SCHEMA',N'dbo','TABLE',N'OKP_EXTNOM','COLUMN',N'name'
EXEC sys.sp_addextendedproperty N'MS_Description','ID ������������','SCHEMA',N'dbo','TABLE',N'OKP_EXTNOM','COLUMN',N'nom_id'
EXEC sys.sp_addextendedproperty N'MS_Description','ID �����������','SCHEMA',N'dbo','TABLE',N'OKP_EXTNOM','COLUMN',N'ctr_id'
EXEC sys.sp_addextendedproperty N'MS_Description','ID ��������������','SCHEMA',N'dbo','TABLE',N'OKP_EXTNOM','COLUMN',N'user_id'
EXEC sys.sp_addextendedproperty N'MS_Description','���� ��������','SCHEMA',N'dbo','TABLE',N'OKP_EXTNOM','COLUMN',N'date_created'
EXEC sys.sp_addextendedproperty N'MS_Description','�� ���������','SCHEMA',N'dbo','TABLE',N'OKP_EXTNOM','COLUMN',N'is_default'
GO

/* @NAME:  OKP_UOPCOMMENT
** @DESCR: ����������� � ������� ������
**/

CREATE TABLE dbo.OKP_UOPCOMMENT (
  ID int IDENTITY(1, 1) NOT NULL,
  UOP_GRUID uniqueidentifier NOT NULL,
  COMMENT varchar(4000) COLLATE Database_default NULL,
  CONSTRAINT OKP_UOPCOMMENT_pk PRIMARY KEY CLUSTERED (ID)
)
GO

EXEC sp_addextendedproperty 'MS_Description', N'������� ������������ � ������� ������', N'schema', N'dbo', N'table', N'OKP_UOPCOMMENT'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ������', N'schema', N'dbo', N'table', N'OKP_UOPCOMMENT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������� ������ �����', N'schema', N'dbo', N'table', N'OKP_UOPCOMMENT', N'column', N'UOP_GRUID'
EXEC sp_addextendedproperty 'MS_Description', N'����������� � ����� (�� �� ������ ������)', N'schema', N'dbo', N'table', N'OKP_UOPCOMMENT', N'column', N'COMMENT'
GO

/* @NAME:  ARH_UOPCOMMENT
** @DESCR: ����� ������������ � ������� ������
**/
CREATE TABLE dbo.ARH_UOPCOMMENT (
    ID int  NULL,
    UOP_GRUID uniqueidentifier  NULL,
    COMMENT varchar(4000) COLLATE Database_default NULL
 )
GO

EXEC sp_addextendedproperty 'MS_Description', N'�������� ������� ������������ � ������� ������', N'schema', N'dbo', N'table', N'ARH_UOPCOMMENT'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ����� ������', N'schema', N'dbo', N'table', N'ARH_UOPCOMMENT', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'���������� ������������� ������ �����', N'schema', N'dbo', N'table', N'ARH_UOPCOMMENT', N'column', N'UOP_GRUID'
EXEC sp_addextendedproperty 'MS_Description', N'����������� � ����� (�� �� ������ ������)', N'schema', N'dbo', N'table', N'ARH_UOPCOMMENT', N'column', N'COMMENT'
GO

/* @NAME: okp_select
** @DESCR: ���� ������ �� ������
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

EXEC sp_addextendedproperty 'MS_Description', N'���� ������', N'schema', N'dbo', N'table', N'okp_select'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'okp_select', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �����������', N'schema', N'dbo', N'table', N'okp_select', N'column', N'idn'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'okp_select', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������� ���������', N'schema', N'dbo', N'table', N'okp_select', N'column', N'msrc_id'
EXEC sp_addextendedproperty 'MS_Description', N'��������� ��������', N'schema', N'dbo', N'table', N'okp_select', N'column', N'filter_union'
EXEC sp_addextendedproperty 'MS_Description', N'���������', N'schema', N'dbo', N'table', N'okp_select', N'column', N'system'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'okp_select', N'column', N'grp_id'
GO

/* @NAME: okp_sfield
** @DESCR: ���� � ����� ������
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

EXEC sp_addextendedproperty 'MS_Description', N'���� � ����� ������', N'schema', N'dbo', N'table', N'okp_sfield'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'okp_sfield', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �����������', N'schema', N'dbo', N'table', N'okp_sfield', N'column', N'idn'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'okp_sfield', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���� ������', N'schema', N'dbo', N'table', N'okp_sfield', N'column', N'select_id'
EXEC sp_addextendedproperty 'MS_Description', N'ID ��������', N'schema', N'dbo', N'table', N'okp_sfield', N'column', N'mfld_id'
EXEC sp_addextendedproperty 'MS_Description', N'���� � �������� �� �������� �������', N'schema', N'dbo', N'table', N'okp_sfield', N'column', N'mfld_path'
EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'okp_sfield', N'column', N'visible'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������', N'schema', N'dbo', N'table', N'okp_sfield', N'column', N'gravity'
GO

/* @NAME: okp_sfilter
** @DESCR: ������� � ����� ������
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

EXEC sp_addextendedproperty 'MS_Description', N'������� � ����� ������', N'schema', N'dbo', N'table', N'okp_sfilter'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'okp_sfilter', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �����������', N'schema', N'dbo', N'table', N'okp_sfilter', N'column', N'idn'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'okp_sfilter', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'ID ���� ������', N'schema', N'dbo', N'table', N'okp_sfilter', N'column', N'select_id'
EXEC sp_addextendedproperty 'MS_Description', N'�������', N'schema', N'dbo', N'table', N'okp_sfilter', N'column', N'visible'
EXEC sp_addextendedproperty 'MS_Description', N'������� �� ���������', N'schema', N'dbo', N'table', N'okp_sfilter', N'column', N'checked'
EXEC sp_addextendedproperty 'MS_Description', N'������� ���������', N'schema', N'dbo', N'table', N'okp_sfilter', N'column', N'gravity'
EXEC sp_addextendedproperty 'MS_Description', N'����� SQL-�������', N'schema', N'dbo', N'table', N'okp_sfilter', N'column', N'query_text'
GO

/* @NAME: okp_rparm
** @DESCR: ��������� �������� �������
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

EXEC sp_addextendedproperty 'MS_Description', N'��������� �������� �������', N'schema', N'dbo', N'table', N'okp_rparm'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'okp_rparm', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �������������', N'schema', N'dbo', N'table', N'okp_rparm', N'column', N'idn'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'okp_rparm', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'���', N'schema', N'dbo', N'table', N'okp_rparm', N'column', N'typ'
EXEC sp_addextendedproperty 'MS_Description', N'���������', N'schema', N'dbo', N'table', N'okp_rparm', N'column', N'system'
EXEC sp_addextendedproperty 'MS_Description', N'������ ����������', N'schema', N'dbo', N'table', N'okp_rparm', N'column', N'build_line'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'okp_rparm', N'column', N'grp_id'
GO

/* @NAME: okp_calc_model
** @DESCR: ������� �����������
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

EXEC sp_addextendedproperty 'MS_Description', N'������� �����������', N'schema', N'dbo', N'table', N'okp_calc_model'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������', N'schema', N'dbo', N'table', N'okp_calc_model', N'column', N'id'
EXEC sp_addextendedproperty 'MS_Description', N'���������� �����', N'schema', N'dbo', N'table', N'okp_calc_model', N'column', N'idn'
EXEC sp_addextendedproperty 'MS_Description', N'������������', N'schema', N'dbo', N'table', N'okp_calc_model', N'column', N'name'
EXEC sp_addextendedproperty 'MS_Description', N'������ ������ ������', N'schema', N'dbo', N'table', N'okp_calc_model', N'column', N'costing'
EXEC sp_addextendedproperty 'MS_Description', N'��������', N'schema', N'dbo', N'table', N'okp_calc_model', N'column', N'main'
GO

create table OKP_ROOTpasp (
    ID int not null identity(1, 1),
    CPL_ID int not null,
    DATE_CREATER datetime NOT NULL DEFAULT (GETDATE())
  )

EXEC sp_addextendedproperty 'MS_Description', N'������� ���������� ���������', N'schema', N'dbo', N'table', N'OKP_ROOTpasp'
EXEC sp_addextendedproperty 'MS_Description', N'ID ������ (����� ������ ����������� ��������)', N'schema', N'dbo', N'table', N'OKP_ROOTpasp', N'column', N'ID'
EXEC sp_addextendedproperty 'MS_Description', N'������ �� RWC ���������������� �����', N'schema', N'dbo', N'table', N'OKP_ROOTpasp', N'column', N'CPL_ID'
EXEC sp_addextendedproperty 'MS_Description', N'���� �������� ����������� ��������', N'schema', N'dbo', N'table', N'OKP_ROOTpasp', N'column', N'DATE_CREATER'
GO