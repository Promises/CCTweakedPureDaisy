require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 2,["5"] = 2,["6"] = 3,["7"] = 3,["8"] = 4,["9"] = 4,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 9,["16"] = 9,["17"] = 10,["18"] = 10,["19"] = 13,["20"] = 29,["21"] = 29,["22"] = 29,["23"] = 37,["24"] = 35,["25"] = 38,["26"] = 39,["27"] = 40,["28"] = 41,["29"] = 42,["30"] = 43,["31"] = 37,["32"] = 47,["34"] = 48,["35"] = 48,["36"] = 49,["37"] = 50,["38"] = 48,["41"] = 47,["42"] = 54,["44"] = 55,["45"] = 55,["46"] = 56,["47"] = 57,["49"] = 55,["52"] = 60,["53"] = 54,["54"] = 63,["55"] = 64,["56"] = 65,["59"] = 68,["60"] = 69,["61"] = 70,["62"] = 71,["65"] = 73,["66"] = 73,["67"] = 74,["68"] = 75,["69"] = 73,["74"] = 79,["75"] = 80,["76"] = 81,["77"] = 82,["80"] = 84,["81"] = 84,["82"] = 85,["83"] = 86,["84"] = 84,["89"] = 90,["90"] = 63,["91"] = 93,["92"] = 93,["93"] = 93,["96"] = 94,["97"] = 94,["99"] = 95,["101"] = 96,["102"] = 97,["103"] = 98,["104"] = 99,["105"] = 100,["106"] = 101,["107"] = 102,["108"] = 103,["111"] = 106,["112"] = 94,["115"] = 93,["116"] = 110,["117"] = 110,["118"] = 110,["120"] = 111,["121"] = 112,["122"] = 113,["123"] = 114,["124"] = 115,["126"] = 110,["127"] = 119,["128"] = 120,["129"] = 121,["130"] = 122,["131"] = 119,["132"] = 125,["133"] = 126,["134"] = 127,["135"] = 128,["136"] = 125,["137"] = 131,["138"] = 132,["139"] = 133,["140"] = 134,["141"] = 131,["142"] = 137,["143"] = 138,["144"] = 138,["145"] = 138,["146"] = 138,["147"] = 137,["148"] = 141,["149"] = 142,["150"] = 143,["151"] = 143,["152"] = 143,["153"] = 144,["154"] = 145,["156"] = 147,["157"] = 141,["158"] = 150,["159"] = 151,["160"] = 151,["162"] = 152,["163"] = 153,["165"] = 155,["166"] = 150,["167"] = 158,["168"] = 159,["169"] = 159,["171"] = 160,["172"] = 161,["174"] = 163,["175"] = 158,["176"] = 166,["177"] = 167,["178"] = 167,["180"] = 168,["181"] = 169,["183"] = 171,["184"] = 166,["185"] = 174,["186"] = 174,["187"] = 174,["189"] = 175,["190"] = 176,["191"] = 177,["192"] = 174,["193"] = 180,["194"] = 181,["195"] = 182,["196"] = 183,["197"] = 184,["199"] = 186,["200"] = 180,["201"] = 189,["202"] = 190,["203"] = 191,["205"] = 193,["206"] = 194,["208"] = 196,["209"] = 196,["210"] = 196,["211"] = 196,["212"] = 196,["213"] = 197,["214"] = 197,["216"] = 198,["217"] = 199,["218"] = 201,["220"] = 202,["221"] = 202,["222"] = 203,["223"] = 203,["225"] = 204,["226"] = 205,["227"] = 206,["228"] = 207,["229"] = 207,["230"] = 207,["233"] = 210,["234"] = 202,["239"] = 214,["242"] = 219,["243"] = 189,["244"] = 222,["245"] = 223,["246"] = 224,["247"] = 224,["248"] = 224,["249"] = 224,["250"] = 222,["251"] = 227,["252"] = 228,["253"] = 229,["254"] = 227});
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
