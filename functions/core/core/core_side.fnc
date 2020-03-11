private ["_return"];

_return = call {
	if (local _this)exitWith {
		if (playerSide == civilian)exitWith {"CIV"};
		if (playerSide == resistance)exitWith {"UN"};
		if (playerSide == west)exitWith {"PD"};
	};
	
	if (side _this == civilian)exitWith {"CIV"};
	if (side _this == resistance)exitWith {"UN"};
	if (side _this == west)exitWith {"PD"};
};


_return