CREATE TABLE [wvg].[Nationaliteit Steun Ontvanger] (
    [ID Nationaliteit Steun Ontvanger] INT           NOT NULL,
    [ID Steun Ontvanger]               INT           NULL,
    [ID Nationaliteit]                 INT           NULL,
    [Identificatie Nr]                 VARCHAR (50)  NULL,
    [Details]                          VARCHAR (MAX) NULL,
    [Type Identificatie]               VARCHAR (50)  NULL,
    [Laatste Wijziging]                DATETIME      NULL,
    CONSTRAINT [PK_Nationaliteit Steun Ontvanger] PRIMARY KEY CLUSTERED ([ID Nationaliteit Steun Ontvanger] ASC),
    CONSTRAINT [FK_Nationaliteit Steun Ontvanger_Nationaliteit1] FOREIGN KEY ([ID Nationaliteit]) REFERENCES [wvg].[Nationaliteit] ([ID Nationaliteit]),
    CONSTRAINT [FK_Nationaliteit Steun Ontvanger_Steun Ontvanger] FOREIGN KEY ([ID Steun Ontvanger]) REFERENCES [wvg].[Steun Ontvanger] ([ID Steun Ontvanger])
);

