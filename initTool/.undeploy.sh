#!/bin/sh -
/weblogic/Oracle/Middleware/Oracle_Home/oracle_common/common/bin/wlst.sh << !


connect('weblogic','Weblogic_123','t3://localhost:8848')
stopApplication($DOMAIN_NAME)
undeploy($DOMAIN_NAME)
disconnect()


exit()
!
