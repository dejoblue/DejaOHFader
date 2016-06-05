-- Deja OHFader

	local DVMMBAlphaTimer
	
	local orderhall=CreateFrame("Frame", "orderhall", UIParent)
		orderhall:RegisterEvent("PLAYER_LOGIN")
		orderhall:RegisterEvent("PLAYER_ENTERING_WORLD")
		orderhall:RegisterEvent("ZONE_CHANGED")
		orderhall:RegisterEvent("ZONE_CHANGED_NEW_AREA")
		orderhall:RegisterEvent("ADDON_LOADED")
		
	orderhall:HookScript("OnEnter", function(self)
		OrderHallCommandBar:SetAlpha(1)
		self:SetAlpha(0)
	end)

	local function CheckMouseOver(self)
		if OrderHallCommandBar:IsMouseOver() then
			OrderHallCommandBar:SetAlpha(1)
		else
			OrderHallCommandBar:SetAlpha(0)
			orderhall:SetAlpha(1)		
		end
	end
	
	local function delayHideMMB(self)
		DVMMBAlphaTimer = C_Timer.NewTimer(0.10, CheckMouseOver)
	end

	orderhall:HookScript("OnLeave", delayHideMMB)

	orderhall:SetScript("OnEvent", function(self, event, addon)
		if addon == "Blizzard_OrderHallUI" then
			orderhall:SetAllPoints(OrderHallCommandBar)
			orderhall:EnableMouse(true)
			orderhall:Show()

			local torderhall=orderhall:CreateTexture(nil,"ARTWORK")
				torderhall:SetAllPoints(orderhall)
				torderhall:SetColorTexture(0, 192, 255, 0.7)

			OrderHallCommandBar:EnableMouse(false)
			OrderHallCommandBar:SetAlpha(0)
		end
	end)
