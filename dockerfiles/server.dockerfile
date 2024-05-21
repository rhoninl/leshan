FROM openjdk:11-jre-slim

WORKDIR /app

RUN apt-get update && apt-get install -y wget

RUN wget -O leshan-server-demo.jar https://ci.eclipse.org/leshan/job/leshan-ci/job/master/lastSuccessfulBuild/artifact/leshan-server-demo.jar

EXPOSE 5683/udp 5684/udp 8080/tcp

CMD ["java", "-jar", "leshan-server-demo.jar"]

# docker build -t leshan-server -f dockerfile.server .
# docker run -d -p 5683:5683/udp -p 5684:5684/udp -p 8080:8080/tcp leshan-server