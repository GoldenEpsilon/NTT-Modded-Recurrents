#define init
global.sprite = sprite_add_weapon("UltraFlameThrower.png",2,9);
global.sprflame = sprite_add("ultraflame.png",7,8,8);

#define weapon_name
return "ULTRA FLAMETHROWER";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return 1;

#define weapon_load
return 15;

#define weapon_cost
return 3;

#define weapon_rads
return 20;

#define weapon_swap
return sndSwapDragon;

#define weapon_area
return 36;

#define weapon_text
return "@qBURN TO THE GROUND";

#define weapon_fire
sound_play_pitchvol(sndDragonLoop,0.7,1.5);
sound_play_pitchvol(sndDragonLoop,1.5,0.7);
repeat(15){
  if instance_exists(self){
  {
weapon_post(4,-1,1);
repeat(13){
    with instance_create(x,y,Flame)
    {
move_contact_solid(other.gunangle, 6);
      direction = other.gunangle + (random_range(-15,15) * other.accuracy);
      speed=12;
      damage=12;
	sprite_index = global.sprflame;
      image_angle = direction;
      team = other.team;
      creator = other;
    }
}
wait(1)
}
}
}
audio_stop_sound(sndDragonLoop);