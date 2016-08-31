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

    deamonFile.close()

    print("Loaded: "..v)
end

_G.carbide = {}

_G.carbide["getRunningProcesses"] = function()
    return unpack(deamons)
end

_G.carbide["startNewProcess"] = function(toRun, name, priority, autorestart)
    deamons[#deamons + 1] = {
        ["Name"] = name,
        ["Priority"] = priority,
        ["Function"] = toRun,
        ["AutoRestart"] = autorestart,
    }
end

_G.carbide["stopProcess"] = function(pid)
    if deamons[pid] ~= nil then
        deamons[pid] = nil
    else
        return false
    end
end

