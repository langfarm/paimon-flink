FROM --platform=${TARGETPLATFORM:-linux/amd64} flink:1.20

ARG MAVEN_MIRROR="https://maven.aliyun.com/repository/public"


RUN wget -O /opt/flink/lib/paimon-flink-1.20-0.9.0.jar \
    "${MAVEN_MIRROR}/org/apache/paimon/paimon-flink-1.20/0.9.0/paimon-flink-1.20-0.9.0.jar"
RUN wget -O /opt/flink/lib/paimon-flink-action-0.9.0.jar \
    "${MAVEN_MIRROR}/org/apache/paimon/paimon-flink-action/0.9.0/paimon-flink-action-0.9.0.jar"

# postgres cdc
RUN wget -O /opt/flink/lib/flink-sql-connector-postgres-cdc-3.2.1.jar \
    "${MAVEN_MIRROR}/org/apache/flink/flink-sql-connector-postgres-cdc/3.2.1/flink-sql-connector-postgres-cdc-3.2.1.jar"

RUN wget -O /opt/flink/lib/flink-sql-connector-kafka-3.4.0-1.20.jar \
    "${MAVEN_MIRROR}/org/apache/flink/flink-sql-connector-kafka/3.4.0-1.20/flink-sql-connector-kafka-3.4.0-1.20.jar"

# paimon
RUN wget -O /opt/flink/lib/commons-cli-1.9.0.jar \
    "${MAVEN_MIRROR}/commons-cli/commons-cli/1.9.0/commons-cli-1.9.0.jar"

RUN wget -O /opt/flink/lib/flink-shaded-hadoop-2-uber-2.8.3-10.0.jar \
    "${MAVEN_MIRROR}/org/apache/flink/flink-shaded-hadoop-2-uber/2.8.3-10.0/flink-shaded-hadoop-2-uber-2.8.3-10.0.jar"

RUN wget -O /opt/flink/lib/flink-connector-base-1.20.0.jar \
    "${MAVEN_MIRROR}/org/apache/flink/flink-connector-base/1.20.0/flink-connector-base-1.20.0.jar"

RUN wget -O /opt/flink/lib/paimon-s3-0.9.0.jar \
    "${MAVEN_MIRROR}/org/apache/paimon/paimon-s3/0.9.0/paimon-s3-0.9.0.jar"

COPY --chown=flink:flink docker/conf/config.yaml /opt/flink/conf/

ENV TZ='Asia/Shanghai'
