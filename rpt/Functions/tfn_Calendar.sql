



--select *  from [rpt].[tfn_Calendar] ('2014-12-30',10000,'2017-08-13')
/************************************************
Author : Gino Bockaert
Date : 01-06-2017
Purpose : Generic table dimension creation

History
Version			Date			Initials	Modification 
1.0				01-06-2017		gbo			Initial version
1.1				11-08-2017		gbo			Added ISO Period
1.2				10-06-2019		gbo			Adde last 8 w & last 12 m borders
****************************************************************/

CREATE FUNCTION [rpt].[tfn_Calendar](@FromDate Date = '2020-12-28'
                                    ,		-- date to start from 
                                    @NoDays   INT      = 4000
                                    ,				-- number of years to generate 
                                    @CurrDate Date						-- current date 
)
RETURNS @dimdate TABLE
([Date]              Date NULL,
 [YYYYMMDD]          [INT] NULL,
 [Year]              [INT] NULL,
 [YrNN]              [INT] NULL,
 [YYYYMM]            [INT] NULL,
 [Month]             [INT] NULL,
 [Day]               [INT] NULL,
 [WkDNo]             [INT] NULL,
 [WkDName]           [NCHAR](9) NULL,
 [WkDName2]          [NCHAR](2) NULL,
 [WkDName3]          [NCHAR](3) NULL,
 [JulDay]            [INT] NULL,
 [JulWk]             [INT] NULL,
 [WkNo]              [INT] NULL,
 [Qtr]               [INT] NULL,
 [Last]              [INT] NULL,
 [LdOfMo]            [INT] NULL,
 [LDtOfMo]           [DATETIME] NULL,
 [MonthName]         [NVARCHAR](16) NULL,
 [MonthName_Short]   [NVARCHAR](3) NULL,
 [MonthYearName]     [NVARCHAR](34) NULL,
 [DayMonthLabel]	 [NVARCHAR](20) NULL,
 [IsoWeekNo]         [INT] NULL,
 [IsoPeriod]         [INT] NULL,
 [IsoYearNo]         [INT] NULL,

 [IsoYYYYWW]         [INT] NULL,
 [IsoWeekName]       [VARCHAR](3) NULL,
 [QtrName]           [VARCHAR](31) NULL,
 [Curr_Date]         [DATETIME] NULL,
 [Yday_Date]         [DATETIME] NULL,
 [Curr_Date_LY]      [DATETIME] NULL,
 [Curr_IsoYYYYWW]    [INT] NULL,
 [Curr_IsoYYYYWW_LY] [INT] NULL,
 [Prev_IsoYYYYWW]    [INT] NULL,
 [Curr_YYYYMM]       [INT] NULL,
 [Curr_YYYYMM_LY]    [INT] NULL,
 [Prev_YYYYMM]       [INT] NULL,
 [Curr_Year]         [INT] NULL,
 [Curr_Year_LY]      [INT] NULL,
 [Curr_ISOYearNo]    [INT] NULL,
 [Curr_ISOYearNo_LY] [INT] NULL,
 [Curr_ISOPeriod] [INT] NULL,
 [Curr_ISO_Last8W] [INT] NULL,
 [Curr_ISO_Last8M] [INT] NULL
)
AS
     BEGIN
         WITH E1(N)
              AS (
              SELECT 1
              UNION ALL
              SELECT 1), --2 rows
              E2(N)
              AS (
              SELECT 1
              FROM E1 a,
                   E1 b), --4 rows
              E4(N)
              AS (
              SELECT 1
              FROM E2 a,
                   E2 b), --16 rows
              E8(N)
              AS (
              SELECT 1
              FROM E4 a,
                   E4 b), --256 rows
              E16(N)
              AS (
              SELECT 1
              FROM E8 a,
                   E8 b), --65536 rows
              cteTally(N)
              AS (
              SELECT TOP (ABS(@NoDays)) ROW_NUMBER() OVER(ORDER BY
                                                         (
                                                             SELECT NULL
                                                         ))
              FROM E16),
              relative_fields
              AS (
              SELECT Curr_Date = CAST(CONVERT(NVARCHAR, @CurrDate, 112) AS DATETIME),
                     Yday_Date = CONVERT(NVARCHAR, DATEADD(day, -1, @CurrDate), 112),
                     Curr_Date_LY = CAST(CONVERT(NVARCHAR, DATEADD(day, -364, @CurrDate), 112) AS DATETIME),
                     [Curr_IsoYYYYWW] = (CASE
                                             WHEN DATEPART(ISO_WEEK, @CurrDate) >= 52
                                                  AND MONTH(@CurrDate) = 1
                                             THEN YEAR(@CurrDate) - 1
                                             ELSE YEAR(@CurrDate)
                                         END * 100) + DATEPART(ISO_WEEK, @CurrDate),
                     [Curr_IsoYYYYWW_LY] = (CASE
                                                WHEN DATEPART(ISO_WEEK, DATEADD(day, -364, @CurrDate)) >= 52
                                                     AND MONTH(DATEADD(day, -364, @CurrDate)) = 1
                                                THEN YEAR(DATEADD(day, -364, @CurrDate)) - 1
                                                ELSE YEAR(DATEADD(day, -364, @CurrDate))
                                            END * 100) + DATEPART(ISO_WEEK, DATEADD(day, -364, @CurrDate)),
                     [Prev_IsoYYYYWW] = (CASE
                                             WHEN DATEPART(ISO_WEEK, DATEADD(day, -7, @CurrDate)) >= 52
                                                  AND MONTH(DATEADD(day, -7, @CurrDate)) = 1
                                             THEN YEAR(DATEADD(day, -7, @CurrDate)) - 1
                                             ELSE YEAR(DATEADD(day, -7, @CurrDate))
                                         END * 100) + DATEPART(ISO_WEEK, DATEADD(day, -7, @CurrDate)),
                     [Curr_YYYYMM] = YEAR(@CurrDate) * 100 + MONTH(@CurrDate),
                     [Curr_YYYYMM_LY] = YEAR(DATEADD(year, -1, @CurrDate)) * 100 + MONTH(@CurrDate),
                     [Prev_YYYYMM] = YEAR(DATEADD(month, -1, @CurrDate)) * 100 + MONTH(DATEADD(month, -1, @CurrDate)),
                     [Curr_Year] = YEAR(@CurrDate),
                     [Curr_Year_LY] = YEAR(@CurrDate) - 1,
                     [Curr_ISOYearNo] = CASE
                                            WHEN DATEPART(ISO_WEEK, @CurrDate) = 1
                                                 AND MONTH(@CurrDate) = 12
                                            THEN YEAR(@CurrDate) + 1
                                            WHEN DATEPART(ISO_WEEK, @CurrDate) >= 52
                                                 AND MONTH(@CurrDate) = 1
                                            THEN YEAR(@CurrDate) - 1
                                            ELSE YEAR(@CurrDate)
                                        END,
				[Curr_ISOPeriod] = 	   case when cast ((DATEPART(ISO_WEEK, @CurrDate) / 4.)-0.01 as int) + 1 > 13  then 13 else cast ((DATEPART(ISO_WEEK, @CurrDate) / 4.)-0.01 as int) + 1  end 
				,
                    [Curr_ISOYearNo_LY] = --case when datepart(ISO_WEEK,dateadd(day,-364,@CurrDate)) >=52 and MONTH(dateadd(day,-364,@CurrDate)) =1 then  YEAR(dateadd(day,-364,@CurrDate))-1 else YEAR(dateadd(day,-364,@CurrDate)) end 
                     CASE
                         WHEN DATEPART(ISO_WEEK, DATEADD(day, -364, @CurrDate)) = 1
                              AND MONTH(DATEADD(day, -364, @CurrDate)) = 12
                         THEN YEAR(DATEADD(day, -364, @CurrDate)) + 1
                         WHEN DATEPART(ISO_WEEK, DATEADD(day, -364, @CurrDate)) >= 52
                              AND MONTH(DATEADD(day, -364, @CurrDate)) = 1
                         THEN YEAR(DATEADD(day, -364, @CurrDate)) - 1
                         ELSE YEAR(DATEADD(day, -364, @CurrDate))
                     END
					 
				,[Curr_ISO_Last8W]  =  (CASE
                                             WHEN DATEPART(ISO_WEEK, DATEADD(day, -7*8, @CurrDate)) >= 52
                                                  AND MONTH(DATEADD(day, -7*8, @CurrDate)) = 1
                                             THEN YEAR(DATEADD(day, -7*8, @CurrDate)) - 1
                                             ELSE YEAR(DATEADD(day, -7*8, @CurrDate))
                                         END * 100) + DATEPART(ISO_WEEK, DATEADD(day, -7*8, @CurrDate))
				,[Curr_ISO_Last12M]  = YEAR(DATEADD(month, -12, @CurrDate)) * 100 + MONTH(DATEADD(month, -12, @CurrDate)))
			-- [SeqNo]=Sequential day number (@FromDate always=1) forward or backwards
              INSERT INTO @dimdate
                     SELECT 
			-- [Date]=Date (with 00:00:00.000 for the time component)                              
                     [Date] = dt.DT,  
			-- YMD format
                     [YYYYMMDD] = CAST(CONVERT(VARCHAR, dt.DT, 112) AS INT),
			-- [Year]=Four digit year                                  
                     [Year] = dp.YY,
			-- [YrNN]=Two digit year                                    
                     [YrNN] = dp.YY % 100,
			-- [YYYYMM]=Integer YYYYMM (year * 100 + month)                              
                     [YYYYMM] = dp.YY * 100 + dp.MM,
			-- [BuddhaYr]=Year in Buddhist calendar                                                 
                     [Month] = dp.MM, 
			-- [Day]=Day (as an INT)                                   
                     [Day] = dp.DD,
			-- [WkDNo]=Week day number (based on @@DATEFIRST)                                    
                     [WkDNo] = DATEPART(dw, dt.DT),
			-- Next 3 columns dependent on language setting so may not work for non-English  
			-- [WkDName]=Full name of the week day, e.g., Monday, Tuesday, etc.                     
                     [WkDName] = CONVERT(NCHAR(9), dp.DW), 
			-- [WkDName2]=Two characters for the week day, e.g., Mo, Tu, etc.                 
                     [WkDName2] = CONVERT(NCHAR(2), dp.DW),  
			-- [WkDName3]=Three characters for the week day, e.g., Mon, Tue, etc.                
                     [WkDName3] = CONVERT(NCHAR(3), dp.DW),  
			-- [JulDay]=Julian day (day number of the year)                
                     [JulDay] = dp.DY,
			-- [JulWk]=Week number of the year                                    
                     [JulWk] = dp.DY / 7 + 1,
			-- [WkNo]=Week number                                
                     [WkNo] = dp.DD / 7 + 1,
			-- [Qtr]=Quarter number (of the year)                                
                     [Qtr] = DATEPART(qq, dt.Dt),                       
			-- [Last]=Number the weeks for the month in reverse      
                     [Last] = (DATEPART(dd, dp.LDtOfMo) - dp.DD) / 7 + 1,
			-- [LdOfMo]=Last day of the month                  
                     [LdOfMo] = DATEPART(dd, dp.LDtOfMo),
			-- [LDtOfMo]=Last day of the month as a DATETIME
                     [LDtOfMo] = dp.LDtOfMo,

                     [MonthName] = UPPER(LEFT(Datename(Month, dt.DT), 1)) + SUBSTRING(Datename(Month, dt.DT), 2, 15),
                     [MonthName_Short] = UPPER(LEFT(Datename(Month, dt.DT), 1)) + SUBSTRING(Datename(Month, dt.DT), 2, 2),
                     [MonthYearName] = (UPPER(LEFT(Datename(Month, dt.DT), 1)) + SUBSTRING(Datename(Month, dt.DT), 2, 2))+'/'+CAST(dp.YY AS VARCHAR),
				 [DayMonthLabel] = cast(dp.DD as nvarchar(2))+' '+UPPER(LEFT(Datename(Month, dt.DT), 1)) + SUBSTRING(Datename(Month, dt.DT), 2, 2),
                     [IsoWeekNo] = DATEPART(ISO_WEEK, dt.DT),
				case when cast ((DATEPART(ISO_WEEK, dt.DT) / 4.)-0.01 as int) + 1 > 13 then 13 else cast ((DATEPART(ISO_WEEK, dt.DT) / 4.)-0.01 as int) + 1  end IsoPeriod,
                     [IsoYearNo] = CASE
                                       WHEN DATEPART(ISO_WEEK, dt.DT) = 1
                                            AND dp.MM = 12
                                       THEN dp.YY + 1
                                       WHEN DATEPART(ISO_WEEK, dt.DT) >= 52
                                            AND dp.MM = 1
                                       THEN dp.YY - 1
                                       ELSE dp.YY
                                   END,

                     [IsoYYYYWW] = (CASE
                                        WHEN DATEPART(ISO_WEEK, dt.DT) = 1
                                             AND dp.MM = 12
                                        THEN dp.YY + 1
                                        WHEN DATEPART(ISO_WEEK, dt.DT) >= 52
                                             AND dp.MM = 1
                                        THEN dp.YY - 1
                                        ELSE dp.YY
                                    END * 100) + DATEPART(ISO_WEEK, dt.DT),
                     [IsoWeekName] = 'W'+RIGHT('00'+CAST(DATEPART(ISO_WEEK, dt.DT) AS VARCHAR), 2),
                     [QtrName] = 'Q'+CAST(DATEPART(qq, dt.Dt) AS VARCHAR),
			-- relative fields
                     Curr_Date,
                     Yday_Date,
                     Curr_Date_LY,
                     Curr_IsoYYYYWW,
                     Curr_IsoYYYYWW_LY,
                     Prev_IsoYYYYWW,
                     Curr_YYYYMM,
                     Curr_YYYYMM_LY,
                     Prev_YYYYMM,
                     Curr_Year,
                     Curr_Year_LY,
                     Curr_ISOYearNo,
                     Curr_ISOYearNo_LY,
					 Curr_ISOPeriod,
					 Curr_ISO_Last8W,
					 Curr_ISO_Last12M	
				
                     FROM cteTally t
                          CROSS APPLY
                     ( --=== Create the date

                         SELECT DT = CAST(DATEADD(dd, (t.N - 1) * SIGN(@NoDays), @FromDate) AS DATE)
                     ) dt
                          CROSS APPLY
                     ( --=== Create the other parts from the date above using a "cCA"
		-- (Cascading CROSS APPLY (cCA), courtesy of Chris Morris)

                         SELECT YY = DATEPART(yy, dt.DT),
                                MM = DATEPART(mm, dt.DT),
                                DD = DATEPART(dd, dt.DT),
                                DW = DATENAME(dw, dt.DT),
                                Dy = DATEPART(dy, dt.DT),
                                LDtOfMo = DATEADD(mm, DATEDIFF(mm, -1, dt.DT), -1)
                     ) dp
                          CROSS JOIN relative_fields;
         RETURN;
     END;

