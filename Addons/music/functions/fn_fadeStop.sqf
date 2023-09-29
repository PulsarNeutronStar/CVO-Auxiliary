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

params [
	["_fadeTime", 5, [0]]
];

if (!isNil "CVO_Music_isFading") exitWith {};

if (CVO_Music_isPLaying) then {
	CVO_Music_isFading = true;
	private _musicVolume = musicVolume;
	_fadeTime fadeMusic 0;
	[
		{	playMusic "";
			1 fadeMusic _this;
			CVO_Music_isFading = nil;	},		// Code
		_musicVolume,					// Parameters
		(_fadeTime + 1)					// Time To wait
	] call CBA_fnc_waitAndExecute;
};

