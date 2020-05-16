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

if (player distance (getMarkerPos "lsdfield") < 200) exitWith {true};
if (player distance (getMarkerPos "cocainefield_4_1") < 200) exitWith {true};
if (player distance (getMarkerPos "herionfield_2") < 200) exitWith {true};
if (player distance (getMarkerPos "herionfield_2") < 200) exitWith {true};
(call house_nearHouse)