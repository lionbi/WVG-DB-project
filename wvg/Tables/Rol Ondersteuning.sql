CREATE TABLE [wvg].[Rol Ondersteuning] (
    [ID Rol Ondersteuning] INT            NOT NULL,
    [Code]                 NVARCHAR (20)  NULL,
    [Omschrijving]         NVARCHAR (100) NULL,
    [Laatste Wijziging]    DATETIME       NULL,
    CONSTRAINT [PK_Rol Ondersteuning] PRIMARY KEY CLUSTERED ([ID Rol Ondersteuning] ASC)
);

