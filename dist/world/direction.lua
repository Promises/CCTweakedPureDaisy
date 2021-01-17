require("lualib_bundle");
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
