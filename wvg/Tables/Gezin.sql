CREATE TABLE [wvg].[Gezin] (
    [ID Gezin]          INT            IDENTITY (1, 1) NOT NULL,
    [Code]              NVARCHAR (10)  NULL,
    [Naam]              VARCHAR (100)  NULL,
    [Details]           VARCHAR (MAX)  CONSTRAINT [DF_Gezin_Details] DEFAULT (space((1))) NULL,
    [Adres]             VARCHAR (250)  CONSTRAINT [DF_Gezin_Adres] DEFAULT (space((1))) NULL,
    [Straat]            NVARCHAR (100) CONSTRAINT [DF_Gezin_Straat] DEFAULT (space((1))) NULL,
    [Postcode]          NVARCHAR (20)  CONSTRAINT [DF_Gezin_Postcode] DEFAULT (space((1))) NULL,
    [Woonplaats]        NVARCHAR (100) CONSTRAINT [DF_Gezin_Woonplaats] DEFAULT (space((1))) NULL,
    [Telefoon]          NVARCHAR (50)  CONSTRAINT [DF_Gezin_Telefoon] DEFAULT (space((1))) NULL,
    [Email]             NVARCHAR (100) CONSTRAINT [DF_Gezin_Email] DEFAULT (space((1))) NULL,
    [Flag IEM]          TINYINT        CONSTRAINT [DF_Gezin_Flag IEM] DEFAULT ((0)) NULL,
    [Flag BRR]          TINYINT        CONSTRAINT [DF_Gezin_Flag BRR] DEFAULT ((0)) NULL,
    [Laatste Wijziging] DATETIME       CONSTRAINT [DF_Gezin_Laatste Wijziging] DEFAULT (getdate()) NULL,
    [Rowversion]        ROWVERSION     NULL,
    CONSTRAINT [PK_Gezin] PRIMARY KEY CLUSTERED ([ID Gezin] ASC)
);

