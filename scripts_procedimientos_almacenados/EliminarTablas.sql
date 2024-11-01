
CREATE PROCEDURE spEliminarTablas
as
BEGIN 
IF (SELECT COUNT(1) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME <> 'sysdiagrams')> 0 
BEGIN
	DROP TABLE IF EXISTS PermiRole;
	DROP TABLE IF EXISTS PermiUser;
	DROP TABLE IF EXISTS PermiRoleRecord;
	DROP TABLE IF EXISTS PermiUserRecord;
	DROP TABLE IF EXISTS EntityCatalog;
	DROP TABLE IF EXISTS Permission;
	DROP TABLE IF EXISTS UserCompany;
	DROP TABLE IF EXISTS [User];
	DROP TABLE IF EXISTS [Role];
	DROP TABLE IF EXISTS CostCenter;
	DROP TABLE IF EXISTS BranchOffice;
	DROP TABLE IF EXISTS Company;

	SELECT 'Tablas eliminadas exitosamente.'
END
ELSE
BEGIN
SELECT 'No existen tablas para eliminar.'
END
END


--DROP PROCEDURE spEliminarTablas
--EXEC spEliminarTablas

