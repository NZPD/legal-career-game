-- Main.lua
print("\n" .. string.rep("=", 50))
print("⚖️ LEGAL CAREER PROGRESSION GAME ⚖️")
print("Initializing...")
print(string.rep("=", 50))

local GameManager = require(game.ServerScriptService.GameSystems.GameManager)
local CaseManager = require(game.ServerScriptService.GameSystems.CaseManager)
local FinanceSystem = require(game.ServerScriptService.GameSystems.FinanceSystem)
local ReputationSystem = require(game.ServerScriptService.GameSystems.ReputationSystem)
local JudicialSchool = require(game.ServerScriptService.JudicialSchool)
local GameConfig = require(game.ReplicatedStorage.GameConfig)

print("✅ All modules loaded!")

local gameManager = GameManager.new()

local Players = game:GetService("Players")

function onPlayerAdded(player)
    print("\n👤 Player joined:", player.Name)
    local playerData = gameManager:initializePlayer(player)
    
    print("\n🎓 Starting tutorial...")
    local school = JudicialSchool.new(playerData)
    school:startTutorial()
    
    wait(2)
    gameManager:displayPlayerStats(player)
end

function onPlayerRemoving(player)
    print("\n👤 Player left:", player.Name)
    gameManager.players[player.UserId] = nil
end

Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)

for _, player in pairs(Players:GetPlayers()) do
    task.spawn(onPlayerAdded, player)
end

print("\n" .. string.rep("=", 50))
print("✅ GAME SERVER READY!")
print("Waiting for players...")
print(string.rep("=", 50) .. "\n")