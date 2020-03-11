private ["_display","_control"];

disableSerialization;

_display = (uiNamespace getVariable 'tag_notify');
_control = _display displayCtrl 54;	

(ctrlShown _control)