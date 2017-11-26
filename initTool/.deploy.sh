#!/bin/sh -
/weblogic/Oracle/Middleware/Oracle_Home/oracle_common/common/bin/wlst.sh << !


connect('weblogic','Weblogic_123','t3://localhost:8848')
deploy('clbps-service-app','$HOME/app/clbps-service-app.war',remote='true',upload='true')
startApplication($DOMAIN_NAME)
disconnect()


exit()
!
