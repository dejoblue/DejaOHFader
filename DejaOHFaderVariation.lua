-- Deja OHFader

	local DVMMBAlphaTimer
	
	local orderhall=CreateFrame("Frame", "orderhall", UIParent)
		orderhall:RegisterEvent("ZONE_CHANGED")
		orderhall:RegisterEvent("ZONE_CHANGED_NEW_AREA")
		orderhall:RegisterEvent("ADDON_LOADED")
		
	orderhall:HookScript("OnEnter", function(self)
		OrderHallCommandBar:SetAlpha(1)
		self:SetAlpha(0)
	end)

	local function CheckMouseOver(self)
		if not OrderHallCommandBar then 
			orderhall:Hide()
		elseif OrderHallCommandBar:IsMouseOver() then
			OrderHallCommandBar:SetAlpha(1)
		else
			orderhall:SetAllPoints(OrderHallCommandBar)
			orderhall:EnableMouse(true)
			orderhall:Show()

			local torderhall=orderhall:CreateTexture(nil,"ARTWORK")
				torderhall:SetAllPoints(orderhall)
				torderhall:SetColorTexture(0, 192, 255, 0.7)

			OrderHallCommandBar:EnableMouse(false)
			OrderHallCommandBar:SetAlpha(0)
			orderhall:SetAlpha(1)		
		end
	end
	
	local function delayHideMMB(self)
		DVMMBAlphaTimer = C_Timer.NewTimer(0.10, CheckMouseOver)
	end

	orderhall:HookScript("OnLeave", delayHideMMB)
	orderhall:HookScript("OnEvent", CheckMouseOver)
