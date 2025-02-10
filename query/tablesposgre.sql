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



CREATE TABLE empresas(
	EmpresaId UUID PRIMARY KEY,
	TDIdentificacionId UUID,
	NroRuc VARCHAR(11),
	RazonSocial VARCHAR(100) NOT NULL,
	Direccion VARCHAR(100) NOT NULL
)

CREATE TABLE puntoemision(
	punto_emision_id UUID PRIMARY KEY,
	codigo_sunat VARCHAR(4),
	empresa UUID,
	nombre_punto_emision VARCHAR(100) NOT NULL,
	direccion VARCHAR(100),
	departamento INT,
	provincia INT,
	distrito INT
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


