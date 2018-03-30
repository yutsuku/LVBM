La Vendetta Boss Mod / Deadly Boss Mod - a World of Warcraft (1.12.1) AddOn Pack (modification)
====================================

Installation:

Put all "LVBM_*" folders into ".../World of Warcraft/Interface/AddOns/".
Create AddOns folder if necessary

After Installation directory tree should look like the following

<pre>
World of Warcraft
`- Interface
   `- AddOns
      |-- LVBM_API
      |   |-- BossModTemplate.lua
      |   |-- Bosses.lua
      |   |-- LVBM_API.lua
      |   |-- LVBM_API.toc
      |   |-- LVBM_API.xml
      |   |-- LVBM_StatusBars.lua
      |   |-- LVBM_StatusBars.xml
      |   |-- Patchnotes.lua
      |   |-- Textures
      |   |   |-- Arrow-Right.tga
      |   |   |-- CloudStatusBarDesign.tga
      |   |   |-- ExtraStatusBarDesign1.tga
      |   |   |-- Minimap-Button-Down.blp
      |   |   |-- Minimap-Button-Up.blp
      |   |   |-- OptionsFrame.blp
      |   |   |-- PerlStatusBarDesign.tga
      |   |   `-- Spark.blp
      |   |-- localization.cn.lua
      |   |-- localization.de.lua
      |   |-- localization.en.lua
      |   |-- localization.fr.lua
      |   |-- localization.kr.lua
      |   `-- localization.tw.lua
      |-- LVBM_AQ20
      |   |-- LVAnubisathGuardians.lua
      |   |-- LVAyamiss.lua
      |   |-- LVBM_AQ20.toc
      |   |-- LVBuru.lua
      |   |-- LVMoam.lua
      |   |-- LVOssirian.lua
      |   |-- LVRajaxx.lua
      |   |-- localization.cn.lua
      |   |-- localization.de.lua
      |   |-- localization.en.lua
      |   |-- localization.fr.lua
      |   `-- localization.tw.lua
      |-- LVBM_AQ40
      |   |-- LVBM_AQ40.toc
      |   |-- LVCThun.lua
      |   |-- LVDefender.lua
      |   |-- LVFankriss.lua
      |   |-- LVHuhuran.lua
      |   |-- LVOuro.lua
      |   |-- LVSartura.lua
      |   |-- LVSkeram.lua
      |   |-- LVThreeBugs.lua
      |   |-- LVTwinEmps.lua
      |   |-- LVViscidus.lua
      |   |-- localization.cn.lua
      |   |-- localization.de.lua
      |   |-- localization.en.lua
      |   |-- localization.fr.lua
      |   `-- localization.tw.lua
      |-- LVBM_BWL
      |   |-- LVBM_BWL.toc
      |   |-- LVChromaggus.lua
      |   |-- LVEbonroc.lua
      |   |-- LVFiremaw.lua
      |   |-- LVFlamegor.lua
      |   |-- LVNefarian.lua
      |   |-- LVRazorgore.lua
      |   |-- LVVaelastrasz.lua
      |   |-- localization.cn.lua
      |   |-- localization.de.lua
      |   |-- localization.en.lua
      |   |-- localization.fr.lua
      |   `-- localization.tw.lua
      |-- LVBM_GUI
      |   |-- Bindings.xml
      |   |-- LVBM_GUI.lua
      |   |-- LVBM_GUI.toc
      |   |-- LVBM_GUI.xml
      |   |-- LVBM_GUI_InfoFrame.lua
      |   |-- LVBM_GUI_Templates.xml
      |   |-- localization.gui.cn.lua
      |   |-- localization.gui.de.lua
      |   |-- localization.gui.en.lua
      |   |-- localization.gui.fr.lua
      |   `-- localization.gui.tw.lua
      |-- LVBM_MC
      |   |-- LVBM_MC.toc
      |   |-- LVGeddon.lua
      |   |-- LVGehennas.lua
      |   |-- LVLucifron.lua
      |   |-- LVMagmadar.lua
      |   |-- LVMajordomo.lua
      |   |-- LVRagnaros.lua
      |   |-- LVShazzrah.lua
      |   |-- localization.cn.lua
      |   |-- localization.de.lua
      |   |-- localization.en.lua
      |   |-- localization.fr.lua
      |   `-- localization.tw.lua
      |-- LVBM_NAXX
      |   |-- Abomination
      |   |   |-- LVGluth.lua
      |   |   |-- LVGrobbulus.lua
      |   |   |-- LVPatchwerk.lua
      |   |   `-- LVThaddius.lua
      |   |-- Deathknight
      |   |   |-- LVFourHorsemen.lua
      |   |   |-- LVGothik.lua
      |   |   `-- LVRazuvious.lua
      |   |-- Frostwyrm
      |   |   |-- LVKelthuzad.lua
      |   |   `-- LVSapphiron.lua
      |   |-- Ghoul
      |   |   |-- LVHeigan.lua
      |   |   |-- LVLoatheb.lua
      |   |   |-- LVLoatheb.xml
      |   |   `-- LVNoth.lua
      |   |-- LVBM_NAXX.toc
      |   |-- Spider
      |   |   |-- LVAnubRekhan.lua
      |   |   |-- LVGrandWidowFaerlina.lua
      |   |   `-- LVMaexxna.lua
      |   |-- localization.cn.lua
      |   |-- localization.de.lua
      |   |-- localization.en.lua
      |   |-- localization.fr.lua
      |   `-- localization.tw.lua
      |-- LVBM_Other
      |   |-- LVAzuregos.lua
      |   |-- LVBM_Other.toc
      |   |-- LVBattlegrounds.lua
      |   |-- LVKazzak.lua
      |   |-- LVOnyxia.lua
      |   |-- LVOutdoorDragons.lua
      |   |-- LVRunecloth.lua
      |   |-- LVStartUp.lua
      |   |-- LVTestBossMod.lua
      |   |-- localization.cn.lua
      |   |-- localization.de.lua
      |   |-- localization.en.lua
      |   |-- localization.fr.lua
      |   `-- localization.tw.lua
      |-- LVBM_RaidTools
      |   |-- LVBM_RaidTools.lua
      |   |-- LVBM_RaidTools.toc
      |   |-- LVBM_RaidTools.xml
      |   |-- localization.en.lua
      |   `-- localization.tw.lua
      `-- LVBM_ZG
          |-- LVArlokk.lua
          |-- LVBM_ZG.toc
          |-- LVHakkar.lua
          |-- LVJeklik.lua
          |-- LVJindo.lua
          |-- LVMandokir.lua
          |-- LVMarli.lua
          |-- LVVenoxis.lua
          |-- localization.cn.lua
          |-- localization.de.lua
          |-- localization.en.lua
          |-- localization.fr.lua
          `-- localization.tw.lua


</pre>

Features:
- This is a repack containing every singe package instead of individual ones

Known Issues:
- None.

Notes:
- I am **not the original author** of this AddOn.