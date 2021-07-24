ps aux | grep '[a]bcdefg' | awk '{print $2}'

kill $(ps aux | grep '[a]bcdefg' | awk '{print $2}') > /dev/null 2>&1

sleep 5

ps aux | grep '[a]bcdefg'

echo "abcdefg is starting."

nohup java -XX:ErrorFile=./hs_err-abcdefg.log -XX:HeapDumpPath=./abcdefg.hprof -Xloggc:./abcdefg.log -XX:-HeapDumpOnOutOfMemoryError -verbose:gc -XX:-UseGCLogFileRotation -XX:-PrintGCDetails -XX:-PrintGCTimeStamps -XX:GCLogFileSize=8K -XX:NumberOfGCLogFiles=10 -jar -Xdebug -Xrunjdwp:server=y,transport=dt_socket,suspend=n,address=8011 -Djava.rmi.server.hostname=127.0.0.1 -Dcom.sun.management.jmxremote.port=8009 -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false abcdefg-0.0.1-SNAPSHOT.war --spring.profiles.active=dev &

sleep 10

ps aux | grep '[a]bcdefg' | awk '{print $2}'

ps -ef | grep '[a]bcdefg'

