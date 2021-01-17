require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 2,["6"] = 2,["7"] = 3,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 8,["14"] = 16,["15"] = 17,["16"] = 17,["17"] = 17,["18"] = 17,["19"] = 18,["20"] = 19,["22"] = 21,["23"] = 16});
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
