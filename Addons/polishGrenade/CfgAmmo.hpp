
class CfgAmmo {
    class Default;
    class Grenade: Default {
        GVAR(pullPinSound)[] = {"A3\sounds_f\weapons\grenades\Grenade_PullPin.wss", 1.5, 1, 10};
        impactGroundSoft[] = {};
    };

    class SmokeShell;

    class ACE_G_M84: SmokeShell {
        GVAR(flashbang) = 1;
        model = QPATHTOF(models\ACE_m84_thrown.p3d);
        dangerRadiusHit = -1;
        suppressionRadiusHit = 20;
        typicalSpeed = 22;
        cost = 40;
        explosive = 1E-7;
        deflecting = 15;
        explosionTime = 2.3;
        timeToLive = 6;
        grenadeFireSound[] = {};
        grenadeBurningSound[] = {};
        aiAmmoUsageFlags = "64"; // infantry
        smokeColor[] = {0,0,0,0};
        effectsSmoke = "ACE_M84FlashbangEffect";
        whistleDist = 0;
    };

};
