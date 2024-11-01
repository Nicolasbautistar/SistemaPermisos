CREATE PROCEDURE spInsertarRegistros
AS
BEGIN
set nocount on;
BEGIN TRY
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Company')
OR NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'BranchOffice')
OR NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CostCenter')
OR NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Role')
OR NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'User')
OR NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'UserCompany')
OR NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Permission')
OR NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EntityCatalog')
OR NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'PermiUserRecord')
OR NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'PermiRoleRecord')
OR NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'PermiUser')
OR NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'PermiRole')
BEGIN
 PRINT 'Debe crear primero las tablas.';
    RETURN;
END
If (SELECT COUNT(1) FROM Company)= 0
BEGIN
	INSERT INTO Company (
    compa_name,
    compa_tradename,
    compa_doctype,
    compa_docnum,
    compa_address,
    compa_city,
    compa_state,
    compa_country,
    compa_industry,
    compa_phone,
    compa_email,
    compa_website,
    compa_logo,
    compa_active
)
VALUES 
    ('Alpha Technologies Inc.', 'AlphaTech', 'NI', '900123456-7', '123 Tech St', 'Bogotá', 'Cundinamarca', 'Colombia', 'Technology', '3011234567', 'contact@alphatech.com', 'www.alphatech.com', NULL, 1),
    ('Global Finances LLC', 'GlobalFin', 'CC', '800234567-8', '456 Finance Ave', 'Medellín', 'Antioquia', 'Colombia', 'Finance', '3022345678', 'info@globalfin.com', 'www.globalfin.com', NULL, 1),
    ('Health Solutions SA', 'HealthSol', 'CE', '900345678-9', '789 Health Blvd', 'Cali', 'Valle del Cauca', 'Colombia', 'Healthcare', '3033456789', 'support@healthsol.com', NULL, NULL, 1),
    ('EcoEnergy Ltd.', 'EcoPower', 'PP', '700456789-0', '101 Energy Rd', 'Cartagena', 'Bolívar', 'Colombia', 'Energy', '3044567890', 'hello@ecopower.com', 'www.ecopower.com', NULL, 0),
    ('Innovative Designs Corp.', 'InnoDes', 'OT', '600567890-1', '202 Design St', 'Barranquilla', 'Atlántico', 'Colombia', 'Design', '3055678901', 'contact@innodes.com', NULL, NULL, 1);
END
If (SELECT COUNT(1) FROM BranchOffice)= 0
BEGIN
	INSERT INTO BranchOffice (
    company_id,
    broff_name,
    broff_code,
    broff_address,
    broff_city,
    broff_state,
    broff_country,
    broff_phone,
    broff_email,
    broff_active
)
VALUES 
    (1, 'AlphaTech Bogotá', 'AT-BG01', '123 Tech St', 'Bogotá', 'Cundinamarca', 'Colombia', '3121111111', 'bogota@alphatech.com', 1),
    (1, 'AlphaTech Medellín', 'AT-MD02', '456 Innovation Ave', 'Medellín', 'Antioquia', 'Colombia', '3121112222', 'medellin@alphatech.com', 1),
    (2, 'GlobalFin Medellín', 'GF-MD01', '789 Finance Blvd', 'Medellín', 'Antioquia', 'Colombia', '3122223333', 'medellin@globalfin.com', 1),
    (2, 'GlobalFin Cali', 'GF-CL02', '101 Market St', 'Cali', 'Valle del Cauca', 'Colombia', '3122224444', 'cali@globalfin.com', 1),
    (3, 'HealthSol Bogotá', 'HS-BG01', '202 Health Ave', 'Bogotá', 'Cundinamarca', 'Colombia', '3123335555', 'bogota@healthsol.com', 1),
    (3, 'HealthSol Cali', 'HS-CL02', '303 Wellness Blvd', 'Cali', 'Valle del Cauca', 'Colombia', '3123336666', 'cali@healthsol.com', 0),
    (4, 'EcoPower Cartagena', 'EP-CT01', '404 Energy Rd', 'Cartagena', 'Bolívar', 'Colombia', '3124447777', 'cartagena@ecopower.com', 1),
    (4, 'EcoPower Barranquilla', 'EP-BQ02', '505 Solar St', 'Barranquilla', 'Atlántico', 'Colombia', '3124448888', 'barranquilla@ecopower.com', 1),
    (5, 'InnoDes Bogotá', 'ID-BG01', '606 Creative Ave', 'Bogotá', 'Cundinamarca', 'Colombia', '3125559999', 'bogota@innodes.com', 1),
    (5, 'InnoDes Medellín', 'ID-MD02', '707 Design St', 'Medellín', 'Antioquia', 'Colombia', '3125550000', 'medellin@innodes.com', 1);

END
If (SELECT COUNT(1) FROM CostCenter)= 0
BEGIN
INSERT INTO CostCenter (
    company_id,
    cosce_parent_id,
    cosce_code,
    cosce_name,
    cosce_description,
    cosce_budget,
    cosce_level,
    cosce_active
)
VALUES 
    (1, NULL, 'CC-AT001', 'Administración General', 'Administración y gestión de recursos de AlphaTech', 50000.00, 1, 1),
    (1, 1, 'CC-AT002', 'Finanzas y Contabilidad', 'Control de finanzas y contabilidad de AlphaTech', 30000.00, 2, 1),
    (2, NULL, 'CC-GF001', 'Operaciones', 'Gestión de operaciones de GlobalFin', 80000.00, 1, 1),
    (2, 3, 'CC-GF002', 'Marketing', 'Departamento de marketing para campañas de GlobalFin', 20000.00, 2, 1),
    (3, NULL, 'CC-HS001', 'Salud y Bienestar', 'Bienestar y atención médica en HealthSol', 60000.00, 1, 1),
    (3, 5, 'CC-HS002', 'Recursos Humanos', 'Gestión de recursos humanos y talento en HealthSol', 25000.00, 2, 0),
    (4, NULL, 'CC-EP001', 'Producción Energética', 'Producción y distribución de energía en EcoPower', 120000.00, 1, 1),
    (4, 7, 'CC-EP002', 'Innovación y Desarrollo', 'Investigación y desarrollo de nuevas tecnologías en EcoPower', 40000.00, 2, 1),
    (5, NULL, 'CC-ID001', 'Diseño y Creatividad', 'Desarrollo creativo en InnoDes', 45000.00, 1, 1),
    (5, 9, 'CC-ID002', 'Desarrollo de Productos', 'Centro de desarrollo de productos innovadores en InnoDes', 50000.00, 2, 1);
END
If (SELECT COUNT(1) FROM Role)= 0
BEGIN
	INSERT INTO Role (
	    company_id,
	    role_name,
	    role_code,
	    role_description,
	    role_active
	)
	VALUES 
	(1, 'Administrador de Sistemas', 'SYS_ADMIN', 'Responsable de la administración de sistemas y redes en AlphaTech.', 1),
	(1, 'Gerente Financiero', 'FIN_MANAGER', 'Encargado de la supervisión financiera y presupuestaria en AlphaTech.', 1),
	(2, 'Analista de Marketing', 'MKT_ANALYST', 'Desarrollo y análisis de campañas de marketing para GlobalFin.', 1),
	(2, 'Especialista en Producto', 'PROD_SPEC', 'Especialista en productos financieros de GlobalFin.', 1),
	(3, 'Asistente de Recursos Humanos', 'HR_ASST', 'Apoyo en los procesos de contratación y administración de personal en HealthSol.', 1),
	(3, 'Director Médico', 'MED_DIR', 'Supervisión general de políticas médicas y de bienestar en HealthSol.', 1),
	(4, 'Ingeniero de Energía', 'ENG_ENERGY', 'Gestión y optimización de proyectos energéticos en EcoPower.', 1),
	(4, 'Investigador de Desarrollo', 'RND_RESEARCH', 'Investigación y desarrollo de nuevas tecnologías para EcoPower.', 0),
	(5, 'Diseñador Creativo', 'CREA_DESIGN', 'Responsable del diseño creativo de productos en InnoDes.', 1),
	(5, 'Desarrollador de Productos', 'PROD_DEV', 'Desarrollo de productos innovadores y sostenibles en InnoDes.', 1);
END
If (SELECT COUNT(1) FROM [User])= 0
BEGIN
INSERT INTO [User] (user_username, user_password, user_email, user_phone, user_is_admin, user_is_active)
VALUES 
    ('user1', 'Password123!', 'user1@example.com', '555-0101', 0, 1),
    ('user2', 'Password123!', 'user2@example.com', '555-0102', 1, 1),
    ('user3', 'Password123!', 'user3@example.com', '555-0103', 0, 1),
    ('user4', 'Password123!', 'user4@example.com', '555-0104', 0, 0),
    ('user5', 'Password123!', 'user5@example.com', '555-0105', 1, 1);
END 
If (SELECT COUNT(1) FROM UserCompany)= 0
BEGIN
INSERT INTO UserCompany (user_id, role_id, company_id, useco_active)
VALUES 
    (1, 1, 1, 1),  -- Usuario 1, Administrador de Sistemas, Compañía AlphaTech, Activo
    (2, 2, 1, 1),  -- Usuario 2, Gerente Financiero, Compañía AlphaTech, Activo
    (3, 4, 2, 1);  -- Usuario 3, Especialista en Producto, Compañía GlobalFin, Inactivo
end

If (SELECT COUNT(1) FROM Permission)= 0
BEGIN
	INSERT INTO Permission (permi_name, permi_description, permi_create, permi_read, permi_update, permi_delete, permi_import, permi_export)
	VALUES 
	    ('View Reports', 'Permiso para ver informes y reportes.', 0, 1, 0, 0, 0, 0),
	    ('Edit User', 'Permiso para editar la información del usuario.', 0, 0, 1, 0, 0, 0),
	    ('Create User', 'Permiso para crear nuevos usuarios.', 1, 0, 0, 0, 0, 0),
	    ('Delete User', 'Permiso para eliminar usuarios.', 0, 0, 0, 1, 0, 0),
	    ('Import Data', 'Permiso para importar datos al sistema.', 0, 0, 0, 0, 1, 0),
	    ('Export Data', 'Permiso para exportar datos del sistema.', 0, 0, 0, 0, 0, 1),
	    ('Full Access', 'Permiso completo para todas las operaciones.', 1, 1, 1, 1, 1, 1),
	    ('Read-Only', 'Permiso solo para lectura.', 0, 1, 0, 0, 0, 0);
END
If (SELECT COUNT(1) FROM EntityCatalog)= 0
BEGIN
INSERT INTO EntityCatalog (entit_name, entit_descrip, entit_active, entit_config)
VALUES 
    ('User', 'Modelo que representa a un usuario del sistema.', 1, '{"permissions": ["read", "write", "delete"]}'),
    ('Product', 'Modelo que representa un producto en el inventario.', 1, '{"tax_rate": 0.2, "currency": "USD"}'),
    ('Order', 'Modelo que representa un pedido realizado por un usuario.', 1, '{"status": ["pending", "completed", "canceled"]}'),
    ('Category', 'Modelo que representa las categorías de productos.', 1, '{"max_items": 100}'),
    ('Invoice', 'Modelo que representa una factura generada por el sistema.', 0, '{"format": "PDF", "due_days": 30}'),
    ('Payment', 'Modelo que representa un pago realizado por un usuario.', 1, '{"methods": ["credit_card", "paypal"]}'),
    ('Review', 'Modelo que representa una reseña dejada por un usuario sobre un producto.', 1, '{"ratings": [1, 2, 3, 4, 5]}'),
    ('Shipment', 'Modelo que representa el envío de un pedido.', 1, '{"carrier": "UPS", "tracking": true}');
END
If (SELECT COUNT(1) FROM PermiUserRecord)= 0
BEGIN
INSERT INTO PermiUserRecord (usercompany_id, permission_id, entitycatalog_id, peusr_record, peusr_include)
VALUES 
    (1, 1, 1, 1001, 1),  -- Permiso para el usuario de la compañía 1 para la entidad User
    (1, 2, 2, 1002, 1),  -- Permiso para el usuario de la compañía 1 para la entidad Product
    (1, 3, 3, 1003, 0),  -- Permiso denegado para el usuario de la compañía 1 para la entidad Order
    (2, 1, 4, 1004, 1),  -- Permiso para el usuario de la compañía 2 para la entidad Category
    (2, 4, 5, 1005, 1),  -- Permiso para el usuario de la compañía 2 para la entidad Invoice
    (3, 2, 6, 1006, 1),  -- Permiso para el usuario de la compañía 3 para la entidad Payment
    (3, 5, 7, 1007, 1),  -- Permiso para el usuario de la compañía 3 para la entidad Review
    (3, 3, 8, 1008, 0);  -- Permiso denegado para el usuario de la compañía 3 para la entidad Shipment
END
If (SELECT COUNT(1) FROM PermiRoleRecord)= 0
BEGIN
INSERT INTO PermiRoleRecord (role_id, permission_id, entitycatalog_id, perrc_record, perrc_include)
VALUES 
    (1, 1, 1, 2001, 1),  -- Permiso incluido para el rol 1 para la entidad User
    (1, 2, 2, 2002, 1),  -- Permiso incluido para el rol 1 para la entidad Product
    (1, 3, 3, 2003, 0),  -- Permiso excluido para el rol 1 para la entidad Order
    (2, 1, 4, 2004, 1),  -- Permiso incluido para el rol 2 para la entidad Category
    (2, 4, 5, 2005, 1),  -- Permiso incluido para el rol 2 para la entidad Invoice
    (3, 2, 6, 2006, 1),  -- Permiso incluido para el rol 3 para la entidad Payment
    (3, 5, 7, 2007, 1),  -- Permiso incluido para el rol 3 para la entidad Review
    (3, 3, 8, 2008, 0);  -- Permiso excluido para el rol 3 para la entidad Shipment
END
If (SELECT COUNT(1) FROM PermiUser)= 0
BEGIN
INSERT INTO PermiUser (usercompany_id, permission_id, entitycatalog_id, peusr_include)
VALUES 
    (1, 1, 1, 1),  -- Usuario 1, Permiso 1, Entidad 1, Permiso incluido
    (1, 2, 2, 1),  -- Usuario 1, Permiso 2, Entidad 2, Permiso incluido
    (1, 3, 3, 0),  -- Usuario 1, Permiso 3, Entidad 3, Permiso excluido
    (2, 1, 4, 1)  -- Usuario 2, Permiso 1, Entidad 4, Permiso incluido
END
If (SELECT COUNT(1) FROM PermiRole)= 0
BEGIN
	INSERT INTO PermiRole (role_id, permission_id, entitycatalog_id, perol_include, perol_record)
	VALUES 
	(1, 1, 1, 1, NULL),  -- Rol 1, Permiso 1, Entidad 1, Permiso incluido
	(1, 2, 2, 1, NULL),  -- Rol 1, Permiso 2, Entidad 2, Permiso incluido
	(1, 3, 3, 0, NULL),  -- Rol 1, Permiso 3, Entidad 3, Permiso excluido
	(2, 1, 4, 1, NULL),  -- Rol 2, Permiso 1, Entidad 4, Permiso incluido
	(2, 4, 5, 1, NULL),  -- Rol 2, Permiso 4, Entidad 5, Permiso incluido
	(3, 2, 6, 1, NULL),  -- Rol 3, Permiso 2, Entidad 6, Permiso incluido
	(3, 5, 7, 1, NULL),  -- Rol 3, Permiso 5, Entidad 7, Permiso incluido
	(3, 3, 8, 0, NULL);  -- Rol 3, Permiso 3, Entidad 8, Permiso excluido
END
END TRY
BEGIN CATCH
 PRINT 'Ocurrió un error al crear las tablas.';
    RETURN;
END CATCH
PRINT 'Registros de prueba Insertados'
END


--drop procedure spInsertarRegistros

