IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'PermiUserRecord')
BEGIN
CREATE TABLE PermiUserRecord (
    -- Primary Key
    id_peusr BIGINT IDENTITY(1,1) PRIMARY KEY,                -- Identificador único para el permiso de usuario
    
    -- Foreign Keys
    usercompany_id BIGINT NOT NULL                            -- Relación usuario-compañía a la que se asigna el permiso
        CONSTRAINT FK_PermiUserRecord_UserCompany 
        FOREIGN KEY REFERENCES UserCompany(id_useco),
        
    permission_id BIGINT NOT NULL                             -- Permiso asignado al usuario
        CONSTRAINT FK_PermiUserRecord_Permission 
        FOREIGN KEY REFERENCES Permission(id_permi),
        
    entitycatalog_id INT NOT NULL                          -- Entidad sobre la que se aplica el permiso
        CONSTRAINT FK_PermiUserRecord_EntityCatalog 
        FOREIGN KEY REFERENCES EntityCatalog(id_entit),
    
    -- Record Specific Information
    peusr_record BIGINT NOT NULL,                             -- Identificador del registro específico de la entidad al que aplica el permiso
    
    -- Permission Configuration
    peusr_include BIT NOT NULL DEFAULT 1,                     -- Indica si el permiso se incluye (1) o se excluye (0) para el usuario
    
    -- Unique constraint for user-company, permission, entity catalog and record combination
    CONSTRAINT UQ_UserCompany_Permission_Entity_Record 
        UNIQUE (usercompany_id, permission_id, entitycatalog_id, peusr_record)
);
END 
GO
--Se hace referencia a la PM de EntityCatalog, y el tipo de dato es int
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
GO

