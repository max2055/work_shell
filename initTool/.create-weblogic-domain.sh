
if [ $APPTYPE == "web" ]; then
    sh weblogic.sh $HOME/domains/$DOMAIN_NAME 9001
    
elif [ $APPTYPE == "service" ]; then
    sh weblogic.sh $HOME/domains/$DOMAIN_NAME 9002
    
elif [ $APPTYPE == "mobile" ]; then
    sh weblogic.sh $HOME/domains/$DOMAIN_NAME 9003
    
elif [ $APPTYPE == "batch" ]; then
    sh weblogic.sh $HOME/domains/$DOMAIN_NAME 9004
    
else
    exit 1
    
fi

