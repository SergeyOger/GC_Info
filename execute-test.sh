mvn clean package
echo "----------------------------------------------------------------------------------------------"
echo 'Serial GC execution'
java -XX:+UseSerialGC -Xms100m -Xmx2000m -verbose:gc -jar target/gc-collectors-1.0-SNAPSHOT.jar
echo "----------------------------------------------------------------------------------------------"
echo "Paralel GC execution"
java -XX:+UseParallelGC -Xms300m -Xmx2000m -verbose:gc -jar target/gc-collectors-1.0-SNAPSHOT.jar
echo "----------------------------------------------------------------------------------------------"
echo "CMS GC execution"
java -XX:+UseConcMarkSweepGC -Xms300m -Xmx2000m -verbose:gc -jar target/gc-collectors-1.0-SNAPSHOT.jar
echo "----------------------------------------------------------------------------------------------"
echo "G1 GC execution"
java -XX:+UseG1GC -Xms300m -Xmx2000m -verbose:gc -jar target/gc-collectors-1.0-SNAPSHOT.jar
echo "----------------------------------------------------------------------------------------------"
echo "Z GC execution"
java -XX:+UnlockExperimentalVMOptions -XX:+UseZGC -Xms300m -Xmx2000m -verbose:gc -jar target/gc-collectors-1.0-SNAPSHOT.jar
