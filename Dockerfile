FROM kong/kong-gateway:3.13

USER root

COPY cluster.crt /etc/kong/cluster.crt
COPY cluster.key /etc/kong/cluster.key

# 1. Nom du folder qui contient le plugin
ARG PLUGIN_NAME=my-header-plugin

# 2. Creer le folder dans notre image docker pour recevoir le code du plugin
RUN mkdir -p /usr/local/share/lua/5.1/kong/plugins/${PLUGIN_NAME}

# 3. Copier notre fichier dans l'image docker
COPY ./custom_plugin/${PLUGIN_NAME}/schema.lua /usr/local/share/lua/5.1/kong/plugins/${PLUGIN_NAME}/schema.lua
COPY ./custom_plugin/${PLUGIN_NAME}/handler.lua /usr/local/share/lua/5.1/kong/plugins/${PLUGIN_NAME}/handler.lua

# 4. Ajouter notre plugin à la liste
# bundled = Tout les plugins de base
ENV KONG_PLUGINS=bundled,${PLUGIN_NAME}

USER kong