LVBM.AddOns.Nefarian = {
	["Name"] = LVBM_NEFARIAN_NAME,
	["Abbreviation1"] = "nef",
	["Version"] = "1.1",
	["Author"] = "Tandanu",
	["Description"] = LVBM_NEFARIAN_DESCRIPTION,
	["Instance"] = LVBM_BWL,
	["GUITab"] = LVBMGUI_TAB_BWL,
	["Sort"] = 8,
	["Options"] = {
		["Enabled"] = true,
		["Announce"] = false,
		["BlockHeals"] = true,
		["UnequipBow"] = true,
		["SyncKills"] = true,
	},
	["DropdownMenu"] = {
		[1] = {
			["variable"] = "LVBM.AddOns.Nefarian.Options.BlockHeals",
			["text"] = LVBM_NEFARIAN_BLOCK_HEALS,
			["func"] = function() LVBM.AddOns.Nefarian.Options.BlockHeals = not LVBM.AddOns.Nefarian.Options.BlockHeals; end,
		},
		[2] = {
			["variable"] = "LVBM.AddOns.Nefarian.Options.UnequipBow",
			["text"] = LVBM_NEFARIAN_UNEQUIP_BOW,
			["func"] = function() LVBM.AddOns.Nefarian.Options.UnequipBow = not LVBM.AddOns.Nefarian.Options.UnequipBow; end,
		},
		[3] = {
			["variable"] = "LVBM.AddOns.Nefarian.Options.SyncKills",
			["text"] = LVBM_NEFARIAN_SYNCKILLS_INFO,
			["func"] = function() LVBM.AddOns.Nefarian.Options.SyncKills = not LVBM.AddOns.Nefarian.Options.SyncKills; end,
		},
	},
	["DrakonidsTotal"] = 42,
	["DrakonidKillCount"] = 0,
	["LastCountMsg"] = 0,
	["PriestCall"] = false,
	["BowBag"]	= 0,
	["BowSlot"] = 0,
	["BowUnequipped"] = false,
	["Events"] = {
		["CHAT_MSG_MONSTER_YELL"] = true,
		["CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE"] = true,
		["CHAT_MSG_ADDON"] = true,
		["CHAT_MSG_COMBAT_HOSTILE_DEATH"] = true,
	},
	["OnCombatStart"] = function(delay)
		LVBM.AddOns.Nefarian.DrakonidKillCount = 0;
	end,
	["OnCombatEnd"] = function()
		LVBM.AddOns.Nefarian.DrakonidKillCount = 0;
	end,
	["OnEvent"] = function(event, arg1)
		if LVBM.AddOns.Nefarian.Options.SyncKills and event == "CHAT_MSG_ADDON" and arg1 == "LVBM_NEF_P1_KILLCOUNT" and arg2 and arg3 == "RAID" then
			local killcount = tonumber(arg2);
			if ( killcount and killcount > LVBM.AddOns.Nefarian.DrakonidKillCount ) then
				LVBM.AddOns.Nefarian.DrakonidKillCount = killcount;
			end
		elseif event == "CHAT_MSG_COMBAT_HOSTILE_DEATH" then
			if string.find(arg1, "Drakonid") then
				LVBM.AddOns.Nefarian.DrakonidKillCount = LVBM.AddOns.Nefarian.DrakonidKillCount + 1;
				if(LVBM.AddOns.Nefarian.Options.SyncKills) then
					SendAddonMessage("LVBM_NEF_P1_KILLCOUNT", LVBM.AddOns.Nefarian.DrakonidKillCount);
				end
				
				if (math.mod(LVBM.AddOns.Nefarian.DrakonidKillCount,5) == 0) then
					LVBM.Announce(string.format(LVBM_NEFARIAN_SYNCKILLS_ANNOUNCE, LVBM.AddOns.Nefarian.DrakonidKillCount));
				end
			end

		elseif event == "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE" then
			if arg1 == LVBM_NEFARIAN_CAST_SHADOW_FLAME then
				LVBM.Announce(LVBM_SHADOW_FLAME_WARNING);
				LVBM.StartStatusBarTimer(2, "Shadow Flame Cast");
			elseif arg1 == LVBM_NEFARIAN_CAST_FEAR then
				LVBM.Announce(LVBM_NEFARIAN_FEAR_WARNING);
				LVBM.StartStatusBarTimer(1.5, "Fear Cast");
				LVBM.EndStatusBarTimer("Fear");
				LVBM.StartStatusBarTimer(30, "Fear");
			end
		elseif event == "CHAT_MSG_MONSTER_YELL" then
			if arg1 == LVBM_NEFARIAN_YELL_PHASE2 then
				LVBM.Announce(LVBM_NEFARIAN_PHASE2_WARNING);
				LVBM.StartStatusBarTimer(15, "Phase 2");
				LVBM.StartStatusBarTimer(43, "Fear");
			elseif arg1 == LVBM_NEFARIAN_YELL_PHASE3 then
				LVBM.Announce(LVBM_NEFARIAN_PHASE3_WARNING);
			elseif string.find(arg1, "Shamans") then
				LVBM.Announce(LVBM_NEFARIAN_SHAMAN_WARNING);
				LVBM.Schedule(27, "LVBM.AddOns.Nefarian.OnEvent", "ClassCallWarning", 5)
				LVBM.EndStatusBarTimer("Class call CD");
				LVBM.StartStatusBarTimer(30, "Shaman call");
				LVBM.AddOns.Nefarian.OnEvent("EquipBow");
			elseif string.find(arg1, "Paladins") then
				LVBM.Announce(LVBM_NEFARIAN_PALA_WARNING);
				LVBM.Schedule(27, "LVBM.AddOns.Nefarian.OnEvent", "ClassCallWarning", 5)
				LVBM.EndStatusBarTimer("Class call CD");
				LVBM.StartStatusBarTimer(30, "Paladin call");
				LVBM.AddOns.Nefarian.OnEvent("EquipBow");
			elseif string.find(arg1, "Druids") then
				LVBM.Announce(LVBM_NEFARIAN_DRUID_WARNING);
				LVBM.Schedule(27, "LVBM.AddOns.Nefarian.OnEvent", "ClassCallWarning", 5)
				LVBM.EndStatusBarTimer("Class call CD");
				LVBM.StartStatusBarTimer(30, "Druid call");
				LVBM.AddOns.Nefarian.OnEvent("EquipBow");
			elseif string.find(arg1, "Priests") then
				if UnitClass("player") == LVBM_PRIEST then
					LVBM.AddSpecialWarning(LVBM_NEFARIAN_PRIEST_CALL, true, true);
					LVBM.AddOns.Nefarian.PriestCall = 30;
					LVBM.Schedule(30, "LVBM.AddOns.Nefarian.OnEvent", "ResetPriestCall")
				end
				LVBM.Announce(LVBM_NEFARIAN_PRIEST_WARNING);
				LVBM.Schedule(27, "LVBM.AddOns.Nefarian.OnEvent", "ClassCallWarning", 5)
				LVBM.EndStatusBarTimer("Class call CD");
				LVBM.StartStatusBarTimer(30, "Priest call");
				LVBM.AddOns.Nefarian.OnEvent("EquipBow");
			elseif string.find(arg1, "Warriors") then
				LVBM.Announce(LVBM_NEFARIAN_WARRIOR_WARNING);
				LVBM.Schedule(27, "LVBM.AddOns.Nefarian.OnEvent", "ClassCallWarning", 5)
				LVBM.EndStatusBarTimer("Class call CD");
				LVBM.StartStatusBarTimer(30, "Warrior call");
				LVBM.AddOns.Nefarian.OnEvent("EquipBow");
			elseif string.find(arg1, "Rogues") then
				LVBM.Announce(LVBM_NEFARIAN_ROGUE_WARNING);
				LVBM.Schedule(27, "LVBM.AddOns.Nefarian.OnEvent", "ClassCallWarning", 5)
				LVBM.EndStatusBarTimer("Class call CD");
				LVBM.StartStatusBarTimer(30, "Rogue call");
				LVBM.AddOns.Nefarian.OnEvent("EquipBow");
			elseif string.find(arg1, "Warlocks") then
				LVBM.Announce(LVBM_NEFARIAN_WARLOCK_WARNING);
				LVBM.Schedule(27, "LVBM.AddOns.Nefarian.OnEvent", "ClassCallWarning", 5)
				LVBM.EndStatusBarTimer("Class call CD");
				LVBM.StartStatusBarTimer(30, "Warlock call");
				LVBM.AddOns.Nefarian.OnEvent("EquipBow");
			elseif string.find(arg1, "Hunters") then
				LVBM.Announce(LVBM_NEFARIAN_HUNTER_WARNING);
				LVBM.Schedule(27, "LVBM.AddOns.Nefarian.OnEvent", "ClassCallWarning", 5)
				LVBM.EndStatusBarTimer("Class call CD");
				LVBM.StartStatusBarTimer(30, "Hunter call");
				LVBM.AddOns.Nefarian.OnEvent("EquipBow");
			elseif string.find(arg1, "Mages") then
				LVBM.Announce(LVBM_NEFARIAN_MAGE_WARNING);
				LVBM.Schedule(27, "LVBM.AddOns.Nefarian.OnEvent", "ClassCallWarning", 5)
				LVBM.EndStatusBarTimer("Class call CD");
				LVBM.StartStatusBarTimer(30, "Mage call");
				LVBM.AddOns.Nefarian.OnEvent("EquipBow");
			elseif arg1 == LVBM_NEFARIAN_YELL_DEAD then
				LVBM.UnSchedule("LVBM.AddOns.Nefarian.OnEvent", "ClassCallWarning", 5);
				LVBM.UnSchedule("LVBM.AddOns.Nefarian.OnEvent", "ClassCallWarning", 0);
			end
		elseif event == "ClassCallWarning" then
			if arg1 == 5 then
				LVBM.Announce(LVBM_NEFARIAN_CLASS_CALL_WARNING);
				LVBM.Schedule(3, "LVBM.AddOns.Nefarian.OnEvent", "ClassCallWarning", 0)
			elseif arg1 == 0 then
				if UnitClass("player") == LVBM_HUNTER and LVBM.AddOns.Nefarian.Options.UnequipBow then
					for i = 0, 4 do
						if GetContainerNumSlots(i) then
							for j = 1, GetContainerNumSlots(i) do
								if GetContainerItemInfo(i, j) == nil then
									ClearCursor();
									PickupInventoryItem(18);
									if CursorHasItem() then
										PickupContainerItem(i, j)
										LVBM.AddOns.Nefarian.BowBag = i;
										LVBM.AddOns.Nefarian.BowSlot = j;
										LVBM.AddOns.Nefarian.BowUnequipped = true;										
									else
										LVBM.AddMsg(LVBM_NEFARIAN_UNEQUIP_ERROR);
									end
									break;
								end
							end
							if LVBM.AddOns.Nefarian.BowUnequipped then
								break;
							end
						end
					end
				end
			end
		elseif event == "EquipBow" then
			if LVBM.AddOns.Nefarian.BowUnequipped then
				if GetContainerItemInfo(LVBM.AddOns.Nefarian.BowBag, LVBM.AddOns.Nefarian.BowSlot) then
					ClearCursor();
					PickupContainerItem(LVBM.AddOns.Nefarian.BowBag, LVBM.AddOns.Nefarian.BowSlot);
					if CursorHasItem() then
						PickupInventoryItem(18);	
						LVBM.AddOns.Nefarian.BowBag = 0;
						LVBM.AddOns.Nefarian.BowSlot = 0;
						LVBM.AddOns.Nefarian.BowUnequipped = false;
					else
						LVBM.AddMsg(LVBM_NEFARIAN_EQUIP_ERROR);
					end
				else
					LVBM.AddMsg(LVBM_NEFARIAN_EQUIP_ERROR);
				end
			end
		elseif event == "ResetPriestCall" then
			LVBM.AddOns.Nefarian.PriestCall = false;
		end
	end,
	["Hooks"] = {
		["oldUseAction"] = UseAction,
		["newUseAction"] = function(slot, checkCursor, onSelf)
			if type(LVBM.AddOns.Nefarian.PriestCall) == "number" and LVBM.AddOns.Nefarian.Options.BlockHeals then
				LVBMTooltipTextLeft1:SetText("");
				LVBMTooltip:SetAction(slot);
				if LVBMTooltipTextLeft1:GetText() and LVBM_NEFARIAN_BLOCKED_SPELLS[LVBMTooltipTextLeft1:GetText()] and LVBM_NEFARIAN_BLOCKED_SPELLS[LVBMTooltipTextLeft1:GetText()] <= LVBM.AddOns.Nefarian.PriestCall then
					LVBM.AddMsg(string.format(LVBM_NEFARIAN_HEAL_BLOCKED, LVBMTooltipTextLeft1:GetText()));
					return;
				else
					LVBM.AddOns.Nefarian.Hooks.oldUseAction(slot, checkCursor, onSelf);
				end				
			end
			LVBM.AddOns.Nefarian.Hooks.oldUseAction(slot, checkCursor, onSelf);
		end,
		["oldCastSpellByName"] = CastSpellByName,
		["newCastSpellByName"] = function(spell, onSelf)
			if type(LVBM.AddOns.Nefarian.PriestCall) == "number" and LVBM.AddOns.Nefarian.Options.BlockHeals then
				local cleanSpell;
				cleanSpell = string.gsub(spell, "%((%w+) (%d+)%)", "");
				if cleanSpell and LVBM_NEFARIAN_BLOCKED_SPELLS[cleanSpell] and LVBM_NEFARIAN_BLOCKED_SPELLS[cleanSpell] <= LVBM.AddOns.Nefarian.PriestCall then
					LVBM.AddMsg(string.format(LVBM_NEFARIAN_HEAL_BLOCKED, cleanSpell));
					return;
				else
					LVBM.AddOns.Nefarian.Hooks.oldCastSpellByName(spell, onSelf);
				end
			end
			LVBM.AddOns.Nefarian.Hooks.oldCastSpellByName(spell, onSelf);
		end,
	},
	["OnUpdate"] = function(elapsed)
		if type(LVBM.AddOns.Nefarian.PriestCall) == "number" then
			LVBM.AddOns.Nefarian.PriestCall = LVBM.AddOns.Nefarian.PriestCall - elapsed;
			if LVBM.AddOns.Nefarian.PriestCall <= 0 then
				LVBM.AddOns.Nefarian.PriestCall = false;
			end
		end
	end
};

local version, build, date = GetBuildInfo();
if tonumber(string.sub(version, 0, 3)) < 2 then
	UseAction 		= LVBM.AddOns.Nefarian.Hooks.newUseAction;
	CastSpellByName	= LVBM.AddOns.Nefarian.Hooks.newCastSpellByName;
end

