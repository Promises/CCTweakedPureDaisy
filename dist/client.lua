require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 3,["5"] = 3,["6"] = 3,["7"] = 11,["8"] = 15,["9"] = 15,["10"] = 15,["11"] = 16,["12"] = 17,["13"] = 17,["14"] = 17,["15"] = 17,["17"] = 18,["18"] = 19,["19"] = 20,["22"] = 24,["23"] = 25,["25"] = 11});
local ____exports = {}
____exports.Client = __TS__Class()
local Client = ____exports.Client
Client.name = "Client"
function Client.prototype.____constructor(self, configPath)
    local filehandle = ({
        fs.open(configPath, "r")
    })[1]
    if filehandle then
        local raw = {
            textutils.unserializeJSON(
                filehandle:readAll()
            )
        }
        if raw[1] then
            local data = raw[1]
            print(data)
        end
    end
    if not filehandle then
        print("unable to load files")
    end
end
return ____exports
