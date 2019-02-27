#define init
global.sprite = sprite_add_weapon("BloodExplosionGun.png",3,4);

#define weapon_name
return "Blood Explosion Gun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 40;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 10;

#define weapon_text
return "Pure Blood";

#define weapon_fire
if infammo = 0{
	
if ammo[weapon_get_type(argument0)] - 2 < 0{

ammo[weapon_get_type(argument0)] = 0;

sprite_index = spr_hurt;

image_index = 0;

my_health --;
	
sound_play(sndBloodHurt);

lasthit = [global.sprite,"Blood Explosion#Gun"]
	
sound_play(snd_hurt);
}else
{

ammo[weapon_get_type(argument0)] -= 2}

}
weapon_post(9,-9,15);
sound_play_pitchvol(sndBloodLauncherExplo,0.9,2);
for(i = 20; i < 300; i += 30)
{
	with instance_create(x+lengthdir_x(other.i,other.gunangle+random_range(3,-3)),y+lengthdir_y(other.i,other.gunangle+random_range(3,-3)),MeatExplosion)
	{
		creator = other;
	}
}
motion_add(gunangle,-7);