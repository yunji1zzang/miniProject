--����� ����

CREATE USER ugly_admin -- ���� �̸�
IDENTIFIED BY ugly_admin; -- ���� ���

SELECT USERNAME FROM DBA_USERS WHERE USERNAME='ugly_admin'; -- ���� Ȯ��

-- ���� �ο�

GRANT CONNECT,RESOURCE,DBA TO ugly_admin;

GRANT CREATE TABLE TO ugly_admin;

