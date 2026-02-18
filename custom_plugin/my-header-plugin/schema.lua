local typedefs = require "kong.db.schema.typedefs"

return {
    name = "my-header-plugin",
    fields = {
        {
            -- On s'assure que le plugin peut être appliquer à une route ou un service, mais pas à un consumers.
            -- https://github.com/Kong/kong/blob/2eb75111a611af87e91c6aa4240eddd85fb6d121/kong/db/schema/typedefs.lua#L400
            consumer = typedefs.no_consumer,
        },
        {
            protocols = typedefs.protocols_http
        },
        {
            config = {
                type = "record",
                fields = {
                    { header_name = { type = "string", required = true, default = "X-Custom-Response", description = "The key of the header" } },
                    { header_value = { type = "string", required = true, default = "Hello-from-Konnect", description = "The value of the header" } },
                    { header_value_suffix = { type = "string", default = "Suffix", description = "If not empty, will add this value at the end of the 'header_value'" } },
                },
            },
        },
    },
}