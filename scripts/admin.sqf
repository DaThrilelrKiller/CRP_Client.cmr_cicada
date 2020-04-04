DEV_Classes = [
"CfgVehicles",
"CfgSounds",
"CfgWeapons",
"CfgMagizes"
];

DEV_CfgVehicles = [
	"All",
	"AllVehicles",
	"LandVehicle",
	"Land",
	"Air",
	"Truck",
	"Ship",
	"Car",
	"Tank",
	"Helicopter",
	"Plane",
	"Man",
	"Thing"
];

DEV_CfgSounds = [
	"All"
];

DEV_CfgWeapons = [
	"CannonCore",
	"RifleCore",
	"Rifle",
	"Launcher",
	"Default",
	"Pistol"
];

DEV_CfgMagizes = [
	"All"
];

DEV_CfgVehicles_Actions = [
	[{format["createVehicle '%2';",_this select 0,_this select 1]},{[_this select 1,screenToWorld[0.5,0.5],player,dtk_side]call shops_createVehicle;}]
];

DEV_CfgWeapons_Actions = [
	[{format["%1 addWeapon '%2';",_this select 0,_this select 1]},{(_this select 0)addWeapon(_this select 1)}]
];

DEV_CfgMagizes_Actions = [
	[{format["%1 addMagazine '%2';",_this select 0,_this select 1]},{(_this select 0)addMagazine(_this select 1)}]
];

DEV_CfgSounds_Actions = [
	[{format["%1 say '%2';",_this select 0,_this select 1]},{(_this select 0)say(_this select 1)}],
	[{format["playSound '%2';",_this select 0,_this select 1]},{(_this select 0)say(_this select 1)}]
];

DEV_Open = {
	createDialog "DevCon";
	{
		lbAdd [2100,_x];
	}forEach DEV_Classes;
	
	lbSetCurSel [2100, 0];
	[]call DEV_PlayerList;
};

DEV_RefreshKind = {
	lbClear 2101;

	{
		lbAdd [2101,_x];
	}forEach (missionNameSpace getVariable [format["DEV_%1",lbText [2100, (lbCurSel 2100)]],[]]);
	lbSetCurSel [2101, 0];
};

DEV_GetKind = {
	private ["_weapon","_kind","_type","_return"];

	_type = _this select 0;
	_kind = _this select 1;

	if (_type isKindOf _kind)exitWith {true};

	_unknownConfig = configFile >> lbText [2100, (lbCurSel 2100)] >> _type;
	_pistolConfig = configFile >> lbText [2100, (lbCurSel 2100)] >> _kind;
		
	_return = false;
	while {isClass _unknownConfig} do
	{
		if (_unknownConfig == _pistolConfig) exitWith
		{
			_return = true; 
		};
		 _unknownConfig = inheritsFrom _unknownConfig;
	};
	_return;
};

DEV_GetPicture = {
	private ["_picture","_array"];

	_picture = getText(_this >> "picture");
	_array = [_picture,"."]call string_split;
	
	_picture = if (count _array == 2)then {_picture}else{getText(configFile >> "CfgVehicleIcons" >> _picture)};
	_picture
};

DEV_RefreshConfig = {
	private ["_config","_class"];
	
	lbClear 1501;
	_config = configFile >> lbText [2100, (lbCurSel 2100)];
		
	for "_i" from 0 to (count _config)-1 do {
		_class = _config select _i;
		_name = configName(_class);	
		
		_kind  = lbText [2101, (lbCurSel 2101)];
		
		if ([_name,_kind] call DEV_GetKind || {_kind == "All"})then {
			
			_display = getText(_class >> "displayName");
			_picture = _class call DEV_GetPicture;
						
			_index = lbAdd [1501,format ["%2",_name,_display]];
			lbSetPicture [1501, _index, format ["%1",_picture]];
			lbSetData [1501, _index, _name];
		};
	};
	
};

DEV_RefreshActions = {
	lbClear 1502;
	
	_unit = player;
	_selected = lbData [1501, (lbCurSel 1501)];

	{
		_text = [_unit,_selected]call (_x select 0);
		
		lbAdd [1502,_text];
	}forEach (missionNameSpace getVariable [format["DEV_%1_Actions",lbText [2100, (lbCurSel 2100)]],[]]);
	lbSetCurSel [1502, 0];
};

DEV_ExecAction = {
	call compile lbText [1502, (lbCurSel 1502)];
};

DEV_PlayerList = {
	{
		lbAdd [2102,str _x];
	}forEach playableUnits;
	lbSetCurSel [2102, 0];
};

call dev_open;



