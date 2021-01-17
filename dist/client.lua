require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 3,["7"] = 3,["8"] = 3,["9"] = 9,["10"] = 10,["11"] = 11,["12"] = 12,["13"] = 13,["14"] = 9,["15"] = 16,["16"] = 17,["17"] = 18,["18"] = 18,["20"] = 19,["22"] = 16,["23"] = 23,["24"] = 24,["25"] = 24,["26"] = 24,["27"] = 24,["29"] = 25,["30"] = 26,["32"] = 23,["33"] = 31,["34"] = 32,["35"] = 32,["36"] = 32,["37"] = 33,["38"] = 34,["39"] = 34,["40"] = 34,["41"] = 34,["43"] = 35,["44"] = 36,["45"] = 37,["48"] = 40,["49"] = 31});
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
