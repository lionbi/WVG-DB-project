CREATE TABLE [wvg].[Interne Ondersteuner] (
    [ID Interne Ondersteuner] INT            NOT NULL,
    [Nummer]                  NVARCHAR (20)  NOT NULL,
    [Achternaam]              NVARCHAR (100) NOT NULL,
    [Voornaam]                NVARCHAR (100) NULL,
    [Straat]                  NVARCHAR (100) NULL,
    [Postcode]                NVARCHAR (20)  NULL,
    [Woonplaats]              NVARCHAR (100) NULL,
    [Telefoon]                NVARCHAR (50)  NULL,
    [Email]                   NVARCHAR (100) NULL,
    [Functie]                 NVARCHAR (50)  NULL,
    [Geslacht]                CHAR (1)       NULL,
    [Laatste Wijziging]       DATETIME       NULL,
    CONSTRAINT [PK_Interne Ondersteuner] PRIMARY KEY CLUSTERED ([ID Interne Ondersteuner] ASC)
);

