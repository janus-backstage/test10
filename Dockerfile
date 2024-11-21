FROM registry.access.redhat.com/ubi8/ubi-minimal:8.5

MAINTAINER sgutierr

LABEL BASE_IMAGE="registry.access.redhat.com/ubi8/ubi-minimal:8.5"
LABEL JAVA_VERSION="17"

RUN microdnf install --nodocs java-17-openjdk-headless && microdnf clean all

WORKDIR /work/
COPY target/*.jar /work/application.jar

EXPOSE 8080
CMD ["java", "-jar", "application.jar"]
