-- CourtScene.lua
-- Ace Attorney style courtroom system

local CourtScene = {}
CourtScene.__index = CourtScene

function CourtScene.new(caseData)
    local self = setmetatable({}, CourtScene)
    self.case = caseData
    self.phase = "investigation" -- investigation or trial
    self.evidence = {}
    self.presentedEvidence = {}
    self.investigationState = "intro"
    self.trialState = "opening"
    return self
end

function CourtScene:startInvestigation()
    self.phase = "investigation"
    print("\n" .. string.rep("=", 60))
    print("🔍 INVESTIGATION PHASE - " .. self.case.title)
    print(string.rep("=", 60))
    print("\nCase Description:")
    print(self.case.description)
    print("\nYour Goal: Gather evidence and find contradictions")
    print("\nAvailable Locations:")
    for i, location in ipairs(self.case.locations) do
        print(i .. ". " .. location.name)
    end
    print(string.rep("=", 60))
end

function CourtScene:investigateLocation(locationName)
    for _, location in ipairs(self.case.locations) do
        if location.name == locationName then
            print("\n" .. string.rep("=", 60))
            print("🔎 INVESTIGATING: " .. location.name)
            print(string.rep("=", 60))
            print(location.description)
            print("\nEvidence Found:")
            for i, evidence in ipairs(location.evidence) do
                table.insert(self.evidence, evidence)
                print(i .. ". " .. evidence.name .. " - " .. evidence.description)
            end
            print("\nWitnesses:")
            for i, witness in ipairs(location.witnesses) do
                print(i .. ". " .. witness.name)
            end
            print(string.rep("=", 60))
            return location
        end
    end
    print("Location not found!")
end

function CourtScene:talkToWitness(witnessName)
    for _, location in ipairs(self.case.locations) do
        for _, witness in ipairs(location.witnesses) do
            if witness.name == witnessName then
                print("\n" .. string.rep("=", 60))
                print("💬 TALKING TO: " .. witness.name)
                print(string.rep("=", 60))
                print("Testimony:\n" .. witness.testimony)
                print("\nImportant Info: " .. witness.keyInfo)
                print(string.rep("=", 60))
                return witness
            end
        end
    end
end

function CourtScene:startTrial()
    self.phase = "trial"
    print("\n" .. string.rep("=", 60))
    print("⚖️  TRIAL PHASE - " .. self.case.title)
    print(string.rep("=", 60))
    print("\nYour Evidence:")
    for i, evidence in ipairs(self.evidence) do
        print(i .. ". " .. evidence.name)
    end
    print("\nOpposition's Testimony:")
    print(self.case.prosecution.testimony)
    print("\nOptions:")
    print("1. Press for more info")
    print("2. Present evidence")
    print("3. Make objection")
    print(string.rep("=", 60))
end

function CourtScene:presentEvidence(evidenceName)
    for _, evidence in ipairs(self.evidence) do
        if evidence.name == evidenceName then
            print("\n" .. string.rep("=", 60))
            print("💼 PRESENTING EVIDENCE")
            print(string.rep("=", 60))
            print("Evidence: " .. evidence.name)
            print("Details: " .. evidence.description)
            
            if evidence.countersContradiction == self.case.currentContradiction then
                print("\n✅ OBJECTION OVERRULED!")
                print("This evidence contradicts the testimony!")
                self.case.correctEvidenceCount = (self.case.correctEvidenceCount or 0) + 1
                return true
            else
                print("\n❌ NOT EFFECTIVE")
                print("This evidence doesn't contradict the current testimony.")
                return false
            end
        end
    end
end

function CourtScene:calculateOutcome()
    local successRate = (self.case.correctEvidenceCount or 0) / (self.case.totalContradictions or 1)
    if successRate >= 0.8 then
        return "won", 100
    elseif successRate >= 0.5 then
        return "won", 70
    else
        return "lost", 20
    end
end

return CourtScene