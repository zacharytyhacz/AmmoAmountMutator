class AmmoChangerDPV1 extends Mutator config(AmmoChangerDP);


// Enforcer
var() config int EnforcerWeaponPickupAmount;
var() config int EnforcerAmmoPickupAmount;


// BioRifle
var() config int BioRifleWeaponPickupAmmoAmount;
var() config int BioRifleAmmoPickupAmount;
var() config int BioRifleMaxAmmoAmount;


// Shock Rifle
var() config int ShockWeaponPickupAmmoAmount;
var() config int ShockAmmoPickupAmount;
var() config int ShockMaxAmmoAmount;


// Pulse
var() config int PulseWeaponPickupAmmoAmount;
var() config int PulseAmmoPickupAmount;
var() config int PulseMaxAmmoAmount;


// Minigun
var() config int MinigunAmmoPickupAmount;
var() config int MinigunWeaponPickupAmmoAmount;

// Minigun and Enforcer
var() config int MinigunEnforcerMaxAmmoAmount;


// Ripper
var() config int RipperWeaponPickupAmmoAmount;
var() config int RipperAmmoPickupAmount;
var() config int RipperMaxAmmoAmount;


// Flak
var() config int FlakWeaponPickupAmmoAmount;
var() config int FlakAmmoPickupAmount;
var() config int FlakMaxAmmoAmount;


// RocketLauncher
var() config int RocketLauncherWeaponPickupAmmoAmount;
var() config int RocketLauncherAmmoPickupAmount;
var() config int RocketLauncherMaxAmmoAmount;


// Sniper
var() config int SniperWeaponPickupAmmoAmount;
var() config int SniperAmmoPickupAmount;
var() config int SniperMaxAmmoAmount;

function PostBeginPlay()
{
    Super.PostBeginPlay();
    log("EnforcerWeaponPickupAmount: " @ EnforcerWeaponPickupAmount);
    log("EnforcerAmmoPickupAmount: " @ EnforcerAmmoPickupAmount);
    log("BioRifleWeaponPickupAmmoAmount: " @ BioRifleWeaponPickupAmmoAmount);
    log("BioRifleAmmoPickupAmount: " @ BioRifleAmmoPickupAmount);
    log("BioRifleMaxAmmoAmount: " @ BioRifleMaxAmmoAmount);
    log("ShockWeaponPickupAmmoAmount: " @ ShockWeaponPickupAmmoAmount);
    log("ShockAmmoPickupAmount: " @ ShockAmmoPickupAmount);
    log("ShockMaxAmmoAmount: " @ ShockMaxAmmoAmount);
    log("PulseWeaponPickupAmmoAmount: " @ PulseWeaponPickupAmmoAmount);
    log("PulseAmmoPickupAmount: " @ PulseAmmoPickupAmount);
    log("PulseMaxAmmoAmount: " @ PulseMaxAmmoAmount);
    log("MinigunAmmoPickupAmount: " @ MinigunAmmoPickupAmount);
    log("MinigunWeaponPickupAmmoAmount: " @ MinigunWeaponPickupAmmoAmount);
    log("MinigunEnforcerMaxAmmoAmount: " @ MinigunEnforcerMaxAmmoAmount);
    log("RipperWeaponPickupAmmoAmount: " @ RipperWeaponPickupAmmoAmount);
    log("RipperAmmoPickupAmount: " @ RipperAmmoPickupAmount);
    log("RipperMaxAmmoAmount: " @ RipperMaxAmmoAmount);
    log("FlakWeaponPickupAmmoAmount: " @ FlakWeaponPickupAmmoAmount);
    log("FlakAmmoPickupAmount: " @ FlakAmmoPickupAmount);
    log("FlakMaxAmmoAmount: " @ FlakMaxAmmoAmount);
    log("RocketLauncherWeaponPickupAmmoAmount: " @ RocketLauncherWeaponPickupAmmoAmount);
    log("RocketLauncherAmmoPickupAmount: " @ RocketLauncherAmmoPickupAmount);
    log("RocketLauncherMaxAmmoAmount: " @ RocketLauncherMaxAmmoAmount);
    log("SniperWeaponPickupAmmoAmount: " @ SniperWeaponPickupAmmoAmount);
    log("SniperAmmoPickupAmount: " @ SniperAmmoPickupAmount);
    log("SniperMaxAmmoAmount: " @ SniperMaxAmmoAmount);
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
    local Weapon WeaponPickup;
    local Ammo AmmoPickup;

    // Enforcer
    if (Other.IsA('Enforcer'))
    {
        WeaponPickup = Weapon(Other);
        WeaponPickup.PickupAmmoCount = EnforcerWeaponPickupAmount;
        return false;
    }
    else if (Other.IsA('EClip')) {
        AmmoPickup = Ammo(Other);
        AmmoPickup.MaxAmmo = MinigunEnforcerMaxAmmoAmount;
        AmmoPickup.AmmoAmount = EnforcerAmmoPickupAmount;
        return false;
    }

    // minigun
    else if (Other.IsA('Minigun2'))
    {
        WeaponPickup = Weapon(Other);
        WeaponPickup.PickupAmmoCount = MinigunWeaponPickupAmmoAmount;
        return false;
    }
    else if (Other.IsA('MiniAmmo'))
    {
        AmmoPickup = Ammo(Other);
        AmmoPickup.MaxAmmo = MinigunEnforcerMaxAmmoAmount;
        AmmoPickup.AmmoAmount = MinigunAmmoPickupAmount;
        return false;
    }

    // bio
   else if (Other.IsA('UT_BioRifle'))
   {
        WeaponPickup = Weapon(Other);
        WeaponPickup.PickupAmmoCount = BioRifleWeaponPickupAmmoAmount;
        return false;
    }
    else if (Other.IsA('BioAmmo'))
    {
        AmmoPickup = Ammo(Other);
        AmmoPickup.MaxAmmo = BioRifleMaxAmmoAmount;
        AmmoPickup.AmmoAmount = BioRifleAmmoPickupAmount;
        return false;
    }

    // shock
    else if (Other.IsA('ShockRifle'))
    {
        WeaponPickup = Weapon(Other);
        WeaponPickup.PickupAmmoCount = ShockWeaponPickupAmmoAmount;
        return false;
    }
    else if (Other.IsA('ShockCore'))
    {
        AmmoPickup = Ammo(Other);
        AmmoPickup.MaxAmmo = ShockMaxAmmoAmount;
        AmmoPickup.AmmoAmount = ShockAmmoPickupAmount;
        return false;
    }

    // pulse
    else if (Other.IsA('PulseGun'))
    {
        WeaponPickup = Weapon(Other);
        WeaponPickup.PickupAmmoCount = PulseWeaponPickupAmmoAmount;
        return false;
    }
    else if (Other.IsA('PAmmo'))
    {
        AmmoPickup = Ammo(Other);
        AmmoPickup.MaxAmmo = PulseMaxAmmoAmount;
        AmmoPickup.AmmoAmount = PulseAmmoPickupAmount;
        return false;
    }

    // ripper
    else if (Other.IsA('Ripper'))
    {
        WeaponPickup = Weapon(Other);
        WeaponPickup.PickupAmmoCount = RipperWeaponPickupAmmoAmount;
        return false;
    }
    else if (Other.IsA('BladeHopper'))
    {
        AmmoPickup = Ammo(Other);
        AmmoPickup.MaxAmmo = RipperMaxAmmoAmount;
        AmmoPickup.AmmoAmount = RipperMaxAmmoAmount;
        return false;
    }

    // Flak
    else if (Other.IsA('UT_FlakCannon'))
    {
        WeaponPickup = Weapon(Other);
        WeaponPickup.PickupAmmoCount = FlakWeaponPickupAmmoAmount;
        return false;
    }
    else if (Other.IsA('FlakAmmo'))
    {
        AmmoPickup = Ammo(Other);
        AmmoPickup.MaxAmmo = FlakMaxAmmoAmount;
        AmmoPickup.AmmoAmount = FlakAmmoPickupAmount;
        return false;
    }

    // Rockets
    else if (Other.IsA('UT_Eightball'))
    {
        WeaponPickup = Weapon(Other);
        WeaponPickup.PickupAmmoCount = RocketLauncherWeaponPickupAmmoAmount;
        return false;
    }
    else if (Other.IsA('RocketPack'))
    {
        AmmoPickup = Ammo(Other);
        AmmoPickup.MaxAmmo = RocketLauncherMaxAmmoAmount;
        AmmoPickup.AmmoAmount = RocketLauncherAmmoPickupAmount;
        return false;
    }

    // Sniper
    else if (Other.IsA('SniperRifle'))
    {
        WeaponPickup = Weapon(Other);
        WeaponPickup.PickupAmmoCount = SniperWeaponPickupAmmoAmount;
        return false;
    }
    else if (Other.IsA('BulletBox'))
    {
        AmmoPickup = Ammo(Other);
        AmmoPickup.MaxAmmo = SniperMaxAmmoAmount;
        AmmoPickup.AmmoAmount = SniperAmmoPickupAmount;
        return false;
    }

    return Super.CheckReplacement(Other, bSuperRelevant);
}

defaultproperties
{
  EnforcerWeaponPickupAmount=30
  EnforcerAmmoPickupAmount=20



  BioRifleWeaponPickupAmmoAmount=25
  BioRifleAmmoPickupAmount=25
  BioRifleMaxAmmoAmount=100



  ShockWeaponPickupAmmoAmount=20
  ShockAmmoPickupAmount=10
  ShockMaxAmmoAmount=50



  PulseWeaponPickupAmmoAmount=60
  PulseAmmoPickupAmount=25
  PulseMaxAmmoAmount=199



  MinigunAmmoPickupAmount=50
  MinigunWeaponPickupAmmoAmount=50

  MinigunEnforcerMaxAmmoAmount=199



  RipperWeaponPickupAmmoAmount=15
  RipperAmmoPickupAmount=25
  RipperMaxAmmoAmount=75



  FlakWeaponPickupAmmoAmount=10
  FlakAmmoPickupAmount=10
  FlakMaxAmmoAmount=50



  RocketLauncherWeaponPickupAmmoAmount=6
  RocketLauncherAmmoPickupAmount=12
  RocketLauncherMaxAmmoAmount=48



  SniperWeaponPickupAmmoAmount=8
  SniperAmmoPickupAmount=10
  SniperMaxAmmoAmount=50
}
