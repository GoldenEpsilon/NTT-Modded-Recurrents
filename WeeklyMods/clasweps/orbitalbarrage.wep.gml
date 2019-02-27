#define init
global.sprite = sprite_add_weapon("orbitalbarrage.png",2,6);
global.sprstrike = sprite_add("barragemarker.png",1,10.5,10.5)

#define weapon_name
return "ORBITAL BARRAGE";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_load
return 40;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 18;

#define weapon_text
return "Hell From Above";

#define weapon_fire
weapon_post(3,0,0);
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
alarm1 = 20;
image_alpha = 0.5;
      	on_step = script_ref_create(strikestep);
  on_destroy = script_ref_create(strikedestroy);
	on_wall = script_ref_create(nothinglul);
	on_hit = script_ref_create(nothinglul);
    }
}

#define strikestep
alarm1-=1;
if(alarm1 = 0)
{
image_alpha=0.1;
repeat(10){
sound_play_pitchvol(sndIDPDNadeExplo,1.2,1);
	with instance_create(x+lengthdir_x(random_range(10,50),random(360)),y+lengthdir_y(random_range(10,50),random(360)),Explosion){
	sprite_index = sprRogueExplosion;
	image_xscale=0.7;
	image_yscale=0.7;
        image_blend = c_red;
	hitid = [sprite_index,"ORBITAL STRIKE"];
	//team = other.team;
}
wait(2);
}
	instance_destroy();
}

#define strikedestroy

#define nothinglul
//filler so it just doesn't get destroyed on touching stuff