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


export function stringToDirection(s:string): Direction {
   let direction = VerboseDirection.findIndex(dir => dir.toLowerCase() === s.toLowerCase());
   if(direction) {
       return direction;
   }
   return 0
}
