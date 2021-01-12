CREATE TABLE [wvg].[Statuut Historiek] (
    [ID Statuut Historiek] INT            NOT NULL,
    [ID Steun Ontvanger]   INT            NOT NULL,
    [ID Statuut Type]      INT            NOT NULL,
    [Bron]                 VARCHAR (MAX)  NULL,
    [Datum Vanaf]          DATE           NULL,
    [Referentie Dossier]   VARCHAR (100)  NULL,
    [Details]              VARCHAR (MAX)  NULL,
    [URL Info]             VARCHAR (1000) NULL,
    [Laatste Wijziging]    DATETIME       NULL,
    CONSTRAINT [PK_Statuut Historiek] PRIMARY KEY CLUSTERED ([ID Statuut Historiek] ASC),
    CONSTRAINT [FK_Statuut Historiek_Statuut Type] FOREIGN KEY ([ID Statuut Type]) REFERENCES [wvg].[Statuut Type] ([ID Statuut Type]),
    CONSTRAINT [FK_Statuut Historiek_Steun Ontvanger] FOREIGN KEY ([ID Steun Ontvanger]) REFERENCES [wvg].[Steun Ontvanger] ([ID Steun Ontvanger])
);

