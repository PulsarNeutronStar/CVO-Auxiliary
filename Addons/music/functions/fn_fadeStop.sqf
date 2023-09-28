/*
 * Author: [Name of Author(s)]
 * Saves the current musicVolume, fades the current soundtrack for 
 *
 * Arguments:
 * 0: <Optional> Time to Fade <Number> (Default: 5)
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * ["something", player] call cvo_music_fnc_fadeStop;
 *
 * Public: yes
 */

if (!hasInterface) exitWith {};

params [
	["_fadeTime", 5, [0]],
	["_clearQueue", false, [false]]
];

if (CVO_Music_isPLaying) do {
	private _musicVolume = musicVolume;
	_fadeTime fadeMusic 0;
	[
		{	playMusic "";
			1 fadeMusic _this;	},		// Code
		_musicVolume,					// Parameters
		_fadeTime						// Time To wait
	] call CBA_fnc_waitAndExecute;

	if (_clearQueue) then {
		CVO_Music_Queue = [];
		publicVariableServer "CVO_Music_Queue";
	};
};

