CREATE TABLE [wvg].[Bankrekening] (
    [ID Bankrekening]   INT          IDENTITY (1, 1) NOT NULL,
    [Bankrekening Nr]   VARCHAR (20) NULL,
    [Naam Bankrekening] VARCHAR (50) NULL,
    [Bank]              VARCHAR (20) NULL,
    [Sortering]         SMALLINT     NULL,
    [Laatste Wijziging] DATETIME     CONSTRAINT [DF_Bankrekening_Laatste Wijziging] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Bankrekening] PRIMARY KEY CLUSTERED ([ID Bankrekening] ASC)
);

