#define init
global.sprite = sprite_add_weapon("Energy Shovel.png",4,5);

#define weapon_name
return "ENERGY SHOVEL";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return false;



#define weapon_melee
 
return true;

#define weapon_load
return 22;

#define weapon_cost
return 4;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 12;

#define weapon_text
return "ZWANG!";

#define weapon_fire
weapon_post(10,-5,5);
sound_play_pitchvol(sndShovel,1.3,0.9)
sound_play_pitchvol(sndEnergyHammer,1.2,0.8)
for(var i = -60; i <= 60; i += 60)
{
    with instance_create(x + lengthdir_x(skill_get(13)* 12, gunangle + i),y + lengthdir_y(skill_get(13)* 12, gunangle + i),EnergySlash)
    {
      direction = other.gunangle + (i * other.accuracy);
      image_angle = direction;
    damage = 30 + (skill_get(13) * 30);
    speed = 1 * (skill_get(13) + 2);
      creator = other;
    team=other.team;
    }
}
wepangle = -wepangle;
motion_add(gunangle, 5);
