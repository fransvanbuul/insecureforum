call mvn clean
call mvn dependency:copy-dependencies
call sourceanalyzer -b demo -clean
call sourceanalyzer -b demo -verbose -jdk 1.8 -cp "target\dependency\*.jar" "src\main\**\*"
call sourceanalyzer -b demo -scan
