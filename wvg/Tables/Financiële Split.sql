CREATE TABLE [wvg].[Financiële Split] (
    [ID Financiële Split]   INT             NOT NULL,
    [ID Financieel Dagboek] INT             NOT NULL,
    [ID Actie]              INT             NOT NULL,
    [Details]               VARCHAR (MAX)   NULL,
    [Bedrag]                MONEY           NULL,
    [ID Steundossier]       INT             NULL,
    [URL Document Info]     NVARCHAR (1000) NULL,
    [Laatste Wijziging]     DATETIME        NULL,
    CONSTRAINT [PK_Financiële Split] PRIMARY KEY CLUSTERED ([ID Financiële Split] ASC)
);

