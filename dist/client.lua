require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 2,["5"] = 2,["6"] = 4,["7"] = 4,["8"] = 4,["9"] = 12,["10"] = 16,["11"] = 16,["12"] = 16,["13"] = 17,["14"] = 18,["15"] = 18,["16"] = 18,["17"] = 18,["19"] = 19,["20"] = 20,["21"] = 21,["22"] = 21,["23"] = 21,["24"] = 21,["25"] = 21,["26"] = 22,["29"] = 26,["30"] = 27,["32"] = 12});
local ____exports = {}
local ____direction = require("world.direction")
local stringToDirection = ____direction.stringToDirection
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
            print(
                "" .. tostring(
                    stringToDirection(data.facing)
                )
            )
            print(data.server)
        end
    end
    if not filehandle then
        print("unable to load files")
    end
end
return ____exports
