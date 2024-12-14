FROM adoptopenjdk/openjdk11
ARG JAR_FILE=target/OnlineBanking-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} onlinebanking-app.jar
ENTRYPOINT ["java","-jar","/onlinebanking-app.jar"]