private ["_marker"];

if (dtk_client)then {
	{
		_marker = [("save_" + str _ForEachIndex),getPos _x,nil,nil,"colorRed","mil_dot",nil,"Vehicle Save Point"]call core_createMarkerLocal;
		_marker setMarkerAlphaLocal 1;
		v_save_locs set [count v_save_locs,_marker];
	}ForEach (nearestobjects [dtk_center, ["Land_Ind_Garage01_EP1"], (dtk_center select 0)]); 
};