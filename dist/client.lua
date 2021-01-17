require("lualib_bundle");
local ____exports = {}
local ____turtle = require("world.turtle")
local Turtle = ____turtle.Turtle
local ____data = require("world.data")
local loadConfigFile = ____data.loadConfigFile
____exports.Client = __TS__Class()
local Client = ____exports.Client
Client.name = "Client"
function Client.prototype.____constructor(self, configPath)
    self.running = false
    local data = loadConfigFile(configPath)
    self.websocketAddress = data.server
    self.websocketPort = data.port
    self.localTurtle = __TS__New(Turtle, configPath)
end
function Client.prototype.listener(self)
    self.running = true
    while self.running do
        self:handleAction(
            ({
                self.websocket.receive()
            })[1]
        )
    end
end
function Client.prototype.listenForTerminate(self)
    local key
    repeat
        do
            local b = {
                os.pullEvent("key")
            }
            print(b[2])
        end
    until not true
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
function Client.prototype.handleAction(self, receiveElement)
    if receiveElement == "" then
    else
        print("Unknown action:")
        print(receiveElement)
    end
end
return ____exports
