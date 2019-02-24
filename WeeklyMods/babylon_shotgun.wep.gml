#define init
global.sprBabylonShotgun = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAACEAAAAUCAYAAAADU1RxAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMjHxIGmVAAABf0lEQVRIS7WTMU7DUBBEfR0aCk5AQ8E1kJAoOAE1FQegzFWN3+JnJj/fPxaISOO/f3Z2dqI40zzP0/LhcQF6R9DOgVFvwfm8wqfnlw33D48F+Ne39wlQj+BMzo54Ufs/Pk9LfR7i5vZug+LsgzRGB5da53v8RSBDJDQQuTCRGhYk9Gr51FKXjhDAn0XksjRJ2G/1cj0+Q2w6A2QIv533I8A0a5f2eE7r6rUhFADuCAmkqZArk3Uua3U9ntO6evlOtMu4t4NpwIlGXULPlk8v6tIZArI1OxKCM3XyGSL53AF3OETLJ4eR9d7i5NHao66eISQV5L3l2561y67xhDFo9UbvRA4mn5yz1BfmHT69qEtHiPx30BDtvYcyWZcl9nhmsl513+K/AtOsDbnHRwCw/1ImN6rx6HE9HhDGcOsv8JNQcQ7kfa8GGo6ABm03hNAYyOVArzaE92tQD/CpEDzWNGfiTbCcoxocDZIBwObFQ9McUHAEaH+Lmt8zS/5/MU9fc8uDRzAKa94AAAAASUVORK5CYII=",11,8);
global.sprFatShell    = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAYAAAAKCAIAAAAYbLhkAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAALEQAACxEBf2RfkQAAAAd0SU1FB+IFAQIHLncXt1oAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMjHxIGmVAAAAMUlEQVQYV2PADqYxiDxnYAAiIIMGQn1hsse6tIAIyIAKWUmxAjlABGRAhbCoQgEMDAD7EhxLK6Gc+gAAAABJRU5ErkJggg==",0,4,5);
global.sprFatShellUpg = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAcAAAANCAIAAADqq+PiAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAALEAAACxABrSO9dQAAAAd0SU1FB+IFAQIHLncXt1oAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMjHxIGmVAAAARUlEQVQoU2PACaYxiCAjhOhzBgYgIlu0gEEKIgpkABFCFKIKXRQZQUX7wmSPdWlBEJCNV9RTiQPIgSAgGyqKXS06YGAAAPAtLwAMz6VlAAAAAElFTkSuQmCC",0,4,7);

#define weapon_name
return "BABYLON SHOTGUN"

#define weapon_type
return 2;

#define weapon_cost
return 25;

#define weapon_area
return 100;

#define weapon_load
return 50;

#define weapon_swap
return sndSwapShotgun;

#define weapon_auto
return false;

#define weapon_melee
return false;

#define weapon_laser_sight
return false;

#define weapon_sprt
return global.sprBabylonShotgun;

#define weapon_text
return choose("A COLLOSEUM OF YOUR OWN","@wBIG","STRAIGHT FROM @r@qH@qE@qL@qL","TOWERING");

#define weapon_fire
sleep(20)

if "extraspeed" not in self{extraspeed = 7 + gunangle / 10000}else{extraspeed += 7 + gunangle / 10000} //knockback, adding variables to the player is a sin

var _pitch = random_range(.8,1.2);                //i dont really like sound_play_gun since this does the same
sound_play_pitch(sndSuperFlakExplode,.3*_pitch);
sound_play_pitch(sndFlakExplode,.4*_pitch);
sound_play_pitch(sndHeavySlugger,.7*_pitch);
sound_play_pitch(sndSuperFlakCannon,.6*_pitch);
sound_play_pitch(sndDoubleShotgun,.8*_pitch);

var _ammo = 6;                                    //amount of charges
var _i    = 12;                                   //charge offset units
var _I    = -_i * _ammo / 2 +_i/2                 //charge offset angle

with instance_create(x,y,HeavySlug) //kinda ulgy for a secondary pattern solution but  ¯\_(ツ)_/¯
{
  creator = other;
  team    = other.team;
  motion_add(other.gunangle + _I-_i/2+random_range(-4,4)*other.accuracy,12);
  image_angle = direction;
}
repeat(_ammo)
{
  weapon_post(25,-70,45);
  repeat(8)
  {
    with instance_create(x,y,Slug)
    {
      creator = other;
      team    = other.team;
      motion_add(other.gunangle + _I+random_range(-4,4)*other.accuracy,random_range(12,16));
      image_angle = direction;
    }
    with instance_create(x,y,Smoke)
    {
      motion_add(other.gunangle + _I + random_range(-4,4),random_range(2,6))
    }
  }
  sleep(30); //make stuff just a bit more epic
  with instance_create(x,y,HeavySlug)
  {
    creator = other;
    team    = other.team;
    motion_add(other.gunangle + _I+_i/2+random_range(-6,6)*other.accuracy,12);
    image_angle = direction;
  }
  _I += _i;
}

#define step
if "extraspeed" in self
{
  if extraspeed > 30{extraspeed = 20} //cap speed for safety reasons
	if extraspeed > 0
	{
    sleep(1)
    sound_play_gun(sndFootOrgSand4,999999999999999999999999999999999999999999999999,.00001)//mute action
		if irandom(2) != 0{instance_create(x,y,Dust)}
		canaim = false;
		with instance_create(x+lengthdir_x(extraspeed+20*skill_get(13),frac(extraspeed)*10000),y+lengthdir_y(extraspeed+20*skill_get(13),frac(extraspeed)*10000),Shank)
    {
			team = other.team;
      creator = other;
      damage = 20;
      sprite_index = mskNone;
      mask_index = sprHeavyNade;
      image_xscale = 4;
      image_yscale = 4;
			image_angle = other.gunangle;
		}
		motion_add(frac(extraspeed)*10000-180,extraspeed-frac(extraspeed));
		extraspeed -= current_time_scale;
	}
	else{extraspeed = 0;canaim = true}
}

#define weapon_reloaded
var _pitch = random_range(.8,1.2);
sound_play_pitchvol(sndCrossReload,.4*_pitch,.5);
sound_play_pitchvol(sndSwapPistol,.6*_pitch,.5);
sound_play_pitchvol(sndShotReload,.5*_pitch,.5);

repeat(6)
{
  with instance_create(x,y,Shell)
  {
    if skill_get(15) = true{sprite_index = global.sprFatShellUpg}else{sprite_index = global.sprFatShell};
    motion_add(other.right+90+random_range(-20,20),random_range(4,5));
  }
}
