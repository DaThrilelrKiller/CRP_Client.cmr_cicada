private ["_idc","_object","_array","_arrayitems","_arrayamount","_index"];

_idc = _this select 0;
_object = _this select 1;
_showdrap = _this select 2;
_array = _object getVariable ["dtk_storage",[[],[]]];

lbClear _idc;

_arrayitems = _array select 0;
_arrayamount = _array select 1;

{
	if (_showdrap || {_x call config_dropable})then 
	{
		_index = lbAdd [_idc, format ["%1 - %2 (%3kg)",(_arrayamount select _ForEachIndex),(_x call config_displayname),(_x call config_weight)]];
		lbSetData [_idc, _index, str [_x,(_arrayamount select _ForEachIndex)]];
		lbSetPicture [_idc, _index, format ["\crp_data\images\items\%1.paa",[_x]call config_image]];
	};
}forEach _arrayitems;