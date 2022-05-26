[script]

--
-- Definition for user-defined data type ART_LEN : 
--

CREATE TYPE dbo.ART_LEN
FROM varchar(8)   NULL
GO

--
-- Definition for user-defined data type CCC_LEN : 
--

CREATE TYPE dbo.CCC_LEN
FROM varchar(10)    NULL
GO

--
-- Definition for user-defined data type D_DATE : 
--

CREATE TYPE dbo.D_DATE
FROM datetime NOT NULL
GO

--
-- Definition for user-defined data type DEP_LEN : 
--

CREATE TYPE dbo.DEP_LEN
FROM varchar(10)    NULL
GO

--
-- Definition for user-defined data type DOC_LEN : 
--

CREATE TYPE dbo.DOC_LEN
FROM varchar(50)    NULL
GO

--
-- Definition for user-defined data type EIZ_LEN : 
--

CREATE TYPE dbo.EIZ_LEN
FROM varchar(3)    NULL
GO

--
-- Definition for user-defined data type G_CODE : 
--

CREATE TYPE dbo.G_CODE
FROM varchar(1)    NULL
GO

--
-- Definition for user-defined data type G_COST : 
--

CREATE TYPE dbo.G_COST
FROM float NULL
GO

--
-- Definition for user-defined data type G_COUNT : 
--

CREATE TYPE dbo.G_COUNT
FROM int NULL
GO

--
-- Definition for user-defined data type G_KOEFF : 
--

CREATE TYPE dbo.G_KOEFF
FROM float NULL
GO

--
-- Definition for user-defined data type G_NUMB : 
--

CREATE TYPE dbo.G_NUMB
FROM varchar(10)    NULL
GO

--
-- Definition for user-defined data type G_PRICE : 
--

CREATE TYPE dbo.G_PRICE
FROM money NULL
GO

--
-- Definition for user-defined data type G_QUANT_F : 
--

CREATE TYPE dbo.G_QUANT_F
FROM float NULL
GO

--
-- Definition for user-defined data type G_QUANT_I : 
--

CREATE TYPE dbo.G_QUANT_I
FROM int NULL
GO

--
-- Definition for user-defined data type G_TIME : 
--

CREATE TYPE dbo.G_TIME
FROM datetime NOT NULL
GO

--
-- Definition for user-defined data type KTS_LEN : 
--

CREATE TYPE dbo.KTS_LEN
FROM varchar(10)    NULL
GO

--
-- Definition for user-defined data type NAO_LEN : 
--

CREATE TYPE dbo.NAO_LEN
FROM varchar(50)    NULL
GO

--
-- Definition for user-defined data type PIN_LEN : 
--

CREATE TYPE dbo.PIN_LEN
FROM varchar(5)    NULL
GO

--
-- Definition for user-defined data type PRT_LEN : 
--

CREATE TYPE dbo.PRT_LEN
FROM varchar(50)    NULL
GO

--
-- Definition for user-defined data type PRT_NAM : 
--

CREATE TYPE dbo.PRT_NAM
FROM varchar(50)    NULL
GO

--
-- Definition for user-defined data type REMARK : 
--

CREATE TYPE dbo.REMARK
FROM text NULL
GO

--
-- Definition for user-defined data type WRH_LEN : 
--

CREATE TYPE dbo.WRH_LEN
FROM varchar(10)    NULL
GO

--
-- Definition for user-defined data type WRH_NAM : 
--

CREATE TYPE dbo.WRH_NAM
FROM varchar(50)    NULL
GO

