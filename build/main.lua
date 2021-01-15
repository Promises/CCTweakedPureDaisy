--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____turtle = require("World.turtle")
local Turtle = ____turtle.Turtle
local t = __TS__New(Turtle)
print(t.inventory)
print(
    t:getFuel()
)
t:walkTo(0, 3)
t:walkTo(3, 3)
t:setDirection(3)
return ____exports
