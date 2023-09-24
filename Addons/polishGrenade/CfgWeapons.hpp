
class CfgWeapons {
    class GrenadeLauncher;
    class Throw: GrenadeLauncher {
        muzzles[] += {"ACE_HandFlare_WhiteMuzzle","ACE_HandFlare_RedMuzzle","ACE_HandFlare_GreenMuzzle","ACE_HandFlare_YellowMuzzle","ACE_M84Muzzle","ACE_M14Muzzle","ACE_CTS9Muzzle","ACE_SatchelMuzzle","ACE_DemoMuzzle"};

        class ThrowMuzzle;

        class ACE_M84Muzzle: ThrowMuzzle {
            magazines[] = {"ACE_M84"};
        };
    };
};
