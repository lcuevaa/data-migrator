-- VIEW_PUNTOEMISION
CREATE VIEW VIEW_SUCURSAL_NEW
AS
	SELECT
		vs.CodigoSucursal, 
		s.CodigoPuntoEmisionSUNAT, 
		vs.CodEmpresa, 
		vs.NombreComercial, 
		vs.Direccion, 
		s.Departamento, 
		s.Provincia, 
		s.Distrito
	FROM VIEW_SUCURSALES AS vs
	INNER JOIN SUCURSALES AS s
	ON vs.SucursalId = s.SucursalId


-- Vista empresas
CREATE VIEW VIEW_EMPRESAS AS
    SELECT 
        e.CodigoMigracion,
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
INNER JOIN dbo.UNIDADES_MEDIDA U ON A.UnidadId = U.UnidadId


-- hay 22 registros pero solo reconoce 21 hay conflicto en id
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


-- El mismo problema que unidadMedida
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