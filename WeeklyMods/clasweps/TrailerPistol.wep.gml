#define init
global.sprite = sprite_add_weapon("TrailerPistol.png",0,4);

#define weapon_name
return "Trailer Pistol";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return 0;

#define weapon_load
return 25;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 9;

#define weapon_text
return "Explosion Line";

#define weapon_fire
weapon_post(6,-7,13);
sound_play_pitchvol(sndDevastatorExplo,1.7,0.9)
  if instance_exists(self)
  {
    with instance_create(x,y,CustomProjectile)
    {
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
      sprite_index = mskNone
      mask_index = mskEnemyBullet1
      speed = 9;
      damage = 6 + (skill_get(17) * 2);
      image_angle = direction;
      team = other.team;
      creator = other;
	alarm0 = 1
	boomsize = 0.7 + (skill_get(17) * 0.2);
  on_step = script_ref_create(TrailerStep);
  on_destroy = script_ref_create(TrailerDestroy);
    }
}

#define TrailerStep
if alarm0=0{
sound_play_pitchvol(sndPlasmaHit,1.2,0.7)
with instance_create(x,y,PlasmaImpact){
image_xscale = other.boomsize
image_yscale = other.boomsize
damage = 2 + skill_get(17)
}
alarm0=1
boomsize -= 0.03
}else{
alarm0-=1
}
if boomsize <= 0.2 instance_destroy()


#define TrailerDestroy
sound_play_pitchvol(sndPlasmaBigExplode,1.2,0.7)
with instance_create(x,y,PlasmaImpact){
image_xscale = 0.75
image_yscale = 0.75
}