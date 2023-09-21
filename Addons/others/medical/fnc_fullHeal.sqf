/*
	Author: Mr. Zorn

	Description:
		 Adds an Ace Interaction to a vehicle class so players can perform a fullheal with a progressbar (30s) on said vehicle.
 
 	Dependency: ACE, CBA
	
	Parameter(s):
		0: <_target> can be one of: 
						<Object>	     	    							- Individual Object to add the Full Heal ACE Action
						<String of classname>   							- Entire Class to add the Full Heal ACE Action

		1:  <_duration>	<Number in secounds>    <Optional> <Default: 30>	- Duration of the Healing Process
		2: 	<_chance> 	<Number 0..100> 		<Optional> <Default: 5>		- Defines the chance for the Easeregg sound - 0 disables the Easteregg

	Returns:
		Returns False when <_target> is not defined.

	Examples:
		[ourMedicalVehicle,     60, 1] call cvo_others_fnc_fullHeal;	// Adds Full Health Check on a single object
		["mod_vehicle_medical", 30, 0] call cvo_others_fnc_fullHeal;	// Adds Full Health Check on all objects of this classname
*/




params [
	["_target",		"", 	["",objNull]],
	["_duration", 	30, 	[0]			],
	["_chance", 	5, 		[0]			]
];

if (_target isEqualTo "") exitWith {false};
private _targetType;


// Here you define the code you want to execute, in this case, via a progress bar
_code = {
	if (round random 100 < _chance) then {
		playSound3D [getMissionPath "cvo_others\medical\medical_healsound.ogg", player];
	};
	[{
		[
			"Get Treated...",												// Title of progressBar
			_duration,																// Duration of progressBar in secounds
			{true},															// Condition, will check every frame
			{
				[player] call ace_medical_treatment_fnc_fullHealLocal;		// The actual fucking code
			}																// codeblock to be executed on completion
		] call CBA_fnc_progressBar;											// Executing a CBA progressBar from an Ace Interaction results in crash. Delay execution by 1 frame!!!
	}] call CBA_fnc_execNextFrame;											// <- this will delay the execution by 1 Frame. 
}; 																			// This is the code you want the interaction to execute.


// Here we create the action which we later attach to something
_cvo_fullAceHeal = [
	"CVO_FullHeal",									// Action Name
	"Get Full Health Check",						// Name for the ACE Interaction Menu
	"cvo_others\medical\redCrystal.paa",						// custom Icon
	_code,											// Statement - the coe you're executing
	{true}											// Condition
] call ace_interact_menu_fnc_createAction;

switch (typeName _target) do {

	case "STRING": {
		[
			_target,										// Class the action should be assigned to
			0,												// Type of action, 0 for action, 1 for self-actionIDs
			["ACE_MainActions"],							// Parent path of the new action <Array>
			_cvo_fullAceHeal
		] call ace_interact_menu_fnc_addActionToClass;		// Alternative: ace_interact_menu_fnc_addActionToObject 
	};

	case "OBJECT": {
		[
			_target,										// Class the action should be assigned to
			0,												// Type of action, 0 for action, 1 for self-actionIDs
			["ACE_MainActions"],							// Parent path of the new action <Array>
			_cvo_fullAceHeal
		] call ace_interact_menu_fnc_addActionToObject;		// Alternative: ace_interact_menu_fnc_addActionToObject 
	};

};


// Here we define where we want this action that we created to be attached to



