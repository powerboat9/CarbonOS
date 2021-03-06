local function center(txt, defaultOffset)
    local oldX, oldY = term.getCursorPos()
    local x, y = term.getSize()
    y = y / 2
    x = x / 2
    local lines = {}
    do
        local temp = txt
        while true do
            local new = txt:match("^([^\n]*)\n?")
            if new then
                lines[#lines + 1] = new
            else
                break
            end
        end
    end
    local offset = (#lines - 1) / 2 + (defaultOffset or 0)
    for i = 0 - offset, 0 + offset do
        term.setCursorPos(math.floor((x - #lines[i + offset + 1]) / 2), math.floor(y + offset))
        term.write(lines[i + offset + 1])
    end
    term.setCursorPos(oldX, oldY)
end

local function wipe()
    term.clear()
    term.setCursorPos(1, 1)
end

local function BSOD(err)
    term.setBackgroundColor(term.isColor() and colors.blue or colors.black)
    term.setTextColor(colors.white)
    center([[Sorry! CarbonOS has Encountered a Serious Error!
Error: ]] .. tostring(err) .. [[
Press any key to reboot.]])
    os.pullEvent("key")
    os.reboot()
end

local function getGreyscale(c)
    if c == colors.white or c == colors.black or c == colors.grey or c == colors.lightGrey then
        return c
    else
        return colors.lightGrey
    end
end

local icons = {}
local function addIcon(funct, display)
    if type(funct) ~= "function" or type(display) ~= "table" or (type(display.greyscale) ~= "table" and type(display.color) ~= "table") then
        error("Invalid input", 2)
    if not term.isColor() then
        if type(display.grayscale) == "table" then
            display = display.greyscale
        else
            local newDisplay = {}
            for 
    end
        
       
local function redrawDesktop()
    term.setBackgroundColor(term.isColor() and colors. or colors.lightGrey) --Sets the start button color to green
    term.setTextColor(colors.white)
    wipe()
    term.write("Start") --Displays the start button

local function init()
    local bootImg = paintutils.loadImage("/System/Images/boot") --Turns the boot image into a variable that can be loaded at any time
    local desktopImg = paintutils.loadImage("/System/Images/desktop") --Turns the desktop background image into a variable that can be loaded at any time
    wipe()
    print("Loading Boot Screen...")
    paintutils.drawImage(boot, 1,1) --Displays the boot screen
--os.sleep(2) --Keeps the boot screen loaded for 2 seconds
    term.setBackgroundColor(term.isColor() and colors.brown or colors.black) --Sets the desktop color to brown (or grey)
    term.clear() --Clears the screen
    paintutils.drawImage(desktop, 1,1) --Displays the desktop
    local w, h = term.getSize()
    term.setBackgroundColor(term.isColor() and colors.green or colors.lightGrey) --Sets the start button color to green
    term.setTextColor(colors.white)
    wipe()
    term.write("Start") --Displays the start button
    local event, x, y, button = os.pullEvent("mouse_click") --Recognizes mouse clicks
end

local ok, err = pcall(init) --Crash API
if err then
   BSOD(err)
end
