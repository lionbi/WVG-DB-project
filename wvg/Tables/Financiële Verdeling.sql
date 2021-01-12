CREATE TABLE [wvg].[Financiële Verdeling] (
    [ID Financiële Steun]   INT             NOT NULL,
    [ID Financieel Dagboek] INT             NOT NULL,
    [ID Steun]              INT             NOT NULL,
    [Details]               VARCHAR (MAX)   NULL,
    [Bedrag]                MONEY           NULL,
    [ID Steundossier]       INT             NULL,
    [URL Document Info]     NVARCHAR (1000) NULL,
    [Laatste Wijziging]     DATETIME        NULL,
    CONSTRAINT [PK_Financiële Steun] PRIMARY KEY CLUSTERED ([ID Financiële Steun] ASC),
    CONSTRAINT [FK_Financiële Steun_Financieel Dagboek] FOREIGN KEY ([ID Financieel Dagboek]) REFERENCES [wvg].[Financieel Dagboek] ([ID Financieel Dagboek]),
    CONSTRAINT [FK_Financiële Steun_Steundossier] FOREIGN KEY ([ID Steundossier]) REFERENCES [wvg].[Steundossier] ([ID Steundossier])
);


GO
ALTER TABLE [wvg].[Financiële Verdeling] NOCHECK CONSTRAINT [FK_Financiële Steun_Financieel Dagboek];

