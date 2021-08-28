; Wingman Crafting Labels - By DanMarzola
CustomCrafting:
  CraftingBasesRequest()
  Global CustomCraftingBase
  textList1 := ""
  For k, v in WR.CustomCraftingBases.CustomBases[1]
    textList1 .= (!textList1 ? "" : ", ") v
  baseList := ""
  textList2 := ""
  For k, v in WR.CustomCraftingBases.CustomBases[2]
    textList2 .= (!textList2 ? "" : ", ") v
  baseList := ""
  textList3 := ""
  For k, v in WR.CustomCraftingBases.CustomBases[3]
    textList3 .= (!textList3 ? "" : ", ") v
  baseList := ""
  textList4 := ""
  For k, v in WR.CustomCraftingBases.CustomBases[4]
    textList4 .= (!textList4 ? "" : ", ") v
  baseList := ""
  textList5 := ""
  For k, v in WR.CustomCraftingBases.CustomBases[5]
    textList5 .= (!textList5 ? "" : ", ") v
  baseList := ""
  textList6 := ""
  For k, v in WR.CustomCraftingBases.CustomBases[6]
    textList6 .= (!textList6 ? "" : ", ") v
  baseList := ""
  textList7 := ""
  For k, v in WR.CustomCraftingBases.CustomBases[7]
    textList7 .= (!textList7 ? "" : ", ") v
  baseList := ""
  textList8 := ""
  For k, v in WR.CustomCraftingBases.CustomBases[8]
    textList8 .= (!textList8 ? "" : ", ") v
  baseList := ""
  textList9 := ""
  For k, v in WR.CustomCraftingBases.CustomBases[9]
    textList9 .= (!textList9 ? "" : ", ") v
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
  Gui, CustomCrafting: Add, Button, default gupdateEverything    x225 y180  w150 h23,   Save Configuration
  Gui, CustomCrafting: Add, ComboBox, Sort vCustomCraftingBase xm+5 ym+28 w500, %baseList%
  Gui, CustomCrafting: Add, Tab2, vInventoryGuiTabs x3 y3 w600 h300 -wrap , Group CB1|Group CB2|Group CB3|Group CB4|Group CB5|Group CB6|Group CB7|Group CB8|Group CB9
  Gui, CustomCrafting: Tab, Group CB1
    Gui, CustomCrafting: Add, Edit, vActiveCraftTier1 ReadOnly y+38 w500 r8 , %textList1%
    Gui, CustomCrafting: Add, Button, gAddCustomCraftingBase y+8 w60 r2 center, Add`nT1 Base
    Gui, CustomCrafting: Add, Button, gRemoveCustomCraftingBase x+5 w60 r2 center, Remove`nT1 Base
    Gui, CustomCrafting: Add, Button, gResetCustomCraftingBase x+5 w60 r2 center, Reset`nT1 Base
  Gui, CustomCrafting: Tab, Group CB2
    Gui, CustomCrafting: Add, Edit, vActiveCraftTier2 ReadOnly y+38 w500 r8 , %textList2%
    Gui, CustomCrafting: Add, Button, gAddCustomCraftingBase y+8 w60 r2 center, Add`nT2 Base
    Gui, CustomCrafting: Add, Button, gRemoveCustomCraftingBase x+5 w60 r2 center, Remove`nT2 Base
    Gui, CustomCrafting: Add, Button, gResetCustomCraftingBase x+5 w60 r2 center, Reset`nT2 Base
  Gui, CustomCrafting: Tab, Group CB3
    Gui, CustomCrafting: Add, Edit, vActiveCraftTier3 ReadOnly y+38 w500 r8 , %textList3%
    Gui, CustomCrafting: Add, Button, gAddCustomCraftingBase y+8 w60 r2 center, Add`nT3 Base
    Gui, CustomCrafting: Add, Button, gRemoveCustomCraftingBase x+5 w60 r2 center, Remove`nT3 Base
    Gui, CustomCrafting: Add, Button, gResetCustomCraftingBase x+5 w60 r2 center, Reset`nT3 Base
  Gui, CustomCrafting: Tab, Group CB4
    Gui, CustomCrafting: Add, Edit, vActiveCraftTier4 ReadOnly y+38 w500 r8 , %textList4%
    Gui, CustomCrafting: Add, Button, gAddCustomCraftingBase y+8 w60 r2 center, Add`nT4 Base
    Gui, CustomCrafting: Add, Button, gRemoveCustomCraftingBase x+5 w60 r2 center, Remove`nT4 Base
    Gui, CustomCrafting: Add, Button, gResetCustomCraftingBase x+5 w60 r2 center, Reset`nT4 Base
  Gui, CustomCrafting: Tab, Group CB5
    Gui, CustomCrafting: Add, Edit, vActiveCraftTier5 ReadOnly y+38 w500 r8 , %textList5%
    Gui, CustomCrafting: Add, Button, gAddCustomCraftingBase y+8 w60 r2 center, Add`nT5 Base
    Gui, CustomCrafting: Add, Button, gRemoveCustomCraftingBase x+5 w60 r2 center, Remove`nT5 Base
    Gui, CustomCrafting: Add, Button, gResetCustomCraftingBase x+5 w60 r2 center, Reset`nT5 Base
  Gui, CustomCrafting: Tab, Group CB6
    Gui, CustomCrafting: Add, Edit, vActiveCraftTier6 ReadOnly y+38 w500 r8 , %textList6%
    Gui, CustomCrafting: Add, Button, gAddCustomCraftingBase y+8 w60 r2 center, Add`nT6 Base
    Gui, CustomCrafting: Add, Button, gRemoveCustomCraftingBase x+5 w60 r2 center, Remove`nT6 Base
    Gui, CustomCrafting: Add, Button, gResetCustomCraftingBase x+5 w60 r2 center, Reset`nT6 Base
  Gui, CustomCrafting: Tab, Group CB7
    Gui, CustomCrafting: Add, Edit, vActiveCraftTier7 ReadOnly y+38 w500 r8 , %textList7%
    Gui, CustomCrafting: Add, Button, gAddCustomCraftingBase y+8 w60 r2 center, Add`nT7 Base
    Gui, CustomCrafting: Add, Button, gRemoveCustomCraftingBase x+5 w60 r2 center, Remove`nT7 Base
    Gui, CustomCrafting: Add, Button, gResetCustomCraftingBase x+5 w60 r2 center, Reset`nT7 Base
  Gui, CustomCrafting: Tab, Group CB8
    Gui, CustomCrafting: Add, Edit, vActiveCraftTier8 ReadOnly y+38 w500 r8 , %textList8%
    Gui, CustomCrafting: Add, Button, gAddCustomCraftingBase y+8 w60 r2 center, Add`nT8 Base
    Gui, CustomCrafting: Add, Button, gRemoveCustomCraftingBase x+5 w60 r2 center, Remove`nT8 Base
    Gui, CustomCrafting: Add, Button, gResetCustomCraftingBase x+5 w60 r2 center, Reset`nT8 Base
  Gui, CustomCrafting: Tab, Group CB9
    Gui, CustomCrafting: Add, Edit, vActiveCraftTier9 ReadOnly y+38 w500 r8 , %textList9%
    Gui, CustomCrafting: Add, Button, gAddCustomCraftingBase y+8 w60 r2 center, Add`nT9 Base
    Gui, CustomCrafting: Add, Button, gRemoveCustomCraftingBase x+5 w60 r2 center, Remove`nT9 Base
    Gui, CustomCrafting: Add, Button, gResetCustomCraftingBase x+5 w60 r2 center, Reset`nT9 Base
  Gui, CustomCrafting: Show, , Edit Crafting Tiers
Return

AddCustomCraftingBase:
  Gui, Submit, nohide
  RegExMatch(A_GuiControl, "T" rxNum " Base", RxMatch )
  If (CustomCraftingBase = "" || IndexOf(CustomCraftingBase,WR.CustomCraftingBases.CustomBases[RxMatch1]))
    Return
  WR.CustomCraftingBases.CustomBases[RxMatch1].Push(CustomCraftingBase)
  textList := ""
  For k, v in WR.CustomCraftingBases.CustomBases[RxMatch1]
        textList .= (!textList ? "" : ", ") v
  GuiControl,, ActiveCraftTier%RxMatch1%, %textList%
Return

RemoveCustomCraftingBase:
  Gui, Submit, nohide
  RegExMatch(A_GuiControl, "T" rxNum " Base", RxMatch )
  If (CustomCraftingBase = "" || !IndexOf(CustomCraftingBase,WR.CustomCraftingBases.CustomBases[RxMatch1]))
    Return
  For k, v in WR.CustomCraftingBases.CustomBases[RxMatch1]
    If (v = CustomCraftingBase)
      WR.CustomCraftingBases.CustomBases[RxMatch1].RemoveAt(k)
  textList := ""
  For k, v in WR.CustomCraftingBases.CustomBases[RxMatch1]
        textList .= (!textList ? "" : ", ") v
  GuiControl,, ActiveCraftTier%RxMatch1%, %textList%
  Gui, Show
Return

ResetCustomCraftingBase:
  RegExMatch(A_GuiControl, "T" rxNum " Base", RxMatch )
  WR.CustomCraftingBases.CustomBases[RxMatch1] := WR.CustomCraftingBases.Default[RxMatch1].Clone()
  textList := ""
  For k, v in WR.CustomCraftingBases.CustomBases[RxMatch1]
        textList .= (!textList ? "" : ", ") v
  GuiControl,, ActiveCraftTier%RxMatch1%, %textList%
Return

CraftingBasesRequest(endAtRefresh := 0){
  If (AccountNameSTR = "")
    AccountNameSTR := POE_RequestAccount().accountName
  Global RecipeArray := {}

  If (YesEnableCB1||True){
    If(YesStashCB1){
        Object := POE_RequestStash(YesStashNumberCB1,0)
    }Else{
        Object := POE_RequestStash(StashTabCrafting,0)
    }
    TheObject := []

    For k, v in WR.CustomCraftingBases.CustomBases[1]{
        aux := {"Base Name": v,"ItemObjectArray":[]}
        TheObject.Push(aux)
    }


    For i, content in Object.items
    {
        item := new ItemBuild(content,Object.quadLayout)
        For k,v in TheObject{
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
                  TheObject[k]["ItemObjectArray"].InsertAt(ki, aux)
                  flag:=true
                  break
                }
              }
              if(!flag){
                TheObject[k]["ItemObjectArray"].Push(aux)
              }
            }
            Else
            {
              TheObject[k]["ItemObjectArray"].Push(aux)
            }
          }
        }
    }

  }
  msg:= PrintArray(TheObject)
  msgbox, % msg

}

	PrintArray(Obj,showkey:=True){
		local Msg := "", k, v
		For k, v in Obj {
			Msg .= (Msg?"`n":"") (showkey? k " : " : "" )  (IsObject(v)?PrintArray(v):v)
		}
		Return Msg
	}