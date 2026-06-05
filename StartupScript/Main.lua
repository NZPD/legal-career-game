-- Main.lua
print("\n" .. string.rep("=", 80))
print("🎮 ULTIMATE GAME HUB - Starting Server")
print("Element Awakening + Kingdom Conquest + Hunter Association")
print(string.rep("=", 80))

-- Load all systems
local PlayerManager = require(game.ServerScriptService.Systems.PlayerManager)
local GameSystem = require(game.ServerScriptService.Systems.GameSystem)
local CombatSystem = require(game.ServerScriptService.Systems.CombatSystem)
local MissionSystem = require(game.ServerScriptService.Systems.MissionSystem)
local GuildSystem = require(game.ServerScriptService.Systems.GuildSystem)

print("\n✅ All systems loaded!\n")

local Players = game:GetService("Players")
local PlayerData = {}

function onPlayerAdded(player)
    print("🎮 Player joined: " .. player.Name)
    
    -- Create player data
    local data = PlayerManager.new(player)
    data:awakenElement()
    PlayerData[player.UserId] = data
    
    wait(1)
    data:displayStats()
end

function onPlayerRemoved(player)
    print("❌ Player left: " .. player.Name)
    PlayerData[player.UserId] = nil
end

Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoved)

-- Handle existing players
for _, player in pairs(Players:GetPlayers()) do
    task.spawn(onPlayerAdded, player)
end

-- DEMO MODE - Show all systems
print(string.rep("=", 80))
print("📋 SYSTEM DEMO")
print(string.rep("=", 80))

-- Demo 1: Element System
print("\n[1/5] ELEMENT SYSTEM DEMO")
GameSystem.displayElements()

-- Demo 2: Create player and show stats
print("[2/5] CREATING DEMO PLAYER")
local demoPlayer = PlayerManager.new({Name = "DemoHero", UserId = 12345})
demoPlayer.element = "Fire"
demoPlayer:displayStats()

-- Demo 3: Learn ability
print("[3/5] LEARNING ABILITY")
GameSystem.learnAbility(demoPlayer, "Fireball")
GameSystem.learnAbility(demoPlayer, "Inferno")

-- Demo 4: Show missions
print("[4/5] HUNTER MISSIONS DEMO")
MissionSystem.displayMissions("F")

-- Demo 5: Guild system
print("[5/5] GUILD SYSTEM DEMO")
local guild1 = GuildSystem.createGuild("Phoenix Rising", "FireLord")
GuildSystem.addMember(1, "IceWizard")
GuildSystem.addMember(1, "ThunderMage")
GuildSystem.displayGuild(guild1)

-- Demo battle
local enemy = PlayerManager.new({Name = "Enemy", UserId = 99999})
enemy.element = "Ice"
enemy:gainExp(50, "test")

print("[BONUS] BATTLE DEMO")
CombatSystem.simulateBattle(demoPlayer, enemy, "Fireball")

-- Demo castle attack
print("[BONUS] GUILD WARFARE DEMO")
local guild2 = GuildSystem.createGuild("Shadow Syndicate", "DarkMaster")
GuildSystem.addMember(2, "NightBlade")
GuildSystem.attackCastle(guild1, guild2, 1)

print("\n" .. string.rep("=", 80))
print("✅ SERVER READY!")
print(string.rep("=", 80))
print("\n🎮 GAME SYSTEMS:")
print("  ⚡ Element Awakening - Level up your element and unlock abilities")
print("  👑 Kingdom Conquest - Create guilds and conquer castles")
print("  🏹 Hunter Association - Complete missions and climb ranks")
print("\nWaiting for players...\n")