private ["_text"];
_text = lbText [1500, (lbCurSel 1500)];
switch (_text) do
{
	case "Delete": 
	{
		closeDialog 0;
		_object = cursorTarget;
		if (_object in INV_ServerBuildingArray)exitWith {systemChat "that object cannot be deleted"};
		deleteVehicle _object;
		systemChat format ["%1 deleted",_object];
	};
	case "Teleport": 
	{
		closeDialog 0;
		call admin_teleport;
	};
	case "Console": 
	{
		closeDialog 0;
		call admin_console;
	};
	case "Move": 
	{
		closeDialog 0;
		call admin_Move;
	};
	case "Inventory": 
	{
		closeDialog 0;
		call admin_inventory;
	};
	case "Licenses": 
	{
		closeDialog 0;
		call admin_licenses;
	};
	case "Vehicles": 
	{
		closeDialog 0;
		call admin_vehicles;
	};
	case "Logs": 
	{
		closeDialog 0;
		call admin_logs;
	};
	case "Spectate": 
	{
		_currentcam = cameraView;
		_player = (call compile lbData [2100, lbCurSel 2100]select 1);
		_player switchCamera "EXTERNAL";
				
		[_currentcam]spawn 
		{
			waitUntil {speed player > 0.1};
			(vehicle player) switchCamera (_this select 0);
		};
		closeDialog 0;
	};
	case "Camera": 
	{
		closeDialog 0;
		player exec "camera.sqs";
	};
	case "Revive": 
	{
		call admin_Revive;
		closeDialog 0;
	};
	case "Clothing": 
	{
		closeDialog 0;
		[]call admin_clothes;
	};
	case "Sounds": 
	{
		closeDialog 0;
		[]call admin_sounds;
	};
};