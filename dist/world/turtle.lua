require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 2,["5"] = 2,["6"] = 3,["7"] = 3,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 9,["16"] = 9,["17"] = 21,["18"] = 21,["19"] = 21,["21"] = 27,["22"] = 30,["23"] = 29,["24"] = 34,["26"] = 35,["27"] = 35,["28"] = 36,["29"] = 37,["30"] = 35,["33"] = 34,["34"] = 41,["36"] = 42,["37"] = 42,["38"] = 43,["39"] = 44,["41"] = 42,["44"] = 47,["45"] = 41,["46"] = 50,["47"] = 51,["48"] = 52,["51"] = 55,["52"] = 56,["53"] = 57,["54"] = 58,["57"] = 60,["58"] = 60,["59"] = 61,["60"] = 62,["61"] = 60,["66"] = 66,["67"] = 67,["68"] = 68,["69"] = 69,["72"] = 71,["73"] = 71,["74"] = 72,["75"] = 73,["76"] = 71,["81"] = 77,["82"] = 50,["83"] = 80,["84"] = 80,["85"] = 80,["88"] = 81,["89"] = 81,["91"] = 82,["93"] = 83,["94"] = 84,["95"] = 85,["96"] = 86,["97"] = 87,["98"] = 88,["99"] = 89,["100"] = 90,["103"] = 93,["104"] = 81,["107"] = 80,["108"] = 97,["109"] = 97,["110"] = 97,["112"] = 98,["113"] = 99,["114"] = 100,["115"] = 101,["116"] = 102,["118"] = 97,["119"] = 106,["120"] = 107,["121"] = 108,["122"] = 109,["123"] = 106,["124"] = 112,["125"] = 113,["126"] = 114,["127"] = 115,["128"] = 112,["129"] = 118,["130"] = 119,["131"] = 120,["132"] = 121,["133"] = 118,["134"] = 124,["135"] = 125,["136"] = 125,["137"] = 125,["138"] = 125,["139"] = 124,["140"] = 128,["141"] = 129,["142"] = 130,["143"] = 130,["144"] = 130,["145"] = 131,["146"] = 132,["148"] = 134,["149"] = 128,["150"] = 137,["151"] = 138,["152"] = 138,["154"] = 139,["155"] = 140,["157"] = 142,["158"] = 137,["159"] = 145,["160"] = 146,["161"] = 146,["163"] = 147,["164"] = 148,["166"] = 150,["167"] = 145,["168"] = 153,["169"] = 154,["170"] = 154,["172"] = 155,["173"] = 156,["175"] = 158,["176"] = 153,["177"] = 161,["178"] = 161,["179"] = 161,["181"] = 162,["182"] = 163,["183"] = 164,["184"] = 161,["185"] = 167,["186"] = 168,["187"] = 169,["188"] = 170,["189"] = 171,["191"] = 173,["192"] = 167,["193"] = 176,["194"] = 177,["195"] = 178,["197"] = 180,["198"] = 181,["200"] = 183,["201"] = 183,["202"] = 183,["203"] = 183,["204"] = 183,["205"] = 184,["206"] = 184,["208"] = 185,["209"] = 186,["210"] = 188,["212"] = 189,["213"] = 189,["214"] = 190,["215"] = 190,["217"] = 191,["218"] = 192,["219"] = 193,["220"] = 194,["221"] = 194,["222"] = 194,["225"] = 197,["226"] = 189,["231"] = 238,["234"] = 243,["235"] = 176,["236"] = 246,["237"] = 247,["238"] = 248,["239"] = 248,["240"] = 248,["241"] = 248,["242"] = 246,["243"] = 251,["244"] = 252,["245"] = 253,["246"] = 253,["247"] = 253,["248"] = 254,["249"] = 255,["250"] = 256,["251"] = 257,["252"] = 257,["253"] = 257,["254"] = 258,["255"] = 281,["257"] = 251});
local ____exports = {}
local ____Vector3 = require("world.grid.Vector3")
local Vector3 = ____Vector3.Vector3
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
        return "/data/location.json"
    end
end
return ____exports
