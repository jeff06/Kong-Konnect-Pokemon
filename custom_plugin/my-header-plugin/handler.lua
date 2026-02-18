local MyHeaderHandler = {
    -- Plus le chiffre est haut, plus le plugin va router tôt.
    -- https://developer.konghq.com/gateway/entities/plugin/#plugin-priority
    PRIORITY = 1000,
    VERSION = "0.1.0",
}

function MyHeaderHandler:header_filter(conf)
    local mergedHeader = mergeIfNotEmpty(conf.header_value, conf.header_value_suffix, "-")
    -- 'conf' contient les valeurs passer dans le plugin. 
    -- donc, conf contient les valeurs 'header_name' et 'header_value' de schema.lua
    kong.response.set_header(conf.header_name, mergedHeader)
end

function isEmptyOrNil(s)
    -- Both false and nil are considered false in Lua control structures.
    -- The number 0 and the empty string are considered true.
    -- So we must explicitly check for nil and the empty string.
    return s == nil or s == ''
end

function mergeIfNotEmpty(str1, str2, separator)
    separator = separator or " " -- Default separator is a space

    local result = ""

    if not isEmptyOrNil(str1) then
        result = result .. str1
    end

    if not isEmptyOrNil(str2) then
        -- Add separator if result is not empty yet
        if result ~= "" then
            result = result .. separator
        end
        result = result .. str2
    end

    return result
end

return MyHeaderHandler