--CREATE USER

CREATE USER [GimarisADF] FROM EXTERNAL PROVIDER;

ALTER ROLE db_owner ADD MEMBER [GimarisADF];

SELECT * FROM sys.database_principals WHERE name = 'GimarisADF';

SELECT * FROM sys.database_role_members WHERE member_principal_id = USER_ID('GimarisADF');