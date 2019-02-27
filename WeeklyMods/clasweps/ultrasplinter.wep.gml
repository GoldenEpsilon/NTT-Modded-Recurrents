#define init
global.sprite = sprite_add_weapon("UltraSplinter.png",2,5);
global.sprsplinter = sprite_add("UltraSplinterPro.png",3,0,3);
#define weapon_name
return "ULTRA SPLINTER GUN";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 3;

#define weapon_auto
return 0;

#define weapon_load
return 12;

#define weapon_cost
return 6;

#define weapon_rads
return 12;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 28;

#define weapon_text
return "@gULTRA @sOUCHIES";

#define weapon_fire
repeat(7){
splindir = random_range(-8,8)
weapon_post(4, -3, 3);
sound_play(sndSuperSplinterGun);
for(i = -3; i <= 3; i += 3)
{
  with instance_create(x,y,Splinter)
  {
    direction = other.gunangle + (other.splindir + other.i + random_range(-2, 2) * other.accuracy);
    speed = 20;
    image_angle = direction;
    team = other.team;
    sprite_index = global.sprsplinter;
}
}
wait(1)
}