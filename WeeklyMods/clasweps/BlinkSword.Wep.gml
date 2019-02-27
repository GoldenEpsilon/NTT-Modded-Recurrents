#define init
global.sprite = sprite_add_weapon("BlinkSword.png",2,4);

#define weapon_name
return "Blink Sword";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 0;

#define weapon_auto
return false;



#define weapon_melee
return true;

#define weapon_load
return 16;

#define weapon_swap
return sndSwapSword;

#define weapon_area
return 8;

#define weapon_text
return "*Teleports Behind You";

#define weapon_fire
  if instance_exists(self)
  {
		_x = x + lengthdir_x(30, other.gunangle);
		_y = y + lengthdir_y(30, other.gunangle);
if(!collision_line(x,y,_x,_y,Wall,0,0)){
 // Find Non-Walled Space:
		x = _x;
		y = _y;
}
    weapon_post(0, -5, 5);
sound_play_pitchvol(sndChickenSword,1.05,1);
sound_play_pitchvol(sndDevastator,1.6,0.7);
    with instance_create(x + lengthdir_x(skill_get(13)* 12, gunangle),y + lengthdir_y(skill_get(13)* 12, gunangle),Slash)
    {
      direction = other.gunangle + (4 * other.accuracy);
    speed = 2 * (skill_get(13) + 2);
      image_angle = direction;
      image_xscale = 1
      image_yscale = 1
      damage=13
      team = other.team;
      creator = other;
}
wepangle = -wepangle;
motion_add(gunangle, 5);
}