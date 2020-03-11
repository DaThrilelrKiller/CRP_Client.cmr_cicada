private ["_return"];

_return = (_this getVariable "PlayerSettings" select 1);
_return = if (isnil "_return")then {"UNKNOWN"}else{_return};
_return