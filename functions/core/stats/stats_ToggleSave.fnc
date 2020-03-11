if ([player,2] call stats_nearSave)exitWith
{
	if (driver (vehicle player) == player)then {
		if (vehicle player != player)then {
			call stats_savevehicle;
		}else{
			[]call stats_retrivevehicleland;
		};
	};
};