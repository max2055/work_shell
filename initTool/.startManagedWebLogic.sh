cd ./bin

JAVA_OPTIONS="-Xms4g -Xmx4g -Dfile.encoding=UTF-8 -Djava.security.egd=file:/dev/urandom -XX:+PrintHeapAtGC -XX:+PrintGCDetails -XX:+PrintGCDateStamps  -Xloggc:$HOME/dump/gc_`date +%Y%m%d_%H%M%S`.log -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=$HOME/dump -XX:+UseG1GC"
export JAVA_OPTIONS

nohup ./startManagedWebLogic.sh managed_node_name http://ip:8848 >> ../nohup/nohup_`date +%Y%m%d_%H%M%S`.out &
