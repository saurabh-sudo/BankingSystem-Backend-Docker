#!/bin/bash

# Start the BackOffice application on port 8081
echo "Starting BackOffice service..."
java -jar /app/backofficesystem-app.jar --server.port=8080 &
BACKOFFICE_PID=$!
echo "BackOffice service started with PID $BACKOFFICE_PID"

# Start the OnlineBanking application on port 8082
echo "Starting OnlineBanking service..."
java -jar /app/onlinebanking-app.jar --server.port=8081 &
ONLINEBANKING_PID=$!
echo "OnlineBanking service started with PID $ONLINEBANKING_PID"

# Start the TransactionScheduling application on port 8083
echo "Starting TransactionScheduling service..."
java -jar /app/transactionscheduling-app.jar --server.port=8082 &
TRANSACTIONSCHEUDLING_PID=$!
echo "TransactionScheduling service started with PID $TRANSACTIONSCHEUDLING_PID"

# Wait for all services to finish
wait $BACKOFFICE_PID
wait $ONLINEBANKING_PID
wait $TRANSACTIONSCHEUDLING_PID

echo "All services have completed."