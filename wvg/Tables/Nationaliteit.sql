CREATE TABLE [wvg].[Nationaliteit] (
    [ID Nationaliteit]  INT           NOT NULL,
    [ID Land]           INT           NULL,
    [Code]              VARCHAR (20)  NULL,
    [Omschrijving]      VARCHAR (100) NULL,
    [Laatste Wijziging] DATETIME      NULL,
    CONSTRAINT [PK_Nationaliteit] PRIMARY KEY CLUSTERED ([ID Nationaliteit] ASC),
    CONSTRAINT [FK_Nationaliteit_Land] FOREIGN KEY ([ID Land]) REFERENCES [wvg].[Land] ([ID Land])
);

