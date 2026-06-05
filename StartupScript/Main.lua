-- Main.lua - Updated Game Hub
print("\n" .. string.rep("=", 60))
print("🎮 MULTI-GAME HUB - Starting Server")
print(string.rep("=", 60))

local PlayerData = require(game.ServerScriptService.GameSystems.PlayerData)
local ElementSystem = require(game.ServerScriptService.GameSystems.ElementSystem)
local HunterSystem = require(game.ServerScriptService.GameSystems.HunterSystem)
local GuildSystem = require(game.ServerScriptService.GameSystems.GuildSystem)
local GameHub = require(game.ServerScriptService.GameSystems.GameHub)

print("✅ All systems loaded!\n")

local Players = game:GetService("Players")
local playerDataStore = {}

function onPlayerAdded(player)
    print("👤 Player joined: " .. player.Name)
    
    local data = PlayerData.new(player)
    playerDataStore[player.UserId] = data
    
    -- Awaken their element
    local element = data:awakeneElement()
    
    -- Show game hub
    wait(1)
    GameHub.displayMainHub()
    
    -- Display initial stats
    wait(1)
    data:displayStats()
end

function onPlayerRemoving(player)
    print("👤 Player left: " .. player.Name)
    playerDataStore[player.UserId] = nil
end

Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)

for _, player in pairs(Players:GetPlayers()) do
    task.spawn(onPlayerAdded, player)
end

-- Demo mode to show all systems
print("\n📖 DEMO MODE ACTIVATED\n")

-- Demo Element System
print("--- ELEMENT SYSTEM DEMO ---")
ElementSystem.displayElement("Fire")

-- Demo Hunter System
print("--- HUNTER SYSTEM DEMO ---")
HunterSystem.displayAvailableMissions("F")

-- Demo Guild System
print("--- GUILD SYSTEM DEMO ---")
local demoGuild = GuildSystem.createGuild("Phoenix Rising", "FireLord")
GuildSystem.addMember(demoGuild, "IceWizard")
GuildSystem.addMember(demoGuild, "ThunderMage")
GuildSystem.displayGuildStats(demoGuild)

-- Demo Battle
print("--- SIMULATING GUILD BATTLE ---")
local enemyGuild = GuildSystem.createGuild("Shadow Syndicate", "DarkMaster")
GuildSystem.addMember(enemyGuild, "NightBlade")
GuildSystem.attackCastle(demoGuild, enemyGuild, 1)

print("\n" .. string.rep("=", 60))
print("✅ GAME SERVER READY!")
print("Waiting for players...")
print(string.rep("=", 60) .. "\n")