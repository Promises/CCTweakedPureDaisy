export interface BarrelItem {
    barrel: WorldTile;
    name: string;
    x: number;
    z: number;
    y?: number;
}

export enum WorldTile {
    NONE,
    LIVING_ROCK,
    LIVING_WOOD,
    PURE_DAISY,
    B_OAK,
    B_STONE,
    B_COBBLESTONE,
    B_LROCK,
    B_LWOOD,
    B_FUEL
}

interface IItems {
    [key: string]: BarrelItem;
}

export const Items: IItems ={
    LivingWood: {
        name: "botania:livingwood",
        barrel: WorldTile.B_LWOOD,
        x: 4,
        z: 3,
    },
    LivingRock: {
        name: "botania:livingrock",
        barrel: WorldTile.B_LROCK,
        x: 2,
        z: 3
    },
    Coal: {
        name: "minecraft:charcoal",
        barrel: WorldTile.B_FUEL,
        x: 3,
        z: 3,
        y: 4,
    },
    Oak: {
        name: "minecraft:oak_log",
        barrel: WorldTile.B_OAK,
        x: 6,
        z: 3
    },
    Stone: {
        name: "minecraft:stone",
        barrel: WorldTile.B_STONE,
        x: 0,
        z: 3
    },
    CobbleStone: {
        name: "minecraft:cobblestone",
        barrel: WorldTile.B_COBBLESTONE,
        x: 3,
        z: 3,
        y: 2
    },

}


export const ItemLookup: IItems = {
    "minecraft:stone": Items.Stone,
    "minecraft:oak_log": Items.Oak,
    "minecraft:charcoal": Items.Coal,
    "botania:livingrock": Items.LivingRock,
    "botania:livingwood": Items.LivingWood,
    "minecraft:cobblestone": Items.CobbleStone,
}
