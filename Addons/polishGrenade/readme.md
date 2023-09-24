## Goal:

Create A Handgranade, potentially based on the ACE_M84 which has the model of the Toilet and plays the Polish Song once the pin is pulled.



model = "\A3\structures_f_enoch\furniture\bathroom\toilet_b_02\toilet_b_02.p3d";


ammo = "ACE_G_M84";
author = "ACE-Team";
count = 1;
descriptionShort = "Also known as flashbang. Causes immediate flash blindness, deafness, tinnitus, and inner ear disturbance.";
displayname = "M84 Stun Grenade";
displayNameShort = "M84";
initSpeed = 18;
mass = 4;
maxLeadSpeed = 6.94444;
maxThrowHoldTime = 2;
maxThrowIntensityCoef = 1.4;
minThrowIntensityCoef = 0.3;
model = "\z\ace\addons\grenades\models\ACE_m84.p3d";
modelSpecial = "";
nameSound = "handgrenade";
picture = "\z\ace\addons\grenades\UI\ACE_m84_x_ca.paa";
quickReload = 0;
reloadAction = "";
scope = 2;
selectionFireAnim = "zasleh";
simulation = "ProxyMagazines";
type = 256;
useAction = 0;
useActionTitle = "";
value = 1;
weaponpoolavailable = 1;
weight = 0;


configFile >> "CfgMagazines" >> "ACE_M84"
["Default","CA_Magazine","HandGrenade"]
["ace_grenades"]


https://www.youtube.com/watch?v=zecnwqXe850

g will appear when launching the game.
        requiredAddons[] = {"ace_common", "ace_grenades"};

        class ACE_M84Muzzle: ThrowMuzzle {
            magazines[] = {"ACE_M84"};
        };


