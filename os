CarbonOS = true
os.loadAPI("/System/APIs/sha256")
local function center(text)
  local x,y = term.getSize()
  local x2,y2 = term.getCursorPos()
  term.setCursorPos(math.floor((x / 2) - (text:len() / 2)), y2)
  end
local mon = peripheral.find("monitor")
if mon then
   secondDisplay = true
   mon.setBackgroundColor(colors.brown)
   mon.clear()
else
secondDisplay = nil
end
function init()
tmp = fs.open("/System/.firstuse", "r")
if tmp.readLine() == "true" then
   firstUse = true
end
tmp.close()
boot = paintutils.loadImage("/System/Images/boot") --Turns the boot image into a variable that can be loaded at any time
desktop = paintutils.loadImage("/System/Images/desktop") --Turns the desktop background image into a variable that can be loaded at any time
term.clear() 
paintutils.drawImage(boot, 1,1) 
os.sleep(2)
term.setBackgroundColor(colors.brown)
term.clear() 
term.setCursorPos(1,1)
if firstUse then
   textutils.slowPrint("Welcome to CarbonOS!")
   print()
   textutils.slowPrint("CarbonOS is a simple, fast, and easy to use OS.")
   print()
   textutils.slowPrint("Before you can use this OS, You will have to go through the setup.")
   print()
   textutils.slowPrint("The setup is very quick and should not take more then 5 minutes.")
   os.sleep(3)
   term.clear()
   term.setCursorPos(1,1)
   center("Account")
   term.setCursorPos(2,10)
   print("With an account, you can install your own Programs, set Parental Controls for your child(s), and do much more!")
   print("You can also have your own files for each account.")
   print()
   term.write("Username: ")
   user = read()
   term.write("Password: ")
   pass = read()
   print()
   print("Creating Account...")
   local salt = "amazing"
   local hash = sha256.pbkdf2(pass, salt, 100)
   fs.makeDir(fs.combine("/System/Users/", user))
   shell.run("cd /System/Users/", user)
   fs.makeDir("Programs")
   fs.makeDir("Documents")
   local welcome = {
                   "Welcome to CarbonOS!",
                   "You can do alot of things in this OS",
                   "Notice the GUI? You can do alot of things with the Amazing GUI",
                   "What do all OS's miss out? The fact that cannot extend programs on to muliple monitors",
                   "CarbonOS is the First OS that can!",
                   "Thank You for using CarbonOS!",
                   "Credits:",
                   "Anavrins - SHA256 API",
                   "oeed - Ink",
                   "GravityScore - LuaIDE",
                   "Thank You!"
                   }
   shell.run("cd", fs.combine("/System/Users/", user))
   shell.run("cd Documents")
   file = fs.open(fs.combine("/System/Users/", user, "w"))
   for _,line in ipairs(welcome) do
   file.write(line)
   end
   file.close()
   print("Done!")
   term.clear()
   term.setCursorPos(1,1)
   textutils.slowPrint("You can now use CarbonOS!")
   textutils.slowPrint("Enjoy!")
   os.sleep(1)
   os.reboot()
          
                   
end
paintutils.drawImage(desktop, 1,1) 
local w, h = term.getSize()
term.setCursorPos(1, h)
term.setBackgroundColor(colors.green)
term.write("Start                                              ") --Displays the start button
local event, x, y, button = os.pullEvent("mouse_click") --Recognizes mouse clicks
end
local ok, error = pcall(init) 
if error then
   term.clear()
   term.setBackgroundColor(colors.blue)
   term.clear()
   term.setCursorPos(1,1)
   print("Sorry! CarbonOS has Encountered a Serious Error!")
   print("Error: ", error)
   print()
   print("Press any key to reboot.")
   os.pullEvent("key")
   os.reboot()
   return
end
