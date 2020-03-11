private ["_cost"];

if ([paint_unit,["Man"]]call core_isKindOf)then {
	_cost = if ((lbCurSel 150) == -1)then {
		20000
	}else{
		((lbData[150,lbCurSel 150]) call config_buycost)
	};
	
	if ([player,"geld",-_cost] call storage_add)then {
		[paint_type] call clothing_switch;
		player setVariable ["textures",dtk_paint];
		player call clothing_texture;
		closeDialog 0;
	}else{
		systemchat format["You need %1 to buy a this skin",[_cost] call Main_FormatMoney];
	};
}else{
	if ([player,"geld", -5000] call storage_add)then {
		DTK_Painting = true;
		closeDialog 0;
		paint_temp_vehicle say "Spray";
		for "_i" from 0 to 100 step 1 do 
		{
			[format['%1%2 Spraying Painting Vehcile',_i,"%"],'\crp_data\images\tags\paint',true]call tag_notify;
			sleep 0.008;
		};
		DTK_Painting = false;
		[]call paint_close;
		paint_unit setVariable ["textures",dtk_paint];
		[typeOf paint_unit,paint_unit]call vehicle_texture;
	}else{
		systemchat "You do not have enough money to paint your vehicle";
	};
};
processInitCommands;