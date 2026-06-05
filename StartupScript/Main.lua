-- Main.lua (Updated)
print("\n" .. string.rep("=", 60))
print("⚖️  LEGAL CAREER PROGRESSION GAME⚖️")
print("Inspired by Phoenix Wright: Ace Attorney")
print("Initializing...")
print(string.rep("=", 60))

local GameManager = require(game.ServerScriptService.GameSystems.GameManager)
local CaseManager = require(game.ServerScriptService.GameSystems.CaseManager)
local CaseDatabase = require(game.ServerScriptService.GameSystems.CaseDatabase)
local MenuController = require(game.ServerScriptService.GameSystems.MenuController)
local CourtScene = require(game.ServerScriptService.GameSystems.CourtScene)

print("✅ All modules loaded!")

local gameManager = GameManager.new()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

function onPlayerAdded(player)
    print("\n👤 Player joined: " .. player.Name)
    local playerData = gameManager:initializePlayer(player)
    wait(1)
    gameManager:displayPlayerStats(player)
end

function onPlayerRemoving(player)
    print("\n👤 Player left: " .. player.Name)
    gameManager.players[player.UserId] = nil
end

Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)

for _, player in pairs(Players:GetPlayers()) do
    task.spawn(onPlayerAdded, player)
end

-- Menu Signal Handler
local menuSignal = ReplicatedStorage:WaitForChild("MenuSignal")
menuSignal.OnServerEvent:Connect(function(player, buttonName)
    MenuController.handleMenuClick(player, buttonName)
end)

-- Case Signal Handler
local caseSignal = ReplicatedStorage:WaitForChild("CaseSignal")
caseSignal.OnServerEvent:Connect(function(player, action, caseTitle)
    if action == "SelectCase" then
        print("\nPlayer " .. player.Name .. " selected case: " .. caseTitle)
        -- Start investigation phase
    end
end)

print("\n" .. string.rep("=", 60))
print("✅ GAME SERVER READY!")
print("Waiting for players...")
print(string.rep("=", 60) .. "\n")