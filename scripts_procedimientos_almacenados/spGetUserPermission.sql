CREATE PROCEDURE spGetUserPermission
    @EntityCatalogID INT,
    @UserID BIGINT
AS
BEGIN

    -- Consulta de permisos a nivel de rol para la entidad completa
	SELECT Rol, Permiso, NivelPermiso INTO #Permisos from(
    SELECT
        r.role_name AS Rol,
        p.permi_name AS Permiso,
        'Rol General' AS NivelPermiso
    FROM
        PermiRole pr
    JOIN
        Role r ON pr.role_id = r.id_role
    JOIN
        Permission p ON pr.permission_id = p.id_permi
    JOIN
        UserCompany uc ON uc.role_id = r.id_role
    WHERE
        uc.user_id = @UserID
        AND pr.entitycatalog_id = @EntityCatalogID
        AND pr.perol_include = 1

    UNION

    -- Consulta de permisos a nivel de usuario para la entidad completa
    SELECT
        'Usuario Específico' AS Rol,
        p.permi_name AS Permiso,
        'Usuario General' AS NivelPermiso
    FROM
        PermiUser pu
    JOIN
        Permission p ON pu.permission_id = p.id_permi
    WHERE
        pu.usercompany_id = @UserID
        AND pu.entitycatalog_id = @EntityCatalogID
        AND pu.peusr_include = 1

    UNION

    -- Consulta de permisos a nivel de rol por registro
    SELECT
        r.role_name AS Rol,
        p.permi_name AS Permiso,
        'Rol por Registro' AS NivelPermiso
    FROM
        PermiRoleRecord prr
    JOIN
        Role r ON prr.role_id = r.id_role
    JOIN
        Permission p ON prr.permission_id = p.id_permi
    JOIN
        UserCompany uc ON uc.role_id = r.id_role
    WHERE
        uc.user_id = @UserID
        AND prr.entitycatalog_id = @EntityCatalogID
        AND prr.perrc_include = 1

    UNION

    -- Consulta de permisos a nivel de usuario por registro
    SELECT
        'Usuario Específico' AS Rol,
        p.permi_name AS Permiso,
        'Usuario por Registro' AS NivelPermiso
    FROM
        PermiUserRecord pur
    JOIN
        Permission p ON pur.permission_id = p.id_permi
    WHERE
        pur.usercompany_id = @UserID
        AND pur.entitycatalog_id = @EntityCatalogID
        AND pur.peusr_include = 1 )a

IF (SELECT COUNT(1) FROM #Permisos)>0
BEGIN 
SELECT Rol, Permiso, NivelPermiso FROM #Permisos
RETURN;
END
ELSE
BEGIN
SELECT 'Este usuario no tiene permisos en esta entidad.' [Resultado]
RETURN;
END
END;



