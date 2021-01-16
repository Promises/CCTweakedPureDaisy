require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 6,["5"] = 6,["6"] = 10,["7"] = 12,["8"] = 13,["9"] = 14,["10"] = 14,["11"] = 14,["12"] = 14,["13"] = 14});
local ____exports = {}
local ____turtle = require("world.turtle")
local Turtle = ____turtle.Turtle
local dataJson = Turtle:findData()
if dataJson then
    if __TS__StringStartsWith(dataJson, "/disk") then
        Turtle:configFromDrive(
            ("/" .. tostring(
                Turtle:getDiskDrive()
            )) .. "/location.json"
        )
    end
end
return ____exports
