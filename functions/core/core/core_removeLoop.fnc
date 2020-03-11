private ["_return","_index"];
_index = _this;

_return = {
	if ((_x select 2) == _index)exitWith {_ForEachIndex};
}forEach core_loop_array;

core_loop_array set [_return,""];
core_loop_array = core_loop_array - [""];