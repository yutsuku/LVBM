LVBM.AddOns.Ouro = {
	["Name"] = LVBM_OURO_NAME,
	["Abbreviation1"] = "ouru",
	["Version"] = "1.1",
	["Author"] = "Tandanu",
	["Description"] = LVBM_OURO_DESCRIPTION,
	["Instance"] = LVBM_AQ40,
	["GUITab"] = LVBMGUI_TAB_AQ40,
	["Sort"] = 8,
	["Options"] = {
		["Enabled"] = true,
		["Announce"] = false,
	},	
	["Events"] = {
		["CHAT_MSG_MONSTER_EMOTE"] = true,
		["CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS"] = true,
		["CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE"] = true,
		["CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF"] = true,
	},
	["Submerged"] = false,
	["Enraged"] = false,
	["InCombat"] = false,
	["DirtTargets"] = {},
	["OnCombatStart"] = function(delay)
		LVBM.AddOns.Ouro.Enraged = false;
		LVBM.AddOns.Ouro.Submerged = false;
		LVBM.AddOns.Ouro.Dead = false;
		LVBM.AddOns.Ouro.DirtTargets = {};
		LVBM.Announce(LVBM_OURO_EMERGED_WARNING);
		LVBM.Schedule(25 - delay, "LVBM.AddOns.Ouro.OnEvent", "SubmergeWarning", 60);
		LVBM.Schedule(70 - delay, "LVBM.AddOns.Ouro.OnEvent", "SubmergeWarning", 15);
		LVBM.StartStatusBarTimer(90 - delay, "Submerge");
		LVBM.StartStatusBarTimer(20 - delay, "Sweep");
		LVBM.StartStatusBarTimer(25 - delay, "Sand Blast");
	end,
	["OnCombatEnd"] = function()
		LVBM.AddOns.Ouro.Enraged = false;
		LVBM.AddOns.Ouro.Submerged = false;
		LVBM.AddOns.Ouro.Dead = true;
		LVBM.AddOns.Ouro.DirtTargets = {};
	end,
	["OnEvent"] = function(event, arg1)
		if (event == "CHAT_MSG_MONSTER_EMOTE") then
			if arg1 == LVBM_OURO_ENRAGE and arg2 == LVBM_OURO_OURO then
				LVBM.Announce(LVBM_OURO_ENRAGE_ANNOUNCE);
				LVBM.AddOns.Ouro.Enraged = true;
				LVBM.UnSchedule("LVBM.AddOns.Ouro.OnEvent", "SubmergeWarning", 60); --ouro does not submerge when enraged
				LVBM.UnSchedule("LVBM.AddOns.Ouro.OnEvent", "SubmergeWarning", 15);
				LVBM.EndStatusBarTimer("Submerge");
			end
		elseif (event == "CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS") then
			-- Kronos bug workaround
			if arg1 == LVBM_OURO_BERSERK then
				LVBM.Announce(LVBM_OURO_ENRAGE_ANNOUNCE);
				LVBM.AddOns.Ouro.Enraged = true;
				LVBM.UnSchedule("LVBM.AddOns.Ouro.OnEvent", "SubmergeWarning", 60); --ouro does not submerge when enraged
				LVBM.UnSchedule("LVBM.AddOns.Ouro.OnEvent", "SubmergeWarning", 15);
				LVBM.EndStatusBarTimer("Submerge");
			end
		elseif (event == "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE") or (event == "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF") then
		
			if (arg1 == LVBM_OURO_CAST_SWEEP) then
				LVBM.AddOns.Ouro.InCombat = true;
				LVBM.Announce(LVBM_OURO_SWEEP_WARNING);
				LVBM.Schedule(16, "LVBM.AddOns.Ouro.OnEvent", "SweepWarning", 5);
				LVBM.EndStatusBarTimer("Sweep")
				LVBM.StartStatusBarTimer(1.5, "Sweep Cast");
				LVBM.Schedule(1.5, "LVBM.AddOns.Ouro.OnEvent", "StartNewTimer", "Sweep");
			end
			
			if (event == "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE") then
				do
					local _,_,target = string.find(arg1, LVBM_OURO_DIRT_MOUND_QUAKE_TARGET1)
					if not target then
						_,_,target = string.find(arg1, LVBM_OURO_DIRT_MOUND_QUAKE_TARGET2)
					end
					if not target then
						_,_,target = string.find(arg1, LVBM_OURO_DIRT_MOUND_QUAKE_TARGET3)
					end
					
					if (target) then
						LVBM.EndStatusBarTimer("Sweep")
						LVBM.UnSchedule("LVBM.AddOns.Ouro.OnEvent", "SweepWarning", 5)
						
						local found
						local announce
						
						-- do not spam same player name (30s cd)
						for i=1, getn(LVBM.AddOns.Ouro.DirtTargets) do
							if (LVBM.AddOns.Ouro.DirtTargets[i].name == target) then
								found = true
								local now = time()
								if (LVBM.AddOns.Ouro.DirtTargets[i].time+30 < now) then
									LVBM.AddOns.Ouro.DirtTargets[i].time = now
									announce = true
								end
							end
						end
						
						-- fresh target for Dirt Mound
						if (not found) then
							table.insert(LVBM.AddOns.Ouro.DirtTargets, {time=time(), name=target})
							announce = true
						end
						
						if (announce) then
							LVBM.Announce(string.format(LVBM_OURO_DIRT_MOUND_ANNOUNCE, target));
						end
					end
					
				end
			end
			
			if (arg1 == LVBM_OURO_CAST_SAND_BLAST) then
				LVBM.AddOns.Ouro.InCombat = true;
				LVBM.Announce(LVBM_OURO_BLAST_WARNING);				
				LVBM.Schedule(18, "LVBM.AddOns.Ouro.OnEvent", "SandBlastWarning", 5);
				LVBM.EndStatusBarTimer("Sand Blast");
				LVBM.StartStatusBarTimer(2, "Sand Blast Cast");
				LVBM.Schedule(2, "LVBM.AddOns.Ouro.OnEvent", "StartNewTimer", "Sand Blast");
			elseif (not LVBM.AddOns.Ouro.Dead) and (not LVBM.AddOns.Ouro.Submerged) and (not LVBM.AddOns.Ouro.Enraged) and string.find(arg1, LVBM_OURO_DIRT_MOUND_QUAKE) and ((not LVBM.GetStatusBarTimerTimeLeft("Emerge")) or (LVBM.GetStatusBarTimerTimeLeft("Emerge") > 22)) then
				LVBM.AddOns.Ouro.InCombat = true;
				LVBM.AddOns.Ouro.Submerged = true;
				LVBM.Announce(LVBM_OURO_SUBMERGED_WARNING);
				LVBM.Schedule(24, "LVBM.AddOns.Ouro.OnEvent", "EmergeWarning", 5);
				LVBM.Schedule(29, "LVBM.AddOns.Ouro.OnEvent", "OuroEmerge");
				LVBM.Schedule(34, "LVBM.AddOns.Ouro.OnEvent", "ResetSubmergeVar");
				LVBM.UnSchedule("LVBM.AddOns.Ouro.OnEvent", "SubmergeWarning", 60);
				LVBM.UnSchedule("LVBM.AddOns.Ouro.OnEvent", "SubmergeWarning", 15);
				LVBM.UnSchedule("LVBM.AddOns.Ouro.OnEvent", "SandBlastWarning", 5);
				LVBM.UnSchedule("LVBM.AddOns.Ouro.OnEvent", "SweepWarning", 5);
				LVBM.EndStatusBarTimer("Submerge");
				LVBM.EndStatusBarTimer("Sweep");
				LVBM.EndStatusBarTimer("Sand Blast");
				LVBM.StartStatusBarTimer(29, "Emerge");
			end
		elseif (event == "StartNewTimer") then
			if arg1 == "Sweep" then
				LVBM.StartStatusBarTimer(19, "Sweep");
			elseif arg1 == "Sand Blast" then
				LVBM.StartStatusBarTimer(21, "Sand Blast");
			end
		elseif (event == "ResetSubmergeVar") then
			LVBM.AddOns.Ouro.Submerged = false;
		elseif (event == "SweepWarning") then		
			if arg1 == 5 then
				LVBM.Announce(LVBM_OURO_SWEEP_SOON_WARNING);
			end
		elseif (event == "SandBlastWarning") then
			if arg1 == 5 then
				LVBM.Announce(LVBM_OURO_BLAST_SOON_WARNING);
			end
		elseif (event == "EmergeWarning") then
			LVBM.Announce(LVBM_OURO_EMERGE_SOON_WARNING);
		elseif (event == "OuroEmerge") then
			LVBM.Announce(LVBM_OURO_EMERGED_WARNING);
			LVBM.Schedule(30, "LVBM.AddOns.Ouro.OnEvent", "SubmergeWarning", 60);
			LVBM.Schedule(75, "LVBM.AddOns.Ouro.OnEvent", "SubmergeWarning", 15);
			LVBM.Schedule(15, "LVBM.AddOns.Ouro.OnEvent", "SweepWarning", 5);
			LVBM.Schedule(18, "LVBM.AddOns.Ouro.OnEvent", "SandBlastWarning", 5);
			LVBM.EndStatusBarTimer("Emerge");
			LVBM.StartStatusBarTimer(90, "Submerge");
			LVBM.StartStatusBarTimer(20, "Sweep");
			LVBM.StartStatusBarTimer(24, "Sand Blast");
			LVBM.AddOns.Ouro.DirtTargets = {}
		elseif (event == "SubmergeWarning") then
			if arg1 == 100 then
				LVBM.Announce(LVBM_OURO_POSSIBLE_SUBMERGE_WARNING);
			elseif arg1 then				
				LVBM.Announce(string.format(LVBM_OURO_SUBMERGE_WARNING, arg1));
			end
		end
	end,
};
