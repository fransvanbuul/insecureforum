@echo off
echo Fortify Scan Starting
call mvn verify -B
call mvn dependency:copy-dependencies
sourceanalyzer -b insecureforum_java -verbose -jdk 1.8 -cp target/dependency/*.jar src/main/java src/main/webapp
sourceanalyzer -b insecureforum_js -verbose src/main/resources/static/js
sourceanalyzer -b insecureforum_java -scan -f insecureforum_java.fpr
sourceanalyzer -b insecureforum_js -scan -f insecureforum_js.fpr

