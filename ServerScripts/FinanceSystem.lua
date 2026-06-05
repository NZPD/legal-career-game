-- FinanceSystem.lua
local FinanceSystem = {}

function FinanceSystem.calculateCaseReward(caseType, difficulty, won)
    local baseReward = {
        ["Criminal Defense"] = 500,
        ["Criminal Prosecution"] = 600,
        ["Civil Litigation"] = 750,
        ["Constitutional Law"] = 2000,
        ["Corporate Law"] = 1500,
        ["Administrative Law"] = 400
    }
    
    local difficultyMultiplier = {
        ["Easy"] = 1,
        ["Medium"] = 1.5,
        ["Hard"] = 2.5,
        ["Expert"] = 4
    }
    
    local base = baseReward[caseType] or 500
    local multiplier = difficultyMultiplier[difficulty] or 1
    local reward = base * multiplier
    
    if won then
        return math.floor(reward)
    else
        return math.floor(reward * 0.1)
    end
end

function FinanceSystem.getMonthlyExpenses(careerStage)
    local expenses = {
        ["Intern"] = 200,
        ["Public Defender"] = 300,
        ["Attorney"] = 500,
        ["Senior Counsel"] = 1000,
        ["Chief Prosecutor"] = 1500,
        ["Supreme Court Justice"] = 2000
    }
    
    return expenses[careerStage] or 200
end

function FinanceSystem.canAffordCase(playerMoney, caseType)
    local caseCost = {
        ["Criminal Defense"] = 100,
        ["Criminal Prosecution"] = 150,
        ["Civil Litigation"] = 200,
        ["Constitutional Law"] = 500,
        ["Corporate Law"] = 400,
        ["Administrative Law"] = 100
    }
    
    local cost = caseCost[caseType] or 100
    return playerMoney >= cost
end

return FinanceSystem