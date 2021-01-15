// import {Grid} from "./grid";
// import {Node} from "./node";
// import {open} from "fs-extra";
//
// export class Pathfinding {
//     grid: Grid;
//
//     findPath(startNode: Node, targetNode: Node) {
//         let openSet: Node[] = [];
//         let closedSet: Map<string, Node> = new Map<string, Node>();
//         openSet.push(startNode);
//
//         while (openSet.length > 0) {
//             let currentNodeIndx = 0;
//             for (let i = 1; i < openSet.length; i++) {
//                 if (openSet[i].fCost() < currentNode.fCost() || openSet[i].fCost() === currentNode.fCost() && openSet[i].hCost < currentNode.hCost) {
//                     currentNodeIndx = openSet[i];
//                 }
//             }
//             openSet.slice()
//         }
//     }
// }
