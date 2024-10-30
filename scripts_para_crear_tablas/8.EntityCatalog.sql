IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EntityCatalog')
BEGIN
CREATE TABLE EntityCatalog (
    -- Primary Key
    id_entit INT IDENTITY(1,1) PRIMARY KEY,                    -- Identificador �nico para el elemento del cat�logo de entidades
    
    -- Entity Information
    entit_name NVARCHAR(255) NOT NULL UNIQUE,                  -- Nombre del modelo Django asociado
    entit_descrip NVARCHAR(255) NOT NULL,                      -- Descripci�n del elemento del cat�logo de entidades
    
    -- Status
    entit_active BIT NOT NULL DEFAULT 1,                       -- Indica si el elemento del cat�logo est� activo (1) o inactivo (0)
    
    -- Configuration
    entit_config NVARCHAR(MAX) NULL                           -- Configuraci�n adicional para el elemento del cat�logo
);
END
GO

If (SELECT COUNT(1) FROM EntityCatalog)= 0
BEGIN
INSERT INTO EntityCatalog (entit_name, entit_descrip, entit_active, entit_config)
VALUES 
    ('User', 'Modelo que representa a un usuario del sistema.', 1, '{"permissions": ["read", "write", "delete"]}'),
    ('Product', 'Modelo que representa un producto en el inventario.', 1, '{"tax_rate": 0.2, "currency": "USD"}'),
    ('Order', 'Modelo que representa un pedido realizado por un usuario.', 1, '{"status": ["pending", "completed", "canceled"]}'),
    ('Category', 'Modelo que representa las categor�as de productos.', 1, '{"max_items": 100}'),
    ('Invoice', 'Modelo que representa una factura generada por el sistema.', 0, '{"format": "PDF", "due_days": 30}'),
    ('Payment', 'Modelo que representa un pago realizado por un usuario.', 1, '{"methods": ["credit_card", "paypal"]}'),
    ('Review', 'Modelo que representa una rese�a dejada por un usuario sobre un producto.', 1, '{"ratings": [1, 2, 3, 4, 5]}'),
    ('Shipment', 'Modelo que representa el env�o de un pedido.', 1, '{"carrier": "UPS", "tracking": true}');
END
GO