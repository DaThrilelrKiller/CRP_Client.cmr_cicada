private ["_return","_object","_distance"];

_object = _this select 0;
_distance = _this select 1;

if (isNil "v_save_locs")exitWith {false};
if (count v_save_locs < 1)exitWith {false};

_return = 
{
	if (getMarkerPos _x distance getPos _object < _distance)exitWith {true};

}forEach v_save_locs;

_return = [false,true]select !isNil "_return";
_return