require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 2,["7"] = 2,["8"] = 4,["9"] = 4,["10"] = 4,["11"] = 10,["12"] = 11,["13"] = 12,["14"] = 13,["15"] = 14,["16"] = 10,["17"] = 17,["18"] = 18,["19"] = 19,["20"] = 19,["22"] = 20,["24"] = 17,["25"] = 24,["26"] = 25,["27"] = 26,["28"] = 26,["29"] = 26,["30"] = 27,["31"] = 27,["33"] = 28,["34"] = 29,["36"] = 31,["38"] = 24});
local ____exports = {}
local ____turtle = require("world.turtle")
local Turtle = ____turtle.Turtle
local ____data = require("world.data")
local loadConfigFile = ____data.loadConfigFile
____exports.Client = __TS__Class()
local Client = ____exports.Client
Client.name = "Client"
function Client.prototype.____constructor(self, configPath)
    local data = loadConfigFile(configPath)
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
    local url = (("ws://" .. tostring(self.websocketAddress)) .. ":") .. tostring(self.websocketPort)
    print(
        "connecting to " .. tostring(url)
    )
    local ws = {
        http.websocket(url)
    }
    if ws[1] then
        self.websocket = ws[1]
    else
        print(ws[2])
    end
end
return ____exports
