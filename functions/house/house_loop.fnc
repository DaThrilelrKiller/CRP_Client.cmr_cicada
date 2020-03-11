
for "_o" from 0 to 1 step 0 do 
{
	{	
		if (player distance getmarkerPos _x < 15)then {
			_building  = nearestBuilding (getMarkerPos _x);
			_locked = missionNamespace getVariable [format["%1_locked",_x],false];
			_doors = [_building]call house_doors;
			
			if (_locked)then {
				{
					_phase = _building animationPhase _x;
					if (_phase < 1)then {
						_building animate [_x, 1];
					};
				}forEach _doors;
			};
		};	
	}forEAch dtk_locked;
	sleep 0.1;
};