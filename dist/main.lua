--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____turtle = require("World.turtle")
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
