-- 
-- Onyxia Beta v1.0
--

LVBM.AddOns.Onyxia = { 
	["Name"] = LVBM_ONYXIA_NAME,
	["Abbreviation1"] = "ony", 
	["Version"] = "1",
	["Author"] = "La Vendetta|Nitram",
	["Description"] = LVBM_ONYXIA_INFO,
	["Instance"] = LVBM_OTHER,
	["GUITab"] = LVBMGUI_TAB_OTHER,
	["Options"] = {  
		["Enabled"] = true,
		["Announce"] = false,
	},
	["Events"] = {
		["CHAT_MSG_MONSTER_EMOTE"] = true,
		["CHAT_MSG_MONSTER_YELL"] = true,
		["CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE"] = true,
	},	
	["OnEvent"] = function(event, arg1) 
		if ( (event == "CHAT_MSG_MONSTER_EMOTE") and ( arg1 == LVBM_ONYXIA_BREATH_EMOTE ) ) then
			LVBM.Announce(LVBM_ONYXIA_BREATH_ANNOUNCE);

		elseif ( (event == "CHAT_MSG_MONSTER_YELL") and (arg1 == LVBM_ONYXIA_PHASE2_YELL) ) then
			LVBM.Announce(LVBM_ONYXIA_PHASE2_ANNOUNCE);

		elseif ( (event == "CHAT_MSG_MONSTER_YELL") and (arg1 == LVBM_ONYXIA_PHASE3_YELL) ) then
			LVBM.Announce(LVBM_ONYXIA_PHASE3_ANNOUNCE);
			LVBM.StartStatusBarTimer(40, "Bellowing Roar");
			LVBM.Schedule(37, "LVBM.AddOns.Onyxia.OnEvent", "BellowingRoarWarning", 3);
		
		elseif ( event == "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE" ) then
			if (arg1 == LVBM_ONYXIA_ROAR) then
				LVBM.EndStatusBarTimer("Bellowing Roar");
				LVBM.StartStatusBarTimer(1.5, "Bellowing Roar Cast");
				LVBM.Schedule(1.5, "LVBM.AddOns.Onyxia.OnEvent", "BellowingRoarWarning", 0);
			end
		elseif ( event == "BellowingRoarWarning" ) then
			if arg1 == 3 then
				LVBM.Announce(LVBM_ONYXIA_ROAR_ANNOUNCE);
			elseif arg1 == 0 then
				LVBM.StartStatusBarTimer(25, "Bellowing Roar");
				LVBM.Schedule(22, "LVBM.AddOns.Onyxia.OnEvent", "BellowingRoarWarning", 3);
			end
			
		end
	end,		
};
