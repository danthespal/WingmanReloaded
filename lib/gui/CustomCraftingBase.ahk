; Wingman Crafting Labels - By DanMarzola
CustomCrafting:
  ;CraftingBasesRequest()
  Global CustomCraftingBase
  TabCreator := ""
  for ki, vi in WR.CustomCraftingBases.CustomBases{
    textList%ki% := []
    TabCreator .= (!TabCreator ? "" : "|") "Group CB"ki
    For k, v in WR.CustomCraftingBases.CustomBases[ki]
      textList%ki%.Push(v)
  }
  baseList := ""
  For k, v in Bases
  {
    If ( !IndexOf("talisman",v["tags"]) 
      && ( IndexOf("amulet",v["tags"]) 
    || IndexOf("ring",v["tags"]) 
    || IndexOf("belt",v["tags"]) 
    || IndexOf("armour",v["tags"]) 
    || IndexOf("weapon",v["tags"])
    || IndexOf("jewel",v["tags"])
    || IndexOf("abyss_jewel",v["tags"]) ) )
    {
      baseList .= v["name"]"|"
    }
  }

  Gui, CustomCrafting: New
  Gui, CustomCrafting: +AlwaysOnTop -MinimizeBox
  ;Gui, CustomCrafting: Add, Button, default gupdateEverything x225 y250 w150 h23, Save Configuration
  Gui, CustomCrafting: Add, Tab2, vInventoryGuiTabs x3 y3 w600 h300 -wrap , %TabCreator%
  for ki, vi in WR.CustomCraftingBases.CustomBases{
    Gui, CustomCrafting: Tab, Group CB%ki%
    Gui, CustomCrafting: Add, ListView , w500 r10 -wrap -Multi Grid gMyCustomCraftingBaseListView vlistview%ki%, CB%ki% Bases
    Gui, CustomCrafting: Add, Button, gAddNewCustomCraftingBaseRow y+8 w60 r2 center, Add`nT%ki% Base
    Gui, CustomCrafting: Add, Button, gSaveCustomCraftingBaseTier x+5 w60 r2 center, Save`nT%ki% Base
    Gui, CustomCrafting: Add, Button, gResetCustomCraftingBaseTier x+5 w60 r2 center, Reset`nT%ki% Base
    RefreshCBList(ki)
  }
  Gui, CustomCrafting: Show, , Edit Crafting Tiers
Return

AddNewCustomCraftingBaseRow:
  RegExMatch(A_GuiControl, "T" rxNum " Base", RxMatch )
  Gui, ListView, listview%RxMatch1%
  LV_Add("","Double Click to Edit this Row")
  Gui, Submit, nohide
Return

ResetCustomCraftingBaseTier:
  RegExMatch(A_GuiControl, "T" rxNum " Base", RxMatch )
  Gui, ListView, listview%RxMatch1%
  WR.CustomCraftingBases.CustomBases[RxMatch1] := WR.CustomCraftingBases.Default[RxMatch1].Clone()
  textList%RxMatch1% := []
  For k, v in WR.CustomCraftingBases.CustomBases[RxMatch1]
    textList%RxMatch1%.Push(v)
  LV_Delete()
  RefreshCBList(RxMatch1)
  Gui, Submit, nohide
Return

SaveCustomCraftingBaseTier:
RegExMatch(A_GuiControl, "T" rxNum " Base", RxMatch )
Gui, ListView, listview%RxMatch1%
WR.CustomCraftingBases.CustomBases[RxMatch1] := []
Loop % LV_GetCount()
{
  LV_GetText(RetrievedText, A_Index)
  WR.CustomCraftingBases.CustomBases[RxMatch1].Push(RetrievedText)
}
submit()
Return

MyCustomCraftingBaseListView:
RegExMatch(InventoryGuiTabs, "CB"rxNum, RxMatch )
Gui, ListView, listview%RxMatch1%
if (A_GuiEvent = "DoubleClick")
{
  RowNumber :=  A_EventInfo
  LV_GetText(OutputVar1, RowNumber,1)
  Gui, CustomMapModsUI2: New
  Gui, CustomMapModsUI2: +AlwaysOnTop -MinimizeBox
  Gui, CustomMapModsUI2: Add, Text,, Map Modifier:
  Gui, CustomMapModsUI2: Add, ComboBox, w400 vMapModField , % OutputVar1 "||" WR.Data.Map_Affixes
  ;Gui, CustomMapModsUI2: Add, Button, gSaveRowCUM y+8 w120 h30 center, Save
  ;Gui, CustomMapModsUI2: Add, Button, gRemoveRowCUM x+5 w120 h30 center, Remove
  Gui, CustomMapModsUI2: Show, , Edit Map Mod
}
return

CraftingBasesRequest(endAtRefresh := 0){
  If (AccountNameSTR = "")
    AccountNameSTR := POE_RequestAccount().accountName

  Object := []
  Global CBObjectArray := []

  ; Create Object with All
  For ki, vi in WR.CustomCraftingBases.CustomBases
  {
    if(YesEnableCB%ki%)
    {
      StashValue := (YesStashCB%ki% ? YesStashNumberCB%ki% : (StashTabYesCrafting ? StashTabCrafting : 0))
      KeepValue := (YesKeepCB%ki% ? YesKeepNumberCB%ki% : 0)
      if(KeepValue)
        Object.InsertAt(ki,POE_RequestStash(StashValue,0))
      For k, v in WR.CustomCraftingBases.CustomBases[ki]
      {
        aux := {"Base Name": v,"StashNumber": StashValue ,"KeepNumber": KeepValue,"ItemObjectArray":[]}
        CBObjectArray.Push(aux)
      }
    }

  }
  For ty, vy in Object{
    For i, content in Object[ty].items
    {
      item := new ItemBuild(content,Object[ty].quadLayout)
      For k,v in CBObjectArray{
        if(v["Base Name"] == item.Prop.ItemBase){ 
          aux := {"ILvL": item.Prop.ItemLevel,"X":item.Prop.StashX,"Y":item.Prop.StashY}
          flag:=false

          ; Order Array by ILvL
          if (v["ItemObjectArray"].Count() > 0)
          {
            for ki, vi in v["ItemObjectArray"]
            {
              if (vi["ILvL"] < aux["ILvL"])
              {
                CBObjectArray[k]["ItemObjectArray"].InsertAt(ki, aux)
                flag:=true
                break
              }
            }
            if(!flag)
              CBObjectArray[k]["ItemObjectArray"].Push(aux)
          }
          Else
            CBObjectArray[k]["ItemObjectArray"].Push(aux)
        }
      }
    }
  }
  ;Remove Empty Stuff from Object
  AuxCBObjectArray := CBObjectArray.Clone()
  CBObjectArray := []
  For ki, vi in AuxCBObjectArray
  {
    if(vi["ItemObjectArray"].Count() != 0)
      CBObjectArray.Push(vi)
  }
  AuxCBObjectArray := []
}

RefreshCBList(number){
  For k, v in textList%number%
    LV_Add("",v)
}
Return