#FROM adoptopenjdk/openjdk11
##WORKDIR /app
#ARG JAR_FILE=./BackOfficeSystem/target/BackOfficeSystem-0.0.1-SNAPSHOT.jar
#COPY ${JAR_FILE} backofficesystem-app.jar
#ENTRYPOINT ["java","-jar","/app/backofficesystem-app.jar"]


#FROM adoptopenjdk/openjdk11
#WORKDIR /app
#ARG JAR_FILE=target/OnlineBanking-0.0.1-SNAPSHOT.jar
#COPY ${JAR_FILE} app/onlinebanking-app.jar
##ENTRYPOINT ["java","-jar","/app/onlinebanking-app.jar"]
#
#FROM adoptopenjdk/openjdk11
#WORKDIR /app
#ARG JAR_FILE=target/TransactionScheduling-0.0.1-SNAPSHOT.jar
#COPY ${JAR_FILE} app/transactionscheduling-app.jar
#ENTRYPOINT ["java","-jar","/app/transactionscheduling-app.jar"]

#RUN chmod +x ./mvnw

# Step 1: Build Stage for BackOffice
#FROM adoptopenjdk/openjdk11 AS backoffice_build
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app
COPY . .
#COPY ./BackOfficeSystem/ ./
RUN mvn clean package -DskipTests


FROM adoptopenjdk/openjdk11
#WORKDIR /app
#ARG JAR_FILE=./BackOfficeSystem/target/BackOfficeSystem-0.0.1-SNAPSHOT.jar
COPY --from=build /app/BackOfficeSystem/target/BackOfficeSystem-0.0.1-SNAPSHOT.jar /app/backofficesystem-app.jar
COPY --from=build /app/OnlineBanking/target/OnlineBanking-0.0.1-SNAPSHOT.jar /app/onlinebanking-app.jar
COPY --from=build /app/TransactionScheduling/target/TransactionScheduling-0.0.1-SNAPSHOT.jar /app/transactionscheduling-app.jar

# Set the entrypoint script
#WORKDIR /app
COPY --from=build /app/entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]
ENTRYPOINT ["/app/entrypoint.sh"]

# Expose the necessary ports (example for Spring Boot apps)
EXPOSE 8081 8082 8083

#ENTRYPOINT ["java","-jar","/app/backofficesystem-app.jar"]


#FROM adoptopenjdk/openjdk11
#WORKDIR /app
#ARG JAR_FILE=target/OnlineBanking-0.0.1-SNAPSHOT.jar


#ENTRYPOINT ["java","-jar","/app/onlinebanking-app.jar"]

#FROM adoptopenjdk/openjdk11
#WORKDIR /app
##ARG JAR_FILE=target/TransactionScheduling-0.0.1-SNAPSHOT.jar
#COPY --from=build /app/TransactionScheduling/target/TransactionScheduling-0.0.1-SNAPSHOT.jar /app/transactionscheduling-app.jar
#ENTRYPOINT ["java","-jar","/app/transactionscheduling-app.jar"]

## Step 2: Build Stage for OnlineBanking
#FROM adoptopenjdk/openjdk11 AS onlinebanking_build
#WORKDIR /app
#COPY ./OnlineBanking/ ./
#RUN ./mvnw clean package -DskipTests
#
## Step 3: Build Stage for TransactionScheduling
#FROM adoptopenjdk/openjdk11 AS transactionscheduling_build
#WORKDIR /app
#COPY ./TransactionScheduling/ ./
#RUN ./mvnw clean package -DskipTests
#
## Final Image (runtime)
#FROM adoptopenjdk/openjdk11
#WORKDIR /app
#
## Copy built JARs from respective stages into the final image
#COPY --from=backoffice_build /app/target/backoffice-*.jar /app/backoffice.jar
#COPY --from=onlinebanking_build /app/target/onlinebanking-*.jar /app/onlinebanking.jar
#COPY --from=transactionscheduling_build /app/target/transactionscheduling-*.jar /app/transactionscheduling.jar


## Set the entrypoint script
##WORKDIR /app
##COPY entrypoint.sh /entrypoint.sh
##RUN chmod +x /entrypoint.sh
##ENTRYPOINT ["entrypoint.sh"]
#ENTRYPOINT ["/entrypoint.sh"]
#
## Expose the necessary ports (example for Spring Boot apps)
#EXPOSE 8081 8082 8083

# Run the entrypoint script by default


# Expose the ports for each app
#EXPOSE 8081 8082 8083

#CMD ["java", "-jar", "backofficesystem-app.jar"]
#CMD ["java", "-jar", "onlinebanking-app.jar"]
#CMD ["java", "-jar", "transactionscheduling-app.jar"]

## Add the entrypoint script into the container
#COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
#
## Set the entrypoint to the script
#ENTRYPOINT ["/entrypoint.sh"]

