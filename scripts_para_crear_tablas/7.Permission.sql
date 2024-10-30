IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Permission')
BEGIN
CREATE TABLE Permission (
    -- Primary Key
    id_permi BIGINT IDENTITY(1,1) PRIMARY KEY,                -- Identificador único para el permiso
    
    -- Basic Information
    name NVARCHAR(255) NOT NULL,                              -- Nombre descriptivo del permiso
    description NVARCHAR(MAX) NULL,                           -- Descripción detallada del permiso y su propósito
    
    -- CRUD Permissions
    can_create BIT NOT NULL DEFAULT 0,                        -- Permite crear nuevos registros
    can_read BIT NOT NULL DEFAULT 0,                          -- Permite ver registros existentes
    can_update BIT NOT NULL DEFAULT 0,                        -- Permite modificar registros existentes
    can_delete BIT NOT NULL DEFAULT 0,                        -- Permite eliminar registros existentes
    
    -- Data Transfer Permissions
    can_import BIT NOT NULL DEFAULT 0,                        -- Permite importar datos masivamente
    can_export BIT NOT NULL DEFAULT 0                         -- Permite exportar datos del sistema
);
END
GO

If (SELECT COUNT(1) FROM Permission)= 0
BEGIN
	INSERT INTO Permission (name, description, can_create, can_read, can_update, can_delete, can_import, can_export)
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
GO