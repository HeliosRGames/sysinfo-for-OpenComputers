local computer = require("computer")
local colors = require("colors")
local io = require("io")
local component = require("component")
local modem = component.modem

function round(a)
  return math.floor(a+0.5)
end

local uptimeseconds = round(computer.uptime())
local remainingsec = round(uptimeseconds%60)
local uptimeminutes = round((uptimeseconds-remainingsec)/60)
local uptime = tostring(uptimeminutes).." minutes "..tostring(remainingsec).." seconds"
local energy = round(computer.energy())
local maxEnergy = round(computer.maxEnergy())
local energyPercentage = tostring(round((energy/maxEnergy)*100)).."%"
local freeMem = round(computer.freeMemory()/1024)
local totalMem = round(computer.totalMemory()/1024)
local memPercentage = tostring(round((freeMem/totalMem)*100)).."%"

print("System uptime: "..uptime)
print("Power: "..tostring(energy).."U/"..tostring(maxEnergy).."U ("..energyPercentage..")")
print("Memory usage: "..freeMem.."KB/"..totalMem.."KB ("..memPercentage..")")
print("Wireless Netword Card Address: "..tostring(modem.address))
