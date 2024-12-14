FROM adoptopenjdk/openjdk11
ARG JAR_FILE=target/BackOfficeSystem-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} backofficesystem-app.jar
ENTRYPOINT ["java","-jar","/backofficesystem-app.jar"]