require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 3,["5"] = 3,["6"] = 4,["7"] = 4,["8"] = 5,["9"] = 5,["10"] = 7,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 10,["17"] = 11,["18"] = 11,["19"] = 14,["20"] = 30,["21"] = 30,["22"] = 30,["23"] = 38,["24"] = 36,["25"] = 39,["26"] = 40,["27"] = 41,["28"] = 42,["29"] = 43,["30"] = 44,["31"] = 38,["32"] = 48,["34"] = 49,["35"] = 49,["36"] = 50,["37"] = 51,["38"] = 49,["41"] = 48,["42"] = 55,["44"] = 56,["45"] = 56,["46"] = 57,["47"] = 58,["49"] = 56,["52"] = 61,["53"] = 55,["54"] = 64,["55"] = 65,["56"] = 66,["59"] = 69,["60"] = 70,["61"] = 71,["62"] = 72,["65"] = 74,["66"] = 74,["67"] = 75,["68"] = 76,["69"] = 74,["74"] = 80,["75"] = 81,["76"] = 82,["77"] = 83,["80"] = 85,["81"] = 85,["82"] = 86,["83"] = 87,["84"] = 85,["89"] = 91,["90"] = 64,["91"] = 94,["92"] = 94,["93"] = 94,["96"] = 95,["97"] = 95,["99"] = 96,["101"] = 97,["102"] = 98,["103"] = 99,["104"] = 100,["105"] = 101,["106"] = 102,["107"] = 103,["108"] = 104,["111"] = 107,["112"] = 95,["115"] = 94,["116"] = 111,["117"] = 111,["118"] = 111,["120"] = 112,["121"] = 113,["122"] = 114,["123"] = 115,["124"] = 116,["126"] = 111,["127"] = 120,["128"] = 121,["129"] = 122,["130"] = 123,["131"] = 120,["132"] = 126,["133"] = 127,["134"] = 128,["135"] = 129,["136"] = 126,["137"] = 132,["138"] = 133,["139"] = 134,["140"] = 135,["141"] = 132,["142"] = 138,["143"] = 139,["144"] = 139,["145"] = 139,["146"] = 139,["147"] = 138,["148"] = 142,["149"] = 143,["150"] = 144,["151"] = 144,["152"] = 144,["153"] = 145,["154"] = 146,["156"] = 148,["157"] = 142,["158"] = 151,["159"] = 152,["160"] = 152,["162"] = 153,["163"] = 154,["165"] = 156,["166"] = 151,["167"] = 159,["168"] = 160,["169"] = 160,["171"] = 161,["172"] = 162,["174"] = 164,["175"] = 159,["176"] = 167,["177"] = 168,["178"] = 168,["180"] = 169,["181"] = 170,["183"] = 172,["184"] = 167,["185"] = 175,["186"] = 175,["187"] = 175,["189"] = 176,["190"] = 177,["191"] = 178,["192"] = 175,["193"] = 181,["194"] = 182,["195"] = 183,["196"] = 184,["197"] = 185,["199"] = 187,["200"] = 181,["201"] = 190,["202"] = 191,["203"] = 192,["205"] = 194,["206"] = 195,["208"] = 197,["209"] = 197,["210"] = 197,["211"] = 197,["212"] = 197,["213"] = 198,["214"] = 198,["216"] = 199,["217"] = 200,["218"] = 202,["220"] = 203,["221"] = 203,["222"] = 204,["223"] = 204,["225"] = 205,["226"] = 206,["227"] = 207,["228"] = 208,["229"] = 208,["230"] = 208,["233"] = 211,["234"] = 203,["239"] = 215,["242"] = 220,["243"] = 190,["244"] = 223,["245"] = 224,["246"] = 225,["247"] = 225,["248"] = 225,["249"] = 225,["250"] = 223,["251"] = 228,["252"] = 229,["253"] = 230,["254"] = 228});
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
