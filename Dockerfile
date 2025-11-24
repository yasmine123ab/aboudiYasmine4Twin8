FROM openjdk:17
COPY jdk/ /usr/local/openjdk-17/
COPY target/*.jar /app.jar
ENV PATH="/usr/local/openjdk-17/bin:${PATH}"
ENTRYPOINT ["java","-jar","/app.jar"]
