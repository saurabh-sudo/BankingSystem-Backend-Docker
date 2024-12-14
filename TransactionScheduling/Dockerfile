FROM adoptopenjdk/openjdk11
ARG JAR_FILE=target/TransactionScheduling-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} transactionscheduling-app.jar
ENTRYPOINT ["java","-jar","/transactionscheduling-app.jar"]