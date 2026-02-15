local typedefs = require "kong.db.schema.typedefs"

return {
  name = "my-header-plugin",
  fields = {
    {
      -- On s'assure que le plugin peut être appliquer à une route ou un service, mais pas à un consumers.
      -- https://github.com/Kong/kong/blob/master/kong/db/schema/typedefs.lua
      consumer = typedefs.no_consumer,
    },
    {
      protocols = typedefs.protocols_http
    },
    {
      config = {
        type = "record",
        fields = {
          { header_name = { type = "string", default = "X-Custom-Response" } },
          { header_value = { type = "string", default = "Hello-from-Konnect" } },
        },
      },
    },
  },
}