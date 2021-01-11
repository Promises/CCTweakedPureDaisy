let [w,h] = term.getSize()

function printCentered(y:any, s: string) {
    let x = Math.floor((w - s.length) / 2)
    term.setCursorPos(x, y)
    term.clearLine()
    term.write(s)
}

let nOption = 1

/** Draw Menu the Menu and its current selection */
function drawMenu(){
    term.clear()
    term.setCursorPos(1, 1)
    term.write("First OS")

    term.setCursorPos(w-11, 1)
    if (nOption == 1) {
        term.write("Command")
    } else if (nOption == 2) {
        term.write("Programs")
    } else if (nOption == 3) {
        term.write("Shutdown")
    } else if (nOption == 4) {
        term.write("Uninstall")
    } else {
        // Do nothing
    }
}

// GUI
term.clear()
function drawFrontend() {
    let posY = Math.floor(h/2) - 3
    printCentered(posY, "")
    posY++
    printCentered(posY, "  Start Menu  ")
    posY++
    printCentered(posY, "")
    posY++
    // Print Menu Option Command
    printCentered(posY, nOption == 1 ? "[ Command  ]": "Command ")
    posY++
    // Print Menu Option Programs
    printCentered(posY, nOption == 2 ? "[ Programs ]": "Programs")
    posY++
    // Print Menu Option Shutdown
    printCentered(posY, nOption == 3 ? "[ Shutdown ]": " Shutdown ")
    posY++
    // Print Menu Option Uninstall
    printCentered(posY, nOption == 4 ? "[ Uninstall ]": " Uninstall ")
}

// Display

drawMenu()
drawFrontend()

while (true){
    let [event, p] = os.pullEvent()
    if(event == "key"){
        let key: number = p
        let redraw: boolean = false
        if (key == 17 || key == 200) {
            if (nOption > 1) {
                nOption--
                redraw = true
            }
        } else if (key == 31 || key == 208) {
            if (nOption < 4) {
                nOption++
                redraw = true
            }
        }
        if (redraw) {
            drawMenu()
            drawFrontend()
        }
    }
}