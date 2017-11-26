#!/bin/bash
#check JAVA_OPTIONS


#set profile


source $HOME/.bash_profile

my_sh_path=/weblogic/Oracle/Middleware/Oracle_Home/oracle_common/common/bin

#set domain name
my_domain_path=$my_domain_path
echo 'my_domain_path=$my_domain_path'
#set admin port
my_admin_port=$my_admin_port
echo 'my_admin_port=$my_admin_port'
#set port 
my_domain_port=$my_domain_port
echo 'my_domain_port=$my_domain_port'

#set weblogic userName
weblogic_user=$weblogic_user
#set weblogic password
weblogic_pwd=$weblogic_pwd
#managed Node Name
managed_node_name=$managed_node_name


sh $my_sh_path/wlst.sh <<!
selectTemplate('Basic WebLogic Server Domain')
loadTemplates()
cd('Servers/AdminServer')
set('ListenPort',$my_admin_port)
set('TunnelingEnabled','true')
cd('/')
create('$managed_node_name','Server')
cd('Servers/$managed_node_name')
set('ListenPort',$my_domain_port)
set('TunnelingEnabled','true')
cd('/Security/base_domain/User/weblogic')
cmo.setName('$weblogic_user')
cmo.setUserPassword('$weblogic_pwd')
setOption('OverwriteDomain','true');
setOption('ServerStartMode','prod'); 
writeDomain('$my_domain_path') 
closeTemplate()
exit()
!


mkdir -p $my_domain_path/servers/AdminServer/security/
echo "username=$weblogic_user" > $my_domain_path/servers/AdminServer/security/boot.properties
echo "password=$weblogic_pwd" >> $my_domain_path/servers/AdminServer/security/boot.properties

mkdir -p $my_domain_path/servers/$managed_node_name/security/
echo "username=$weblogic_user" > $my_domain_path/servers/$managed_node_name/security/boot.properties
echo "password=$weblogic_pwd" >> $my_domain_path/servers/$managed_node_name/security/boot.properties

cd $my_domain_path/

if test ! -d $my_domain_path/nohup;then
mkdir $my_domain_path/nohup
fi

cd $HOME/initTool
cp .startManagedWebLogic.sh $my_domain_path/startManagedWebLogic.sh

cd $my_domain_path/
sed -i "s/managed_node_name/$managed_node_name/g" startManagedWebLogic.sh

ip=`hostname -I`
AdminUrl=$(echo $AdminUrl)
sed -i "s/ip/$ip/g" startManagedWebLogic.sh




