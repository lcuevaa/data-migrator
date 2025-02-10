CREATE VIEW VIEW_PUNTOEMISION
AS
	SELECT  s.SucursalId, 
			s.CodigoPuntoEmisionSUNAT, 
			s.EmpresaId, 
			s.NombreComercial, 
			s.Direccion, 
			s.Departamento, 
			s.Provincia, 
			s.Distrito
	FROM SUCURSALES as s



CREATE VIEW VIEW_EMPRESAS
AS
	SELECT	e.EmpresaId, 
			e.TDIdentificacionId, 
			e.NroRuc, 
			e.RazonSocial, 
			e.Direccion
	FROM Empresas as e

CREATE VIEW VIEW_PRODUCTOS 
AS
	SELECT 
		ArticuloId, 
		CodigoInternoAux, 
		CodigoSUNAT, 
		EmpresaId, 
		Descripcion, 
		UnidadId, 
		Peso, 
		TipoAfectacionIgv
	FROM           
		dbo.ARTICULOS

CREATE VIEW VIEW_UNIDADMEDIDA 
AS
	SELECT 
		UnidadId,
		Nombre,
		CodigoInternacional
	FROM           
		dbo.UNIDADES_MEDIDA


CREATE VIEW VIEW_AFECTACION_IGV
AS
	SELECT 
		CodigoIgv,
		Descripcion
	FROM           
		dbo.TIPOS_AFECTACION_IGV


-- preguntar si es validalineacredito o generarcredito 
CREATE VIEW VIEW_FORMAS_PAGO
AS
	SELECT 
		Codigo,
		Nombre,
		ValidaLineaCredito 
	FROM           
		dbo.FORMAS_PAGO


CREATE VIEW VIEW_TIPOS_DOCUMENTO
AS
	SELECT 
		Codigo,
		Descripcion,
		Nombre
	FROM           
		dbo.TIPOS_DOCUMENTO



CREATE VIEW VIEW_CONTRIBUYENTE
AS
	SELECT 
		ClienteId,
		TipoIdentificacion,
		NroDocumento,
		NombreCliente,
		DireccionCliente,
		Departamento,
		Provincia,
		Distrito,
		Urbanizacion,
		Email_1
	FROM           
		dbo.CLIENTES
