#!/bin/bash

if [ $# -ne 2 ]; then
        echo "Pleas input TWO parameters:System Name (like orbps/tsms) and App Type (like batch/web/service)"
        exit 1
else
        echo "System Name is $1, App Type is $2"
fi

SYSNAME=$1
APPTYPE=$2

. $HOME/.bash_profile
datestring=`date +"%Y%m%d%H%M%S"`

echo ""
echo ""
echo "start installing"

echo ""
echo ""
echo "step1 : set envionment variables"
sleep 2

DOMAIN_NAME=${SYSNAME}-${APPTYPE}-app
echo "your DOMAIN_NAME is $DOMAIN_NAME"
echo ""

ORACLE_SID=${SYSNAME}db
echo "your ORACLE_SID is $ORACLE_SID"
echo ""

cd $HOME
echo "backup .bash_profile"
mv $HOME/.bash_profile $HOME/.bak_bash_profile.$datestring

cd $HOME/initTool/
echo "create new .bash_profile"
cp $HOME/initTool/.bash_profile $HOME/.bash_profile

cd $HOME
echo "set .bash_profile"
sed -i "s/SYSNAME=/SYSNAME=$SYSNAME/g" .bash_profile
sed -i "s/DOMAIN_NAME=/DOMAIN_NAME=$DOMAIN_NAME/g" .bash_profile
sed -i "s/APPTYPE=/APPTYPE=$APPTYPE/g" .bash_profile
sed -i "s/ORACLE_SID=/ORACLE_SID=$ORACLE_SID/g" .bash_profile
sed -i "s/TWO_TASK=/TWO_TASK=$ORACLE_SID/g" .bash_profile

echo "take effect of .bash_profile"
. $HOME/.bash_profile

echo ""
echo ""

echo "step 2 : initializing directories"
sleep 2

cd $HOME

echo "create directory 'app'"
if test ! -d $HOME/app;then
mkdir $HOME/app
fi

echo "create directory 'oracle'"
if test ! -d $HOME/oracle;then
mkdir $HOME/oracle
fi

echo "create directory 'patch'"
if test ! -d $HOME/patch;then
mkdir $HOME/patch
fi

echo "create directory 'dump'"
if test ! -d $HOME/dump;then
mkdir $HOME/dump
fi

echo ""
echo ""

echo "step 3 : setting database connection"
sleep 2
cd $HOME/initTool/
cp $HOME/initTool/tnsnames.ora $HOME/oracle/tnsnames.ora

echo ""
echo ""

echo "step 4 : preparing weblogic"
sleep 2
cd $HOME/initTool/
cp .create-weblogic-domain.sh $HOME/initTool/create-weblogic-domain.sh
cp .weblogic.sh $HOME/initTool/weblogic.sh
cp .deploy.sh $HOME/app/deploy.sh
cp .undeploy.sh $HOME/app/undeploy.sh

echo ""
echo ""

echo "step 5 : auth rundeck"
sleep 2
cd $HOME/initTool/
#chmod +x $HOME/initTool/auth.sh
chmod +x $HOME/initTool/auth_rsync.sh
#sh $HOME/initTool/auth.sh
sh $HOME/initTool/auth_rsync.sh

sleep 3
echo ""
echo ""

echo "installing finish"
