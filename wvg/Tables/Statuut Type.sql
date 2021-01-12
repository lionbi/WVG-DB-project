CREATE TABLE [wvg].[Statuut Type] (
    [ID Statuut Type]   INT           NOT NULL,
    [Code]              VARCHAR (50)  NULL,
    [Omschrijving]      VARCHAR (100) NULL,
    [Laatste Wijziging] DATETIME      NULL,
    CONSTRAINT [PK_Statuut Type] PRIMARY KEY CLUSTERED ([ID Statuut Type] ASC)
);

