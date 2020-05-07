

private ["_building","_phase","_doors"];

waitUntil {
	if (count DTK_Locked != 0)then {
		{
			_building = nearestBuilding (getMarkerPos _x);
			_doors = [_building]call house_doors;
			
			{
				_phase = _building animationPhase _x;
				if (_phase < 1)then {
					_building animate [_x, 1];
				};
			}forEach _doors;
		}forEach DTK_Locked;
	};
	false
};