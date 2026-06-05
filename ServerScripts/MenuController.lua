-- MenuController.lua
-- Handles menu interactions and case selection

local MenuController = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create signals if they don't exist
if not ReplicatedStorage:FindFirstChild("MenuSignal") then
    local menuSignal = Instance.new("RemoteEvent")
    menuSignal.Name = "MenuSignal"
    menuSignal.Parent = ReplicatedStorage
end

if not ReplicatedStorage:FindFirstChild("CaseSignal") then
    local caseSignal = Instance.new("RemoteEvent")
    caseSignal.Name = "CaseSignal"
    caseSignal.Parent = ReplicatedStorage
end

function MenuController.handleMenuClick(player, buttonName)
    print("Menu clicked: " .. buttonName .. " by " .. player.Name)
    
    if buttonName == "New Game" then
        MenuController.startNewGame(player)
    elseif buttonName == "Continue" then
        MenuController.continueGame(player)
    elseif buttonName == "Case Archive" then
        MenuController.showCaseArchive(player)
    elseif buttonName == "Statistics" then
        MenuController.showStatistics(player)
    elseif buttonName == "Settings" then
        MenuController.showSettings(player)
    elseif buttonName == "Quit" then
        MenuController.quitGame(player)
    end
end

function MenuController.startNewGame(player)
    print("Starting new game for " .. player.Name)
    -- Show case selection menu
    MenuController.showCaseSelection(player)
end

function MenuController.continueGame(player)
    print("Continuing game for " .. player.Name)
    -- Load last case
end

function MenuController.showCaseArchive(player)
    print("Showing case archive for " .. player.Name)
end

function MenuController.showStatistics(player)
    print("Showing statistics for " .. player.Name)
end

function MenuController.showSettings(player)
    print("Showing settings for " .. player.Name)
end

function MenuController.quitGame(player)
    print(player.Name .. " quit the game")
    player:Kick("Thanks for playing!")
end

function MenuController.showCaseSelection(player)
    local CaseDatabase = require(game.ServerScriptService.GameSystems.CaseDatabase)
    local playerData = game.ServerScriptService.GameManager:getPlayerData(player)
    
    local cases = CaseDatabase.getCasesByCareer(playerData.careerStage)
    
    print("\n" .. string.rep("=", 60))
    print("📋 AVAILABLE CASES FOR " .. playerData.careerStage:upper())
    print(string.rep("=", 60))
    
    for i, case in ipairs(cases) do
        print(i .. ". " .. case.title .. " [" .. case.difficulty .. "] - Reward: $" .. case.reward)
        print("   " .. case.description)
    end
    print(string.rep("=", 60))
end

return MenuController