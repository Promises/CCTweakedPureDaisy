require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 3,["5"] = 3,["6"] = 5,["7"] = 6,["8"] = 6,["9"] = 7,["10"] = 7,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 9,["15"] = 12,["16"] = 28,["17"] = 28,["18"] = 28,["20"] = 34,["21"] = 37,["22"] = 36,["23"] = 41,["25"] = 42,["26"] = 42,["27"] = 43,["28"] = 44,["29"] = 42,["32"] = 41,["33"] = 48,["35"] = 49,["36"] = 49,["37"] = 50,["38"] = 51,["40"] = 49,["43"] = 54,["44"] = 48,["45"] = 57,["46"] = 58,["47"] = 59,["50"] = 62,["51"] = 63,["52"] = 64,["53"] = 65,["56"] = 67,["57"] = 67,["58"] = 68,["59"] = 69,["60"] = 67,["65"] = 73,["66"] = 74,["67"] = 75,["68"] = 76,["71"] = 78,["72"] = 78,["73"] = 79,["74"] = 80,["75"] = 78,["80"] = 84,["81"] = 57,["82"] = 87,["83"] = 87,["84"] = 87,["87"] = 88,["88"] = 88,["90"] = 89,["92"] = 90,["93"] = 91,["94"] = 92,["95"] = 93,["96"] = 94,["97"] = 95,["98"] = 96,["99"] = 97,["102"] = 100,["103"] = 88,["106"] = 87,["107"] = 104,["108"] = 104,["109"] = 104,["111"] = 105,["112"] = 106,["113"] = 107,["114"] = 108,["115"] = 109,["117"] = 104,["118"] = 113,["119"] = 114,["120"] = 115,["121"] = 116,["122"] = 113,["123"] = 119,["124"] = 120,["125"] = 121,["126"] = 122,["127"] = 119,["128"] = 125,["129"] = 126,["130"] = 127,["131"] = 128,["132"] = 125,["133"] = 131,["134"] = 132,["135"] = 132,["136"] = 132,["137"] = 132,["138"] = 131,["139"] = 135,["140"] = 136,["141"] = 137,["142"] = 137,["143"] = 137,["144"] = 138,["145"] = 139,["147"] = 141,["148"] = 135,["149"] = 144,["150"] = 145,["151"] = 145,["153"] = 146,["154"] = 147,["156"] = 149,["157"] = 144,["158"] = 152,["159"] = 153,["160"] = 153,["162"] = 154,["163"] = 155,["165"] = 157,["166"] = 152,["167"] = 160,["168"] = 161,["169"] = 161,["171"] = 162,["172"] = 163,["174"] = 165,["175"] = 160,["176"] = 168,["177"] = 168,["178"] = 168,["180"] = 169,["181"] = 170,["182"] = 171,["183"] = 168,["184"] = 174,["185"] = 175,["186"] = 176,["187"] = 177,["188"] = 178,["190"] = 180,["191"] = 174,["192"] = 183,["193"] = 184,["194"] = 185,["196"] = 187,["197"] = 188,["199"] = 190,["200"] = 190,["201"] = 190,["202"] = 190,["203"] = 190,["204"] = 191,["205"] = 191,["207"] = 192,["208"] = 193,["209"] = 195,["211"] = 196,["212"] = 196,["213"] = 197,["214"] = 197,["216"] = 198,["217"] = 199,["218"] = 200,["219"] = 201,["220"] = 201,["221"] = 201,["224"] = 204,["225"] = 196,["230"] = 208,["233"] = 213,["234"] = 183,["235"] = 216,["236"] = 217,["237"] = 218,["238"] = 218,["239"] = 218,["240"] = 218,["241"] = 216,["242"] = 221,["243"] = 222,["244"] = 223,["245"] = 221});
local ____exports = {}
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
____exports.VerboseDirection = {"North", "West", "South", "East"}
____exports.Turtle = __TS__Class()
local Turtle = ____exports.Turtle
Turtle.name = "Turtle"
function Turtle.prototype.____constructor(self)
    self.inventory = {}
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
