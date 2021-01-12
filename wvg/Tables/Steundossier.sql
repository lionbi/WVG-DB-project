CREATE TABLE [wvg].[Steundossier] (
    [ID Steundossier]         INT           NOT NULL,
    [Omschrijving]            VARCHAR (100) NULL,
    [Datum]                   DATE          NULL,
    [Details]                 VARCHAR (MAX) NULL,
    [Bedrag Budget]           MONEY         NULL,
    [ID Externe Ondersteuner] INT           NULL,
    [Laatste Wijziging]       DATETIME      NULL,
    CONSTRAINT [PK_Steundossier_1] PRIMARY KEY CLUSTERED ([ID Steundossier] ASC)
);

