private ["_delay","_function"];

onEachFrame {
	{
		_delay = _x select 0;
		_function = _x select 1;
		_last = _x select 3;
		_last = if (isNil "_last")then {_x set [3,diag_tickTime + _delay];}else{_last};
	
		
		if (diag_tickTime > _last)then {
			_x set [3,diag_tickTime + _delay];
			
			if (typeName _function == "CODE")then {
				call _function;
			}else{
				_prams = _this select 0;
				_code = _this select 1;
				_prams execVM _code;
			};
		};
	}count core_loop_array;
};