--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
w, h = term.getSize()
function printCentered(y, s)
    local x = math.floor((w - #s) / 2)
    term.setCursorPos(x, y)
    term.clearLine()
    term.write(s)
end
nOption = 1
function drawMenu()
    term.clear()
    term.setCursorPos(1, 1)
    term.write("First OS")
    term.setCursorPos(w - 11, 1)
    if nOption == 1 then
        term.write("Command")
    elseif nOption == 2 then
        term.write("Programs")
    elseif nOption == 3 then
        term.write("Shutdown")
    elseif nOption == 4 then
        term.write("Uninstall")
    else
    end
end
term.clear()
function drawFrontend()
    local posY = math.floor(h / 2) - 3
    printCentered(posY, "")
    posY = posY + 1
    printCentered(posY, "  Start Menu  ")
    posY = posY + 1
    printCentered(posY, "")
    posY = posY + 1
    printCentered(posY, ((nOption == 1) and "[ Command  ]") or "Command ")
    posY = posY + 1
    printCentered(posY, ((nOption == 2) and "[ Programs ]") or "Programs")
    posY = posY + 1
    printCentered(posY, ((nOption == 3) and "[ Shutdown ]") or " Shutdown ")
    posY = posY + 1
    printCentered(posY, ((nOption == 4) and "[ Uninstall ]") or " Uninstall ")
end
drawMenu()
drawFrontend()
while true do
    local event, p = os.pullEvent()
    if event == "key" then
        local key = p
        local redraw = false
        if (key == 17) or (key == 200) then
            if nOption > 1 then
                nOption = nOption - 1
                redraw = true
            end
        elseif (key == 31) or (key == 208) then
            if nOption < 4 then
                nOption = nOption + 1
                redraw = true
            end
        end
        if redraw then
            drawMenu()
            drawFrontend()
        end
    end
end
