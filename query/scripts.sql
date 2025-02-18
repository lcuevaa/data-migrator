-- TIPOS OPERACION
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('0101','Venta interna');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('0112','Venta Interna - Sustenta Gastos Deducibles Persona Natural');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('0113','Venta Interna-NRUS');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('0200','Exportación de Bienes');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('0201','Exportación de Servicios – Prestación servicios realizados íntegramente en el país');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('0202','Exportación de Servicios – Prestación de servicios de hospedaje No Domiciliado');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('0203','Exportación de Servicios – Transporte de navieras');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('0204','Exportación de Servicios – Servicios a naves y aeronaves de bandera extranjera');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('0205','Exportación de Servicios  - Servicios que conformen un Paquete Turístico');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('0206','Exportación de Servicios – Servicios complementarios al transporte de carga');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('0207','Exportación de Servicios – Suministro de energía eléctrica a favor de sujetos domiciliados en ZED');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('0208','Exportación de Servicios – Prestación servicios realizados parcialmente en el extranjero');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('0301','Operaciones con Carta de porte aéreo (emitidas en el ámbito nacional)');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('0302','Operaciones de Transporte ferroviario de pasajeros');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('0303','Operaciones de Pago de regalía petrolera');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('0401','Ventas no domiciliados que no califican como exportación');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('1001','Operación Sujeta a Detracción');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('1002','Operación Sujeta a Detracción- Recursos Hidrobiológicos');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('1003','Operación Sujeta a Detracción- Servicios de Transporte Pasajeros');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('1004','Operación Sujeta a Detracción- Servicios de Transporte Carga');
insert into tipos_operacion(tipo_operacion_id, tipo_operacion_nombre) values('2001','Operación Sujeta a Percepción');


-- TIPOS TRIBUTO
insert into tipos_tributo(tipo_tributo_id,tipo_tributo_nombre,nombre_sunat,codigo_internacional,codigo_categoria) values('1000','IGV Impuesto General a las Ventas','IGV','VAT','S');
insert into tipos_tributo(tipo_tributo_id,tipo_tributo_nombre,nombre_sunat,codigo_internacional,codigo_categoria) values('1016','Impuesto a la Venta Arroz Pilado', 'IVAP','VAT', 'S');
insert into tipos_tributo(tipo_tributo_id,tipo_tributo_nombre,nombre_sunat,codigo_internacional,codigo_categoria) values('2000','ISC Impuesto Selectivo al Consumo', 'ISC', 'EXC', 'S');
insert into tipos_tributo(tipo_tributo_id,tipo_tributo_nombre,nombre_sunat,codigo_internacional,codigo_categoria) values('9995','Exportación','EXP', 'FRE', 'G');
insert into tipos_tributo(tipo_tributo_id,tipo_tributo_nombre,nombre_sunat,codigo_internacional,codigo_categoria) values('9996','Gratuito','GRA', 'FRE', 'Z');
insert into tipos_tributo(tipo_tributo_id,tipo_tributo_nombre,nombre_sunat,codigo_internacional,codigo_categoria) values('9997','Exonerado','EXO', 'VAT', 'E');
insert into tipos_tributo(tipo_tributo_id,tipo_tributo_nombre,nombre_sunat,codigo_internacional,codigo_categoria) values('9998','Inafecto','INA','FRE', 'O');
insert into tipos_tributo(tipo_tributo_id,tipo_tributo_nombre,nombre_sunat,codigo_internacional,codigo_categoria) values('9999','Otros tributos','OTROS', 'OTH', 'S');