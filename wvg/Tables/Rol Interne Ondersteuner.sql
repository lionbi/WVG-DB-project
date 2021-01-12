CREATE TABLE [wvg].[Rol Interne Ondersteuner] (
    [ID Rol Interne Ondersteuner] INT NOT NULL,
    [ID Rol Ondersteuning]        INT NOT NULL,
    [ID Interne Ondersteuner]     INT NOT NULL,
    CONSTRAINT [PK_Rol Interne Ondersteuner] PRIMARY KEY CLUSTERED ([ID Rol Interne Ondersteuner] ASC),
    CONSTRAINT [FK_Rol Interne Ondersteuner_Interne Ondersteuner] FOREIGN KEY ([ID Interne Ondersteuner]) REFERENCES [wvg].[Interne Ondersteuner] ([ID Interne Ondersteuner]),
    CONSTRAINT [FK_Rol Interne Ondersteuner_Rol Ondersteuning] FOREIGN KEY ([ID Rol Ondersteuning]) REFERENCES [wvg].[Rol Ondersteuning] ([ID Rol Ondersteuning])
);

