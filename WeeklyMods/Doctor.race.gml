 // When mod is first loaded
#define init

 // Define sprites using existing Big Bandit sprites
global.spr_idle = sprRavenIdle;
global.spr_walk = sprRavenWalk;
global.spr_hurt = sprRavenHurt; // Hurt Sprite Must Always Be At Least 3+ Frames
global.spr_dead = sprRavenDead;
global.spr_port = sprRavenLift;
global.spr_icon = sprRavenFly;
global.spr_slct = sprRavenIdle;
global.spr_sit1 = sprRavenDead;
global.spr_sit2 = sprRavenDead;
global.spr_ult[1] = sprHealthChest;
global.spr_ult[2] = sprToxicBarrel;
global.spr_heal = sprMutant9Idle

 // Set ultra variables
global.ultra[1] = 0;
global.ultra[2] = 0;
global.stealth = 0

 // When Player is first created:
#define create

global.ultra[1] = 0
global.ultra[2] = 0
global.stealth = 0

 // Set Player Sprites:
	spr_idle = global.spr_idle; // Idle
	spr_walk = global.spr_walk; // Walk
	spr_hurt = global.spr_hurt; // Hurt
	spr_dead = global.spr_dead; // Dead
  spr_sit1 = global.spr_sit1; // Sit
  spr_sit2 = global.spr_sit2; // Sit2

 // Set Sounds:
//snd_wrld = sndJungleAssassinWake; // LET'S DO THIS
//snd_hurt = sndAssassinHit; // THE WIND HURTS
//snd_lowa = sndAssassinGetUp; // ALWAYS KEEP ONE EYE ON YOUR AMMO
//snd_lowh = sndAssassinGetUp; // THIS ISN'T GOING TO END WELL
//snd_valt = sndAssassinPretend; // AWWW YES
//snd_crwn = sndAssassinPretend; // CROWNS ARE LOYAL
//snd_spch = sndAssassinAttack; // YOU REACHED THE NUCLEAR THRONE
//snd_idpd = sndAssassinGetUp; // BEYOND THE PORTAL
//snd_cptn = sndAssassinAttack; // THE STRUGGLE IS OVER
//snd_dead = sndAssassinDie; // EVERYTHING HURTS
//snd_chst = sndAssassinGetUp; // SO MANY CHESTS
 //You Can Do Something Like This Instead If You Want To Use An Existing Character's Sounds:
#define race_soundbank
return 9;

// Starting Weapon : 1 = Revolver
#define swep
return 1;



 // Do This Stuff Every Frame:
#define step

 // Passive: Fewer rads, more hp drops
with(enemy)
{
  if "doc" not in self
  {
    doc = 1
    raddrop -= 1
  }
}

with(HPPickup)
{
  if "doc" not in self
  {
    doc = 1
    with instance_create(x,y,HPPickup)
    {
      doc = 1
    }
  }
}

 // Active : Injection
if button_pressed(index,"spec") // When Right Click is Pressed:
{
  if global.ultra[1] = 1
  {
    if GameCont.rad >= 50
    {
      sprite_index = global.spr_heal
      sound_play(sndHealthChest)
      GameCont.rad -= (20 * (skill_get(5) + 1))
      my_health += ((skill_get(5) * 2) + 1)
      if my_health > maxhealth my_health = maxhealth
    }
  }
  if global.ultra[1] = 0
  {
    sprite_index = spr_hurt
    image_index = 0
    my_health -= (skill_get(5) + 1)
    sound_play(snd_hurt)
    GameCont.rad += (20 * (skill_get(5) + 1) + (skill_get(5) * 5))
  }
  if global.ultra[2] = 1
  {
    repeat(irandom(20) + 10 * (skill_get(5) + 1))
    {
      with instance_create(x,y,ToxicGas)
      {
        team = other.team
        motion_add(random(360),random(6))
      }
    }
  }
}

 // Set Portrait:
#define race_portrait
return global.spr_port;

 // Set Map Icon:
#define race_mapicon
return global.spr_icon;

 // Set Character Selection Icon:
#define race_menu_button
sprite_index = global.spr_slct;

 // Name:
#define race_name
return "DOCTOR";

 // Selection Description:
#define race_text
return "FEWER @gRADS#@wMORE @rHP @wPICKUPS#@gRADIATION @wINJECTION";

 // Character Has 1 Skins:
#define race_skins
return 1;

 // Thronebutt Description:
#define race_tb_text
return "STRONG INJECTION";

 // Ultra Portraits
#define race_ultra_button
sprite_index = global.spr_ult[argument0];
// Add More Ultra Icon "global.spr_ult[#]" Sprites For More Ultras

 // Ultra Names:
#define race_ultra_name
switch(argument0){
	case 1: return "HEALER"; // Ultra A
	case 2: return "PLAGUE"; // Ultra B
	// Add More Cases For More Ultras
	default: return "";
}

 // Ultra Descriptions:
#define race_ultra_text
switch (argument0){
	case 1: return "REVERSED @wINJECTIONS"; // Ultra A
	case 2: return "CREATE TOXIC ON INJECTION"; // Ultra B
	// Add More Cases For More Ultras
	default: return "";
}


 // When Player Takes An Ultra:
#define race_ultra_take
global.ultra[argument0] = 1; // Confirm Which Ultra Was Taken
if(global.ultra[1] = 1) sound_play(sndHealthChest);
 // Ultra B
if global.ultra[2] = 1 sound_play(sndRavenLift);

sound_play(sndBasicUltra);


 // Loading Screen Tips:
#define race_ttip
return["BIG NEEDLE", "OUCH", "TRADITIONAL REMEDIES", "SUPERSTITION", "BIRD MASK", "PLAGUE DOCTOR"];
