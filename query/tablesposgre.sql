CREATE TABLE unidades_medida (
    unidad_id UUID PRIMARY KEY,
    unidad_nombre VARCHAR(150) NOT NULL,
    codigo_internacion VARCHAR(5)
);


CREATE TABLE tipos_afectacion_igv (
    tipo_afectacion_id VARCHAR(2) PRIMARY KEY,
    descripcion VARCHAR(150) NOT NULL
);

CREATE TABLE formas_pago (
    forma_pago_id VARCHAR(3) PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    es_credito VARCHAR(1) NOT NULL DEFAULT 'N'
);


CREATE TABLE tipos_documento_tributarios (
    td_id VARCHAR(2) PRIMARY KEY,
    descripcion VARCHAR(150),
    nombre_documento VARCHAR(150) NOT NULL
);


-- Tabla empresas
CREATE TABLE empresas(
	empresa_id CHAR(2) PRIMARY KEY,
	tipo_identificacion VARCHAR(2) NOT NULL,
	FOREIGN KEY (tipo_identificacion) REFERENCES tipos_identificacion(tipo_identificacion_id),
	nro_identificacion VARCHAR(11),
	razon_social VARCHAR(150) NOT NULL,
	direccion VARCHAR(200) NOT NULL
)


CREATE TABLE puntos_emision(
	punto_emision_id CHAR(4) PRIMARY KEY,
	codigo_sunat VARCHAR(4),
	empresa CHAR(2) NOT NULL, -- CODIGO MIGRACION
	FOREIGN KEY (empresa) REFERENCES empresas(empresa_id),
	nombre_punto_emision VARCHAR(200) NOT NULL,
	direccion VARCHAR(200),
	departamento CHAR(2) NOT NULL,
	FOREIGN KEY (departamento) REFERENCES departamentos(departamento_id),
	provincia CHAR(4) NOT NULL,
	FOREIGN KEY (provincia) REFERENCES provincias(provincia_id),
	distrito CHAR(6) NOT NULL,
	FOREIGN KEY (distrito) REFERENCES distritos(distrito_id)
)

CREATE TABLE productos (
    producto_id UUID PRIMARY KEY,
    producto_codigo VARCHAR(25) NOT NULL,
    codigo_sunat VARCHAR(10),
    empresa_id INT NOT NULL,
    descripcion VARCHAR(150) NOT NULL,
    unidad_id INT,
    peso DECIMAL(12,2) NOT NULL DEFAULT 0,
    tipo_afectacion_id INT NOT NULL,
    FOREIGN KEY (empresa_id) REFERENCES empresa(id) ,
    FOREIGN KEY (unidad_id) REFERENCES unidad_medida(id),
    FOREIGN KEY (tipo_afectacion_id) REFERENCES tipo_afectacion_impuesto(id) 
);


CREATE TABLE contribuyentes (
    contribuyente_id VARCHAR(15) PRIMARY KEY,
    tipo_identificacion_id INT NOT NULL,
    nro_identificacion VARCHAR(11) NOT NULL,
    nombre_contribuyente VARCHAR(150) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    departamento_id INT NOT NULL,
    provincia_id INT NOT NULL,
    distrito_id INT NOT NULL,
    urbanizacion VARCHAR(100),
    email VARCHAR(100),
    FOREIGN KEY (tipo_identificacion_id) REFERENCES tipos_identificacion(id),
    FOREIGN KEY (departamento_id) REFERENCES departamento(id),
    FOREIGN KEY (provincia_id) REFERENCES provincia(id),
    FOREIGN KEY (distrito_id) REFERENCES distrito(id)
);


-- Tipos de identificacion
CREATE TABLE tipos_identificacion(
	tipo_identificacion_id VARCHAR(2) PRIMARY KEY,
	tipo_identificacion_nombre VARCHAR(100)
)

-- Tipos de operacion
CREATE TABLE tipos_operacion(
	tipo_operacion_id CHAR(4) PRIMARY KEY,
	tipo_operacion_nombre VARCHAR(100) NOT NULL
)

-- Departamentos
CREATE TABLE departamentos(
	departamento_id VARCHAR(2) PRIMARY KEY,
	departamento_nombre VARCHAR(100) NOT NULL
)

-- Provincias
CREATE TABLE provincias(
	provincia_id VARCHAR(4) PRIMARY KEY,
	provincia_nombre VARCHAR(100) NOT NULL,
	departamento VARCHAR(2) NOT NULL,
	FOREIGN KEY (departamento) REFERENCES departamentos(departamento_id)
)

-- Distritos
CREATE TABLE distritos(
	distrito_id VARCHAR(6) PRIMARY KEY,
	distrito_nombre VARCHAR(100) NOT NULL,
	departamento VARCHAR(2) NOT NULL,
	FOREIGN KEY (departamento) REFERENCES departamentos(departamento_id),
	provincia VARCHAR(4) NOT NULL,
	FOREIGN KEY (provincia) REFERENCES provincias(provincia_id)
)

-- TIPOS_OPERACION
CREATE TABLE tipos_operacion (
	tipo_operacion_id VARCHAR(4) PRIMARY KEY,
	tipo_operacion_nombre VARCHAR(150)
)

-- TIPOS_TRIBUTO
CREATE TABLE tipos_tributo(
	tipo_tributo_id VARCHAR(4) PRIMARY KEY,
	tipo_tributo_nombre VARCHAR(100),
	nombre_sunat VARCHAR(100),
	codigo_internacional VARCHAR(5),
	codigo_categoria CHAR(1)
)