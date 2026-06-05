-- LocalCaseUI.lua
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local CaseUI = {}

function CaseUI.displayMainMenu()
    print("\n" .. string.rep("=", 40))
    print("⚖️ LEGAL CAREER PROGRESSION GAME ⚖️")
    print(string.rep("=", 40))
    print("\n📋 MAIN MENU")
    print("1. Take a Case")
    print("2. View Stats")
    print("3. Study")
    print("4. Available Cases")
    print("5. Career Info")
    print(string.rep("=", 40))
end

function CaseUI.displayPlayerStats(playerData)
    local winRate = 0
    if (playerData.casesWon + playerData.casesLost) > 0 then
        winRate = math.floor((playerData.casesWon / (playerData.casesWon + playerData.casesLost)) * 100)
    end
    
    print("\n" .. string.rep("=", 40))
    print("📊 PLAYER STATISTICS")
    print("Name: " .. playerData.name)
    print("Career: " .. playerData.careerStage)
    print("Level: " .. playerData.level .. "/6")
    print("Money: $" .. playerData.money)
    print("Reputation: " .. playerData.reputation)
    print("Cases Won: " .. playerData.casesWon)
    print("Cases Lost: " .. playerData.casesLost)
    print("Win Rate: " .. winRate .. "%")
    print(string.rep("=", 40) .. "\n")
end

return CaseUI