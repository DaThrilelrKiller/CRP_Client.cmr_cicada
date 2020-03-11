if (dtk_server)exitWith {};

{
	_x addaction ["Pull lever","noscript.sqf", format ["%1 spawn slots_start",_x], 1, false, true];
	true
}forEach dtk_machines;