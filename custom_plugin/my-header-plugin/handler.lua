local MyHeaderHandler = {
    -- Plus le chiffre est haut, plus le plugin va router tôt.
    -- https://developer.konghq.com/gateway/entities/plugin/#plugin-priority
    PRIORITY = 1000,
    VERSION = "0.1.0",
}

function MyHeaderHandler:header_filter(conf)
    -- 'conf' contient les valeurs passer dans le plugin. 
    -- donc, conf contient les valeurs 'header_name' et 'header_value' de schema.lua
    kong.response.set_header(conf.header_name, conf.header_value)
end

return MyHeaderHandler