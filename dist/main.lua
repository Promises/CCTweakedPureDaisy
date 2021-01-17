require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 2,["7"] = 2,["8"] = 3,["9"] = 5,["10"] = 7,["11"] = 8,["12"] = 9,["13"] = 9,["14"] = 9,["15"] = 9,["16"] = 9,["17"] = 9,["18"] = 9,["21"] = 13,["23"] = 29,["25"] = 16,["26"] = 18,["27"] = 19,["29"] = 26,["34"] = 30,["35"] = 31,["36"] = 32,["40"] = 35,["41"] = 36});
local ____exports = {}
local ____turtle = require("world.turtle")
local Turtle = ____turtle.Turtle
local ____client = require("client")
local Client = ____client.Client
print("starting v1")
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
                c:listener()
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
