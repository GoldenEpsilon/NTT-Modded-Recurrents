#define init
global.sprite = sprite_add_weapon("PlasmaBazooka.png",12,7);
global.sprrocket = sprite_add("PlasmaRocket.png",1,5,5);

#define weapon_name
return "Plasma Bazooka";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 5;

#define weapon_auto
return 0;

#define weapon_load
return 21;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 10;

#define weapon_text
return "DOESN'T PLASMA ALREADY#EXPLODE?";

#define weapon_fire
if instance_exists(self){
weapon_post(8,-9,18);
sound_play_pitchvol(sndRocket,0.9,1);
if skill_get(17){
sound_play_pitchvol(sndPlasmaBigUpg,1.1,1);
}else{
sound_play_pitchvol(sndPlasmaBig,1.1,1);
}
with instance_create(x+lengthdir_x(8,gunangle),y+lengthdir_y(8,gunangle),CustomProjectile)
{
	team = other.team;
	direction = other.gunangle + (random_range(-3,3) * other.accuracy);
	sprite_index = global.sprrocket;
	//mask_index = mskRocket;
	image_angle = direction;
	damage = 7 + (skill_get(17) * 3);
	typ = 2;
	creator = other;
	alarm1 = 5;
	speed = 2;
	active = 0;
	on_step = prcktstep;
	on_draw = prcktdraw;
	on_destroy = prcktdestroy;
	sound_play_pitchvol(sndRocketFly,0.9,1);
  }
}

#define prcktstep
if(alarm1 >= 0)
{
	alarm1 -= 1;
	if(alarm1 = 0)
	{
		active = 1;
		view_shake_at(x, y, 4);
	}
}
if(active)
{
	if irandom(1) == 1 instance_create(x - lengthdir_x(speed * 2, image_angle), y - lengthdir_y(speed * 2, image_angle), Smoke)
	instance_create(x - lengthdir_x(speed * 2, image_angle)+ random_range(-2,2), y - lengthdir_y(speed * 2, image_angle)+ random_range(-2,2), PlasmaTrail)
	if(speed < 12) speed += 1;
	else speed = 10;
}

#define prcktdraw
if(active)
{
	draw_sprite_ext(sprRocketFlame, -1, x - lengthdir_x(4,image_angle), y - lengthdir_y(4,image_angle), 1, 1.2, image_angle, c_white, image_alpha);
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(sprRocketFlame, 0, x, y, 2 * image_xscale, 2 * image_yscale, image_angle, c_white, 0.1);
}
draw_set_blend_mode(bm_normal);
draw_self();

#define prcktdestroy
expspread = random_range(0,360)
sound_play_pitchvol(sndExplosionL,1.3,0.6);
if skill_get(17){
sound_play_pitchvol(sndPlasmaBigExplodeUpg,1.1,1);
}else{
sound_play_pitchvol(sndPlasmaBigExplode,1.1,1);
}
	with instance_create(x,y,PlasmaImpact){
direction = random_range(0,360);
image_xscale = 1.7 + (skill_get(17) * 0.5);
image_yscale = 1.7 + (skill_get(17) * 0.5);
}
for(i = 0; i <= 240; i += 120){
	with instance_create(x+lengthdir_x(26,direction+i+expspread),y+lengthdir_y(26,direction+i+expspread),PlasmaImpact){
direction = other.direction + other.i;
}
}