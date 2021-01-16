require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 2,["7"] = 2,["8"] = 4,["9"] = 5,["10"] = 6,["12"] = 8,["13"] = 9,["15"] = 11,["16"] = 12,["18"] = 14,["19"] = 15,["21"] = 4,["22"] = 19,["23"] = 20,["24"] = 19});
local ____exports = {}
local ____turtle = require("world.turtle")
local Direction = ____turtle.Direction
local ____Vector3 = require("world.grid.Vector3")
local Vector3 = ____Vector3.Vector3
function ____exports.getCoordInDirection(source, direction)
    if direction == Direction.North then
        return __TS__New(Vector3, source.x, source.y, source.z - 1)
    end
    if direction == Direction.East then
        return __TS__New(Vector3, source.x + 1, source.y, source.z)
    end
    if direction == Direction.South then
        return __TS__New(Vector3, source.x, source.y, source.z + 1)
    end
    if direction == Direction.West then
        return __TS__New(Vector3, source.x - 1, source.y, source.z)
    end
end
function ____exports.log(____string)
    print(____string)
end
return ____exports
