mvn clean package
echo "----------------------------------------------------------------------------------------------"
echo 'Serial GC execution'
java -XX:+UseSerialGC -Xms6000m -Xmx6000m -verbose:gc -jar target/gc-collectors-1.0-SNAPSHOT.jar
echo "----------------------------------------------------------------------------------------------"
echo "Paralel GC execution"
java -XX:+UseParallelGC -Xms6000m -Xmx6000m -verbose:gc -jar target/gc-collectors-1.0-SNAPSHOT.jar
echo "----------------------------------------------------------------------------------------------"
echo "CMS GC execution"
java -XX:+UseConcMarkSweepGC -Xms6000m -Xmx6000m -verbose:gc -jar target/gc-collectors-1.0-SNAPSHOT.jar
echo "----------------------------------------------------------------------------------------------"
echo "G1 GC execution"
java -XX:+UseG1GC -Xms6000m -Xmx6000m -verbose:gc -jar target/gc-collectors-1.0-SNAPSHOT.jar
echo "----------------------------------------------------------------------------------------------"
echo "Z GC execution"
java -XX:+UseZGC -XX:ConcGCThreads=2 -Xms6000m -Xmx6000m -verbose:gc -jar target/gc-collectors-1.0-SNAPSHOT.jar
echo "----------------------------------------------------------------------------------------------"
echo "Epsilon GC execution"
java -XX:+UnlockExperimentalVMOptions -XX:+UseEpsilonGC -Xms6000m -Xmx6000m -verbose:gc -jar target/gc-collectors-1.0-SNAPSHOT.jar
