FROM openjdk:8 AS builder
ENV BUILD_HOME=/usr/app/builder
WORKDIR $BUILD_HOME
ADD . $BUILD_HOME
RUN ./gradlew build
RUN ./gradlew installDist

FROM openjdk:8-jre-alpine AS runner
ENV BUILD_HOME=/usr/app/builder
ENV RUN_HOME=/usr/app/runner
ENV SERVER=logesh-service-server
ENV EXECUTABLE=logesh-server
WORKDIR $RUN_HOME
COPY --from=builder $BUILD_HOME/$SERVER/build/install .
EXPOSE 50051
CMD ./$SERVER/bin/$EXECUTABLE
