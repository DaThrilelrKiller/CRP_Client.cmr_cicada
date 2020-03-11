/*
File: fn_isAbleToPlant.sqf
Desc: Checks if the player is allowed to plant in his/her location
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	none
*/



private ["_return","_surface"];
_return = false;
_surface = surfaceType position player;

_return = if (DTK_Shop_Gangarea1 distance player > 900) then {true}else {_return};
_return = if (DTK_Shop_Gangarea2 distance player > 900) then {true}else {_return};
_return = if (DTK_Shop_Gangarea3 distance player > 900) then {true}else {_return};
_return = if (DTK_Shop_Gangarea4 distance player > 900) then {true}else {_return};
_return = if (_surface != "#Default" && {_return})then {_return} else {false};

_return