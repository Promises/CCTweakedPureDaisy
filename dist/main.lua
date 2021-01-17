require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 2,["7"] = 2,["8"] = 3,["9"] = 5,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 7,["14"] = 7,["15"] = 7,["16"] = 7,["17"] = 7,["20"] = 11,["22"] = 26,["24"] = 14,["25"] = 16,["27"] = 23,["32"] = 27,["33"] = 28,["34"] = 29,["38"] = 32,["39"] = 33});
local ____exports = {}
local ____turtle = require("world.turtle")
local Turtle = ____turtle.Turtle
local ____client = require("client")
local Client = ____client.Client
local dataJson = Turtle:findData()
if dataJson then
    if __TS__StringStartsWith(dataJson, "/disk") then
        print(
            Turtle:configFromDrive(
                ("/" .. tostring(
                    Turtle:getDiskDrive()
                )) .. "/location.json"
            )
        )
    end
end
local c = __TS__New(Client, dataJson)
do
    local ____try, e = pcall(
        function()
            c:connectSocket()
            if c.websocket then
            else
                print("not connected")
            end
        end
    )
    if not ____try then
        print(e)
        if c.websocket then
            c.websocket:close()
        end
    end
end
if c.websocket then
    c.websocket:close()
end
return ____exports
