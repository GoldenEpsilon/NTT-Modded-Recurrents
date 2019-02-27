#define init
global.sprite = sprite_add_weapon("Battleshovel.png",4,4);

#define weapon_name
return "BATTLE SHOVEL";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 0;

#define weapon_auto
return false;



#define weapon_melee
 
return true;

#define weapon_load
return 22;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 10;

#define weapon_text
return "MADE FOR COMBAT";

#define weapon_fire
weapon_post(10,-5,5);
sound_play_pitchvol(sndShovel,1.1,1)
sound_play_pitchvol(sndWrench,1.1,0.7)
for(var i = -60; i <= 60; i += 60)
{
    with instance_create(x + lengthdir_x(skill_get(13)* 10, gunangle+i),y + lengthdir_y(skill_get(13)* 10, gunangle+i),Slash)
    {
      direction = other.gunangle + (i * other.accuracy);
      image_angle = direction;
    damage = 8;
    image_xscale = 0.8;
    image_yscale = 0.8;
    speed = 1.0 * (skill_get(13) + 2);
      creator = other;
    team=other.team;
    }
}
wepangle = -wepangle;
motion_add(gunangle, 3.5);
