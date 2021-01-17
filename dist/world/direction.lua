require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 3,["5"] = 4,["6"] = 4,["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 10,["14"] = 18,["15"] = 19,["16"] = 19,["17"] = 19,["18"] = 19,["19"] = 20,["20"] = 21,["22"] = 23,["23"] = 18});
local ____exports = {}
____exports.Direction = {}
____exports.Direction.North = 0
____exports.Direction[____exports.Direction.North] = "North"
____exports.Direction.West = 1
____exports.Direction[____exports.Direction.West] = "West"
____exports.Direction.South = 2
____exports.Direction[____exports.Direction.South] = "South"
____exports.Direction.East = 3
____exports.Direction[____exports.Direction.East] = "East"
____exports.VerboseDirection = {"North", "West", "South", "East"}
function ____exports.stringToDirection(s)
    local direction = __TS__ArrayFindIndex(
        ____exports.VerboseDirection,
        function(____, dir) return string.lower(dir) == string.lower(s) end
    )
    if direction then
        return direction
    end
    return 0
end
return ____exports
