# ejecuta el container de rabbitmq
docker run \
--name dk_rabbitmq \
-d -p 5672:5672 -p 15672:15672 \
--hostname my-rabbit \
-v /volume/docker/rabbitmq/data/log:/data/log \
-v /volume/docker/rabbitmq/data/mnesia:/data/mnesia \
 dk_rabbitmq
