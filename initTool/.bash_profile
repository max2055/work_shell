# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs


#==========================================================
#==                                                      ==
#==                       ORACLE                         ==
#==                                                      ==
#==========================================================
export ORACLE_BASE=/oracle/app/oracle
export ORACLE_HOME=$ORACLE_BASE/product/11.2.0/client_1
export TNS_ADMIN=$HOME/oracle
export ORACLE_SID=
#export ORACLE_TERM=xterm
export NLS_DATE_FORMAT=YYYY-MM-DD
export NLS_LANG="SIMPLIFIED CHINESE_CHINA.ZHS32GB18030"


#==========================================================
#==                                                      ==
#==                        JAVA                          ==
#==                                                      ==
#==========================================================
export JAVA_OPTIONS='-Djava.security.egd=file:/dev/urandom'
export CONFIG_JVM_ARGS='-Djava.security.egd=file:/dev/urandom'
export DERBY_FLAG=false


#==========================================================
#==                                                      ==
#==                        APP                           ==
#==                                                      ==
#==========================================================
export SYSNAME=
export DOMAIN_NAME=
export APPTYPE=
export APPDIR=$HOME/app
export LOGDIR=$HOME/domains/$DOMAIN_NAME/logs/$SYSNAME/$APPTYPE/full

#==========================================================
#==                                                      ==
#==                        ENV                           ==
#==                                                      ==
#==========================================================
export TERM=vt100
export LANG=en_US.UTF-8
umask 022
export TWO_TASK=
export PS1='$LOGNAME'@`hostname`:'$PWD>'
export EDITOR=vi
export TMOUT=86400


#==========================================================
#==                                                      ==
#==                        PATH                          ==
#==                                                      ==
#==========================================================
export PATH=$PATH:$HOME/bin:$ORACLE_HOME/bin 




