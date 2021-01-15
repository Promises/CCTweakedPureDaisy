import {Vector3} from "./Vector3";
import {Turtle} from "../turtle";

export class Node {
    type: string = '';
    walkable: boolean;
    turtle: Turtle | undefined = undefined;
    private worldPosition: Vector3;

    gCost: number;
    hCost: number;

    constructor(_walkable: boolean, _worldPos: Vector3) {
        this.walkable = _walkable;
        this.worldPosition = _worldPos;
    }

    public fCost() {
        return this.gCost + this.hCost;
    }

}
