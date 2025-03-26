USE [Necli]
GO

/****** Object:  Table [dbo].[Usuarios]    Script Date: 26/03/2025 12:43:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [varchar](50) NOT NULL,
	[Contrasena] [varchar](64) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Numero] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



USE [Necli]
GO

/****** Object:  Table [dbo].[Cuentas]    Script Date: 26/03/2025 12:42:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cuentas](
	[NumeroCuenta] [varchar](30) NOT NULL,
	[Saldo] [decimal](18, 2) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[IdUsuario] [varchar](50) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[NumeroCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Cuentas] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO

ALTER TABLE [dbo].[Cuentas]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO


USE [Necli]
GO

/****** Object:  Table [dbo].[Transacciones]    Script Date: 26/03/2025 12:42:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Transacciones](
	[IdTransaccion] [varchar](10) NOT NULL,
	[FechaTransaccion] [datetime2](7) NOT NULL,
	[CuentaOrigen] [varchar](30) NULL,
	[CuentaDestino] [varchar](30) NULL,
	[Monto] [decimal](18, 2) NULL,
	[Tipo] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Transacciones] ADD  DEFAULT (getdate()) FOR [FechaTransaccion]
GO

ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_CuentaDestino] FOREIGN KEY([CuentaDestino])
REFERENCES [dbo].[Cuentas] ([NumeroCuenta])
GO

ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_CuentaDestino]
GO

ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_CuentaOrigen] FOREIGN KEY([CuentaOrigen])
REFERENCES [dbo].[Cuentas] ([NumeroCuenta])
GO

ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_CuentaOrigen]
GO







