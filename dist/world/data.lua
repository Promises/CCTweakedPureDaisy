require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 10,["5"] = 11,["6"] = 11,["7"] = 11,["8"] = 12,["9"] = 13,["10"] = 13,["11"] = 13,["12"] = 13,["14"] = 14,["15"] = 15,["16"] = 16,["19"] = 19,["20"] = 10});
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
