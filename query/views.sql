ALTER VIEW VIEW_PUNTOEMISION
AS
	SELECT  
			RIGHT('0000' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR(4)), 4) AS SucursalId,  -- Genera el id secuencial como CHAR(2)
			s.CodigoPuntoEmisionSUNAT, 
			CASE
				WHEN s.EmpresaId = 'CCD67845-E084-42C5-9294-A3CB750E3D26' THEN '01' 
				WHEN s.EmpresaId = '3314E7F9-18F1-403C-9669-B7485D3D4C05' THEN '02' 
				WHEN s.EmpresaId = 'B46F002A-0F6B-496C-9D09-F47F8E70B249' THEN '03'
			END AS EmpresaId,
			s.NombreComercial, 
			s.Direccion, 
			s.Departamento, 
			s.Provincia, 
			s.Distrito
	FROM SUCURSALES as s


-- Vista empresas
CREATE VIEW VIEW_EMPRESAS AS
    SELECT 
        RIGHT('00' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR(2)), 2) AS empresa_id,  -- Genera el id secuencial como CHAR(2)
        '6' AS TDIdentificacionId,  -- Hardcodeamos el valor 6 como VARCHAR(2)
        e.NroRuc,
        e.RazonSocial,
        e.Direccion
    FROM Empresas AS e;


CREATE VIEW VIEW_PRODUCTOS AS
SELECT 
    A.ArticuloId, 
    A.CodigoInternoAux, 
    A.CodigoSUNAT, 
    E.CodigoMigracion as EmpresaId, 
    A.Descripcion, 
    U.Acronimo as UnidadId, 
    A.Peso, 
    A.TipoAfectacionIgv
FROM dbo.ARTICULOS A
	INNER JOIN dbo.EMPRESAS E ON A.EmpresaId = E.EmpresaId
	INNER JOIN dbo.UNIDADES_MEDIDA U ON A.UnidadCompra = U.UnidadId 
	AND A.UnidadId = U.UnidadId;


CREATE VIEW VIEW_UNIDADMEDIDA 
AS
SELECT 
    Acronimo, 
    Nombre, 
    ISNULL(CodigoInternacional, 'NIU') AS CodigoInternacional
FROM dbo.UNIDADES_MEDIDA;


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



ALTER VIEW VIEW_CONTRIBUYENTE
AS
	SELECT 
		Codigo,
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
		
-- Vistas de tipos de identificacion
CREATE VIEW VIEW_TIPOS_IDENTIFICACION
AS
	SELECT t.TipoIdentificacion_Id, t.Nombre
	FROM TIPOS_IDENTIFICACION AS t

--Vistas de tipos de operacion
ALTER VIEW VIEW_TIPOS_OPERACION
AS
	SELECT 
		RIGHT('0000' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR(4)), 4) AS TipoOperacionId,  -- Genera el id secuencial como CHAR(2)
		tipo.Nombre
	FROM TIPOS_OPERACION AS tipo


--Vistas de departamentos
CREATE VIEW VIEW_DEPARTAMENTOS
AS
	SELECT d.Departamento, d.Nombre
	FROM DEPARTAMENTOS AS d


-- Vistas de provincias
CREATE VIEW VIEW_PROVINCIAS
AS
	SELECT p.Provincia, p.Nombre, p.Departamento
	FROM PROVINCIAS AS p

-- Vistas de distritos
CREATE VIEW VIEW_DISTRITOS
AS
	SELECT d.Distrito, d.Nombre, d.Departamento, d.Provincia
	FROM DISTRITOS AS d