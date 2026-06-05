-- CaseDatabase.lua
-- Professional case system inspired by Ace Attorney

local CaseDatabase = {}

local Cases = {
    {
        id = 1,
        title = "The Turnabout Theft",
        description = "Your client is accused of stealing a valuable artifact. Prove their innocence!",
        difficulty = "Easy",
        caseType = "Criminal Defense",
        winChance = 0.7,
        reward = 500,
        reputation = 25,
        locations = {
            {
                name = "Crime Scene",
                description = "A museum at night. The artifact display case is broken. Glass scattered everywhere.",
                evidence = {
                    {name = "Broken Glass", description = "Glass fragments from the display case"},
                    {name = "Security Footage", description = "Shows the thief had a tattoo on their left arm"}
                },
                witnesses = {
                    {name = "Night Guard", testimony = "I saw someone running out at 2 AM!", keyInfo = "The person had a distinctive tattoo"}
                }
            },
            {
                name = "Client's Home",
                description = "Your client's apartment. Looks normal. No visible tattoos on client.",
                evidence = {
                    {name = "Alibis", description = "Phone records show client was home"},
                    {name = "Client's Clothes", description = "No dirt or glass fragments"}
                },
                witnesses = {}
            },
            {
                name = "Police Station",
                description = "Detective's office. Files scattered on desk.",
                evidence = {
                    {name = "Police Report", description = "Initial report mentions tattoo clue"}
                },
                witnesses = {
                    {name = "Detective", testimony = "We found similar artifacts at a pawn shop", keyInfo = "The pawn shop owner has a tattoo"}
                }
            }
        },
        prosecution = {
            testimony = "The evidence clearly points to the defendant! They were near the museum that night!"
        },
        totalContradictions = 3,
        correctEvidenceCount = 0
    },
    {
        id = 2,
        title = "The Turnabout Witness",
        description = "A key witness is lying. Find the contradiction in their testimony!",
        difficulty = "Medium",
        caseType = "Criminal Defense",
        winChance = 0.5,
        reward = 750,
        reputation = 50,
        locations = {
            {
                name = "Crime Scene",
                description = "Downtown street corner. A robbery took place here.",
                evidence = {
                    {name = "Security Camera", description = "Timestamp shows 3:15 PM"},
                    {name = "Witness Statement", description = "Claims crime happened at 3:00 PM"}
                },
                witnesses = {}
            },
            {
                name = "Restaurant Nearby",
                description = "The witness claims they were here during the crime.",
                evidence = {
                    {name = "Receipt", description = "Timestamp shows 3:20 PM - witness was here at crime time"}
                },
                witnesses = {
                    {name = "Restaurant Owner", testimony = "This person came in at 3:20 PM", keyInfo = "They seemed nervous"}
                }
            }
        },
        prosecution = {
            testimony = "The witness places your client at the scene!"
        },
        totalContradictions = 2,
        correctEvidenceCount = 0
    },
    {
        id = 3,
        title = "The Turnabout Conspiracy",
        description = "A complex case involving multiple witnesses and hidden agendas. Can you uncover the truth?",
        difficulty = "Hard",
        caseType = "Criminal Defense",
        winChance = 0.3,
        reward = 1500,
        reputation = 100,
        locations = {
            {
                name = "Corporate Office",
                description = "Executive floor of a major corporation. Everything seems suspicious.",
                evidence = {
                    {name = "Email Chain", description = "Shows evidence tampering"},
                    {name = "Financial Records", description = "Million dollar discrepancies"}
                },
                witnesses = {
                    {name = "CEO", testimony = "My hands are clean in this matter", keyInfo = "Nervous body language"}
                }
            },
            {
                name = "Lab Facility",
                description = "Research lab where evidence was "found".",
                evidence = {
                    {name = "Lab Report", description = "Forged documents discovered"},
                    {name = "Equipment Log", description = "Shows unauthorized access"}
                },
                witnesses = {
                    {name = "Lab Technician", testimony = "I process evidence by the book", keyInfo = "Recently received large payment"}
                }
            },
            {
                name = "Detective's Office",
                description = "The detective's workspace. Something doesn't add up.",
                evidence = {
                    {name = "Detective's Notes", description = "Contains contradictions"},
                    {name = "Evidence Chain Log", description = "Shows gaps in custody"},
                    {name = "Bank Records", description = "Large deposits from corporation"}
                },
                witnesses = {}
            }
        },
        prosecution = {
            testimony = "The evidence is overwhelming! The defendant is clearly guilty!"
        },
        totalContradictions = 5,
        correctEvidenceCount = 0
    }
}

function CaseDatabase.getAllCases()
    return Cases
end

function CaseDatabase.getCaseById(id)
    for _, case in ipairs(Cases) do
        if case.id == id then
            return case
        end
    end
    return nil
end

function CaseDatabase.getCasesByDifficulty(difficulty)
    local results = {}
    for _, case in ipairs(Cases) do
        if case.difficulty == difficulty then
            table.insert(results, case)
        end
    end
    return results
end

function CaseDatabase.getCasesByCareer(careerStage)
    local difficultyMap = {
        ["Intern"] = {"Easy"},
        ["Public Defender"] = {"Easy", "Medium"},
        ["Attorney"] = {"Easy", "Medium", "Hard"},
        ["Senior Counsel"] = {"Medium", "Hard"},
        ["Chief Prosecutor"] = {"Hard"},
        ["Supreme Court Justice"] = {"Hard"}
    }
    
    local allowed = difficultyMap[careerStage] or {"Easy"}
    local results = {}
    
    for _, case in ipairs(Cases) do
        for _, difficulty in ipairs(allowed) do
            if case.difficulty == difficulty then
                table.insert(results, case)
            end
        end
    end
    
    return results
end

return CaseDatabase