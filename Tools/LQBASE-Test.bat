cd C:\Users\opc\Desktop\SONY\Liquibase\LQBASE_TEST

liquibase --outputFile=mydiff_DEV_TEST_Before.txt ^
--referenceUrl="jdbc:oracle:thin:@152.67.2.223:1521/ltidbpdb.publicsubnet.commonvcn.oraclevcn.com" ^
--referenceUsername=LQBASE_DEV ^
--referencePassword=LQBasedev##123 ^
diff

cd C:\Users\opc\Desktop\SONY\Liquibase\LQBASE_TEST

liquibase --changeLogFile=dbchangelog_DEV_TEST.xml ^
--outputFile=mydiff_DEV_TEST.txt ^
--referenceUrl="jdbc:oracle:thin:@152.67.2.223:1521/ltidbpdb.publicsubnet.commonvcn.oraclevcn.com" ^
--referenceUsername=LQBASE_DEV ^
--referencePassword=LQBasedev##123 ^
diffChangeLog

cd C:\Users\opc\Desktop\SONY\Liquibase\LQBASE_TEST

liquibase --changeLogFile=C:\Users\opc\Desktop\SONY\Liquibase\LQBASE_TEST\dbchangelog_DEV_TEST.xml update

cd C:\Users\opc\Desktop\SONY\Liquibase\LQBASE_TEST
liquibase --outputFile=mydiff_DEV_TEST_After.txt ^
--referenceUrl="jdbc:oracle:thin:@152.67.2.223:1521/ltidbpdb.publicsubnet.commonvcn.oraclevcn.com" ^
--referenceUsername=LQBASE_DEV ^
--referencePassword=LQBasedev##123 ^
diff