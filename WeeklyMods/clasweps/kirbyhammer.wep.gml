#define init
global.sprite = sprite_add_weapon("KirbyHammer.png",0,11);

#define weapon_name
return "KING'S HAMMER";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 0;

#define weapon_auto
return false;



#define weapon_melee
 
return true;

#define weapon_load
return 40;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 15;

#define weapon_text
return "WARRIOR OF THE STARS";

#define weapon_fire
weapon_post(10,-5,5);
sound_play_pitchvol(sndShovel,0.8,0.9)
sound_play_pitchvol(sndHammer,0.7,0.9)
for(var i = -60; i <= 60; i += 60)
{
    with instance_create(x + lengthdir_x(skill_get(13)* 12, gunangle),y + lengthdir_y(skill_get(13)* 12, gunangle),Slash)
    {
sprite_index = sprHeavySlash;
      direction = other.gunangle + (i * other.accuracy);
      image_angle = direction;
    damage = 30;
    speed = 1.0 * (skill_get(13) + 2);
      creator = other;
    team=other.team;
    }
}
wepangle = -wepangle;
motion_add(gunangle, 4);
