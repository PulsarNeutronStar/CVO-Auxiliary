/*
    Author: CVO - Mr. Zorn
    [Description]
		Spawns the Actual crate with the required content.

	Public: No
*/

// Defines the Params
_parameter = _this select 2;
_parameter params["_BoxType", "_spawnloc", "_name", "_array", "_backpacks"];

diag_log (format ["[CVO][CSC](Request) New Request %1", _this]);


private ["_spawnPos", "_size"];

_spawnPos = [];
_size = _target call BIS_fnc_boundingBoxDimensions;
diag_log (format ["[CVO][CSC](Request) _target: %1 - _size = %2", _target, _size]);


if (_spawnloc isEqualTo "REL")  then {

	_spawnPos = _target getRelPos [(_size#0 / 2) + 3 ,180];
	diag_log (format ["[CVO][CSC](Request) post getRelPos _spawnPos: %1", _spawnPos]);

} else {

	_spawnPos = getPosATL _spawnloc;

	};


diag_log (format ["[CVO][CSC](Request) pre set[2,1] _spawnPos: %1", _spawnPos]);
_spawnPos set [2,1];
diag_log (format ["[CVO][CSC](Request) post set [2,1] _spawnPos: %1", _spawnPos]);


diag_log ("[CVO][CSC](Request) - " + _name + " - Start");


// spawn the desired box at the desired location.

_box = createVehicle [_BoxType, _spawnPos,[],2,"CAN_COLLIDE"]; 		
diag_log ("[CVO][CSC](Request) - " + _name + " - Box Created");


// set the custom name for Ace Cargo
_box setVariable ["ace_cargo_customname", _name, true];


// Empties the inventory of the Box
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
diag_log ("[CVO][CSC](Request) - " + _name + " - Cleared Default Inventory");


// Fills the Box with anything in the array that isnt a backpack
if (count _array > 0) then {
	{_box addItemCargoGlobal [_x select 0, _x select 1];} forEach _array;
};

// Fills the Box with with backpacks
if (count _backpacks > 0) then {
	{_box addBackpackCargoGlobal [_x select 0, _x select 1];} forEach _backpacks;
};
diag_log ("[CVO][CSC](Request) - " + _name + " - Added Custom Inventory");

diag_log ("[CVO][CSC](Request) - " + _name + " - Spawning Complete");
