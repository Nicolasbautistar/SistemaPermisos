IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'UserCompany')
BEGIN 
CREATE TABLE UserCompany (
    -- Primary Key
    id_useco BIGINT IDENTITY(1,1) PRIMARY KEY,                -- Identificador �nico para la relaci�n usuario-compa��a
    
    -- Foreign Keys
    user_id BIGINT NOT NULL                                   -- Usuario asociado a la compa��a
        CONSTRAINT FK_UserCompany_User 
        FOREIGN KEY REFERENCES [User](id_user),
    
    company_id BIGINT NOT NULL                                -- Compa��a asociada al usuario
        CONSTRAINT FK_UserCompany_Company 
        FOREIGN KEY REFERENCES Company(id_compa),
    
    -- Status
    useco_active BIT NOT NULL DEFAULT 1,                      -- Indica si la relaci�n usuario-compa��a est� activa (1) o inactiva (0)
    
    -- Unique constraint for user and company combination
    CONSTRAINT UQ_User_Company UNIQUE (user_id, company_id)
);
END
GO

If (SELECT COUNT(1) FROM UserCompany)= 0
BEGIN
INSERT INTO UserCompany (user_id, company_id, useco_active)
VALUES 
    (1, 1, 1),  -- Usuario 1, Compa��a 1, Activo
    (2, 1, 1),  -- Usuario 2, Compa��a 1, Activo
    (3, 2, 0);  -- Usuario 3, Compa��a 2, Inactivo
end
GO