private["_money","_total","_bank"];

_amount = _this;

_money  = [player,"geld"] call storage_amount;
_total = _money + dtk_bank;

if (_total > _this) exitWith
{
	_money = if (_this >= _money)then{_money}else{_this};
	_bank = _this - _money;
	[player,'geld', -(_money)] call storage_add;
	dtk_bank = dtk_bank - _bank;
	closeDialog 0;
};