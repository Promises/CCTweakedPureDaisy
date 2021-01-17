require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 2,["7"] = 2,["8"] = 4,["9"] = 6,["10"] = 7,["11"] = 8,["12"] = 8,["13"] = 8,["14"] = 8,["15"] = 8,["16"] = 8,["17"] = 8,["20"] = 12,["21"] = 13,["22"] = 15,["23"] = 16,["24"] = 16,["25"] = 16,["26"] = 17,["27"] = 18,["29"] = 16,["30"] = 16,["32"] = 22});
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
c:connectSocket()
if c.websocket then
    parallel.waitForAll(
        function() return c:listener() end,
        function()
            while true do
                turtle.turnLeft()
            end
        end
    )
end
print("not connected")
return ____exports
