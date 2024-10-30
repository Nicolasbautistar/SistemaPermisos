If NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Company')
BEGIN
	CREATE TABLE Company (
    -- Primary Key
    id_compa BIGINT IDENTITY(1,1) PRIMARY KEY,                -- Identificador �nico para la compa��a
    
    -- Company Information
    compa_name NVARCHAR(255) NOT NULL,                        -- Nombre legal completo de la compa��a
    compa_tradename NVARCHAR(255) NOT NULL,                   -- Nombre comercial o marca de la compa��a
    
    -- Document Information
    compa_doctype NVARCHAR(2) NOT NULL                        -- Tipo de documento de identificaci�n de la compa��a
        CONSTRAINT CK_Company_DocType 
        CHECK (compa_doctype IN ('NI', 'CC', 'CE', 'PP', 'OT')),
    compa_docnum NVARCHAR(255) NOT NULL,                      -- N�mero de identificaci�n fiscal o documento legal de la compa��a
    
    -- Location Information
    compa_address NVARCHAR(255) NOT NULL,                     -- Direcci�n f�sica de la compa��a
    compa_city NVARCHAR(255) NOT NULL,                        -- Ciudad donde est� ubicada la compa��a
    compa_state NVARCHAR(255) NOT NULL,                       -- Departamento o estado donde est� ubicada la compa��a
    compa_country NVARCHAR(255) NOT NULL,                     -- Pa�s donde est� ubicada la compa��a
    
    -- Contact Information
    compa_industry NVARCHAR(255) NOT NULL,                    -- Sector industrial al que pertenece la compa��a
    compa_phone NVARCHAR(255) NOT NULL,                       -- N�mero de tel�fono principal de la compa��a
    compa_email NVARCHAR(255) NOT NULL,                       -- Direcci�n de correo electr�nico principal de la compa��a
    compa_website NVARCHAR(255) NULL,                         -- Sitio web oficial de la compa��a
    
    -- Media
    compa_logo NVARCHAR(MAX) NULL,                           -- Logo oficial de la compa��a
    
    -- Status
    compa_active BIT NOT NULL DEFAULT 1                       -- Indica si la compa��a est� activa (1) o inactiva (0)
);
END 
GO

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
    ('Alpha Technologies Inc.', 'AlphaTech', 'NI', '900123456-7', '123 Tech St', 'Bogot�', 'Cundinamarca', 'Colombia', 'Technology', '3011234567', 'contact@alphatech.com', 'www.alphatech.com', NULL, 1),
    ('Global Finances LLC', 'GlobalFin', 'CC', '800234567-8', '456 Finance Ave', 'Medell�n', 'Antioquia', 'Colombia', 'Finance', '3022345678', 'info@globalfin.com', 'www.globalfin.com', NULL, 1),
    ('Health Solutions SA', 'HealthSol', 'CE', '900345678-9', '789 Health Blvd', 'Cali', 'Valle del Cauca', 'Colombia', 'Healthcare', '3033456789', 'support@healthsol.com', NULL, NULL, 1),
    ('EcoEnergy Ltd.', 'EcoPower', 'PP', '700456789-0', '101 Energy Rd', 'Cartagena', 'Bol�var', 'Colombia', 'Energy', '3044567890', 'hello@ecopower.com', 'www.ecopower.com', NULL, 0),
    ('Innovative Designs Corp.', 'InnoDes', 'OT', '600567890-1', '202 Design St', 'Barranquilla', 'Atl�ntico', 'Colombia', 'Design', '3055678901', 'contact@innodes.com', NULL, NULL, 1);
END
GO


