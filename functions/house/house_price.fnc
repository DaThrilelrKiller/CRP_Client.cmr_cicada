private ["_size","_doors","_return"];

_size = sizeOf _this;
_doors = count ([_this] call house_doors);

_return = call{
	if (_this == "ClassNameHere")exitWith {100000};
	_size * (_doors/2) * 100000
};

_return


