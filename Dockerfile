FROM openjdk:8-jre
ENTRYPOINT ["java", "-jar", "/usr/share/insecureforum-0.0.1-SNAPSHOT.war"]
ADD target/insecureforum-0.0.1-SNAPSHOT.war /usr/share/insecureforum-0.0.1-SNAPSHOT.war
