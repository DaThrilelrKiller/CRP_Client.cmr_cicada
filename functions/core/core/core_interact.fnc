private ["_unit"];

_unit = _this;

if (!dtk_civ)then {
	call compile format['[0,0,0, ["civmenu", "%1", %1]] execVM "scripts\interact.sqf";', _unit];
}else{
	call compile format['[0,0,0, ["civinteraktion", "%1", %1]] execVM "scripts\interact.sqf";', _unit];
};

