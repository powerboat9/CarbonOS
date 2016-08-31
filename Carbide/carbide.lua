-- Carbide
-- For CarbonOS

local configFile = "Core/Config.conf"

local configFile = fs.open(configFile, "r")

local configOptions = textutils.unserialize(configFile.readAll())

configFile.close()

local rawDeamons = fs.list(configFile.deamonDirectory)

local deamons = {}

local deamonFile

for k, v in pairs(rawDeamons) do
    deamonFile = fs.open(v, "r")

    deamons[k] = {
        ["Name"] = v,
        ["Priority"] = "NORMAL",
        ["Function"] = loadstring(deamonFile.readAll()),
        ["AutoRestart"] = false,
    }
end

