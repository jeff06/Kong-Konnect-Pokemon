FROM kong/kong-gateway:3.13

USER root

COPY cluster.crt /etc/kong/cluster.crt
COPY cluster.key /etc/kong/cluster.key

# Define the plugin name
ARG PLUGIN_NAME=my-header-plugin

# 1. Create the plugin directory
RUN mkdir -p /usr/local/share/lua/5.1/kong/plugins/${PLUGIN_NAME}

# 2. Copy your Lua files into the image
# Assumes your files are in a local folder named 'my-plugin-folder'
COPY ./custom_plugin/${PLUGIN_NAME}/schema.lua /usr/local/share/lua/5.1/kong/plugins/${PLUGIN_NAME}/schema.lua
COPY ./custom_plugin/${PLUGIN_NAME}/handler.lua /usr/local/share/lua/5.1/kong/plugins/${PLUGIN_NAME}/handler.lua

# 3. Tell Kong to load your custom plugin along with the default ones
ENV KONG_PLUGINS=bundled,${PLUGIN_NAME}

USER kong