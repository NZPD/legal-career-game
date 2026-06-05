-- CaseManager.lua
local CaseManager = {}

local CaseDatabase = {
    ["Criminal Defense"] = {
        {
            title = "State v. Johnson - Theft Case",
            description = "Defend a client accused of shoplifting",
            difficulty = "Easy",
            winChance = 0.6
        },
        {
            title = "State v. Martinez - Assault Case",
            description = "Defend against assault charges",
            difficulty = "Medium",
            winChance = 0.5
        },
        {
            title = "State v. Lee - Murder Case",
            description = "High-profile murder defense",
            difficulty = "Hard",
            winChance = 0.3
        }
    },
    ["Criminal Prosecution"] = {
        {
            title = "People v. Davis - Fraud Case",
            description = "Prosecute a white-collar crime case",
            difficulty = "Medium",
            winChance = 0.7
        }
    },
    ["Civil Litigation"] = {
        {
            title = "Smith v. Corporation - Contract Dispute",
            description = "Contract breach lawsuit",
            difficulty = "Easy",
            winChance = 0.65
        }
    },
    ["Corporate Law"] = {
        {
            title = "Merger & Acquisition Review",
            description = "Handle complex M&A transaction",
            difficulty = "Medium",
            winChance = 0.75
        }
    },
    ["Constitutional Law"] = {
        {
            title = "Constitutional Challenge Case",
            description = "Challenge constitutionality of law",
            difficulty = "Expert",
            winChance = 0.4
        }
    },
    ["Administrative Law"] = {
        {
            title = "EPA Compliance Review",
            description = "Environmental regulation compliance",
            difficulty = "Medium",
            winChance = 0.68
        }
    }
}

function CaseManager.generateCase(caseType)
    if not CaseDatabase[caseType] then
        return nil
    end
    
    local cases = CaseDatabase[caseType]
    local case = cases[math.random(#cases)]
    
    return {
        type = caseType,
        title = case.title,
        description = case.description,
        difficulty = case.difficulty,
        winChance = case.winChance,
        generatedAt = os.time()
    }
end

function CaseManager.resolveCase(case, playerSkill)
    local baseWinChance = case.winChance
    local adjustedWinChance = baseWinChance + (playerSkill * 0.2)
    adjustedWinChance = math.min(adjustedWinChance, 0.95)
    
    local roll = math.random()
    local won = roll < adjustedWinChance
    
    return won
end

return CaseManager