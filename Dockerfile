FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM adoptopenjdk/openjdk11
COPY --from=build /app/BackOfficeSystem/target/BackOfficeSystem-0.0.1-SNAPSHOT.jar /app/backofficesystem-app.jar
COPY --from=build /app/OnlineBanking/target/OnlineBanking-0.0.1-SNAPSHOT.jar /app/onlinebanking-app.jar
COPY --from=build /app/TransactionScheduling/target/TransactionScheduling-0.0.1-SNAPSHOT.jar /app/transactionscheduling-app.jar

COPY --from=build /app/entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
EXPOSE 8081 8082 8083

