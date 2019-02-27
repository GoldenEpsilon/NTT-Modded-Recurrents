#define init
global.sprite = sprite_add_weapon("HeavyStriker.png",2,6);
global.sprstrike = sprite_add("Heavystrikemarker.png",1,10.5,10.5)

#define weapon_name
return "HEAVY ORBITAL STRIKE";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_load
return 90;

#define weapon_cost
return 6;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 19;

#define weapon_text
return "SUPER STRIKE";

#define weapon_fire
weapon_post(4,0,0);
sound_play_pitchvol(sndSniperTarget,0.7,1.5);
  if instance_exists(self)
  {
    with instance_create(mouse_x,mouse_y,CustomProjectile)
    {
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
      speed = 0;
      team = other.team;
      sprite_index = global.sprstrike;
      creator = other;
alarm1 = 60;
image_alpha = 0.5;
      	on_step = script_ref_create(strikestep);
  on_destroy = script_ref_create(strikedestroy);
	on_wall = script_ref_create(nothinglul);
	on_hit = script_ref_create(nothinglul);
    }
}

#define strikestep
alarm1-=1;
if(alarm1 <= 0)
{
	instance_destroy();
}

#define strikedestroy
sound_play_pitchvol(sndIDPDNadeExplo,0.5,1.5);
for(i = random(45); i <= 315; i += 45){
	with instance_create(x+lengthdir_x(10,i),y+lengthdir_y(10,i),Explosion){
	sprite_index = sprRogueExplosion;
	hitid = [sprite_index,"ORBITAL STRIKE"];
	image_blend = make_colour_rgb(50, 255, 50);
	//team = other.team;
}
}

#define nothinglul
//filler so it just doesn't get destroyed on touching stuff