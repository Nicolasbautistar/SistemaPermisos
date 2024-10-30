IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'PermiRole')
BEGIN
CREATE TABLE PermiRole (
    -- Primary Key
    id_perol BIGINT IDENTITY(1,1) PRIMARY KEY,                -- Identificador único para el permiso de rol
    
    -- Foreign Keys
    role_id BIGINT NOT NULL                                   -- Rol al que se asigna el permiso
        CONSTRAINT FK_PermiRole_Role 
        FOREIGN KEY REFERENCES Role(id_role),
        
    permission_id BIGINT NOT NULL                             -- Permiso asignado al rol
        CONSTRAINT FK_PermiRole_Permission 
        FOREIGN KEY REFERENCES Permission(id_permi),
        
    entitycatalog_id INT NOT NULL                          -- Entidad sobre la que se aplica el permiso
        CONSTRAINT FK_PermiRole_EntityCatalog 
        FOREIGN KEY REFERENCES EntityCatalog(id_entit),
    
    -- Permission Configuration
    perol_include BIT NOT NULL DEFAULT 1,                     -- Indica si el permiso se incluye (1) o se excluye (0) para el rol
    perol_record BIGINT NULL,                                 -- Campo mencionado en unique_together pero no en el modelo
    
    -- Unique constraint for role, permission, entity catalog, and record combination
    CONSTRAINT UQ_Role_Permission_Entity
        UNIQUE (role_id, permission_id, entitycatalog_id, perol_record)
);
END
GO

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
GO
