drop user LQBASE_CI_BUILD cascade;

Create user LQBASE_CI_BUILD identified by LQBaseBuild##123
default TABLESPACE USERS;

ALTER USER LQBASE_CI_BUILD QUOTA UNLIMITED ON USERS;

Grant connect, resource to LQBASE_CI_BUILD;

Grant create view to LQBASE_CI_BUILD;
Grant create synonym to LQBASE_CI_BUILD;