import {Turtle, WorldData} from "./world/turtle";

export class Client {
    localTurtle: Turtle;
    websocket: lWebSocket;
    websocketAddress: string;
    websocketPort: number;

    constructor(configPath: string) {
        const data: WorldData = Client.loadConfigFile(configPath);
        this.websocketAddress = data.server;
        this.websocketPort = data.port;
        this.localTurtle = new Turtle(configPath);
    }

    public listener() {
        while (true){
            let data = this.websocket.receive();
            print(data);
        }
    }

    public connectSocket() {
        let ws = http.websocket(`ws://${this.websocketAddress}"${this.websocketPort}`);
        if(ws[0]) {
            this.websocket = ws[0];
        }
    }


    public static loadConfigFile(configFile: string): WorldData {
        let filehandle = fs.open(configFile, 'r')[0];
        if(filehandle) {
            let raw = textutils.unserializeJSON(filehandle.readAll());
            filehandle.close();
            if(raw[0]) {
                return raw[0];
            }
        }
        return null
    }
}
