require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 6,["5"] = 7,["6"] = 7,["7"] = 8,["8"] = 8,["9"] = 9,["10"] = 9,["11"] = 10,["12"] = 10,["13"] = 22,["14"] = 22,["15"] = 22,["17"] = 22,["18"] = 177,["19"] = 178,["20"] = 179,["22"] = 245,["23"] = 177,["24"] = 248,["25"] = 249,["26"] = 250,["27"] = 250,["28"] = 250,["29"] = 250,["30"] = 248});
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
____exports.Turtle = __TS__Class()
local Turtle = ____exports.Turtle
Turtle.name = "Turtle"
function Turtle.prototype.____constructor(self)
end
function Turtle.findData(self)
    if fs.exists("/data/location.json") then
        return "/data/location.json"
    end
    return ""
end
function Turtle.getDiskDrive(self)
    local dirList = fs.list("/")
    return __TS__ArrayFind(
        dirList,
        function(____, s) return __TS__StringStartsWith(s, "disk") end
    )
end
return ____exports
