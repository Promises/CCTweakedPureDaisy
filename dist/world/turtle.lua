require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 2,["5"] = 2,["6"] = 3,["7"] = 3,["8"] = 4,["9"] = 4,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 9,["16"] = 9,["17"] = 10,["18"] = 10,["19"] = 13,["20"] = 29,["21"] = 29,["22"] = 29,["23"] = 36,["24"] = 34,["25"] = 37,["26"] = 38,["27"] = 39,["28"] = 40,["29"] = 41,["30"] = 42,["31"] = 36,["32"] = 46,["34"] = 47,["35"] = 47,["36"] = 48,["37"] = 49,["38"] = 47,["41"] = 46,["42"] = 53,["44"] = 54,["45"] = 54,["46"] = 55,["47"] = 56,["49"] = 54,["52"] = 59,["53"] = 53,["54"] = 62,["55"] = 63,["56"] = 64,["59"] = 67,["60"] = 68,["61"] = 69,["62"] = 70,["65"] = 72,["66"] = 72,["67"] = 73,["68"] = 74,["69"] = 72,["74"] = 78,["75"] = 79,["76"] = 80,["77"] = 81,["80"] = 83,["81"] = 83,["82"] = 84,["83"] = 85,["84"] = 83,["89"] = 89,["90"] = 62,["91"] = 92,["92"] = 92,["93"] = 92,["96"] = 93,["97"] = 93,["99"] = 94,["101"] = 95,["102"] = 96,["103"] = 97,["104"] = 98,["105"] = 99,["106"] = 100,["107"] = 101,["108"] = 102,["111"] = 105,["112"] = 93,["115"] = 92,["116"] = 109,["117"] = 109,["118"] = 109,["120"] = 110,["121"] = 111,["122"] = 112,["123"] = 113,["124"] = 114,["126"] = 109,["127"] = 118,["128"] = 119,["129"] = 120,["130"] = 121,["131"] = 118,["132"] = 124,["133"] = 125,["134"] = 126,["135"] = 127,["136"] = 124,["137"] = 130,["138"] = 131,["139"] = 132,["140"] = 133,["141"] = 130,["142"] = 136,["143"] = 137,["144"] = 137,["145"] = 137,["146"] = 137,["147"] = 136,["148"] = 140,["149"] = 141,["150"] = 142,["151"] = 142,["152"] = 142,["153"] = 143,["154"] = 144,["156"] = 146,["157"] = 140,["158"] = 149,["159"] = 150,["160"] = 150,["162"] = 151,["163"] = 152,["165"] = 154,["166"] = 149,["167"] = 157,["168"] = 158,["169"] = 158,["171"] = 159,["172"] = 160,["174"] = 162,["175"] = 157,["176"] = 165,["177"] = 166,["178"] = 166,["180"] = 167,["181"] = 168,["183"] = 170,["184"] = 165,["185"] = 173,["186"] = 173,["187"] = 173,["189"] = 174,["190"] = 175,["191"] = 176,["192"] = 173,["193"] = 179,["194"] = 180,["195"] = 181,["196"] = 182,["197"] = 183,["199"] = 185,["200"] = 179,["201"] = 188,["202"] = 189,["203"] = 190,["205"] = 192,["206"] = 193,["208"] = 195,["209"] = 195,["210"] = 195,["211"] = 195,["212"] = 195,["213"] = 196,["214"] = 196,["216"] = 197,["217"] = 198,["218"] = 200,["220"] = 201,["221"] = 201,["222"] = 202,["223"] = 202,["225"] = 203,["226"] = 204,["227"] = 205,["228"] = 206,["229"] = 206,["230"] = 206,["233"] = 209,["234"] = 201,["239"] = 213,["242"] = 218,["243"] = 188,["244"] = 221,["245"] = 222,["246"] = 223,["247"] = 223,["248"] = 223,["249"] = 223,["250"] = 221,["251"] = 226,["252"] = 227,["253"] = 228,["254"] = 226});
local ____exports = {}
local ____block = require("block")
local Block = ____block.Block
local ____direction = require("world.direction")
local stringToDirection = ____direction.stringToDirection
local ____client = require("client")
local Client = ____client.Client
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
____exports.Turtle = __TS__Class()
local Turtle = ____exports.Turtle
Turtle.name = "Turtle"
function Turtle.prototype.____constructor(self, configFile)
    self.inventory = {}
    local worldData = Client:loadConfigFile(configFile)
    self.currentDirection = stringToDirection(worldData.facing)
    self.currentX = worldData.x
    self.currentY = worldData.y
    self.currentZ = worldData.z
    self:refreshInventory()
end
function Turtle.prototype.refreshInventory(self)
    do
        local i = 0
        while i < 16 do
            local invItem = turtle.getItemDetail(i + 1)
            self.inventory[i + 1] = invItem
            i = i + 1
        end
    end
end
function Turtle.prototype.hasItems(self)
    do
        local i = 0
        while i < 16 do
            if self.inventory[i + 1] then
                return true
            end
            i = i + 1
        end
    end
    return false
end
function Turtle.prototype.setDirection(self, direction)
    local difference = self.currentDirection - direction
    if difference == 0 then
        return
    end
    if difference < 0 then
        if math.abs(difference) == 3 then
            turtle.turnLeft()
            os.sleep(0.4)
        else
            do
                local i = 0
                while i < math.abs(difference) do
                    turtle.turnRight()
                    os.sleep(0.4)
                    i = i + 1
                end
            end
        end
    end
    if difference > 0 then
        if math.abs(difference) == 3 then
            turtle.turnRight()
            os.sleep(0.4)
        else
            do
                local i = 0
                while i < math.abs(difference) do
                    turtle.turnLeft()
                    os.sleep(0.4)
                    i = i + 1
                end
            end
        end
    end
    self.currentDirection = direction
end
function Turtle.prototype.walk(self, steps)
    if steps == nil then
        steps = 1
    end
    do
        local i = 0
        while i < steps do
            if {
                turtle.forward()
            } then
                if self.currentDirection == ____exports.Direction.North then
                    self.currentZ = self.currentZ - 1
                elseif self.currentDirection == ____exports.Direction.West then
                    self.currentX = self.currentX + 1
                elseif self.currentDirection == ____exports.Direction.South then
                    self.currentZ = self.currentZ + 1
                elseif self.currentDirection == ____exports.Direction.East then
                    self.currentX = self.currentX - 1
                end
            end
            os.sleep(0.3)
            i = i + 1
        end
    end
end
function Turtle.prototype.dropDown(self, slot, forceUpdate)
    if forceUpdate == nil then
        forceUpdate = false
    end
    turtle.select(slot + 1)
    turtle.dropDown()
    os.sleep(0.1)
    if forceUpdate then
        self:refreshInventory()
    end
end
function Turtle.prototype.digDown(self)
    turtle.digDown()
    os.sleep(0.1)
    self:refreshInventory()
end
function Turtle.prototype.dig(self)
    turtle.dig()
    os.sleep(0.1)
    self:refreshInventory()
end
function Turtle.prototype.digUp(self)
    turtle.digUp()
    os.sleep(0.1)
    self:refreshInventory()
end
function Turtle.prototype.findInventorySlot(self, item)
    return __TS__ArrayFindIndex(
        self.inventory,
        function(____, i) return i and (i.name == item) end
    )
end
function Turtle.prototype.selectItem(self, item)
    local slot = self:findInventorySlot(item)
    print(
        (tostring(item) .. " found in slot ") .. tostring(slot)
    )
    if slot == -1 then
        return false
    end
    return turtle.select(slot + 1)
end
function Turtle.prototype.getBlockDown(self)
    local block = {
        turtle.inspectDown()
    }
    if block[1] then
        return block[2].name
    end
    return "minecraft:air"
end
function Turtle.prototype.getBlockUp(self)
    local block = {
        turtle.inspectUp()
    }
    if block[1] then
        return block[2].name
    end
    return "minecraft:air"
end
function Turtle.prototype.getBlock(self)
    local block = {
        turtle.inspect()
    }
    if block[1] then
        return block[2].name
    end
    return "minecraft:air"
end
function Turtle.prototype.placeDownSlot(self, slot)
    if slot == nil then
        slot = 1
    end
    turtle.select(slot)
    turtle.placeDown()
    os.sleep(0.1)
end
function Turtle.prototype.placeDown(self, item)
    if self:selectItem(item) then
        turtle.placeDown()
        os.sleep(0.1)
        return true
    end
    return false
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
    return "/data/location.json"
end
return ____exports
