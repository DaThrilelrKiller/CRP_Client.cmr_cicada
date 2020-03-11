/*
File: id_show.fnc
Desc: Displays a player ID to all players in a 6m radius 
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	0. Use -Default for all items
*/

private ["_art"];
_art = _this select 0;

if ((typeName _art) == "STRING")then
{
	format['if (player distance %1 < 5 or player == %1)then {[%1]call id_show;};',player]call network_broadcast;
}
else
{
	_PlayerIDSettings = _art getVariable "PlayerSettings";
	_PlayerSide = _PlayerIDSettings select 1;
	_Array = _PlayerIDSettings select 0;
	_Face = _Array select 0;
	_Month = _Array select 1;
	_Day = _Array select 2;
	_Year = _Array select 3;
	
	private ["_ui","_FaceUI"];
	disableSerialization;
	1010 cutRsc ["IDCard","PLAIN"];

	_ui = uiNameSpace getVariable "IDCard";
	_background = _ui displayCtrl 1201;
	_FaceUI = _ui displayCtrl 1202;
	_Name = _ui displayCtrl 1400;
	_Idnum = _ui displayCtrl 1402;
	_rank = _ui displayCtrl 1403;
	_dob = _ui displayCtrl 1401;

	_Name ctrlSetText format["%1",name _art];
	_Idnum ctrlSetText format["%1",getPlayerUID _art];
	_rank ctrlSetText format["%1","n/a"];
	_dob ctrlSetText format["%1 %2 %3",_Month,_Day,_Year];
};