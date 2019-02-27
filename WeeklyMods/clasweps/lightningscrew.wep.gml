#define init
global.sprite = sprite_add_weapon("lightningscrewdriver.png",2,5);
global.sprshank = sprite_add("lightningshank.png",2,0,8)

#define weapon_name
return "Lightning Screwdriver";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 0;

#define weapon_auto
return false;



#define weapon_melee
return true;

#define weapon_load
return 15;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapSword;

#define weapon_area
return 8;

#define weapon_text
return "Zippy";

#define weapon_fire
{
  if instance_exists(self)
  {
    weapon_post(0, -5, 5);
sound_play_pitchvol(sndLightningHammer,3,1);
    with instance_create(x + lengthdir_x(skill_get(13)* 12, gunangle),y + lengthdir_y(skill_get(13)* 12, gunangle),CustomSlash)
    {
    sprite_index = global.sprshank;
image_speed = 0.4;
      direction = other.gunangle
    speed = 1.5 * (skill_get(13) + 2);
      image_angle = direction;
      damage=8;
      candeflect=false;
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
  ammo = 4;
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