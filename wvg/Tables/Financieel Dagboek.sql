CREATE TABLE [wvg].[Financieel Dagboek] (
    [ID Financieel Dagboek]  INT           IDENTITY (1, 1) NOT NULL,
    [ID Bankrekening]        INT           NULL,
    [ID Bankfile]            INT           NULL,
    [Uittreksel Nr]          VARCHAR (10)  NULL,
    [Transactie Datum]       DATE          NOT NULL,
    [Bankrekening Nr]        VARCHAR (20)  NOT NULL,
    [Bedrag]                 MONEY         NOT NULL,
    [Bankrekening Nr Extern] VARCHAR (20)  NOT NULL,
    [BIC Extern]             VARCHAR (10)  NULL,
    [Adres Extern]           VARCHAR (200) NULL,
    [Code Begunstigde]       VARCHAR (50)  NULL,
    [Mededeling]             VARCHAR (500) NULL,
    [Financiële Klasse ID]   INT           NULL,
    [Laatste Wijziging]      DATETIME      CONSTRAINT [DF_Financieel Dagboek_Laatste Wijziging] DEFAULT (getdate()) NOT NULL,
    [RowVersion]             ROWVERSION    NULL,
    CONSTRAINT [PK_Financieel Dagboek] PRIMARY KEY CLUSTERED ([ID Financieel Dagboek] ASC),
    CONSTRAINT [FK_Financieel Dagboek_Bankrekening1] FOREIGN KEY ([ID Bankrekening]) REFERENCES [wvg].[Bankrekening] ([ID Bankrekening])
);

