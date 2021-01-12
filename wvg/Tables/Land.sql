CREATE TABLE [wvg].[Land] (
    [ID Land]           INT           NOT NULL,
    [Code]              VARCHAR (10)  NULL,
    [Omschrijving]      VARCHAR (100) NULL,
    [Laatste Wijziging] DATETIME      NULL,
    CONSTRAINT [PK_Land] PRIMARY KEY CLUSTERED ([ID Land] ASC)
);

