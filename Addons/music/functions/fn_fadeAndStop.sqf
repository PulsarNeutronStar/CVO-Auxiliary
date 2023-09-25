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
 * ["something", player] call ace_common_fnc_imanexample
 *
 * Public: yes
 */

if (!hasInterface) exitWith {};
if (!canSuspend)   exitWith {	_this spawn cvo_music_fnc_fadeAndStop;	};

params [
	["_fadeTime", 5, [0]]
];

if (CVO_Music_isPLaying) do {
	private _musicVolume = musicVolume;
	_fadeTime fadeMusic 0;
	sleep (_fadeTime + 1);
	playMusic "";
	1 fadeMusic _musicVolume;
};
