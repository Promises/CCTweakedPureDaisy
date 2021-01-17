require("lualib_bundle");
local ____exports = {}
function ____exports.loadConfigFile(configFile)
    local filehandle = ({
        fs.open(configFile, "r")
    })[1]
    if filehandle then
        local raw = {
            textutils.unserializeJSON(
                filehandle:readAll()
            )
        }
        filehandle:close()
        if raw[1] then
            return raw[1]
        end
    end
    return nil
end
return ____exports
