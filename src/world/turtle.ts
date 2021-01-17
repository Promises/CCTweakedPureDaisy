/** @noSelfInFile **/
import {Block} from "../block";
import {stringToDirection} from "./direction";
import {Client} from "../client";

export enum Direction {
    North,
    West,
    South,
    East,
}

export const VerboseDirection = [
    "North",
    "West",
    "South",
    "East",
]

export interface WorldData {
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

    constructor(configFile: string) {
        let worldData = Client.loadConfigFile(configFile);
        this.currentDirection = stringToDirection(worldData.facing);
        this.currentX = worldData.x;
        this.currentY = worldData.y;
        this.currentZ = worldData.z;
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

    public dropDown(slot: number, forceUpdate: boolean = false) {
        turtle.select(slot + 1);
        turtle.dropDown();
        os.sleep(0.1)
        if (forceUpdate) {
            this.refreshInventory();
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

    public getBlockDown(): string {
        let block = turtle.inspectDown();
        if (block[0]) {
            return block[1].name;
        }
        return 'minecraft:air';
    }

    public getBlockUp(): string {
        let block = turtle.inspectUp();
        if (block[0]) {
            return block[1].name;
        }
        return 'minecraft:air';
    }

    public getBlock(): string {
        let block = turtle.inspect();
        if (block[0]) {
            return block[1].name;
        }
        return 'minecraft:air';
    }

    public placeDownSlot(slot: number = 1) {
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
        return "/data/location.json";
    }
}
