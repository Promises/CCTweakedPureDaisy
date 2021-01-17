require("lualib_bundle");
local ____exports = {}
local ____turtle = require("world.turtle")
local Turtle = ____turtle.Turtle
local ____client = require("client")
local Client = ____client.Client
print("starting v0.0.9")
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
                parallel.waitForAll(
                    function() return c:listener() end,
                    function() return c:listenForTerminate() end
                )
            else
                print("not connected")
            end
        end
    )
    if not ____try then
        print(e)
        if c.websocket then
            c.websocket.close()
        end
    end
end
if c.websocket then
    c.websocket.close()
end
return ____exports
