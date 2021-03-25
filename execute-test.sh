# -verbose:gc - simplifyed output
# -Xlog:gc*   - full logs

mvn clean package

echo "----------------------------------------------------------------------------------------------"
echo 'Serial GC execution'
java -XX:+UseSerialGC -Xms512m -Xmx2000m -verbose:gc -jar target/gc-collectors-configuration-test.jar
echo "----------------------------------------------------------------------------------------------"

echo "----------------------------------------------------------------------------------------------"
echo "Paralel GC execution"
java -XX:+UseParallelGC -Xms512m -Xmx2000m -verbose:gc -jar target/gc-collectors-configuration-test.jar
echo "----------------------------------------------------------------------------------------------"

echo "----------------------------------------------------------------------------------------------"
echo "CMS GC execution"
java -XX:+UseConcMarkSweepGC -Xms512m -Xmx2000m -verbose:gc -jar target/gc-collectors-configuration-test.jar
echo "----------------------------------------------------------------------------------------------"

echo "----------------------------------------------------------------------------------------------"
echo "G1 GC execution"
java -XX:+UseG1GC -Xms512m -Xmx2000m -verbose:gc -jar target/gc-collectors-configuration-test.jar
echo "----------------------------------------------------------------------------------------------"

echo "----------------------------------------------------------------------------------------------"
echo "Z GC execution"
java -XX:+UnlockExperimentalVMOptions -XX:+UseZGC -Xms512m -Xmx2000m -verbose:gc -jar target/gc-collectors-configuration-test.jar
echo "----------------------------------------------------------------------------------------------"

echo "----------------------------------------------------------------------------------------------"
echo "Epsilon GC execution"
java -XX:+UnlockExperimentalVMOptions -XX:+UseEpsilonGC -Xms512m -Xmx2000m -verbose:gc -jar target/gc-collectors-configuration-test.jar
echo "----------------------------------------------------------------------------------------------"
