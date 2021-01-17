require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 4,["7"] = 4,["8"] = 4,["9"] = 12,["10"] = 17,["11"] = 19,["12"] = 20,["13"] = 21,["14"] = 12,["15"] = 24,["16"] = 25,["17"] = 26,["18"] = 26,["20"] = 27,["22"] = 24,["23"] = 31,["24"] = 32,["25"] = 32,["26"] = 32,["27"] = 32,["29"] = 33,["30"] = 34,["32"] = 31,["33"] = 39,["34"] = 40,["35"] = 40,["36"] = 40,["37"] = 41,["38"] = 42,["39"] = 42,["40"] = 42,["41"] = 42,["43"] = 43,["44"] = 44,["45"] = 45,["48"] = 48,["49"] = 39});
local ____exports = {}
local ____turtle = require("world.turtle")
local Turtle = ____turtle.Turtle
____exports.Client = __TS__Class()
local Client = ____exports.Client
Client.name = "Client"
function Client.prototype.____constructor(self, configPath)
    local data = ____exports.Client:loadConfigFile(configPath)
    self.websocketAddress = data.server
    self.websocketPort = data.port
    self.localTurtle = __TS__New(Turtle, configPath)
end
function Client.prototype.listener(self)
    while true do
        local data = {
            self.websocket:receive()
        }
        print(data)
    end
end
function Client.prototype.connectSocket(self)
    local ws = {
        http.websocket(
            (("ws://" .. tostring(self.websocketAddress)) .. "\"") .. tostring(self.websocketPort)
        )
    }
    if ws[1] then
        self.websocket = ws[1]
    end
end
function Client.loadConfigFile(self, configFile)
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
