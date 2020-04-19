if (dtk_client)then
{
	[]spawn {
		waitUntil {!isNil "AR_StaticsLoaded"};
		{
			if (_x call TFAR_fnc_isRadio || {_x == "ItemRadio"})then {
				player removeWeapon _x;
			};
		}forEach (weapons player);
		player addWeapon "ItemRadio";
		[]spawn tfar_fnc_clientinit;
		[]spawn tfar_channelCheck;
	};
};
