FROM kong/kong-gateway:3.13

USER root

COPY cluster.crt /etc/kong/cluster.crt
COPY cluster.key /etc/kong/cluster.key

USER kong
