-- ReputationSystem.lua
local ReputationSystem = {}

function ReputationSystem.calculateCaseReputation(caseType, difficulty, won)
    local baseReputation = {
        ["Criminal Defense"] = 10,
        ["Criminal Prosecution"] = 12,
        ["Civil Litigation"] = 8,
        ["Constitutional Law"] = 20,
        ["Corporate Law"] = 15,
        ["Administrative Law"] = 9
    }
    
    local difficultyMultiplier = {
        ["Easy"] = 1,
        ["Medium"] = 1.5,
        ["Hard"] = 2,
        ["Expert"] = 3
    }
    
    local base = baseReputation[caseType] or 10
    local multiplier = difficultyMultiplier[difficulty] or 1
    local reputation = base * multiplier
    
    if not won then
        reputation = reputation * 0.2
    end
    
    return math.floor(reputation)
end

function ReputationSystem.getUnlockedCases(careerStage)
    local unlockedCases = {}
    
    if careerStage == "Intern" then
        unlockedCases = {"Criminal Defense", "Civil Litigation"}
    elseif careerStage == "Public Defender" then
        unlockedCases = {"Criminal Defense", "Criminal Prosecution"}
    elseif careerStage == "Attorney" then
        unlockedCases = {"Criminal Defense", "Criminal Prosecution", "Civil Litigation", "Corporate Law"}
    elseif careerStage == "Senior Counsel" then
        unlockedCases = {"Criminal Defense", "Criminal Prosecution", "Civil Litigation", "Corporate Law", "Constitutional Law"}
    elseif careerStage == "Chief Prosecutor" then
        unlockedCases = {"Criminal Prosecution", "Constitutional Law", "Administrative Law"}
    elseif careerStage == "Supreme Court Justice" then
        unlockedCases = {"Constitutional Law", "Administrative Law"}
    end
    
    return unlockedCases
end

return ReputationSystem