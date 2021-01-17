import {Turtle} from "./world/turtle";
import {loadConfigFile, WorldData} from "./world/data";

export class Client {
    localTurtle: Turtle;
    websocket: lWebSocket;
    websocketAddress: string;
    websocketPort: number;

    constructor(configPath: string) {
        const data: WorldData = loadConfigFile(configPath);
        this.websocketAddress = data.server;
        this.websocketPort = data.port;
        this.localTurtle = new Turtle(configPath);
    }

    public listener() {
        print(this.websocket.receive());
    }

    public connectSocket() {
        const url = `ws://${this.websocketAddress}:${this.websocketPort}`;
        print("connecting to " + url);
        let ws = http.websocket(url);
        if(ws[0]) {
            this.websocket = ws[0];
        } else {
            print(ws[1])
        }
    }



}
