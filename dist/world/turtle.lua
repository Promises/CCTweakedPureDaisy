require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 2,["5"] = 2,["6"] = 3,["7"] = 3,["8"] = 15,["9"] = 15,["10"] = 15,["11"] = 22,["12"] = 20,["13"] = 28,["14"] = 22,["15"] = 32,["17"] = 33,["18"] = 33,["19"] = 34,["20"] = 35,["21"] = 33,["24"] = 32,["25"] = 39,["27"] = 40,["28"] = 40,["29"] = 41,["30"] = 42,["32"] = 40,["35"] = 45,["36"] = 39,["37"] = 48,["38"] = 49,["39"] = 50,["42"] = 53,["43"] = 54,["44"] = 55,["45"] = 56,["48"] = 58,["49"] = 58,["50"] = 59,["51"] = 60,["52"] = 58,["57"] = 64,["58"] = 65,["59"] = 66,["60"] = 67,["63"] = 69,["64"] = 69,["65"] = 70,["66"] = 71,["67"] = 69,["72"] = 75,["73"] = 48,["74"] = 78,["75"] = 78,["76"] = 78,["79"] = 79,["80"] = 79,["82"] = 80,["84"] = 81,["85"] = 82,["86"] = 83,["87"] = 84,["88"] = 85,["89"] = 86,["90"] = 87,["91"] = 88,["94"] = 91,["95"] = 79,["98"] = 78,["99"] = 95,["100"] = 95,["101"] = 95,["103"] = 96,["104"] = 97,["105"] = 98,["106"] = 99,["107"] = 100,["109"] = 95,["110"] = 104,["111"] = 105,["112"] = 106,["113"] = 107,["114"] = 104,["115"] = 110,["116"] = 111,["117"] = 112,["118"] = 113,["119"] = 110,["120"] = 116,["121"] = 117,["122"] = 118,["123"] = 119,["124"] = 116,["125"] = 122,["126"] = 123,["127"] = 123,["128"] = 123,["129"] = 123,["130"] = 122,["131"] = 126,["132"] = 127,["133"] = 128,["134"] = 128,["135"] = 128,["136"] = 129,["137"] = 130,["139"] = 132,["140"] = 126,["141"] = 135,["142"] = 136,["143"] = 136,["145"] = 137,["146"] = 138,["148"] = 140,["149"] = 135,["150"] = 143,["151"] = 144,["152"] = 144,["154"] = 145,["155"] = 146,["157"] = 148,["158"] = 143,["159"] = 151,["160"] = 152,["161"] = 152,["163"] = 153,["164"] = 154,["166"] = 156,["167"] = 151,["168"] = 159,["169"] = 159,["170"] = 159,["172"] = 160,["173"] = 161,["174"] = 162,["175"] = 159,["176"] = 165,["177"] = 166,["178"] = 167,["179"] = 168,["180"] = 169,["182"] = 171,["183"] = 165,["184"] = 174,["185"] = 175,["186"] = 176,["188"] = 178,["189"] = 179,["191"] = 181,["192"] = 181,["193"] = 181,["194"] = 181,["195"] = 181,["196"] = 182,["197"] = 182,["199"] = 183,["200"] = 184,["201"] = 186,["203"] = 187,["204"] = 187,["205"] = 188,["206"] = 188,["208"] = 189,["209"] = 190,["210"] = 191,["211"] = 192,["212"] = 192,["213"] = 192,["216"] = 195,["217"] = 187,["222"] = 199,["225"] = 204,["226"] = 174,["227"] = 207,["228"] = 208,["229"] = 209,["230"] = 209,["231"] = 209,["232"] = 209,["233"] = 207,["234"] = 212,["235"] = 213,["236"] = 214,["237"] = 212});
local ____exports = {}
local ____block = require("block")
local Block = ____block.Block
local ____direction = require("world.direction")
local Direction = ____direction.Direction
____exports.Turtle = __TS__Class()
local Turtle = ____exports.Turtle
Turtle.name = "Turtle"
function Turtle.prototype.____constructor(self, configFile)
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
