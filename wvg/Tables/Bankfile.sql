CREATE TABLE [wvg].[Bankfile] (
    [ID Bankfile]       INT           IDENTITY (1, 1) NOT NULL,
    [Filename]          VARCHAR (100) NULL,
    [Status]            CHAR (1)      NULL,
    [Laatste Wijziging] DATETIME      CONSTRAINT [DF_Log_Bankfiles] DEFAULT (getdate()) NULL,
    [RowVersion]        ROWVERSION    NULL,
    CONSTRAINT [PK_Log_Bankfiles] PRIMARY KEY CLUSTERED ([ID Bankfile] ASC)
);

