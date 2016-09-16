function init()
boot = paintutils.loadImage("/System/Images/boot") --Turns the boot image into a variable that can be loaded at any time
desktop = paintutils.loadImage("/System/Images/desktop") --Turns the desktop background image into a variable that can be loaded at any time
term.clear() --Clears the screen
paintutils.drawImage(boot, 1,1) --Displays the boot screen
os.sleep(2) --Keeps the boot screen loaded for 2 seconds
term.setBackgroundColor(colors.brown) --Sets the desktop color to brown
term.clear() --Clears the screen
term.setCursorPos(1,1)
paintutils.drawImage(desktop, 1,1) --Displays the desktop
local w, h = term.getSize()
term.setCursorPos(1, h)
term.setBackgroundColor(colors.green) --Sets the start button color to green
term.write("Start                                              ") --Displays the start button
local event, x, y, button = os.pullEvent("mouse_click") --Recognizes mouse clicks
end
local ok, error = pcall(init) --Error API
if error then
   term.clear()
   term.setBackgroundColor(colors.blue)
   term.setCursorPos(1,1)
   print("Sorry! CarbonOS has Encountered a Serious Error!")
   print("Error: ", error)
   print()
   print("Press any key to reboot.")
   os.pullEvent("key")
   os.reboot()
end
