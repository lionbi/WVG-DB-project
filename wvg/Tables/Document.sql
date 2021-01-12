CREATE TABLE [wvg].[Document] (
    [ID Document]        INT            NOT NULL,
    [ID Steun Ontvanger] INT            NOT NULL,
    [Titel]              VARCHAR (100)  NULL,
    [Details]            VARCHAR (MAX)  NULL,
    [URL Info]           VARCHAR (1000) NULL,
    [Datum]              DATE           NULL,
    [Laatste Wijziging]  DATETIME       NULL,
    [RowVersion] TIMESTAMP NULL, 
    CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED ([ID Document] ASC),
    CONSTRAINT [FK_Document_Steun Ontvanger] FOREIGN KEY ([ID Steun Ontvanger]) REFERENCES [wvg].[Steun Ontvanger] ([ID Steun Ontvanger])
);

