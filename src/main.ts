import {Turtle} from "./world/turtle";
import {Client} from "./client";
print("starting v2");

let dataJson = Turtle.findData();

if(dataJson) {
    if(dataJson.startsWith('/disk')){
        print(Turtle.configFromDrive(`/${Turtle.getDiskDrive()}/location.json`));
    }
}

let c = new Client(dataJson);
try {

    c.connectSocket();

    if (c.websocket) {
        c.listener()
        // parallel.waitForAll(()=> c.listener(), () => {
        //     while (true) {
        //         turtle.turnLeft();
        //     }
        // });
    } else {
        print("not connected")
    }

} catch (e) {
    print(e);
    if(c.websocket) {
        c.websocket.close();
    }
}
if(c.websocket) {
    c.websocket.close();
}










// const LWX = 6;
// const LWY = 2;
// const LRX = 2;
// const LRY = 2;
//
// function doRound(itemToPlace: BarrelItem) {
//     const startX = t.currentX;
//     const startY = t.currentZ;
//    for (let x = 0; x < 3; x++){
//        let rX = startX - x;
//        for (let y = 0; y < 3; y++){
//            let rY = x == 1 ? startY - 2 + y : startY - y;
//            if(t.findInventorySlot(itemToPlace.name) === -1) {
//                print("Ran out of "+itemToPlace.name);
//                return;
//            }
//            t.walkTo(rX, rY);
//             doBlock(itemToPlace);
//        }
//    }
// }
//
// function doBlock(itemToPlace: BarrelItem) {
//     let block = t.getBlockDown();
//     if(block.startsWith('botania:living')){
//         t.digDown();
//         t.placeDown(itemToPlace.name)
//     }
// }
//
// //
// // let grid = new Grid(10,10);
// // grid.grid[4][5].type = 'minecraft:air'
// // grid.grid[4][5].walkable = true
// // grid.grid[4][4].type = 'minecraft:air'
// // grid.grid[4][4].turtle = t
// // grid.grid[4][4].walkable = true
// // grid.grid[4][3].type = 'minecraft:air'
// // grid.grid[4][3].walkable = true
// // grid.grid[4][2].type = 'minecraft:air'
// // grid.grid[4][2].walkable = true
// // grid.drawGrid();
//
//
//
//
// let gathered = 0;
// while (true) {
//     term.clear();
//     print("Getting Coal, What else you fuck?")
//     print("Gathered " + gathered)
//     print("Fuel is: " + turtle.getFuelLevel())
//     t.cleanInventory();
//     if(t.shouldRefuel()){
//         print("Refueling")
//         t.refuel();
//     }
//     let block = t.getBlock();
//     if(block === Items.CobbleStone.name){
//         t.dig();
//         gathered++;
//     } else {
//         sleep(0.3);
//     }
// }


//
// while (true) {
//     term.clear();
//     print("Cleaning Inventory")
//     t.cleanInventory();
//     print("Fuel is: " + turtle.getFuelLevel())
//     if(t.shouldRefuel()){
//         print("Refueling")
//         t.refuel();
//     }
//     print("Doing Living Wood")
//     t.getItem(Items.Oak);
//     t.walkTo(LWX, LWY);
//     doRound(Items.Oak);
//     print("Cleaning Inventory")
//     t.cleanInventory();
//     print("Doing Living Rock")
//     t.getItem(Items.Stone);
//     t.walkTo(LRX, LRY);
//     doRound(Items.Stone);
//     print("Cleaning Inventory")
//     t.cleanInventory();
//     t.walkToBarrel(Items.Coal);
//     t.setDirection(Direction.Up);
//     print("Sleeping")
//     os.sleep(30);
// }
