#define init
global.sprite = sprite_add_weapon("orbitalstriker.png",2,6);
global.sprstrike = sprite_add("Strikemarker.png",1,9.5,9.5)

#define weapon_name
return "ORBITAL STRIKER";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_load
return 60;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 13;

#define weapon_text
return "Launch @wORBITAL STRIKE";

#define weapon_fire
weapon_post(2,0,0);
sound_play(sndSniperTarget);
  if instance_exists(self)
  {
    with instance_create(mouse_x[index],mouse_y[index],CustomProjectile)
    {
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
      speed = 0;
      team = other.team;
      sprite_index = global.sprstrike;
      creator = other;
alarm1 = 30;
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
sound_play_pitchvol(sndIDPDNadeExplo,0.7,1);
for(i = random(90); i <= 330; i += 120){
	with instance_create(x+lengthdir_x(30,direction+i),y+lengthdir_y(30,direction+i),Explosion){
	sprite_index = sprRogueExplosion;
	hitid = [sprite_index,"ORBITAL STRIKE"];
	//team = other.team;
}
}

#define nothinglul
//filler so it just doesn't get destroyed on touching stuff