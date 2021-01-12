CREATE TABLE [wvg].[Partij] (
    [ID Partij]                  INT           IDENTITY (1, 1) NOT NULL,
    [Nummer]                     VARCHAR (50)  NULL,
    [Bankrekening]               VARCHAR (20)  NULL,
    [ID Steun Ontvanger]         INT           NULL,
    [ID Partij Type]             INT           NOT NULL,
    [Organisatie BTWnr]          VARCHAR (20)  NULL,
    [Organisatie contactpersoon] VARCHAR (20)  NULL,
    [Aanspreking]                NVARCHAR (20) NULL,
    [Naam]                       VARCHAR (100) NULL,
    [Email]                      VARCHAR (100) NULL,
    [Telefoon]                   VARCHAR (50)  NULL,
    [Geslacht]                   VARCHAR (50)  NULL,
    [Adres]                      VARCHAR (255) NULL,
    [Straat]                     VARCHAR (100) NULL,
    [Bus]                        VARCHAR (100) NULL,
    [Postcode]                   VARCHAR (50)  NULL,
    [Woonplaats]                 VARCHAR (100) NULL,
    [Land]                       VARCHAR (100) NULL,
    [Laatste Wijziging]          DATETIME      CONSTRAINT [DF_Externe Ondersteuner_Laatste Wijziging] DEFAULT (getdate()) NULL,
    [RowVersion]                 ROWVERSION    NULL,
    CONSTRAINT [PK_Externe Ondersteuner] PRIMARY KEY CLUSTERED ([ID Partij] ASC)
);

