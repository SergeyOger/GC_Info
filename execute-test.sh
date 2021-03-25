mvn clean package
echo "----------------------------------------------------------------------------------------------"
echo 'Serial GC execution'
java -XX:+UseSerialGC -verbose:gc -jar target/gc-collectors-1.0-SNAPSHOT.jar
echo "----------------------------------------------------------------------------------------------"
echo "Paralel GC execution"
java -XX:+UseParallelGC -verbose:gc -jar target/gc-collectors-1.0-SNAPSHOT.jar
echo "----------------------------------------------------------------------------------------------"
echo "CMS GC execution"
java -XX:+UseConcMarkSweepGC -verbose:gc -jar target/gc-collectors-1.0-SNAPSHOT.jar
echo "----------------------------------------------------------------------------------------------"
echo "G1 GC execution"
java -XX:+UseG1GC -verbose:gc -jar target/gc-collectors-1.0-SNAPSHOT.jar
