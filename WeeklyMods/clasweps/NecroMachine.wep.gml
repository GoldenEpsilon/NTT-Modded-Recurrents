#define init
global.sprite = sprite_add_weapon("NecroMachine.png",2,2);
global.area = sprite_add("NecroAllyArea.png",4,40,40);
global.rez = sprite_add("NecroAllyRez.png",8,24,24);

#define weapon_name
return "Necro-Machine";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return false;

#define weapon_load
return 100;

#define weapon_cost
return 9;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 32;

#define weapon_text
return choose("Grave Raiser","Zombie Ally @rHealth @sDepends#On The Enemy's @wSize");

#define weapon_fire
weapon_post(-3,-2,0);
if(skill_get(17)){
sound_play_pitch(sndPlasmaUpg,3);
}else{
sound_play_pitch(sndPlasma,3);
}
  if instance_exists(self)
  {
    with instance_create(mouse_x[index],mouse_y[index],CustomProjectile)
    {
      sprite_index = global.area;
      mask_index = mskReviveArea;
      team = other.team;
      image_speed = 0.4;
      creator = other;
      rezleft = 4 + (skill_get(17) * 2);
      rezmax = 4 + (skill_get(17) * 2);
      alarm1 = 30;
      	on_step = script_ref_create(rezstep);
	on_hit = script_ref_create(nothing);
	on_wall = script_ref_create(nothing);
	on_destroy = script_ref_create(rezrevive);
    }
}
#define rezstep	// count down until rez time
if alarm1 > 0{
alarm1 -= 1
}else{
instance_destroy()
}

#define rezrevive
    with(Corpse)
    {
      if place_meeting(x,y,other)
      {
	if(other.rezleft > 0){
        with instance_create(x,y,Ally){
	maxhealth = 1 + (other.size * 2)
	my_health = 1 + (other.size * 2)
	raddrop = 0;
	}
	with instance_create(x,y-15,ReviveFX){
	sprite_index = global.rez
	}
	sound_play_pitch(sndNecromancerRevive,1.5);
	with(other){
	rezleft -= 1
	}
        instance_destroy();
	}
      }
    }

if (rezleft = rezmax){
with(creator){
ammo[5] = min(ammo[5] + weapon_cost(), typ_amax[5])
	}
}
#define nothing	//Object doesn't get destroyed on contact
//nothing lul