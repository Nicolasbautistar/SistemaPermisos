IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CostCenter')
BEGIN 
CREATE TABLE CostCenter (
    -- Primary Key
    id_cosce BIGINT IDENTITY(1,1) PRIMARY KEY,                -- Identificador �nico para el centro de costo
    
    -- Foreign Keys
    company_id BIGINT NOT NULL                                -- Compa��a a la que pertenece este centro de costo
        CONSTRAINT FK_CostCenter_Company 
        FOREIGN KEY REFERENCES Company(id_compa),
    
    cosce_parent_id BIGINT NULL                               -- Centro de costo superior en la jerarqu�a organizacional
        CONSTRAINT FK_CostCenter_Parent 
        FOREIGN KEY REFERENCES CostCenter(id_cosce),
    
    -- Basic Information
    cosce_code NVARCHAR(255) NOT NULL,                        -- C�digo �nico que identifica el centro de costo
    cosce_name NVARCHAR(255) NOT NULL,                        -- Nombre descriptivo del centro de costo
    cosce_description NVARCHAR(MAX) NULL,                     -- Descripci�n detallada del centro de costo y su prop�sito
    
    -- Financial Information
    cosce_budget DECIMAL(15,2) NOT NULL DEFAULT 0,            -- Presupuesto asignado al centro de costo
    
    -- Hierarchical Information
    cosce_level SMALLINT NOT NULL DEFAULT 1                   -- Nivel en la jerarqu�a de centros de costo (1 para nivel superior)
        CONSTRAINT CK_CostCenter_Level 
        CHECK (cosce_level > 0),
    
    -- Status
    cosce_active BIT NOT NULL DEFAULT 1,                      -- Indica si el centro de costo est� activo (1) o inactivo (0)
    
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
    (1, NULL, 'CC-AT001', 'Administraci�n General', 'Administraci�n y gesti�n de recursos de AlphaTech', 50000.00, 1, 1),
    (1, 1, 'CC-AT002', 'Finanzas y Contabilidad', 'Control de finanzas y contabilidad de AlphaTech', 30000.00, 2, 1),
    (2, NULL, 'CC-GF001', 'Operaciones', 'Gesti�n de operaciones de GlobalFin', 80000.00, 1, 1),
    (2, 3, 'CC-GF002', 'Marketing', 'Departamento de marketing para campa�as de GlobalFin', 20000.00, 2, 1),
    (3, NULL, 'CC-HS001', 'Salud y Bienestar', 'Bienestar y atenci�n m�dica en HealthSol', 60000.00, 1, 1),
    (3, 5, 'CC-HS002', 'Recursos Humanos', 'Gesti�n de recursos humanos y talento en HealthSol', 25000.00, 2, 0),
    (4, NULL, 'CC-EP001', 'Producci�n Energ�tica', 'Producci�n y distribuci�n de energ�a en EcoPower', 120000.00, 1, 1),
    (4, 7, 'CC-EP002', 'Innovaci�n y Desarrollo', 'Investigaci�n y desarrollo de nuevas tecnolog�as en EcoPower', 40000.00, 2, 1),
    (5, NULL, 'CC-ID001', 'Dise�o y Creatividad', 'Desarrollo creativo en InnoDes', 45000.00, 1, 1),
    (5, 9, 'CC-ID002', 'Desarrollo de Productos', 'Centro de desarrollo de productos innovadores en InnoDes', 50000.00, 2, 1);
END
GO

