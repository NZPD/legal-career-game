-- GameConfig.lua (Updated)
local GameConfig = {}

GameConfig.CAREER_STAGES = {
    {name = "Intern", level = 1, maxCases = 5},
    {name = "Public Defender", level = 2, maxCases = 8},
    {name = "Attorney", level = 3, maxCases = 10},
    {name = "Senior Counsel", level = 4, maxCases = 12},
    {name = "Chief Prosecutor", level = 5, maxCases = 15},
    {name = "Supreme Court Justice", level = 6, maxCases = 20}
}

GameConfig.CASE_TYPES = {
    "Criminal Defense",
    "Criminal Prosecution",
    "Civil Litigation",
    "Constitutional Law",
    "Corporate Law",
    "Administrative Law"
}

GameConfig.PHASES = {"Investigation", "Trial", "Verdict"}

GameConfig.PROMOTION_REQUIREMENTS = {
    ["Intern"] = {casesWon = 3, reputation = 25},
    ["Public Defender"] = {casesWon = 10, reputation = 100},
    ["Attorney"] = {casesWon = 20, reputation = 250},
    ["Senior Counsel"] = {casesWon = 40, reputation = 500},
    ["Chief Prosecutor"] = {casesWon = 70, reputation = 1000},
    ["Supreme Court Justice"] = {casesWon = 100, reputation = 2000}
}

return GameConfig