require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 2,["5"] = 2,["6"] = 3,["7"] = 3,["8"] = 4,["9"] = 4,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 9,["16"] = 9,["17"] = 10,["18"] = 10,["19"] = 22,["20"] = 22,["21"] = 22,["23"] = 22,["24"] = 177,["25"] = 178,["26"] = 179,["28"] = 181,["29"] = 182,["31"] = 184,["32"] = 184,["33"] = 184,["34"] = 184,["35"] = 184,["36"] = 185,["37"] = 185,["39"] = 186,["40"] = 187,["41"] = 189,["43"] = 190,["44"] = 190,["45"] = 191,["46"] = 191,["48"] = 192,["49"] = 193,["50"] = 194,["51"] = 195,["52"] = 195,["53"] = 195,["56"] = 198,["57"] = 190,["62"] = 239,["65"] = 244,["66"] = 177,["67"] = 247,["68"] = 248,["69"] = 249,["70"] = 249,["71"] = 249,["72"] = 249,["73"] = 247,["74"] = 252,["75"] = 253,["76"] = 254,["77"] = 254,["78"] = 254,["79"] = 255,["80"] = 256,["81"] = 257,["82"] = 258,["83"] = 258,["84"] = 258,["85"] = 259,["86"] = 263,["87"] = 264,["88"] = 265,["89"] = 266,["90"] = 267,["91"] = 268,["92"] = 269,["93"] = 270,["94"] = 271,["96"] = 274,["97"] = 274,["98"] = 274,["99"] = 275,["100"] = 275,["101"] = 275,["102"] = 275,["103"] = 275,["104"] = 281,["105"] = 282,["107"] = 252});
local ____exports = {}
local ____Vector3 = require("world.grid.Vector3")
local Vector3 = ____Vector3.Vector3
local ____utils = require("world.utils.utils")
local getCoordInDirection = ____utils.getCoordInDirection
local ____block = require("block")
local Block = ____block.Block
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
    if not ____exports.Turtle:getDiskDrive() then
        return nil
    end
    if fs.exists(
        ("/" .. tostring(
            ____exports.Turtle:getDiskDrive()
        )) .. "/location.json"
    ) then
        local block = {
            turtle.inspectDown()
        }
        if block[1] then
            if block[2].name == Block.Lapis_Block then
                local found = nil
                do
                    local i = 0
                    while i < 4 do
                        local diskDrive = {
                            turtle.inspect()
                        }
                        if diskDrive[1] then
                            if diskDrive[2].name == Block.Disk_Drive then
                                found = diskDrive[2]
                                return ("/" .. tostring(
                                    ____exports.Turtle:getDiskDrive()
                                )) .. "/location.json"
                            end
                        end
                        turtle.turnLeft()
                        i = i + 1
                    end
                end
            end
        else
            print("couldnt find lapis block")
        end
    end
    return nil
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
        local writeHandle = ({
            fs.open("/data/location.json", "w")
        })[1]
        writeHandle:write(
            textutils.serializeJSON(
                __TS__ObjectAssign({}, worldData, {x = turtleCoord.x, y = turtleCoord.y, z = turtleCoord.z})
            )
        )
        writeHandle:close()
        return "/data/location.json"
    end
end
return ____exports
