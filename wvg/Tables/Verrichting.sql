CREATE TABLE [wvg].[Verrichting] (
    [ID Actie]                INT           IDENTITY (1, 1) NOT NULL,
    [ID Financieel Dagboek]   INT           NULL,
    [ID Financiële Klasse]    INT           NULL,
    [ID Steun Ontvanger]      INT           NULL,
    [Datum]                   DATE          NULL,
    [Bedrag]                  MONEY         NULL,
    [Details]                 VARCHAR (MAX) NULL,
    [Document URL]            VARCHAR (255) NULL,
    [Status]                  VARCHAR (20)  NULL,
    [ID Partij]               INT           NULL,
    [ID Interne Ondersteuner] INT           NULL,
    [Laatste Wijziging]       DATETIME      NULL,
    [RowVersion]              ROWVERSION    NULL,
    CONSTRAINT [PK_Steun] PRIMARY KEY CLUSTERED ([ID Actie] ASC),
    CONSTRAINT [FK_Steun_Interne Ondersteuner] FOREIGN KEY ([ID Interne Ondersteuner]) REFERENCES [wvg].[Interne Ondersteuner] ([ID Interne Ondersteuner]),
    CONSTRAINT [FK_Steun_Steun Ontvanger] FOREIGN KEY ([ID Steun Ontvanger]) REFERENCES [wvg].[Steun Ontvanger] ([ID Steun Ontvanger]),
    CONSTRAINT [FK_Verrichting_Financieel Dagboek] FOREIGN KEY ([ID Financieel Dagboek]) REFERENCES [wvg].[Financieel Dagboek] ([ID Financieel Dagboek]),
    CONSTRAINT [FK_Verrichting_Financiële Klasse] FOREIGN KEY ([ID Financiële Klasse]) REFERENCES [wvg].[Financiële Klasse] ([ID Financiële Klasse]),
    CONSTRAINT [FK_Verrichting_Partij] FOREIGN KEY ([ID Partij]) REFERENCES [wvg].[Partij] ([ID Partij])
);

