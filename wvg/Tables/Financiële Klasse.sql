CREATE TABLE [wvg].[Financiële Klasse] (
    [ID Financiële Klasse] INT           IDENTITY (1, 1) NOT NULL,
    [Code]                 NVARCHAR (50) NULL,
    [Naam]                 NVARCHAR (50) NULL,
    [Groep]                NVARCHAR (50) NULL,
    [SubGroep]             NVARCHAR (50) NULL,
    [Laatste Wijziging]    DATETIME      CONSTRAINT [DF_Financiële Klasse_Laatste Wijziging] DEFAULT (getdate()) NULL,
    [RowVersion]           ROWVERSION    NULL,
    CONSTRAINT [PK_Financiële Klasse] PRIMARY KEY CLUSTERED ([ID Financiële Klasse] ASC)
);

