// @noSelfInFile
import {BarrelItem, ItemLookup, Items} from "./items";
import {Vector3} from "./grid/Vector3";
import {getCoordInDirection} from "./utils/utils";
import {Block} from "../block";

export enum Direction {
    North,
    West,
    South,
    East,
}

interface WorldData {
    facing: 'north' | 'east' | 'south' | 'west';
    x: number;
    y: number;
    z: number;
    server: string;
    port: number;
}

export class Turtle {

    currentX: number;
    currentZ: number;
    currentY: number;
    currentDirection: Direction;
    inventory: ({ name: string, count: number } | null)[] = [];

    constructor() {
        this.refreshInventory();
    }


    private refreshInventory() {
        for (let i = 0; i < 16; i++) {
            let invItem = turtle.getItemDetail(i + 1);
            this.inventory[i] = invItem;
        }
    }

    private hasItems(): boolean {
        for (let i = 0; i < 16; i++) {
            if (this.inventory[i]) {
                return true
            }
        }
        return false;
    }

    public setDirection(direction: Direction) {
        const difference = this.currentDirection - direction;
        if (difference === 0) {
            return;
        }
        if (difference < 0) {
            if (Math.abs(difference) === 3) {
                turtle.turnLeft();
                os.sleep(0.4);
            } else {
                for (let i = 0; i < Math.abs(difference); i++) {
                    turtle.turnRight();
                    os.sleep(0.4);
                }
            }
        }
        if (difference > 0) {
            if (Math.abs(difference) === 3) {
                turtle.turnRight();
                os.sleep(0.4);
            } else {
                for (let i = 0; i < Math.abs(difference); i++) {
                    turtle.turnLeft();
                    os.sleep(0.4);
                }
            }
        }
        this.currentDirection = direction;
    }

    public walk(steps: number = 1) {
        for (let i = 0; i < steps; i++) {
            if (turtle.forward()) {
                if (this.currentDirection === Direction.North) {
                    this.currentZ = this.currentZ - 1;
                } else if (this.currentDirection === Direction.West) {
                    this.currentX = this.currentX + 1;
                } else if (this.currentDirection === Direction.South) {
                    this.currentZ = this.currentZ + 1;
                } else if (this.currentDirection === Direction.East) {
                    this.currentX = this.currentX - 1;
                }
            }
            os.sleep(0.3);
        }
    }

    public walkToBarrel(barrel: BarrelItem) {
        this.walkTo(barrel.x, barrel.z);
    }

    public walkTo(x: number, y: number) {
        while (x !== this.currentX) {
            if (this.currentX > x) {
                this.setDirection(Direction.East);
            } else {
                this.setDirection(Direction.West)
            }
            this.walk(Math.abs(this.currentX - x))
        }
        while (y !== this.currentZ) {
            if (this.currentZ > y) {
                this.setDirection(Direction.North);
            } else {
                this.setDirection(Direction.South)
            }
            this.walk(Math.abs(this.currentZ - y))
        }
    }

    public

    public cleanInventory() {
        if (this.hasItems()) {
            for (let i = 0; i < 16; i++) {
                if (this.inventory[i]) {
                    this.returnItemToBarrel(i);
                }
            }
        }
        this.refreshInventory();
    }

    public returnItemToBarrel(slot: number, forceUpdate: boolean = false) {
        let invItem = this.inventory[slot];
        let barrel: BarrelItem = ItemLookup[invItem.name];
        this.walkToBarrel(barrel)
        turtle.select(slot + 1);
        if (barrel.y != undefined && math.abs(this.currentY - barrel.y) != 0) {
            if (this.currentY > barrel.y) {
                turtle.dropDown();
            } else {
                turtle.dropUp();
            }
        } else if (barrel.y != undefined) {
            turtle.dropDown();
        } else {
            turtle.drop();
        }
        os.sleep(0.1)
        if (forceUpdate) {
            this.refreshInventory();
        }
    }

    public dropDown(slot: number, forceUpdate: boolean = false) {
        turtle.select(slot + 1);
        turtle.dropDown();
        os.sleep(0.1)
        if (forceUpdate) {
            this.refreshInventory();
        }
    }

    public getItem(item: BarrelItem) {
        this.walkToBarrel(item);
        if (item.y != undefined && math.abs(this.currentY - item.y) != 0) {
            if (this.currentY > item.y) {
                turtle.suckDown();
            } else {
                turtle.suckUp();
            }
        } else if (item.y === undefined) {
            print("wtf?");
            turtle.suckDown();
        } else {
            print("WTF!!!?");
            turtle.suck();
        }
        os.sleep(0.1);
        this.refreshInventory();
        if (this.inventory.findIndex((i) => i && i.name === item.name) === -1) {
            print(`unable to aquire: ${item.name}, sleeping.`)
            sleep(60);
            this.getItem(item);
        }
    }

    public digDown() {
        turtle.digDown()
        os.sleep(0.1);
        this.refreshInventory();
    }

    public dig() {
        turtle.dig()
        os.sleep(0.1);
        this.refreshInventory();
    }

    public digUp() {
        turtle.digUp()
        os.sleep(0.1);
        this.refreshInventory();
    }

    public findInventorySlot(item: string): number {
        return this.inventory.findIndex((i) => i && i.name === item);
    }

    public selectItem(item: string): boolean {
        const slot = this.findInventorySlot(item);
        print(`${item} found in slot ${slot}`);
        if (slot === -1) {
            return false;
        }
        return turtle.select(slot + 1);
    }

    public refuel() {
        this.cleanInventory();
        this.getItem(Items.Coal);
        this.selectItem(Items.Coal.name);
        turtle.refuel();
        os.sleep(0.1);
    }

    public shouldRefuel(): boolean {
        return turtle.getFuelLevel() < 10000;
    }

    getBlockDown(): string {
        let block = turtle.inspectDown();
        if (block[0]) {
            return block[1].name;
        }
        return '';
    }

    getBlockUp(): string {
        let block = turtle.inspectUp();
        if (block[0]) {
            return block[1].name;
        }
        return '';
    }

    getBlock(): string {
        let block = turtle.inspect();
        if (block[0]) {
            return block[1].name;
        }
        return '';
    }

    placeDownSlot(slot: number = 1) {
        turtle.select(slot);
        turtle.placeDown()
        os.sleep(0.1)
    }

    public placeDown(item: string): boolean {
        if (this.selectItem(item)) {
            turtle.placeDown()
            os.sleep(0.1)
            return true;
        }
        return false
    }

    static findData(): string | null {
        if (fs.exists("/data/location.json")) {
            return '/data/location.json';
        }
        if (!Turtle.getDiskDrive()) {
            return null;
        }
        if (fs.exists(`/${Turtle.getDiskDrive()}/location.json`)) {
            const block = turtle.inspectDown();
            if (block[0]) {
                if (block[1].name === Block.Lapis_Block) {

                    let found = undefined;
                    for (let i = 0; i < 4; i++) {
                        let diskDrive = turtle.inspect();
                        if (diskDrive[0]) {
                            if (diskDrive[1].name == Block.Disk_Drive) {
                                found = diskDrive[1];
                                return `/${Turtle.getDiskDrive()}/location.json`
                            }
                        }
                        turtle.turnLeft();
                    }

                    //     fs.copy(`/${Turtle.getDiskDrive()}/location.json`, "/data/location.json");
                    //     if (fs.exists("/data/location.json")) {
                    //         let fileHandle = fs.open("/data/location.json", 'r')[0];
                    //
                    //         if (fileHandle) {
                    //             let rawStr = fileHandle.readAll()
                    //             fileHandle.close()
                    //             let worldData: WorldData = textutils.unserializeJSON(rawStr)[0];
                    //             let coordOfDiskDrive = new Vector3(worldData.x, worldData.y, worldData.z);
                    //             // let opposite = directionFromString(worldData.facing)
                    //             // print(`${oppositeDirection}`);
                    //             // let turtleCoord = getCoordInDirection(coordOfDiskDrive, directionFromString(worldData.facing) + 2 % 4);
                    //             let turtleCoord;
                    //             if (worldData.facing === "north") {
                    //                 turtleCoord = getCoordInDirection(coordOfDiskDrive, Direction.South);
                    //             } else if (worldData.facing === "east") {
                    //                 turtleCoord = getCoordInDirection(coordOfDiskDrive, Direction.West);
                    //             } else if (worldData.facing === "south") {
                    //                 turtleCoord = getCoordInDirection(coordOfDiskDrive, Direction.North);
                    //             } else if (worldData.facing === "west") {
                    //                 turtleCoord = getCoordInDirection(coordOfDiskDrive, Direction.East);
                    //             }
                    //             //
                    //             let writeHandle: FileHandle = fs.open("/data/location.json", 'w')[0];
                    //             writeHandle.write(textutils.serializeJSON({
                    //                 ...worldData,
                    //                 x: coordOfDiskDrive.x,
                    //                 y: coordOfDiskDrive.y,
                    //                 z: coordOfDiskDrive.z
                    //             }));
                    //             writeHandle.close()
                    //             return "/data/location.json";
                    //         }
                    //     }
                    // }

                }
            } else {
                print("couldnt find lapis block")
            }
        }


        return null;
    }

    static getDiskDrive(): string {
        let dirList = fs.list("/");
        return dirList.find((s) => s.startsWith("disk"));
    }

    static configFromDrive(path: string) {
        fs.copy(path, "/data/location.json");
        let fileHandle = fs.open("/data/location.json", 'r')[0];
                if (fileHandle) {
                    let rawStr = fileHandle.readAll()
                    fileHandle.close()
                    let worldData: WorldData = textutils.unserializeJSON(rawStr)[0];
                    let coordOfDiskDrive = new Vector3(worldData.x, worldData.y, worldData.z);
                    // let opposite = directionFromString(worldData.facing)
                    // print(`${oppositeDirection}`);
                    // let turtleCoord = getCoordInDirection(coordOfDiskDrive, directionFromString(worldData.facing) + 2 % 4);
                    let turtleCoord;
                    if (worldData.facing === "north") {
                        turtleCoord = getCoordInDirection(coordOfDiskDrive, Direction.South);
                    } else if (worldData.facing === "east") {
                        turtleCoord = getCoordInDirection(coordOfDiskDrive, Direction.West);
                    } else if (worldData.facing === "south") {
                        turtleCoord = getCoordInDirection(coordOfDiskDrive, Direction.North);
                    } else if (worldData.facing === "west") {
                        turtleCoord = getCoordInDirection(coordOfDiskDrive, Direction.East);
                    }
                    //
                    let writeHandle: FileHandle = fs.open("/data/location.json", 'w')[0];
                    writeHandle.write(textutils.serializeJSON({
                        ...worldData,
                        x: turtleCoord.x,
                        y: turtleCoord.y,
                        z: turtleCoord.z
                    }));
                    writeHandle.close()
                    return "/data/location.json";
                }
        //     }
        // }
    }
}
