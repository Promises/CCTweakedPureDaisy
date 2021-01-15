import {Node} from "./node";
import {Vector3} from "./Vector3";

export class Grid {
    grid: Node[][];

    gridSizeX: number;
    gridSizeY: number;

    constructor(width: number, height: number) {
        this.gridSizeX = width;
        this.gridSizeY = height;
        this.grid = [];
        for (let x =0; x<this.gridSizeX;x++) {
            this.grid[x] = []
            for (let y = 0; y < this.gridSizeY; y++) {
                this.grid[x][y] = new Node(false, new Vector3(x,1,y))
            }
        }
    }

    public drawGrid() {
        for (let x = 0; x< this.gridSizeX;x++) {
            let rowstr = '';
            for (let y =0; y<this.gridSizeY;y++) {
                let node = this.grid[x][y]
                if(node.turtle) {
                    rowstr += utf8.char(2);
                } else if(node.type != ''){
                    rowstr += this.grid[x][y].walkable ? ' ' : utf8.char(4);
                } else {
                    rowstr += '?';
                }
            }
            print(rowstr);
        }
    }
}
