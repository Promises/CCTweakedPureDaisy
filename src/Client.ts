import {Turtle} from "./World/turtle";

export class Client {
    localTurtle: Turtle;
    websocket: lWebSocket;


    constructor(props) {
        super(props);
        Turtle.findData();
    }

}
