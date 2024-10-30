IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Role')
BEGIN 
CREATE TABLE Role (
    -- Primary Key
    id_role BIGINT IDENTITY(1,1) PRIMARY KEY,                 -- Identificador único para el rol
    
    -- Foreign Keys
    company_id BIGINT NOT NULL                                -- Compañía a la que pertenece este rol
        CONSTRAINT FK_Role_Company 
        FOREIGN KEY REFERENCES Company(id_compa),
    
    -- Basic Information
    role_name NVARCHAR(255) NOT NULL,                         -- Nombre descriptivo del rol
    role_code NVARCHAR(255) NOT NULL,                         -- Código del rol (agregado basado en unique_together)
    role_description NVARCHAR(MAX) NULL,                      -- Descripción detallada del rol y sus responsabilidades
    
    -- Status
    role_active BIT NOT NULL DEFAULT 1,                       -- Indica si el rol está activo (1) o inactivo (0)
    
    -- Unique constraint for company and role code combination
    CONSTRAINT UQ_Company_RoleCode UNIQUE (company_id, role_code)
);
END
GO

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
GO

