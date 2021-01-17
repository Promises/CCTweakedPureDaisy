require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 3,["5"] = 3,["6"] = 5,["7"] = 6,["8"] = 6,["9"] = 7,["10"] = 7,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 9,["15"] = 21,["16"] = 21,["17"] = 21,["19"] = 27,["20"] = 30,["21"] = 29,["22"] = 34,["24"] = 35,["25"] = 35,["26"] = 36,["27"] = 37,["28"] = 35,["31"] = 34,["32"] = 41,["34"] = 42,["35"] = 42,["36"] = 43,["37"] = 44,["39"] = 42,["42"] = 47,["43"] = 41,["44"] = 50,["45"] = 51,["46"] = 52,["49"] = 55,["50"] = 56,["51"] = 57,["52"] = 58,["55"] = 60,["56"] = 60,["57"] = 61,["58"] = 62,["59"] = 60,["64"] = 66,["65"] = 67,["66"] = 68,["67"] = 69,["70"] = 71,["71"] = 71,["72"] = 72,["73"] = 73,["74"] = 71,["79"] = 77,["80"] = 50,["81"] = 80,["82"] = 80,["83"] = 80,["86"] = 81,["87"] = 81,["89"] = 82,["91"] = 83,["92"] = 84,["93"] = 85,["94"] = 86,["95"] = 87,["96"] = 88,["97"] = 89,["98"] = 90,["101"] = 93,["102"] = 81,["105"] = 80,["106"] = 97,["107"] = 97,["108"] = 97,["110"] = 98,["111"] = 99,["112"] = 100,["113"] = 101,["114"] = 102,["116"] = 97,["117"] = 106,["118"] = 107,["119"] = 108,["120"] = 109,["121"] = 106,["122"] = 112,["123"] = 113,["124"] = 114,["125"] = 115,["126"] = 112,["127"] = 118,["128"] = 119,["129"] = 120,["130"] = 121,["131"] = 118,["132"] = 124,["133"] = 125,["134"] = 125,["135"] = 125,["136"] = 125,["137"] = 124,["138"] = 128,["139"] = 129,["140"] = 130,["141"] = 130,["142"] = 130,["143"] = 131,["144"] = 132,["146"] = 134,["147"] = 128,["148"] = 137,["149"] = 138,["150"] = 138,["152"] = 139,["153"] = 140,["155"] = 142,["156"] = 137,["157"] = 145,["158"] = 146,["159"] = 146,["161"] = 147,["162"] = 148,["164"] = 150,["165"] = 145,["166"] = 153,["167"] = 154,["168"] = 154,["170"] = 155,["171"] = 156,["173"] = 158,["174"] = 153,["175"] = 161,["176"] = 161,["177"] = 161,["179"] = 162,["180"] = 163,["181"] = 164,["182"] = 161,["183"] = 167,["184"] = 168,["185"] = 169,["186"] = 170,["187"] = 171,["189"] = 173,["190"] = 167,["191"] = 176,["192"] = 177,["193"] = 178,["195"] = 180,["196"] = 181,["198"] = 183,["199"] = 183,["200"] = 183,["201"] = 183,["202"] = 183,["203"] = 184,["204"] = 184,["206"] = 185,["207"] = 186,["208"] = 188,["210"] = 189,["211"] = 189,["212"] = 190,["213"] = 190,["215"] = 191,["216"] = 192,["217"] = 193,["218"] = 194,["219"] = 194,["220"] = 194,["223"] = 197,["224"] = 189,["229"] = 201,["232"] = 206,["233"] = 176,["234"] = 209,["235"] = 210,["236"] = 211,["237"] = 211,["238"] = 211,["239"] = 211,["240"] = 209,["241"] = 214,["242"] = 215,["243"] = 216,["244"] = 214});
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
