IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CostCenter')
BEGIN 
CREATE TABLE CostCenter (
    -- Primary Key
    id_cosce BIGINT IDENTITY(1,1) PRIMARY KEY,                -- Identificador único para el centro de costo
    
    -- Foreign Keys
    company_id BIGINT NOT NULL                                -- Compañía a la que pertenece este centro de costo
        CONSTRAINT FK_CostCenter_Company 
        FOREIGN KEY REFERENCES Company(id_compa),
    
    cosce_parent_id BIGINT NULL                               -- Centro de costo superior en la jerarquía organizacional
        CONSTRAINT FK_CostCenter_Parent 
        FOREIGN KEY REFERENCES CostCenter(id_cosce),
    
    -- Basic Information
    cosce_code NVARCHAR(255) NOT NULL,                        -- Código único que identifica el centro de costo
    cosce_name NVARCHAR(255) NOT NULL,                        -- Nombre descriptivo del centro de costo
    cosce_description NVARCHAR(MAX) NULL,                     -- Descripción detallada del centro de costo y su propósito
    
    -- Financial Information
    cosce_budget DECIMAL(15,2) NOT NULL DEFAULT 0,            -- Presupuesto asignado al centro de costo
    
    -- Hierarchical Information
    cosce_level SMALLINT NOT NULL DEFAULT 1                   -- Nivel en la jerarquía de centros de costo (1 para nivel superior)
        CONSTRAINT CK_CostCenter_Level 
        CHECK (cosce_level > 0),
    
    -- Status
    cosce_active BIT NOT NULL DEFAULT 1,                      -- Indica si el centro de costo está activo (1) o inactivo (0)
    
    -- Unique constraint for company and cost center code combination
    CONSTRAINT UQ_Company_CostCenterCode UNIQUE (company_id, cosce_code)
);
END 
GO
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
GO

