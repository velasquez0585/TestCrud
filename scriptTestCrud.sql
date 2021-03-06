USE [TestCrud]
GO
/****** Object:  StoredProcedure [dbo].[PeliculasConStockVenta]    Script Date: 17/12/2021 22:03:47 ******/
DROP PROCEDURE [dbo].[PeliculasConStockVenta]
GO
/****** Object:  StoredProcedure [dbo].[PeliculasConStockAlquiler]    Script Date: 17/12/2021 22:03:47 ******/
DROP PROCEDURE [dbo].[PeliculasConStockAlquiler]
GO
/****** Object:  StoredProcedure [dbo].[EditarPelicula]    Script Date: 17/12/2021 22:03:47 ******/
DROP PROCEDURE [dbo].[EditarPelicula]
GO
/****** Object:  StoredProcedure [dbo].[BorrarPelicula]    Script Date: 17/12/2021 22:03:47 ******/
DROP PROCEDURE [dbo].[BorrarPelicula]
GO
/****** Object:  StoredProcedure [dbo].[AsignarGenero]    Script Date: 17/12/2021 22:03:47 ******/
DROP PROCEDURE [dbo].[AsignarGenero]
GO
/****** Object:  StoredProcedure [dbo].[AgregarUsuario]    Script Date: 17/12/2021 22:03:47 ******/
DROP PROCEDURE [dbo].[AgregarUsuario]
GO
/****** Object:  StoredProcedure [dbo].[AgregarPelicula]    Script Date: 17/12/2021 22:03:47 ******/
DROP PROCEDURE [dbo].[AgregarPelicula]
GO
/****** Object:  StoredProcedure [dbo].[AgregarGenero]    Script Date: 17/12/2021 22:03:47 ******/
DROP PROCEDURE [dbo].[AgregarGenero]
GO
ALTER TABLE [dbo].[tUsers] DROP CONSTRAINT [fk_user_rol]
GO
ALTER TABLE [dbo].[tGeneroPelicula] DROP CONSTRAINT [fk_pelicula_genero]
GO
ALTER TABLE [dbo].[tGeneroPelicula] DROP CONSTRAINT [fk_genero_pelicula]
GO
/****** Object:  Table [dbo].[tUsers]    Script Date: 17/12/2021 22:03:47 ******/
DROP TABLE [dbo].[tUsers]
GO
/****** Object:  Table [dbo].[tRol]    Script Date: 17/12/2021 22:03:47 ******/
DROP TABLE [dbo].[tRol]
GO
/****** Object:  Table [dbo].[tPelicula]    Script Date: 17/12/2021 22:03:47 ******/
DROP TABLE [dbo].[tPelicula]
GO
/****** Object:  Table [dbo].[tGeneroPelicula]    Script Date: 17/12/2021 22:03:47 ******/
DROP TABLE [dbo].[tGeneroPelicula]
GO
/****** Object:  Table [dbo].[tGenero]    Script Date: 17/12/2021 22:03:47 ******/
DROP TABLE [dbo].[tGenero]
GO
/****** Object:  Table [dbo].[tGenero]    Script Date: 17/12/2021 22:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tGenero](
	[cod_genero] [int] IDENTITY(1,1) NOT NULL,
	[txt_desc] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tGeneroPelicula]    Script Date: 17/12/2021 22:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tGeneroPelicula](
	[cod_pelicula] [int] NOT NULL,
	[cod_genero] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_pelicula] ASC,
	[cod_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tPelicula]    Script Date: 17/12/2021 22:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tPelicula](
	[cod_pelicula] [int] IDENTITY(1,1) NOT NULL,
	[txt_desc] [varchar](500) NULL,
	[cant_disponibles_alquiler] [int] NULL,
	[cant_disponibles_venta] [int] NULL,
	[precio_alquiler] [numeric](18, 2) NULL,
	[precio_venta] [numeric](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tRol]    Script Date: 17/12/2021 22:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tRol](
	[cod_rol] [int] IDENTITY(1,1) NOT NULL,
	[txt_desc] [varchar](500) NULL,
	[sn_activo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tUsers]    Script Date: 17/12/2021 22:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tUsers](
	[cod_usuario] [int] IDENTITY(1,1) NOT NULL,
	[txt_user] [varchar](50) NULL,
	[txt_password] [varchar](50) NULL,
	[txt_nombre] [varchar](200) NULL,
	[txt_apellido] [varchar](200) NULL,
	[nro_doc] [varchar](50) NULL,
	[cod_rol] [int] NULL,
	[sn_activo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tGenero] ON 

INSERT [dbo].[tGenero] ([cod_genero], [txt_desc]) VALUES (1, N'Acción')
INSERT [dbo].[tGenero] ([cod_genero], [txt_desc]) VALUES (2, N'Comedia')
INSERT [dbo].[tGenero] ([cod_genero], [txt_desc]) VALUES (3, N'Drama')
INSERT [dbo].[tGenero] ([cod_genero], [txt_desc]) VALUES (4, N'Terror')
SET IDENTITY_INSERT [dbo].[tGenero] OFF
INSERT [dbo].[tGeneroPelicula] ([cod_pelicula], [cod_genero]) VALUES (1, 1)
INSERT [dbo].[tGeneroPelicula] ([cod_pelicula], [cod_genero]) VALUES (2, 2)
INSERT [dbo].[tGeneroPelicula] ([cod_pelicula], [cod_genero]) VALUES (3, 2)
INSERT [dbo].[tGeneroPelicula] ([cod_pelicula], [cod_genero]) VALUES (3, 3)
INSERT [dbo].[tGeneroPelicula] ([cod_pelicula], [cod_genero]) VALUES (4, 4)
SET IDENTITY_INSERT [dbo].[tPelicula] ON 

INSERT [dbo].[tPelicula] ([cod_pelicula], [txt_desc], [cant_disponibles_alquiler], [cant_disponibles_venta], [precio_alquiler], [precio_venta]) VALUES (1, N'Duro de matar III', 3, 0, CAST(1.50 AS Numeric(18, 2)), CAST(5.00 AS Numeric(18, 2)))
INSERT [dbo].[tPelicula] ([cod_pelicula], [txt_desc], [cant_disponibles_alquiler], [cant_disponibles_venta], [precio_alquiler], [precio_venta]) VALUES (2, N'Todo Poderoso', 2, 1, CAST(1.50 AS Numeric(18, 2)), CAST(7.00 AS Numeric(18, 2)))
INSERT [dbo].[tPelicula] ([cod_pelicula], [txt_desc], [cant_disponibles_alquiler], [cant_disponibles_venta], [precio_alquiler], [precio_venta]) VALUES (3, N'Stranger than fiction', 1, 1, CAST(1.50 AS Numeric(18, 2)), CAST(8.00 AS Numeric(18, 2)))
INSERT [dbo].[tPelicula] ([cod_pelicula], [txt_desc], [cant_disponibles_alquiler], [cant_disponibles_venta], [precio_alquiler], [precio_venta]) VALUES (4, N'OUIJA', 0, 2, CAST(2.00 AS Numeric(18, 2)), CAST(20.50 AS Numeric(18, 2)))
SET IDENTITY_INSERT [dbo].[tPelicula] OFF
SET IDENTITY_INSERT [dbo].[tRol] ON 

INSERT [dbo].[tRol] ([cod_rol], [txt_desc], [sn_activo]) VALUES (1, N'Administrador', -1)
INSERT [dbo].[tRol] ([cod_rol], [txt_desc], [sn_activo]) VALUES (2, N'Cliente', -1)
SET IDENTITY_INSERT [dbo].[tRol] OFF
SET IDENTITY_INSERT [dbo].[tUsers] ON 

INSERT [dbo].[tUsers] ([cod_usuario], [txt_user], [txt_password], [txt_nombre], [txt_apellido], [nro_doc], [cod_rol], [sn_activo]) VALUES (2, N'userTest', N'Test1', N'Ariel3333', N'ApellidoConA', N'12312321', 1, -1)
INSERT [dbo].[tUsers] ([cod_usuario], [txt_user], [txt_password], [txt_nombre], [txt_apellido], [nro_doc], [cod_rol], [sn_activo]) VALUES (3, N'userTest2', N'Test2', N'Bernardo', N'ApellidoConB', N'12312322', 1, -1)
INSERT [dbo].[tUsers] ([cod_usuario], [txt_user], [txt_password], [txt_nombre], [txt_apellido], [nro_doc], [cod_rol], [sn_activo]) VALUES (4, N'userTest3', N'Test3', N'Carlos', N'ApellidoConC', N'12312323', 1, -1)
INSERT [dbo].[tUsers] ([cod_usuario], [txt_user], [txt_password], [txt_nombre], [txt_apellido], [nro_doc], [cod_rol], [sn_activo]) VALUES (5, N'CarlosV', N'CarlosV', N'Carlos', N'Velasquez', N'9578', 1, -1)
INSERT [dbo].[tUsers] ([cod_usuario], [txt_user], [txt_password], [txt_nombre], [txt_apellido], [nro_doc], [cod_rol], [sn_activo]) VALUES (6, N'userSQL', N'Test1', N'CV', N'VELAS', N'00101', 1, -1)
SET IDENTITY_INSERT [dbo].[tUsers] OFF
ALTER TABLE [dbo].[tGeneroPelicula]  WITH CHECK ADD  CONSTRAINT [fk_genero_pelicula] FOREIGN KEY([cod_pelicula])
REFERENCES [dbo].[tPelicula] ([cod_pelicula])
GO
ALTER TABLE [dbo].[tGeneroPelicula] CHECK CONSTRAINT [fk_genero_pelicula]
GO
ALTER TABLE [dbo].[tGeneroPelicula]  WITH CHECK ADD  CONSTRAINT [fk_pelicula_genero] FOREIGN KEY([cod_genero])
REFERENCES [dbo].[tGenero] ([cod_genero])
GO
ALTER TABLE [dbo].[tGeneroPelicula] CHECK CONSTRAINT [fk_pelicula_genero]
GO
ALTER TABLE [dbo].[tUsers]  WITH CHECK ADD  CONSTRAINT [fk_user_rol] FOREIGN KEY([cod_rol])
REFERENCES [dbo].[tRol] ([cod_rol])
GO
ALTER TABLE [dbo].[tUsers] CHECK CONSTRAINT [fk_user_rol]
GO
/****** Object:  StoredProcedure [dbo].[AgregarGenero]    Script Date: 17/12/2021 22:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AgregarGenero] (
@txt_desc	varchar(500)
)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


		insert into tGenero
		select @txt_desc
		select 'OK, Registros Guardado'

END

GO
/****** Object:  StoredProcedure [dbo].[AgregarPelicula]    Script Date: 17/12/2021 22:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AgregarPelicula] (
@txt_desc	varchar(500),
@cant_disponibles_alquiler	int,
@cant_disponibles_venta	int,
@precio_alquiler	numeric(18, 2),
@precio_venta	numeric(18, 2)
)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


		insert into tPelicula
		select @txt_desc, @cant_disponibles_alquiler, @cant_disponibles_venta, @precio_alquiler, @precio_venta
		select 'OK, Registros Guardado'

END

GO
/****** Object:  StoredProcedure [dbo].[AgregarUsuario]    Script Date: 17/12/2021 22:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AgregarUsuario] (
	@txt_user	varchar(50),
	@txt_password	varchar(50),
	@txt_nombre	varchar(200),
	@txt_apellido	varchar(200),
	@nro_doc	varchar(50),
	@cod_rol	int,
	@sn_activo	int
)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if not exists(select nro_doc from tUsers where nro_doc = @nro_doc )
	begin
		insert into tUsers
		select @txt_user, @txt_password, @txt_nombre, @txt_apellido, @nro_doc, @cod_rol, @sn_activo
		select 'OK, Registros Guardado'
	end
	else
	select 'ERROR, Documento duplicado'
	
END

GO
/****** Object:  StoredProcedure [dbo].[AsignarGenero]    Script Date: 17/12/2021 22:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AsignarGenero] (
@cod_pelicula int,
@cod_genero	int
)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if not exists(select cod_pelicula from tGeneroPelicula where cod_pelicula = @cod_pelicula and cod_genero = @cod_genero)
	begin
		insert into tGeneroPelicula
		select @cod_pelicula, @cod_genero
		select 'OK, Registros Guardado'
	end
	else
	select 'ERROR, genero ya existe asignado a la película'

END

GO
/****** Object:  StoredProcedure [dbo].[BorrarPelicula]    Script Date: 17/12/2021 22:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[BorrarPelicula] (
@cod_pelicula int,
@cant_disponibles_alquiler	int,
@cant_disponibles_venta	int

)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


		update tPelicula set 
		cant_disponibles_alquiler= @cant_disponibles_alquiler, 
		cant_disponibles_venta = @cant_disponibles_venta
		where cod_pelicula = @cod_pelicula
		select 'OK, Registros Guardado'

END
GO
/****** Object:  StoredProcedure [dbo].[EditarPelicula]    Script Date: 17/12/2021 22:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditarPelicula] (
@cod_pelicula int,
@txt_desc	varchar(500),
@cant_disponibles_alquiler	int,
@cant_disponibles_venta	int,
@precio_alquiler	numeric(18, 2),
@precio_venta	numeric(18, 2)
)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


		update tPelicula set 
		txt_desc = @txt_desc, 
		cant_disponibles_alquiler= @cant_disponibles_alquiler, 
		cant_disponibles_venta = @cant_disponibles_venta,
	    precio_alquiler = @precio_alquiler,
		precio_venta = @precio_venta
		where cod_pelicula = @cod_pelicula
		select 'OK, Registros Guardado'

END
GO
/****** Object:  StoredProcedure [dbo].[PeliculasConStockAlquiler]    Script Date: 17/12/2021 22:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PeliculasConStockAlquiler] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	select p.cod_pelicula Codigo_Pelicula, p.txt_desc Pelicula, p.cant_disponibles_alquiler Disponible_Para_Alquilar, p.precio_alquiler Precio_Alquiler, g.cod_genero Codigo_Genero, g.txt_desc Genero
	from tPelicula p
	inner join tGeneroPelicula gp on  p.cod_pelicula = gp.cod_pelicula
	inner join tGenero g on gp.cod_genero = g.cod_genero
	where p.cant_disponibles_alquiler > 0

END

GO
/****** Object:  StoredProcedure [dbo].[PeliculasConStockVenta]    Script Date: 17/12/2021 22:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PeliculasConStockVenta] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	select p.cod_pelicula Codigo_Pelicula, p.txt_desc Pelicula, p.cant_disponibles_venta Disponible_Para_Ventar, p.precio_alquiler Precio_Venta, g.cod_genero Codigo_Genero, g.txt_desc Genero
	from tPelicula p
	inner join tGeneroPelicula gp on  p.cod_pelicula = gp.cod_pelicula
	inner join tGenero g on gp.cod_genero = g.cod_genero
	where p.cant_disponibles_venta > 0

END

GO
