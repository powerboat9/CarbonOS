if fs.exists("/System/log") == true then -- Checks if log file exists
   fs.delete("/System/log") -- If so, delete's it
end
log = fs.open("/System/log", "w") -- Creates new log file in write mode
function init()
log.write("Storing Images...")
boot = paintutils.loadImage("/System/Images/boot") --Turns the boot image into a variable that can be loaded at any time
desktop = paintutils.loadImage("/System/Images/desktop") --Turns the desktop background image into a variable that can be loaded at any time
log.write("Done!")
term.clear() --Clears the screen
print("Loading Boot Screen...")
paintutils.drawImage(boot, 1,1) --Displays the boot screen
os.sleep(2) --Keeps the boot screen loaded for 2 seconds
term.write("Loading GUI...")
term.setBackgroundColor(colors.brown) --Sets the desktop color to brown
term.clear() --Clears the screen
term.setCursorPos(1,1)
paintutils.drawImage(desktop, 1,1) --Displays the desktop
term.write("Getting Size of Screen...")
local w, h = term.getSize()
term.setCursorPos(1, h)
term.setBackgroundColor(colors.green) --Sets the start button color to green
term.write("Start                                              ") --Displays the start button
local event, x, y, button = os.pullEvent("mouse_click") --Recognizes mouse clicks
end
local ok, error = pcall(init) --Crash API
if error then
   log.write("System Crash! Error: ", error)
   rlog = log.readAll()
   log.close()
   term.clear()
   term.setBackgroundColor(colors.blue)
   term.setCursorPos(1,1)
   print("Sorry! CarbonOS has Encountered a Serious Error!")
   print("Error: ", error)
   print()
   print("Log:")
   print(rLog)
   print()
   print("Press any key to reboot.")
   os.pullEvent("key")
   os.reboot()
end
