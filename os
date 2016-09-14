boot = paintutils.loadImage("/System/Images/boot")
desktop = paintutils.loadImage("/System/Images/desktop")
term.clear()
paintutils.drawImage(boot, 1,1)
os.sleep(2)
term.clear()
term.setCursorPos(1,1)
paintutils.drawImage(desktop, 1,1)

