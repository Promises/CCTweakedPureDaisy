require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 2,["5"] = 2,["6"] = 3,["7"] = 3,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 8,["12"] = 8,["13"] = 8,["14"] = 15,["15"] = 13,["16"] = 16,["17"] = 17,["18"] = 18,["19"] = 19,["20"] = 20,["21"] = 21,["22"] = 15,["23"] = 25,["25"] = 26,["26"] = 26,["27"] = 27,["28"] = 28,["29"] = 26,["32"] = 25,["33"] = 32,["35"] = 33,["36"] = 33,["37"] = 34,["38"] = 35,["40"] = 33,["43"] = 38,["44"] = 32,["45"] = 41,["46"] = 42,["47"] = 43,["50"] = 46,["51"] = 47,["52"] = 48,["53"] = 49,["56"] = 51,["57"] = 51,["58"] = 52,["59"] = 53,["60"] = 51,["65"] = 57,["66"] = 58,["67"] = 59,["68"] = 60,["71"] = 62,["72"] = 62,["73"] = 63,["74"] = 64,["75"] = 62,["80"] = 68,["81"] = 41,["82"] = 71,["83"] = 71,["84"] = 71,["87"] = 72,["88"] = 72,["90"] = 73,["92"] = 74,["93"] = 75,["94"] = 76,["95"] = 77,["96"] = 78,["97"] = 79,["98"] = 80,["99"] = 81,["102"] = 84,["103"] = 72,["106"] = 71,["107"] = 88,["108"] = 88,["109"] = 88,["111"] = 89,["112"] = 90,["113"] = 91,["114"] = 92,["115"] = 93,["117"] = 88,["118"] = 97,["119"] = 98,["120"] = 99,["121"] = 100,["122"] = 97,["123"] = 103,["124"] = 104,["125"] = 105,["126"] = 106,["127"] = 103,["128"] = 109,["129"] = 110,["130"] = 111,["131"] = 112,["132"] = 109,["133"] = 115,["134"] = 116,["135"] = 116,["136"] = 116,["137"] = 116,["138"] = 115,["139"] = 119,["140"] = 120,["141"] = 121,["142"] = 121,["143"] = 121,["144"] = 122,["145"] = 123,["147"] = 125,["148"] = 119,["149"] = 128,["150"] = 129,["151"] = 129,["153"] = 130,["154"] = 131,["156"] = 133,["157"] = 128,["158"] = 136,["159"] = 137,["160"] = 137,["162"] = 138,["163"] = 139,["165"] = 141,["166"] = 136,["167"] = 144,["168"] = 145,["169"] = 145,["171"] = 146,["172"] = 147,["174"] = 149,["175"] = 144,["176"] = 152,["177"] = 152,["178"] = 152,["180"] = 153,["181"] = 154,["182"] = 155,["183"] = 152,["184"] = 158,["185"] = 159,["186"] = 160,["187"] = 161,["188"] = 162,["190"] = 164,["191"] = 158,["192"] = 167,["193"] = 168,["194"] = 169,["196"] = 171,["197"] = 172,["199"] = 174,["200"] = 174,["201"] = 174,["202"] = 174,["203"] = 174,["204"] = 175,["205"] = 175,["207"] = 176,["208"] = 177,["209"] = 179,["211"] = 180,["212"] = 180,["213"] = 181,["214"] = 181,["216"] = 182,["217"] = 183,["218"] = 184,["219"] = 185,["220"] = 185,["221"] = 185,["224"] = 188,["225"] = 180,["230"] = 192,["233"] = 197,["234"] = 167,["235"] = 200,["236"] = 201,["237"] = 202,["238"] = 202,["239"] = 202,["240"] = 202,["241"] = 200,["242"] = 205,["243"] = 206,["244"] = 207,["245"] = 205});
local ____exports = {}
local ____block = require("block")
local Block = ____block.Block
local ____direction = require("world.direction")
local Direction = ____direction.Direction
local stringToDirection = ____direction.stringToDirection
local ____data = require("world.data")
local loadConfigFile = ____data.loadConfigFile
____exports.Turtle = __TS__Class()
local Turtle = ____exports.Turtle
Turtle.name = "Turtle"
function Turtle.prototype.____constructor(self, configFile)
    self.inventory = {}
    local worldData = loadConfigFile(configFile)
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
                if self.currentDirection == Direction.North then
                    self.currentZ = self.currentZ - 1
                elseif self.currentDirection == Direction.West then
                    self.currentX = self.currentX + 1
                elseif self.currentDirection == Direction.South then
                    self.currentZ = self.currentZ + 1
                elseif self.currentDirection == Direction.East then
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
