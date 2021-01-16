--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____items = require("world.items")
local ItemLookup = ____items.ItemLookup
local Items = ____items.Items
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
function Turtle.prototype.walkToBarrel(self, barrel)
    self:walkTo(barrel.x, barrel.z)
end
function Turtle.prototype.walkTo(self, x, y)
    while x ~= self.currentX do
        if self.currentX > x then
            self:setDirection(____exports.Direction.East)
        else
            self:setDirection(____exports.Direction.West)
        end
        self:walk(
            math.abs(self.currentX - x)
        )
    end
    while y ~= self.currentZ do
        if self.currentZ > y then
            self:setDirection(____exports.Direction.North)
        else
            self:setDirection(____exports.Direction.South)
        end
        self:walk(
            math.abs(self.currentZ - y)
        )
    end
end
function Turtle.prototype.cleanInventory(self)
    if self:hasItems() then
        do
            local i = 0
            while i < 16 do
                if self.inventory[i + 1] then
                    self:returnItemToBarrel(i)
                end
                i = i + 1
            end
        end
    end
    self:refreshInventory()
end
function Turtle.prototype.returnItemToBarrel(self, slot, forceUpdate)
    if forceUpdate == nil then
        forceUpdate = false
    end
    local invItem = self.inventory[slot + 1]
    local barrel = ItemLookup[invItem.name]
    self:walkToBarrel(barrel)
    turtle.select(slot + 1)
    if (barrel.y ~= nil) and (math.abs(self.currentY - barrel.y) ~= 0) then
        if self.currentY > barrel.y then
            turtle.dropDown()
        else
            turtle.dropUp()
        end
    elseif barrel.y ~= nil then
        turtle.dropDown()
    else
        turtle.drop()
    end
    os.sleep(0.1)
    if forceUpdate then
        self:refreshInventory()
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
function Turtle.prototype.getItem(self, item)
    self:walkToBarrel(item)
    if (item.y ~= nil) and (math.abs(self.currentY - item.y) ~= 0) then
        if self.currentY > item.y then
            turtle.suckDown()
        else
            turtle.suckUp()
        end
    elseif item.y == nil then
        print("wtf?")
        turtle.suckDown()
    else
        print("WTF!!!?")
        turtle.suck()
    end
    os.sleep(0.1)
    self:refreshInventory()
    if __TS__ArrayFindIndex(
        self.inventory,
        function(____, i) return i and (i.name == item.name) end
    ) == -1 then
        print(
            ("unable to aquire: " .. tostring(item.name)) .. ", sleeping."
        )
        sleep(60)
        self:getItem(item)
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
function Turtle.prototype.refuel(self)
    self:cleanInventory()
    self:getItem(Items.Coal)
    self:selectItem(Items.Coal.name)
    turtle.refuel()
    os.sleep(0.1)
end
function Turtle.prototype.shouldRefuel(self)
    return turtle.getFuelLevel() < 10000
end
function Turtle.prototype.getBlockDown(self)
    local block = {
        turtle.inspectDown()
    }
    if block[1] then
        return block[2].name
    end
    return ""
end
function Turtle.prototype.getBlockUp(self)
    local block = {
        turtle.inspectUp()
    }
    if block[1] then
        return block[2].name
    end
    return ""
end
function Turtle.prototype.getBlock(self)
    local block = {
        turtle.inspect()
    }
    if block[1] then
        return block[2].name
    end
    return ""
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
