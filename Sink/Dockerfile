FROM debezium/connect:latest
USER root
RUN mkdir /wallet
USER kafka
COPY ojdbc8-full/* /kafka/libs/
COPY confluentinc-kafka-connect-jdbc-5.3.1/lib/* /kafka/libs/
COPY wallet/* /wallet/
