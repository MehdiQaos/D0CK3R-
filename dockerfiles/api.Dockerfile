FROM bitnami/git:2.43.0 as stage1

ARG REPO_LINK
ARG REPO_BRANCH

ENV BUILD_HOME=/app

WORKDIR $BUILD_HOME

RUN git clone --branch $REPO_BRANCH $REPO_LINK .


FROM maven:3.9.6-eclipse-temurin-17-alpine as build

ENV BUILD_HOME=/app

WORKDIR $BUILD_HOME

COPY --from=stage1 /app/. .

RUN [ "mvn", "clean", "package", "-DskipTests" ]


FROM bellsoft/liberica-openjre-alpine:17.0.9-11

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]