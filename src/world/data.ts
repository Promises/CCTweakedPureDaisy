export interface WorldData {
    facing: 'north' | 'east' | 'south' | 'west';
    x: number;
    y: number;
    z: number;
    server: string;
    port: number;
}

export function loadConfigFile(configFile: string): WorldData {
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
