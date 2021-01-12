CREATE TABLE [wvg].[Partij Type] (
    [ID Partij Type]                   INT           IDENTITY (1, 1) NOT NULL,
    [Code]                             VARCHAR (50)  NULL,
    [Omschrijving]                     VARCHAR (100) NULL,
    [ID Default Financiële Klasse IN]  INT           NULL,
    [ID Default Financiële Klasse UIT] INT           NULL,
    [Laatste Wijziging]                DATETIME      CONSTRAINT [DF_Partij Type_Laatste Wijziging] DEFAULT (getdate()) NULL,
    [RowVersion]                       ROWVERSION    NULL,
    CONSTRAINT [PK_Partije Type] PRIMARY KEY CLUSTERED ([ID Partij Type] ASC)
);

