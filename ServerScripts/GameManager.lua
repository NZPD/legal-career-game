-- GameManager.lua
local GameManager = {}
GameManager.__index = GameManager

function GameManager.new()
    local self = setmetatable({}, GameManager)
    self.players = {}
    self.cases = {}
    return self
end

function GameManager:initializePlayer(player)
    local playerData = {
        name = player.Name,
        level = 1,
        money = 5000,
        reputation = 0,
        casesWon = 0,
        casesLost = 0,
        careerStage = "Intern",
        completedTutorial = false,
        joinedAt = os.time()
    }
    self.players[player.UserId] = playerData
    print("✅ Player initialized:", player.Name)
    return playerData
end

function GameManager:getPlayerData(player)
    return self.players[player.UserId]
end

function GameManager:updatePlayerProgress(player, caseResult, caseReward)
    local playerData = self:getPlayerData(player)
    if not playerData then return end
    
    if caseResult == "won" then
        playerData.casesWon = playerData.casesWon + 1
        playerData.money = playerData.money + caseReward
        playerData.reputation = playerData.reputation + 10
        print("🎉 Case WON! +$" .. caseReward)
    else
        playerData.casesLost = playerData.casesLost + 1
        playerData.money = playerData.money - (caseReward * 0.3)
        playerData.reputation = playerData.reputation + 2
        print("😢 Case LOST")
    end
    
    self:checkForPromotion(playerData)
end

function GameManager:checkForPromotion(playerData)
    local careerPath = {"Intern", "Public Defender", "Attorney", "Senior Counsel", "Chief Prosecutor", "Supreme Court Justice"}
    local promotionRequirements = {
        ["Intern"] = {casesWon = 3, reputation = 25},
        ["Public Defender"] = {casesWon = 10, reputation = 100},
        ["Attorney"] = {casesWon = 20, reputation = 250},
        ["Senior Counsel"] = {casesWon = 40, reputation = 500},
        ["Chief Prosecutor"] = {casesWon = 70, reputation = 1000}
    }
    
    local currentIndex = table.find(careerPath, playerData.careerStage)
    if currentIndex and currentIndex < #careerPath then
        local nextStage = careerPath[currentIndex + 1]
        local requirements = promotionRequirements[playerData.careerStage]
        
        if requirements and playerData.casesWon >= requirements.casesWon and playerData.reputation >= requirements.reputation then
            playerData.careerStage = nextStage
            playerData.level = currentIndex + 1
            playerData.money = playerData.money + (requirements.reputation * 5)
            print("⭐ PROMOTION! You are now a " .. nextStage)
        end
    end
end

function GameManager:displayPlayerStats(player)
    local playerData = self:getPlayerData(player)
    if not playerData then return end
    
    local winRate = 0
    if (playerData.casesWon + playerData.casesLost) > 0 then
        winRate = math.floor((playerData.casesWon / (playerData.casesWon + playerData.casesLost)) * 100)
    end
    
    print("\n" .. string.rep("=", 40))
    print("📊 PLAYER STATISTICS")
    print("Name:", playerData.name)
    print("Career:", playerData.careerStage)
    print("Level:", playerData.level)
    print("Money: $" .. playerData.money)
    print("Reputation:", playerData.reputation)
    print("Cases Won:", playerData.casesWon)
    print("Cases Lost:", playerData.casesLost)
    print("Win Rate:", winRate .. "%")
    print(string.rep("=", 40) .. "\n")
end

return GameManager