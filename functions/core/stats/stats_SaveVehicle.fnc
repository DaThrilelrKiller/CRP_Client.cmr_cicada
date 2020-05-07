private ["_vcl","_vclClass","_trunk","_speedupgrade","_save","_plate","_warrants","_license","_notes","_sirens","_name"];
_vcl = (vehicle player);

if (_vcl == player)then {
	_vcl = [getPos player,20]call core_NearbyVehicle;
};

if (isNil "_vcl")exitWith {
	systemchat "Error saving vehicle: no vehicle found";
};

if !([player,_vcl]call keys_has)exitWith {systemChat "you dont have the keys to this vehicle"};


_name = _vcl call vehicle_name;
_vclClass = (_vcl getVariable "DTK_OwnerUID" select 1);
_trunk = _vcl getVariable "dtk_storage";
_speedupgrade = _vcl getvariable "tuning"; 
_speedupgrade = if (isNil "_speedupgrade")then {0}else{_speedupgrade};

_weaps = getWeaponCargo _vcl;
_mags = getMagazineCargo _vcl;
_plate = _vcl getVariable  "dtk_plate";
_warrants = _vcl getVariable ["cdb_warrants",[]];
_license = _vcl getVariable ["cdb_license",[]];
_notes = _vcl getVariable ["cdb_notes",[]];
_textures = _vcl getVariable ["textures",[]];
_sirens = _vcl getVariable ["dtk_sirens",[]];

INVVehiclesLand set [count INVVehiclesLand, [_vclClass,_trunk,_speedupgrade,_weaps,_mags,_plate,_warrants,_license,_notes,_sirens,_textures]];
deleteVehicle _vcl;

_save = [player, [ [dtk_side, "Vehicles", INVVehiclesLand] ] ];
["SERVER",_save,"S_stats_save",false,false]call network_mpexec;
systemChat format ["(%1) has been saved in your garage, you now have %2 vehicles stored",_name,count INVVehiclesLand];
