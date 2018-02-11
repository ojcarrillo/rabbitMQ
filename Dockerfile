#
# RabbitMQ Dockerfile
#
# https://github.com/dockerfile/rabbitmq
#

# Pull base image.
FROM ubuntu:16.04

# Install wget
RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y nano \
  && rm -rf /var/lib/apt/lists/*

# Add files.
ADD bin/rabbitmq-start /usr/local/bin/
ADD bin/rabbitmq-users /usr/local/bin/
ADD bin/definitions.json /etc/rabbitmq/

#ADD definitions.json /etc/rabbitmq/
#RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.config /etc/rabbitmq/definitions.json

# Install RabbitMQ.
RUN \
  wget -qO - https://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add - && \
  echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --allow-unauthenticated rabbitmq-server && \
  rm -rf /var/lib/apt/lists/* && \
  rabbitmq-plugins enable rabbitmq_management && \
  echo "[{rabbit, [{loopback_users, [] }, { rabbitmq_management, [ { load_definitions, "/etc/rabbitmq/definitions.json" } ] } ]}]." > /etc/rabbitmq/rabbitmq.config && \
  chmod +x /usr/local/bin/*

# Create user for mq_movctas
#RUN rabbitmqctl add_user usuario_mq_post prueba123 && \
#    rabbitmqctl set_permissions -p / usuario_mq_post "mq_movctas.*" ".*" "mq_movctas.*" 

# Define environment variables.
ENV RABBITMQ_LOG_BASE /data/log
ENV RABBITMQ_MNESIA_BASE /data/mnesia

# Define mount points.
VOLUME ["/data/log", "/data/mnesia"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["rabbitmq-start"]

#RUN  rabbitmqctl add_user b2c_client SuperPassword000
#RUN  rabbitmqctl set_permissions -p / b2c_client ".*" ".*" ".*"

#RUN sleep 10
#CMD ["rabbitmq-users"]

# Expose ports.
EXPOSE 5672
EXPOSE 15672
