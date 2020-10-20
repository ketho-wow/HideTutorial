-- License: Public Domain

local function OnEvent(self, event)
	SetCVar("showTutorials", 0)
	SetCVar("showNPETutorials", 0)
	SetCVar("hideAdventureJournalAlerts", 1)

	-- help plates
	for i = 1, NUM_LE_FRAME_TUTORIALS do
		C_CVar.SetCVarBitfield("closedInfoFrames", i, true)
	end

	for i = 1, NUM_LE_FRAME_TUTORIAL_ACCCOUNTS do
		C_CVar.SetCVarBitfield("closedInfoFramesAccountWide", i, true)
	end
end

local f = CreateFrame("Frame")
f:RegisterEvent("VARIABLES_LOADED")
f:SetScript("OnEvent", OnEvent)
