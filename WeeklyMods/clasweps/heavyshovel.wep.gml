#define init
global.sprite = sprite_add_weapon("heavy shovel.png",4,7);

#define weapon_name
return "BIG SHOVEL";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 0;

#define weapon_auto
return false;



#define weapon_melee
 
return true;

#define weapon_load
return 47;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 10;

#define weapon_text
return "Smeck.";

#define weapon_fire
weapon_post(10,-5,5);
sound_play(sndShovel);
for(var i = -90; i <= 90; i += 30)
{
    with instance_create(x,y,Slash)
    {
      direction = other.gunangle + (i * other.accuracy);
      image_angle = direction;
    damage = 30;
    speed = 1.15 * (skill_get(13) + 2);
      creator = other;
    team=other.team;
    }
}
wepangle = -wepangle;
motion_add(gunangle, 3.5);
