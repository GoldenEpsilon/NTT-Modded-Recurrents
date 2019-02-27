#define init
global.sprite = sprite_add_weapon("KingBladeSword.png",4,4);
global.sprghost = sprite_add("KingBladeGhost.png",1,9,8);

#define weapon_name
return "King's Blade";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 0;

#define weapon_auto
return 0;

#define weapon_load
return 30;

#define weapon_swap
return sndSwapSword;

#define weapon_area
return 12;

#define weapon_text
return "HUNGRY SPIRIT";

#define weapon_fire
sound_play_pitchvol(sndChickenSword,1.2,1);
sound_play_pitchvol(sndBlackSword,1.4,0.6);
sound_play_pitchvol(sndChickenLoseHead,1.6,0.6);
sound_play_pitchvol(sndMutant9Hurt,1.6,0.6);
with instance_create(x + lengthdir_x(skill_get(13)* 12, gunangle),y + lengthdir_y(skill_get(13)* 12, gunangle),Slash)
    {
      direction = other.gunangle + (4 * other.accuracy);
      speed = 1 * (skill_get(13) + 2);
      image_angle = direction;
      image_xscale = 1
      image_yscale = 1
      team = other.team;
      damage=7
      creator = other;
    }
with instance_create(x+lengthdir_x(8,gunangle),y+lengthdir_y(8,gunangle),CustomProjectile)
{
	team = other.team;
	direction = other.gunangle + (random_range(-2,2) * other.accuracy);
	sprite_index = global.sprghost;
	image_angle = direction;
	damage = 8;
	speed = 9;
	friction = 0.4;
	typ = 2;
	creator = other;
	shankdir = 0
	on_step = ghoststep;
	on_draw = ghostdraw;
	on_destroy = ghostdestroy;
  }
  wepangle = -wepangle;
motion_add(gunangle, 3.5);


#define ghoststep
if irandom(2) >= 1{
shankdir = random(359)
sound_play_pitchvol(sndChickenSword,1.6,0.6);
with instance_create(x + lengthdir_x(3+(skill_get(13)* 5), shankdir),y + lengthdir_y(3+(skill_get(13)* 5), shankdir),Shank) {
	direction = other.shankdir
	image_angle = direction
	image_xscale = 0.8
	image_yscale = 0.5
	team = other.team;
  }
}
if speed <= 0{
instance_destroy()
}


#define ghostdraw
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, 2*image_xscale, 2*image_yscale, image_angle, image_blend, 0.1);
draw_set_blend_mode(bm_normal);


#define ghostdestroy
with instance_create(x + lengthdir_x(4, direction),y + lengthdir_y(4, direction),Slash)
    {
      direction = other.direction;
      speed = 1 * (skill_get(13) + 2);
      image_angle = direction;
      image_xscale = 0.7
      image_yscale = 0.7
      team = other.team;
      damage= 5;
      creator = other;
    }
with instance_create(x,y,PlasmaImpact)
    {
      image_xscale = 0.5
      image_yscale = 0.5
	}
sound_play_pitchvol(sndBlackSword,1.2,0.9);