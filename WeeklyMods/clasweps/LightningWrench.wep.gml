#define init
global.sprite = sprite_add_weapon("lightningwrench.png",2,4);

#define weapon_name
return "Lightning Wrench";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 0;

#define weapon_auto
return false;



#define weapon_melee
return true;

#define weapon_load
return 25;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 7;

#define weapon_text
return "Zappy";

#define weapon_fire
{
  if instance_exists(self)
  {
    weapon_post(0, -5, 5);
sound_play_pitchvol(sndWrench,0.9,0.5);
sound_play_pitchvol(sndLightningHammer,1.5,1);
    with instance_create(x + lengthdir_x(skill_get(13)* 12, gunangle),y + lengthdir_y(skill_get(13)* 12, gunangle),CustomSlash)
    {
    sprite_index = sprLightningSlash;
    mask_index = mskSlash;
image_speed = 0.4;
      direction = other.gunangle
    speed = 1.5 * (skill_get(13) + 1);
      image_angle = direction;
      damage=8;
      team = other.team;
      creator = other;
      lightningcharge=1+(skill_get(17));
  on_hit = script_ref_create(lwrenchhit);
    }
wepangle = -wepangle;
motion_add(gunangle, 3.5);
}
}

#define lwrenchhit
if other.nexthurt <= current_frame{
projectile_hit(other,damage,force);
if (lightningcharge>0){
lightningcharge-=1;
with instance_create(x,y,Lightning)
{
  move_contact_solid(other.direction, 10);
  alarm0 = 1;
  ammo = 7;
  image_angle = other.direction + (random_range(-10, 10));
  damage= 7;
  team = other.team;
  creator = other
  with instance_create(x,y,LightningSpawn){
 image_angle = other.image_angle;
damage=other.damage;
	}
    }
}
}