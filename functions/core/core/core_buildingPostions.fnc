
_return = [];

for "_i" from 0 to 15 step 1 do 
{
	_pos = _this buildingPos _i;
	if (str _pos != '[0,0,0]')then {
		_return set[count _return,_pos];
	};
};

_return