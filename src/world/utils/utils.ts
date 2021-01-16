import {Direction} from "../turtle";
import {Vector3} from "../grid/Vector3";

export function getCoordInDirection(source: Vector3, direction: Direction): Vector3 {
    if(direction === Direction.North) {
        return new Vector3(source.x, source.y, source.z-1);
    }
    if(direction === Direction.East) {
        return new Vector3(source.x+1, source.y, source.z);
    }
    if(direction === Direction.South) {
        return new Vector3(source.x, source.y, source.z+1);
    }
    if(direction === Direction.West) {
        return new Vector3(source.x-1, source.y, source.z);
    }
}
