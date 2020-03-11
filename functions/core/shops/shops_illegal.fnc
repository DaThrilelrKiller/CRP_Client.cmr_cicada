private ["_shop","_index","_data","_buy","_sell","_return","_bool"];
_shop = _this select 0;
_index = _shop getVariable ["shop_data",""];

if (typeName _index == "STRING")exitWith {};

_data = (INV_ItemShops select _index)select 2;

{
	private ["_buy","_sell"];
	_buy = (_x select 1);
	_sell = (_x select 2);
	if (typeName _buy == "STRING")exitWith {};
	_buy = +_buy; 
	_sell = +_sell; 
	
	{
		if !(_x in _buy)then {
			_buy set [count _buy,_x];
		};
	}forEach _sell;
	
	
	{
		if (_x call config_type == "Item")then {
			_bool = _x call config_illegal;
			if (_bool)then {_return = true};
		};
	}forEach _buy;
}forEach _data;


if (isNil "_return")exitWith {false};
_return