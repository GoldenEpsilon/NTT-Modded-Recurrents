#define init
global.sprite = sprite_add_weapon("DogHead.png",3,8);

#define weapon_name
return "Big Dog Head";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 60;

#define weapon_cost
return 4;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 11;

#define weapon_text
return "Gilotine";

#define weapon_fire
sound_play_pitchvol(sndFlakCannon,1.1,0.5);
sound_play_pitchvol(sndBigDogMissile,1.1,0.7);
weapon_post(8, -8, 16);
with instance_create(x + lengthdir_x(10,gunangle),y + lengthdir_y(10,gunangle),CustomProjectile)
{
  sprite_index = sprSuperFlakBullet;
  mask_index = mskSuperFlakBullet;
  speed = 3;
  friction = 0.03;
  direction = other.gunangle + (random_range(-6, 6) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  damage = 12;
  force = 12;
  typ = 1;
  spin = random_range(-3,-9);
  bnceprce = 1;
  alarm0 = 4;
  on_wall = script_ref_create(flakwall);
  on_hit = script_ref_create(flakhit);
  on_destroy = script_ref_create(flakdestroy);
  on_step = script_ref_create(flakstep);
}
motion_add(gunangle,-8);

#define flakstep
if irandom(1) = 1{
with instance_create(x+random_range(-4,4),y+random_range(-4,4),Smoke)
{
image_xscale = .3;
image_yscale = .3;
depth -= 2
  }
}
if alarm0 > 0{
alarm0 -= 1
}else{
spin += 9
if instance_exists(self){
with instance_create(x,y,AllyBullet)
{
  direction = other.spin;
      image_angle = direction;  
speed=5;
damage=3;
sound_play_pitchvol(sndEnemyFire,1.3,0.7);
team = other.team;
creator = other;
    }
with instance_create(x,y,AllyBullet)
{
  direction = other.spin + 120;
      image_angle = direction;  
speed=4;
damage=2;
sound_play(sndEnemyFire);
team = other.team;
creator = other;
    }
with instance_create(x,y,AllyBullet)
{
  direction = other.spin + 240;
      image_angle = direction;  
speed=4;
damage=2;
sound_play(sndEnemyFire);
team = other.team;
creator = other;
    }
alarm0 = 4
  }
}
if speed <= 0 instance_destroy();

#define flakwall
if bnceprce > 0{
move_bounce_solid(false);
bnceprce -= 1
}else{
instance_destroy()
}

#define flakhit
projectile_hit(other,damage,force);
if bnceprce > 0{
bnceprce -= 1
}else{
speed=0
}

#define flakdestroy
sound_play_pitchvol(sndFlakExplode,1.5,0.5);
sound_play_pitchvol(sndEnemyFire,0.8,1);
for (i = 0; i < 360; i += 40)
{
with instance_create(x,y,AllyBullet)
{
  direction = other.i + (random_range(-6, 6));
      image_angle = direction;  
speed=6
team = other.team;
creator = other;
}
}