createDialog "radio_tower";

{
	{
		if (_x call TFAR_fnc_isRadio)then {
			_active = "Active";
			_index = lbAdd [56, format ["C%1 %2 - %3",_x call TFAR_fnc_getSwChannel,(_x call TFAR_fnc_getSwFrequency),_active]];
			lbSetData [56, _index, str [_x,(_arrayamount select _ForEachIndex)]];
		};
	}forEach (weapons _x);
}forEach playableUnits;