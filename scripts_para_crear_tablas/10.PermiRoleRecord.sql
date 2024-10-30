IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'PermiRoleRecord')
BEGIN
CREATE TABLE PermiRoleRecord (
    -- Primary Key
    id_perrc BIGINT IDENTITY(1,1) PRIMARY KEY,                -- Identificador único para el permiso de rol por registro
    
    -- Foreign Keys
    role_id BIGINT NOT NULL                                   -- Rol al que se asigna el permiso
        CONSTRAINT FK_PermiRoleRecord_Role 
        FOREIGN KEY REFERENCES Role(id_role),
        
    permission_id BIGINT NOT NULL                             -- Permiso asignado al rol
        CONSTRAINT FK_PermiRoleRecord_Permission 
        FOREIGN KEY REFERENCES Permission(id_permi),
        
    entitycatalog_id INT NOT NULL                          -- Entidad sobre la que se aplica el permiso
        CONSTRAINT FK_PermiRoleRecord_EntityCatalog 
        FOREIGN KEY REFERENCES EntityCatalog(id_entit),
    
    -- Record Specific Information
    perrc_record BIGINT NOT NULL,                             -- Identificador del registro específico al que se aplica el permiso
    
    -- Permission Configuration
    perrc_include BIT NOT NULL DEFAULT 1,                     -- Indica si el permiso se incluye (1) o se excluye (0) para el rol y registro
    
    -- Unique constraint for role, permission, entity catalog and record combination
    CONSTRAINT UQ_Role_Permission_Entity_Record 
        UNIQUE (role_id, permission_id, entitycatalog_id, perrc_record)
);
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
GO

