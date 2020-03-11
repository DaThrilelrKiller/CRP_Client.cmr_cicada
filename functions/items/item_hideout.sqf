private["_item","_zunah","_pos","_dir"];
												
_item   = _this select 1;														
systemChat  format[localize "STRS_inventar_bought_hideout", player];																			
 
_pos    = position player;			
_dir    = getdir player;							
_pos        = [(_pos select 0) + ((sin _dir) * 10), (_pos select 1) + ((cos _dir) * 10),(_pos select 2)];	

_fire = "Land_Campfire_burning" createVehicle _pos;																
_tent = "Land_tent_east" CreateVehicle _pos; 															

_box = "TKOrdnanceBox_EP1" createVehicle [0,0,0];												
_box setDir _dir; 
_box setpos (_tent buildingPos 2);
ClearMagazineCargo _box; 
ClearWeaponCargo _box;

_fire call core_setVarName;
_tent call core_setVarName;
_box call core_setVarName;

_tent addaction ["Remove your hideout", "noscript.sqf", 
format['
	deleteVehicle %1;
	deleteVehicle %2;
	deleteVehicle %3;																						
	[player,"hideout",1] call storage_add;
',_tent,_fire,_box],1,false,true,"",""];
																			
[player,_item,-1] call storage_add;
