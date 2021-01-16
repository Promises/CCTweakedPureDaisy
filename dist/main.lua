require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 5,["5"] = 5,["6"] = 10,["7"] = 10,["8"] = 10,["9"] = 14,["10"] = 14,["11"] = 14,["12"] = 14,["13"] = 14,["14"] = 14,["15"] = 14});
local ____exports = {}
local ____turtle = require("world.turtle")
local Turtle = ____turtle.Turtle
print(
    Turtle:getDiskDrive()
)
print(
    Turtle:configFromDrive(
        ("/" .. tostring(
            Turtle:getDiskDrive()
        )) .. "/location.json"
    )
)
return ____exports
