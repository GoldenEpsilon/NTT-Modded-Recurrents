#define init
global.sprite = sprite_add_weapon("GatlingSplinter.png",2,3);
#define weapon_name
return "GATLING SPLINTER GUN";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 3;

#define weapon_auto
return 1;

#define weapon_load
return 4;

#define weapon_cost
return 1;


#define weapon_swap
return sndSwapBow;

#define weapon_area
return 12;

#define weapon_text
return "UNENDING PAIN";

#define weapon_fire
if instance_exists(self){
  with instance_create(x,y,Splinter)
  {
    direction = other.gunangle + (random_range(-6, 6) * other.accuracy);
    speed = 15;
    image_angle = direction;
    team = other.team;
  }
repeat(2){
weapon_post(2, -3, 3);
sound_play(sndSplinterPistol);
  with instance_create(x,y,Splinter)
  {
    direction = other.gunangle + (random_range(-6, 6) * other.accuracy);
    speed = 15 + random_range(-1,1);
    image_angle = direction;
    team = other.team;
  }
wait(2)
}
}