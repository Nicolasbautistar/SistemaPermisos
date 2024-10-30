use Sistema_de_Permisos
-- Create BranchOffice Table
If NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'BranchOffice')
BEGIN
CREATE TABLE BranchOffice (
    -- Primary Key
    id_broff BIGINT IDENTITY(1,1) PRIMARY KEY,                -- Identificador único para la sucursal

    -- Company Reference
    company_id BIGINT NOT NULL                                -- Compañía a la que pertenece esta sucursal
        CONSTRAINT FK_BranchOffice_Company 
        FOREIGN KEY REFERENCES Company(id_compa),
    
    -- Branch Office Information
    broff_name NVARCHAR(255) NOT NULL,                        -- Nombre descriptivo de la sucursal
    broff_code NVARCHAR(255) NOT NULL,                        -- Código único que identifica la sucursal dentro de la empresa
    
    -- Location Information
    broff_address NVARCHAR(255) NOT NULL,                     -- Dirección física de la sucursal
    broff_city NVARCHAR(255) NOT NULL,                        -- Ciudad donde está ubicada la sucursal
    broff_state NVARCHAR(255) NOT NULL,                       -- Departamento o estado donde está ubicada la sucursal
    broff_country NVARCHAR(255) NOT NULL,                     -- País donde está ubicada la sucursal
    
    -- Contact Information
    broff_phone NVARCHAR(255) NOT NULL,                       -- Número de teléfono de la sucursal
    broff_email NVARCHAR(255) NOT NULL,                       -- Dirección de correo electrónico de la sucursal
    
    -- Status
    broff_active BIT NOT NULL DEFAULT 1,                      -- Indica si la sucursal está activa (1) o inactiva (0)

    -- Unique constraint for company and branch code combination
    CONSTRAINT UQ_Company_BranchCode UNIQUE (company_id, broff_code)
);
END
GO

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
GO

