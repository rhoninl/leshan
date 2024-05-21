FROM maven:3.9-sapmachine-17 as builder

WORKDIR /app

COPY . .

RUN mvn clean install

FROM openjdk:11-jre-slim

WORKDIR /app

COPY --from=builder /app/leshan-client-demo/target/leshan-client-demo-2.0.0-SNAPSHOT-jar-with-dependencies.jar .
