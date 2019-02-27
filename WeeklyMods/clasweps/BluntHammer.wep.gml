#define init
global.sprite = sprite_add_weapon("Blunthammer.png",3,9);

#define weapon_name
return "BLUNT HAMMER";

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
return 8;

#define weapon_text
return "AREA OF EFFECT";

#define weapon_fire
weapon_post(10,-5,5);
sound_play_pitchvol(sndShovel,0.7,1)
sound_play_pitchvol(sndHammer,1.1,0.7)
    with instance_create(x + lengthdir_x(skill_get(13)* 10, gunangle),y + lengthdir_y(skill_get(13)* 10, gunangle),Slash)
    {
      direction = other.gunangle
      image_angle = direction;
    damage = 15;
    image_xscale = 1;
    image_yscale = 1;
    speed = 1.0 * (skill_get(13) + 2);
      creator = other;
    team=other.team;
    }
wepangle = -wepangle;
motion_add(gunangle, 3.5);
for(var i = -120; i <= 120; i += 40)
{
    with instance_create(x + lengthdir_x(7 + (skill_get(13)* 10), gunangle+i),y + lengthdir_y(7 + (skill_get(13)* 10), gunangle+i),Slash)
    {
      direction = other.gunangle + (i * other.accuracy);
      image_angle = direction;
    damage = 6;
    image_xscale = 0.4;
    image_yscale = 0.4;
    speed = 1.0 * (skill_get(13) + 2);
      creator = other;
    team=other.team;
    }
}
