#define init
global.sprite = sprite_add_weapon("TrailerGun.png",0,4);

#define weapon_name
return "Plasma Trailer";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return 0;

#define weapon_load
return 35;

#define weapon_cost
return 4;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 12;

#define weapon_text
return "Death's Wake";

#define weapon_fire
weapon_post(8,-7,13);
sound_play_pitchvol(sndDevastatorExplo,1.5,0.9)
  if instance_exists(self)
  {
    with instance_create(x,y,CustomProjectile)
    {
      direction = other.gunangle + (random_range(-2,2) * other.accuracy);
      sprite_index = mskNone
      mask_index = mskEnemyBullet1
      speed = 9;
      damage = 6 + (skill_get(17) * 3);
      image_angle = direction;
      team = other.team;
      creator = other;
	alarm0 = 0
	boomsize = 1 + (skill_get(17) * 0.1);
  on_step = script_ref_create(TrailerStep);
  on_destroy = script_ref_create(TrailerDestroy);
    }
motion_add(gunangle,-4)
}

#define TrailerStep
if alarm0 = 0{
sound_play_pitchvol(sndPlasmaHit,1.2,0.7)
with instance_create(x,y,PlasmaImpact){
image_xscale = other.boomsize
image_yscale = other.boomsize
damage = 2 + skill_get(17)
}
alarm0 = 1
boomsize -= 0.04
}else{
alarm0 -= 1
}
if boomsize <= 0.2 instance_destroy()


#define TrailerDestroy
sound_play_pitchvol(sndPlasmaBigExplode,1.2,0.7)
with instance_create(x,y,PlasmaImpact){
image_xscale = 1
image_yscale = 1
}