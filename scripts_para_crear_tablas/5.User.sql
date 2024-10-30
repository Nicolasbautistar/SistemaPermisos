IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'User')
BEGIN 
CREATE TABLE [User] (
    -- Primary Key
    id_user BIGINT IDENTITY(1,1) PRIMARY KEY,                 -- Identificador único para el usuario
    
    -- Authentication Information
    user_username NVARCHAR(255) NOT NULL,                     -- Nombre de usuario para iniciar sesión
    user_password NVARCHAR(255) NOT NULL,                     -- Contraseña encriptada del usuario
    
    -- Contact Information
    user_email NVARCHAR(255) NOT NULL,                        -- Dirección de correo electrónico del usuario
    user_phone NVARCHAR(255) NULL,                            -- Número de teléfono del usuario
    
    -- Access Control
    user_is_admin BIT NOT NULL DEFAULT 0,                     -- Indica si el usuario es Administrador (1) o normal (0)
    user_is_active BIT NOT NULL DEFAULT 1,                    -- Indica si el usuario está activo (1) o inactivo (0)
    
    -- Unique Constraints
    CONSTRAINT UQ_User_Username UNIQUE (user_username),
    CONSTRAINT UQ_User_Email UNIQUE (user_email)
);
END
GO
If (SELECT COUNT(1) FROM [User])= 0
BEGIN
INSERT INTO [User] (user_username, user_password, user_email, user_phone, user_is_admin, user_is_active)
VALUES 
    ('user1', 'Password123!', 'user1@example.com', '555-0101', 0, 1),
    ('user2', 'Password123!', 'user2@example.com', '555-0102', 1, 1),
    ('user3', 'Password123!', 'user3@example.com', '555-0103', 0, 1),
    ('user4', 'Password123!', 'user4@example.com', '555-0104', 0, 0),
    ('user5', 'Password123!', 'user5@example.com', '555-0105', 1, 1);
END 
GO
