require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 2,["5"] = 2,["6"] = 3,["7"] = 3,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 15,["12"] = 15,["13"] = 15,["14"] = 22,["15"] = 20,["16"] = 23,["17"] = 24,["18"] = 25,["19"] = 26,["20"] = 27,["21"] = 28,["22"] = 22,["23"] = 32,["25"] = 33,["26"] = 33,["27"] = 34,["28"] = 35,["29"] = 33,["32"] = 32,["33"] = 39,["35"] = 40,["36"] = 40,["37"] = 41,["38"] = 42,["40"] = 40,["43"] = 45,["44"] = 39,["45"] = 48,["46"] = 49,["47"] = 50,["50"] = 53,["51"] = 54,["52"] = 55,["53"] = 56,["56"] = 58,["57"] = 58,["58"] = 59,["59"] = 60,["60"] = 58,["65"] = 64,["66"] = 65,["67"] = 66,["68"] = 67,["71"] = 69,["72"] = 69,["73"] = 70,["74"] = 71,["75"] = 69,["80"] = 75,["81"] = 48,["82"] = 78,["83"] = 78,["84"] = 78,["87"] = 79,["88"] = 79,["90"] = 80,["92"] = 81,["93"] = 82,["94"] = 83,["95"] = 84,["96"] = 85,["97"] = 86,["98"] = 87,["99"] = 88,["102"] = 91,["103"] = 79,["106"] = 78,["107"] = 95,["108"] = 95,["109"] = 95,["111"] = 96,["112"] = 97,["113"] = 98,["114"] = 99,["115"] = 100,["117"] = 95,["118"] = 104,["119"] = 105,["120"] = 106,["121"] = 107,["122"] = 104,["123"] = 110,["124"] = 111,["125"] = 112,["126"] = 113,["127"] = 110,["128"] = 116,["129"] = 117,["130"] = 118,["131"] = 119,["132"] = 116,["133"] = 122,["134"] = 123,["135"] = 123,["136"] = 123,["137"] = 123,["138"] = 122,["139"] = 126,["140"] = 127,["141"] = 128,["142"] = 128,["143"] = 128,["144"] = 129,["145"] = 130,["147"] = 132,["148"] = 126,["149"] = 135,["150"] = 136,["151"] = 136,["153"] = 137,["154"] = 138,["156"] = 140,["157"] = 135,["158"] = 143,["159"] = 144,["160"] = 144,["162"] = 145,["163"] = 146,["165"] = 148,["166"] = 143,["167"] = 151,["168"] = 152,["169"] = 152,["171"] = 153,["172"] = 154,["174"] = 156,["175"] = 151,["176"] = 159,["177"] = 159,["178"] = 159,["180"] = 160,["181"] = 161,["182"] = 162,["183"] = 159,["184"] = 165,["185"] = 166,["186"] = 167,["187"] = 168,["188"] = 169,["190"] = 171,["191"] = 165,["192"] = 174,["193"] = 175,["194"] = 176,["196"] = 178,["197"] = 179,["199"] = 181,["200"] = 181,["201"] = 181,["202"] = 181,["203"] = 181,["204"] = 182,["205"] = 182,["207"] = 183,["208"] = 184,["209"] = 186,["211"] = 187,["212"] = 187,["213"] = 188,["214"] = 188,["216"] = 189,["217"] = 190,["218"] = 191,["219"] = 192,["220"] = 192,["221"] = 192,["224"] = 195,["225"] = 187,["230"] = 199,["233"] = 204,["234"] = 174,["235"] = 207,["236"] = 208,["237"] = 209,["238"] = 209,["239"] = 209,["240"] = 209,["241"] = 207,["242"] = 212,["243"] = 213,["244"] = 214,["245"] = 212});
local ____exports = {}
local ____block = require("block")
local Block = ____block.Block
local ____direction = require("world.direction")
local Direction = ____direction.Direction
local stringToDirection = ____direction.stringToDirection
local ____client = require("client")
local Client = ____client.Client
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
