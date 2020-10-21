-- License: Public Domain
local pendingChanges

-- VARIABLES_LOADED seems to consistently fire after ADDON_LOADED
local function OnEvent(self, event, addon)
	if event == "ADDON_LOADED" and addon == "HideTutorial" then
		local tocVersion = select(4, GetBuildInfo())
		if not HideTutorialDB2 or HideTutorialDB2 < tocVersion then
			-- only do this once per character
			HideTutorialDB2 = tocVersion
			pendingChanges = true
		end
	elseif event == "VARIABLES_LOADED" then
		if pendingChanges then
			C_CVar.SetCVar("showTutorials", 0)
			C_CVar.SetCVar("showNPETutorials", 0)
			C_CVar.SetCVar("hideAdventureJournalAlerts", 1)
			-- help plates
			for i = 1, NUM_LE_FRAME_TUTORIALS do
				C_CVar.SetCVarBitfield("closedInfoFrames", i, true)
			end
			for i = 1, NUM_LE_FRAME_TUTORIAL_ACCCOUNTS do
				C_CVar.SetCVarBitfield("closedInfoFramesAccountWide", i, true)
			end
		end
	end
end

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("VARIABLES_LOADED")
f:SetScript("OnEvent", OnEvent)
