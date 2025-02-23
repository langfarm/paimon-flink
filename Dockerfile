FROM --platform=${TARGETPLATFORM:-linux/amd64} flink:1.20

ARG MAVEN_MIRROR="https://maven.aliyun.com/repository/public"


RUN wget -O /opt/flink/lib/paimon-flink-1.20-1.0.1.jar \
    "${MAVEN_MIRROR}/org/apache/paimon/paimon-flink-1.20/1.0.1/paimon-flink-1.20-1.0.1.jar"
RUN wget -O /opt/flink/lib/paimon-flink-action-1.0.1.jar \
    "${MAVEN_MIRROR}/org/apache/paimon/paimon-flink-action/1.0.1/paimon-flink-action-1.0.1.jar"

RUN wget -O /opt/flink/lib/flink-shaded-hadoop-2-uber-2.8.3-10.0.jar \
    "${MAVEN_MIRROR}/org/apache/flink/flink-shaded-hadoop-2-uber/2.8.3-10.0/flink-shaded-hadoop-2-uber-2.8.3-10.0.jar"

# connector cdc
RUN wget -O /opt/flink/lib/flink-sql-connector-postgres-cdc-3.3.0.jar \
    "${MAVEN_MIRROR}/org/apache/flink/flink-sql-connector-postgres-cdc/3.3.0/flink-sql-connector-postgres-cdc-3.3.0.jar"

RUN wget -O /opt/flink/lib/flink-sql-connector-kafka-3.4.0-1.20.jar \
    "${MAVEN_MIRROR}/org/apache/flink/flink-sql-connector-kafka/3.4.0-1.20/flink-sql-connector-kafka-3.4.0-1.20.jar"

RUN wget -O /opt/flink/lib/flink-connector-base-1.20.0.jar \
    "${MAVEN_MIRROR}/org/apache/flink/flink-connector-base/1.20.0/flink-connector-base-1.20.0.jar"

# 换 commons-cli 版本
# ./bin/flink 命令用到
RUN wget -O /opt/flink/lib/commons-cli-1.9.0.jar \
    "${MAVEN_MIRROR}/commons-cli/commons-cli/1.9.0/commons-cli-1.9.0.jar"

# oss/s3
RUN wget -O /opt/flink/lib/paimon-s3-1.0.1.jar \
    "${MAVEN_MIRROR}/org/apache/paimon/paimon-s3/1.0.1/paimon-s3-1.0.1.jar"

COPY --chown=flink:flink docker/conf/config.yaml /opt/flink/conf/

ENV TZ='Asia/Shanghai'
