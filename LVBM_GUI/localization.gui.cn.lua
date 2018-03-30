﻿-- -------------------------------------------- --
-- La Vendetta Boss Mods - Chinese localization --
--       by Diablohu<白银之手>@轻风之语         --
--             www.dreamgen.net                 --
--                11/21/2006                    --
-- -------------------------------------------- --

if (GetLocale() == "zhCN") then

-- LVBM_GUI.lua for Bossmod List Frame (LVBMBossModListFrame)
	LVBMGUI_TAB_1_TITLE_TEXT	= "纳克萨玛斯";
	LVBMGUI_TAB_2_TITLE_TEXT	= "安其拉神殿";
	LVBMGUI_TAB_3_TITLE_TEXT	= "黑翼之巢";
	LVBMGUI_TAB_4_TITLE_TEXT	= "熔火之心";
	LVBMGUI_TAB_5_TITLE_TEXT	= "祖尔格拉布与安其拉废墟";
	LVBMGUI_TAB_6_TITLE_TEXT	= "其他";

-- Tooltips
	LVBMGUI_FRAMETAB_1_TT	= "纳克萨玛斯";
	LVBMGUI_FRAMETAB_1_TD	= "纳克萨玛斯首领模块。右键点击以查看选项。";
	LVBMGUI_FRAMETAB_2_TT	= "安其拉神殿";
	LVBMGUI_FRAMETAB_2_TD	= "安其拉神殿首领模块。右键点击以查看选项。";
	LVBMGUI_FRAMETAB_3_TT	= "黑翼之巢";
	LVBMGUI_FRAMETAB_3_TD	= "黑翼之巢首领模块。右键点击以查看选项。";
	LVBMGUI_FRAMETAB_4_TT	= "熔火之心";
	LVBMGUI_FRAMETAB_4_TD	= "熔火之心首领模块。右键点击以查看选项。";
	LVBMGUI_FRAMETAB_5_TT	= "祖尔格拉布与安其拉废墟";
	LVBMGUI_FRAMETAB_5_TD	= "祖尔格拉布与安其拉废墟首领模块。右键点击以查看选项。";

	LVBMGUI_DISABLE_ADDON		= "关闭模块";
	LVBMGUI_ENABLE_ADDON		= "启用模块";
	LVBMGUI_STOP_ADDON			= "停止模块";
	LVBMGUI_DISABLE_ANNOUNCE	= "关闭通告";
	LVBMGUI_ENABLE_ANNOUNCE		= "启用通告";
	LVBMGUI_SHOW_DROPDOWNMENU	= "其他";
	LVBMGUI_DROPDOWNMENU_TITLE	= "模块菜单";

-- LVBMBossModFrame
	LVBMGUI_HIDE_OPTIONS	= "<<< 选项";
	LVBMGUI_SHOW_OPTIONS	= "选项 >>>";

-- Options Frame (LVBMOptionsFrame)
	LVBMGUI_OPTIONS			= "选项 (GUI v"..LVBMGUI_VERSION.." / Boss Mod v"..LVBM.Version..")";
	LVBMGUI_SIDEFRAME_TAB1	= "基本";
	LVBMGUI_SIDEFRAME_TAB2	= "计时条";
	LVBMGUI_SIDEFRAME_TAB3	= "警报";
	LVBMGUI_SIDEFRAME_TAB4	= "特殊";

-- LVBMOptionsFramePage1
	LVBMGUI_TITLE_SYNCSETTINGS					= "同步信息设置";
	LVBMGUI_TITLE_MINIMAPBUTTON					= "小地图按钮设置";
	LVBMGUI_TITLE_AGGROALERT					= "仇恨警报设置";
	LVBMGUI_CHECKBOX_SYNC_ENABLE				= "启用同步";
	LVBMGUI_BUTTON_VERSION_CHECK				= "版本检测";
	LVBMGUI_BUTTON_VERSION_CHECK_FAILD			= "没有找到其他玩家使用 La Vendetta Boss Mod";
	LVBMGUI_BUTTON_STATUSBAR_SYNCINFO			= "计时条同步信息";
	LVBMGUI_BUTTON_STATUSBAR_SYNCINFO_FAILD 	= "无计时条";
	LVBMGUI_SLIDER_MINIMAP_1					= "位置";
	LVBMGUI_SLIDER_MINIMAP_2					= "半径";
	LVBMGUI_CHECKBOX_MINIMAP					= "显示小地图按钮";
	LVBMGUI_CHECKBOX_AGGROALERT_ENABLE			= "启用仇恨警报";
	LVBMGUI_BUTTON_AGGROALERT_TEST				= "测试仇恨警报";
	LVBMGUI_BUTTON_AGGROALERT_RESET				= "重置设置";
	LVBMGUI_BUTTON_AGGROALERT_RESET_DONE		= "仇恨警报设置已被重置";
	LVBMGUI_CHECKBOX_AGGROALERT_PLAYSOUND		= "获得仇恨后播放声音";
	LVBMGUI_CHECKBOX_AGGROALERT_FLASH			= "获得仇恨后屏幕闪烁";
	LVBMGUI_CHECKBOX_AGGROALERT_SHAKE			= "获得仇恨后屏幕震动";
	LVBMGUI_CHECKBOX_AGGROALERT_SPECIALTEXT		= "显示特殊警报";
	LVBMGUI_CHECKBOX_AGGROALERT_LOCALWARNING	= "显示本地警报";
	LVBMGUI_BUTTON_MOVEABLEBAR					= "移动计时条";
	LVBMGUI_BUTTON_DEFAULTS						= "重置设置";

-- LVBMOptionsFramePage2
	LVBMGUI_TITLE_STATUSBARS 				= "计时条设置";
	LVBMGUI_TITLE_PIZZATIMER				= "创建\"Pizza Timer\"";
	LVBMGUI_CHECKBOX_STATUSBAR_ENABLE		= "启用计时条";
	LVBMGUI_CHECKBOX_STATUSBAR_FILLUP		= "正向填充";
	LVBMGUI_CHECKBOX_STATUSBAR_FLIPOVER		= "向上展开";
	LVBMGUI_EDITBOX_PIZZATIMER_TEXT			= "名称";
	LVBMGUI_EDITBOX_PIZZATIMER_MIN			= "分钟";
	LVBMGUI_EDITBOX_PIZZATIMER_SEC			= "秒";
	LVBMGUI_CHECKBOX_PIZZATIMER_BROADCAST	= "向团队通告";
	LVBMGUI_BUTTON_PIZZATIMER_START			= "开始计时";

-- LVBMOptionsFramePage3
	LVBMGUI_TITLE_RAIDWARNING					= "团队警报设置";
	LVBMGUI_TITLE_SELFWARNING					= "本地警报设置"; 
	LVBMGUI_DROPDOWN_RAIDWARNING_OPTION_1		= "RaidWarning (默认声音)";
	LVBMGUI_DROPDOWN_RAIDWARNING_OPTION_2		= "BellTollNightElf (CT_Raid 声音)";
	LVBMGUI_DROPDOWN_RAIDWARNING_OPTION_3		= "关闭警报音效";
	LVBMGUI_DROPDOWN_RAIDWARNING_INFO_DISABLED	= "团队警报音效关闭";
	LVBMGUI_RAIDWARNING_EXAMPLE					= "*** 团队警报样式 ***";
	LVBMGUI_BUTTON_SOUND_TEST					= "测试音效";
	LVBMGUI_BUTTON_SHOW_EXAMPLE					= "显示样式";
	LVBMGUI_BUTTON_RAIDWARNING_RESET			= "重置设置";
	LVBMGUI_BUTTON_RAIDWARNING_RESET_DONE		= "团队警报设置已被重置";

-- LVBMOptionsFramePage4
	LVBMGUI_TITLE_SPECIALWARNING			= "特殊警报设置";
	LVBMGUI_TITLE_SHAKESCREEN				= "屏幕震动效果设置";
	LVBMGUI_TITLE_FLASHEFFECT				= "屏幕闪烁效果设置";
	LVBMGUI_CHECKBOX_SPECWARNING_ENABLE		= "启用特殊警报";
	LVBMGUI_BUTTON_SPECWARNING_TEST			= "测试警报";
	LVBMGUI_BUTTON_SPECWARNING_EXAMPLE		= "测试信息 :)";
	LVBMGUI_SLIDER_SPECWARNING_DURATION		= "持续时间";
	LVBMGUI_SLIDER_SPECWARNING_FADETIME		= "渐隐时间";
	LVBMGUI_SLIDER_SPECWARNING_TEXTSIZE		= "文字大小";
	LVBMGUI_CHECKBOX_SHAKESCREEN_ENABLE		= "启用屏幕震动效果";
	LVBMGUI_BUTTON_SHAKESCREEN_TEST			= "测试震动";
	LVBMGUI_SLIDER_SHAKESCREEN_DURATION		= "持续时间";
	LVBMGUI_SLIDER_SHAKESCREEN_INTENSITY	= "强度";
	LVBMGUI_CHECKBOX_FLASHEFFECT_ENABLE		= "启用屏幕闪烁效果";
	LVBMGUI_BUTTON_FLASHEFFECT_TEST			= "测试闪烁";
	LVBMGUI_SLIDER_FLASHEFFECT_DURATION		= "持续时间";
	LVBMGUI_SLIDER_FLASHEFFECT_FLASHES		= "闪烁次数";

-- LVBMOptionsFramePage5
	LVBMGUI_ABOUTTITLE	= "关于";
	LVBMGUI_ABOUTTEXT	= {
		"LV Bossmods API (c) by DeadlyMinds Tandanu",
		"LV Bossmods GUI (c) by La Vendetta Nitram",
		" ",
		"汉化：Diablohu<白银之手> @ 二区-轻风之语",
		"感谢：大蛇暗<龙吟> @ 二区-轻风之语",
		"　　　二区-轻风之语白银之手全体成员",
		" ",
		"感谢您使用我们的插件",
		" ",
		"                            访问",
		"                   www.deadlyminds.net",
		"                             或",
		"                  www.curse-gaming.com",
		" ",
		"如果您有什么建议或错误报告，请在 www.curse-gaming.com 留言或在 www.deadlyminds.net 的论坛发表。",

	};


-- Translations added v1.05
	LVBMGUI_DISTANCE_FRAME_TITLE		= "距离";
	LVBMGUI_DISTANCE_FRAME_TEXT			= "距离过近:";
	
	LVBMGUI_INFOFRAME_TOOLTIP_TITLE		= "信息框体";
	LVBMGUI_INFOFRAME_TOOLTIP_TEXT		= "右键点击以移动\nShift+右键单击以隐藏";
	
	LVBMGUI_STATUSBAR_WIDTH_SLIDER		= "宽度";
	LVBMGUI_STATUSBAR_SCALE_SLIDER		= "缩放";
	
	LVBMGUI_BUTTON_RANGECHECK			= "距离侦测";
	LVBMGUI_TOOLTIP_RANGECHECK_TITLE	= "距离侦测";
	LVBMGUI_TOOLTIP_RANGECHECK_TEXT		= "侦测距离你超过30码的队友。";
	
	LVBMGUI_BUTTON_DISTANCEFRAME		= "距离框体";
	LVBMGUI_TOOLTIP_DISTANCEFRAME_TITLE	= "距离框体";
	LVBMGUI_TOOLTIP_DISTANCEFRAME_TEXT	= "显示隐藏距离侦测框体。它将显示距离你过近(10码)的队友。这个功能在诸如克苏恩或哈霍兰公主的作战中相当实用。";

-- Translations added v1.10
	LVBMGUI_SIDEFRAME_TAB5	= "其他";
	LVBMGUI_SIDEFRAME_TAB6	= "关于";
	
	LVBMGUI_SLIDER_STATUSBAR_COUNT			= "数目";
	LVBMGUI_DROPDOWN_STATUSBAR_DESIGN_1		= "经典";
	LVBMGUI_DROPDOWN_STATUSBAR_DESIGN_2		= "现代"; 
	LVBMGUI_DROPDOWN_STATUSBAR_EXAMPLE_BAR	= "样式条";
	
	LVBMGUI_TITLE_AUTORESPOND					= "自动回复设置";
	LVBMGUI_CHECKBOX_AUTORESPOND_ENABLE			= "在首领战中自动回复密语";
	LVBMGUI_CHECKBOX_AUTORESPOND_SHOW_WHISPERS	= "首领战中显示密语";
	LVBMGUI_CHECKBOX_AUTORESPOND_INFORM_USER	= "通知我密语者";
	LVBMGUI_CHECKBOX_AUTORESPOND_HIDE_REPLY		= "隐藏自动密语";
	
	LVBMGUI_EDITBOX_AUTORESPOND_TITLE			= "自动密语信息";
	LVBMGUI_EDITBOX_AUTORESPOND_TOOLTIP_HEADER	= "以下信息将会自动添加:";
	LVBMGUI_EDITBOX_AUTORESPOND_TOOLTIP_TEXT1	= {"%P", "你的名字"};
	LVBMGUI_EDITBOX_AUTORESPOND_TOOLTIP_TEXT2	= {"%B", "首领名字"};
	LVBMGUI_EDITBOX_AUTORESPOND_TOOLTIP_TEXT3	= {"%HP", "首领生命"};
	LVBMGUI_EDITBOX_AUTORESPOND_TOOLTIP_TEXT4	= {"%ALIVE", "团队幸存人数"};
	LVBMGUI_EDITBOX_AUTORESPOND_TOOLTIP_TEXT5	= {"%RAID", "团队总人数"};

-- Translations added v1.15
	LVBMGUI_CHECKBOX_ALLOW_STATUS_COMMAND	= "允许玩家获取作战信息(密语\"status\")";
	LVBMGUI_CHECKBOX_SHOWCOMBATINFO			= "显示作战信息，如战斗用时";
	LVBMGUI_TITLE_COMBATSYSTEM				= "战斗侦测系统";
	LVBMGUI_BUTTON_STATUSBAR_FLASHONEND		= "计时结束时闪烁";
	LVBMGUI_BUTTON_STATUSBAR_AUTOCOLORBARS	= "动态改变计时条颜色";

-- Translations added v1.20
	LVBMGUI_TITLE_RAIDOPTIONS					= "团队选项";
	LVBMGUI_CHECKBOX_HIDEPLAYERNAMESINRAIDS		= "加入团队时隐藏玩家名字";
	LVBMGUI_CHECKBOX_ALLOWSYNCFROMOLDCLIENT		= "接受旧版本的同步指令";
	
-- Translation added v1.25
	LVBMGUI_CHECKBOX_ENABLE_RAIDWARNINGFRAME	= "显示团队警报";
	LVBMGUI_CHECKBOX_ENABLE_SELFWARNINGFRAME	= "显示本地警报";
	LVBMGUI_TAB_NAXX_TEXT						= "NAX";
	LVBMGUI_TAB_AQ40_TEXT						= "AQ40";
	LVBMGUI_TAB_BWL_TEXT						= "BWL";
	LVBMGUI_TAB_MC_TEXT							= "MC";
	LVBMGUI_TAB_20PL_TEXT						= "20人";
	LVBMGUI_TAB_OTHER_TEXT						= "其他";
	LVBMGUI_BUTTON_LOADADDON					= "载入模块";
	LVBMGUI_FRAME_LOADADDON_DESCRIPTION			= {
		"进入相应区域后模块将会自动加载。如果",
		"你想手动加载，可以点击\"载入模块\"按钮，",
		"之后该模块就会被加载并工作，但这样做",
		"会增加CPU和内存的负担。这个功能的作用",
		"是仅仅是优化插件运行效率，因为我们不",
		"想在玩家不在副本的时候加载所有的东西。"
	};

-- Range stuff
	LVBM_GUI_COMBATLOG_MIN_RANGE        = "战斗记录侦测距离设置为最小";
	LVBM_GUI_COMBATLOG_MAX_RANGE        = "战斗记录侦测距离设置为最大";
	LVBM_GUI_COMBATLOG_LONG_RANGE       = "战斗记录侦测距离设置为长";
	LVBM_GUI_COMBATLOG_DEFAULT_RANGE    = "战斗记录侦测距离设置为默认";
end
