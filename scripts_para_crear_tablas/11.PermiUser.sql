IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'PermiUser')
BEGIN
CREATE TABLE PermiUser (
    -- Primary Key
    id_peusr BIGINT IDENTITY(1,1) PRIMARY KEY,                -- Identificador único para el permiso de usuario
    
    -- Foreign Keys
    usercompany_id BIGINT NOT NULL                            -- Relación usuario-compañía a la que se asigna el permiso
        CONSTRAINT FK_PermiUser_UserCompany 
        FOREIGN KEY REFERENCES UserCompany(id_useco),
        
    permission_id BIGINT NOT NULL                             -- Permiso asignado al usuario
        CONSTRAINT FK_PermiUser_Permission 
        FOREIGN KEY REFERENCES Permission(id_permi),
        
    entitycatalog_id INT NOT NULL                          -- Entidad sobre la que se aplica el permiso
        CONSTRAINT FK_PermiUser_EntityCatalog 
        FOREIGN KEY REFERENCES EntityCatalog(id_entit),
    
    -- Permission Configuration
    peusr_include BIT NOT NULL DEFAULT 1,                     -- Indica si el permiso se incluye (1) o se excluye (0) para el usuario
    
    -- Unique constraint for user-company, permission and entity catalog combination
    CONSTRAINT UQ_UserCompany_Permission_Entity 
        UNIQUE (usercompany_id, permission_id, entitycatalog_id)
);
END
GO
If (SELECT COUNT(1) FROM PermiUser)= 0
BEGIN
INSERT INTO PermiUser (usercompany_id, permission_id, entitycatalog_id, peusr_include)
VALUES 
    (1, 1, 1, 1),  -- Usuario 1, Permiso 1, Entidad 1, Permiso incluido
    (1, 2, 2, 1),  -- Usuario 1, Permiso 2, Entidad 2, Permiso incluido
    (1, 3, 3, 0),  -- Usuario 1, Permiso 3, Entidad 3, Permiso excluido
    (2, 1, 4, 1)  -- Usuario 2, Permiso 1, Entidad 4, Permiso incluido
END
GO