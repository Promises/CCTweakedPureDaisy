--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.WorldTile = {}
____exports.WorldTile.NONE = 0
____exports.WorldTile[____exports.WorldTile.NONE] = "NONE"
____exports.WorldTile.LIVING_ROCK = 1
____exports.WorldTile[____exports.WorldTile.LIVING_ROCK] = "LIVING_ROCK"
____exports.WorldTile.LIVING_WOOD = 2
____exports.WorldTile[____exports.WorldTile.LIVING_WOOD] = "LIVING_WOOD"
____exports.WorldTile.PURE_DAISY = 3
____exports.WorldTile[____exports.WorldTile.PURE_DAISY] = "PURE_DAISY"
____exports.WorldTile.B_OAK = 4
____exports.WorldTile[____exports.WorldTile.B_OAK] = "B_OAK"
____exports.WorldTile.B_STONE = 5
____exports.WorldTile[____exports.WorldTile.B_STONE] = "B_STONE"
____exports.WorldTile.B_COBBLESTONE = 6
____exports.WorldTile[____exports.WorldTile.B_COBBLESTONE] = "B_COBBLESTONE"
____exports.WorldTile.B_LROCK = 7
____exports.WorldTile[____exports.WorldTile.B_LROCK] = "B_LROCK"
____exports.WorldTile.B_LWOOD = 8
____exports.WorldTile[____exports.WorldTile.B_LWOOD] = "B_LWOOD"
____exports.WorldTile.B_FUEL = 9
____exports.WorldTile[____exports.WorldTile.B_FUEL] = "B_FUEL"
____exports.Items = {LivingWood = {name = "botania:livingwood", barrel = ____exports.WorldTile.B_LWOOD, x = 4, z = 3}, LivingRock = {name = "botania:livingrock", barrel = ____exports.WorldTile.B_LROCK, x = 2, z = 3}, Coal = {name = "minecraft:charcoal", barrel = ____exports.WorldTile.B_FUEL, x = 3, z = 3, y = 4}, Oak = {name = "minecraft:oak_log", barrel = ____exports.WorldTile.B_OAK, x = 6, z = 3}, Stone = {name = "minecraft:stone", barrel = ____exports.WorldTile.B_STONE, x = 0, z = 3}, CobbleStone = {name = "minecraft:cobblestone", barrel = ____exports.WorldTile.B_COBBLESTONE, x = 3, z = 3, y = 2}}
____exports.ItemLookup = {["minecraft:stone"] = ____exports.Items.Stone, ["minecraft:oak_log"] = ____exports.Items.Oak, ["minecraft:charcoal"] = ____exports.Items.Coal, ["botania:livingrock"] = ____exports.Items.LivingRock, ["botania:livingwood"] = ____exports.Items.LivingWood, ["minecraft:cobblestone"] = ____exports.Items.CobbleStone}
return ____exports
