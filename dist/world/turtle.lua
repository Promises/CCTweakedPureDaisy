require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 2,["5"] = 2,["6"] = 3,["7"] = 3,["8"] = 6,["9"] = 7,["10"] = 7,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 10,["17"] = 22,["18"] = 22,["19"] = 22,["21"] = 22,["22"] = 177,["23"] = 178,["24"] = 179,["26"] = 245,["27"] = 177,["28"] = 248,["29"] = 249,["30"] = 250,["31"] = 250,["32"] = 250,["33"] = 250,["34"] = 248,["35"] = 253,["36"] = 254,["37"] = 255,["38"] = 255,["39"] = 255,["40"] = 256,["41"] = 257,["42"] = 258,["43"] = 259,["44"] = 259,["45"] = 259,["46"] = 260,["47"] = 264,["48"] = 265,["49"] = 266,["50"] = 267,["51"] = 268,["52"] = 269,["53"] = 270,["54"] = 271,["55"] = 272,["57"] = 283,["59"] = 253});
local ____exports = {}
local ____Vector3 = require("world.grid.Vector3")
local Vector3 = ____Vector3.Vector3
local ____utils = require("world.utils.utils")
local getCoordInDirection = ____utils.getCoordInDirection
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
function Turtle.configFromDrive(self, path)
    fs.copy(path, "/data/location.json")
    local fileHandle = ({
        fs.open("/data/location.json", "r")
    })[1]
    if fileHandle then
        local rawStr = fileHandle:readAll()
        fileHandle:close()
        local worldData = ({
            textutils.unserializeJSON(rawStr)
        })[1]
        local coordOfDiskDrive = __TS__New(Vector3, worldData.x, worldData.y, worldData.z)
        local turtleCoord
        if worldData.facing == "north" then
            turtleCoord = getCoordInDirection(coordOfDiskDrive, ____exports.Direction.South)
        elseif worldData.facing == "east" then
            turtleCoord = getCoordInDirection(coordOfDiskDrive, ____exports.Direction.West)
        elseif worldData.facing == "south" then
            turtleCoord = getCoordInDirection(coordOfDiskDrive, ____exports.Direction.North)
        elseif worldData.facing == "west" then
            turtleCoord = getCoordInDirection(coordOfDiskDrive, ____exports.Direction.East)
        end
        return "/data/location.json"
    end
end
return ____exports
