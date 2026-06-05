-- LocalMenuController.lua
-- Client-side menu controller

local LocalMenuController = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local MainMenuUI = require(script.Parent:WaitForChild("MainMenuUI"))

function LocalMenuController.initializeMenu()
    -- Wait for startup
    wait(2)
    
    -- Create main menu
    local menuGui = MainMenuUI.createMainMenu()
    print("Main menu created")
end

function LocalMenuController.openCaseMenu()
    local caseGui, scrollFrame = MainMenuUI.createCaseMenu()
    
    local CaseDatabase = require(ReplicatedStorage:WaitForChild("CaseDatabase"))
    local cases = CaseDatabase.getAllCases()
    
    for i, caseData in ipairs(cases) do
        MainMenuUI.addCaseButton(scrollFrame, caseData, i)
    end
end

-- Start menu on spawn
LocalMenuController.initializeMenu()

return LocalMenuController