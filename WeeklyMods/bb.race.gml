#define init
global.ultra[1] = 0
global.ultra[2] = 0



#define create
//set the sprites, i was too lazy to base64 these
global.ultra[1] = 0
global.ultra[2] = 0
spr_idle = sprBanditBossIdle
spr_walk = sprBanditBossWalk
spr_hurt = sprBanditBossHurt
spr_dead = sprBanditBossDead
spr_chrg = sprBanditBossDead
snd_hurt = sndBigBanditHit
snd_wrld = sndBigBanditIntro
snd_dead = sndBigBanditDie
snd_lowh = sndBigBanditHalfHP;
snd_lowa = sndBigBanditHalfHP;
mask_index = mskBanditBoss
wepspr = sprBanditBossGun
wep = 0
maxspeed = 3
charge = 0
gammo = 0
gangle = gunangle
firedelay = 0
dostart = 1
#define step
mask_index = mskBanditBoss
size = 3
if button_check(index,"horn")
instance_create(x,y,BigRad)
if button_pressed(index,"spec") and charge = 0
{
	charge = 30
	chargeangle = gunangle
	sound_play(sndBigBanditMeleeStart)
}
if charge > 0
{
	if charge < 16
	{
	if global.ultra[2] = 0
	motion_add(chargeangle,3)
	else
	motion_add(direction,3)
	instance_create(x+random(8)-4,y+4+random(4),Dust)
	if place_meeting(x,y,Wall)
	with instance_place(x,y,Wall)
	instance_destroy()
	with instance_create(x+lengthdir_x(6,chargeangle),y+lengthdir_y(6,chargeangle),PortalClear)
	{
	mask_index = other.mask_index
	}
	with instance_create(x,y,Shank)
	{
		damage = 10
		mask_index = mskSlash
		direction = other.direction
		image_angle = direction
		team = other.team
		visible = 0
	}
	sound_stop(sndMeleeWall)
	}
	if charge > 15
	{
	sprite_index = spr_idle
	speed = 0
	}
	charge -= 1
	if charge = 15
	sound_play(sndBigBanditMelee)
	spr_idle = sprBanditBossTell
	spr_walk = sprBanditBossDash
}
else
{
	spr_idle = sprBanditBossIdle
	spr_walk = sprBanditBossWalk
}

if button_pressed(index,"fire") and gammo = 0
{
	sound_play(sndBigBanditShootLaugh)
	gammo = 10
	gangle = gunangle
}
if gammo > 0 and firedelay = 0
{
	firedelay = 4
	motion_add(gangle+180,1)
	wkick = 5
	sound_play(sndEnemyFire)
	with instance_create(x,y,Bullet1)
	{
		sprite_index = sprAllyBullet
		motion_add(other.gangle+random(30/other.accuracy)-15/other.accuracy,8)
		image_angle = direction
		team = other.team
		bb = 1
		damage = 3*(skill_get(17)+1)
	}
	gammo -= 1
	if gammo = 0
	sound_play(sndBigBanditStopShoot)
}
with Bullet1
{
	if "bb" not in self
	bb = 0
	if "bounces" not in self{
	bounces = 0
	if skill_get(15) = 1
	bounces = 1}
	if bb = 1
	{
		if skill_get(13) = 1
		speed += 1
		if skill_get(21) = 1 and instance_exists(enemy)
		{
			target = instance_nearest(mouse_x[other.index],mouse_y[other.index],enemy)
			speedprevious = speed
			motion_add(point_direction(x,y,target.x,target.y),1)
			speed = speedprevious
			image_angle = direction
		}
		if skill_get(15) = 1 and bounces > 0
		{
		if(place_meeting(x+hspeed,y+vspeed,Wall))
									{
										if(instance_exists(self))
										{
											//bounces -= 1;
											move_bounce_solid(0);
											image_angle = direction;
											sound_play(sndBouncerBounce);
											if(instance_exists(self)) bounces -= 1;
										}
									}
		}
	}
}
if gammo = 0 or skill_get(5) = 1
gangle = gunangle
wep = 0
if firedelay > 0
firedelay -= 1
//CHECK WHEN THE GAME STARTS
if instance_exists(SpiralCont)
dostart = 1
if !instance_exists(SpiralCont) and dostart = 1 and global.ultra[1] = 1
repeat(2)
{
	with instance_create(x,y,CustomEnemy)
	{
		team = other.team
		spr_idle = sprBanditIdle
		spr_walk = sprBanditWalk
		spr_hurt = sprBanditHurt
		spr_dead = sprBanditDead
		snd_hurt = sndBanditHit
		snd_dead = sndBanditDie
		maxhealth = 10
		my_health = maxhealth
		alrm0 = 30
		do
		{
		wep = irandom(121)
		} until weapon_get_area(wep) <= GameCont.hard and weapon_get_area(wep) != -1
		on_step = script_ref_create(bandit_step)
		on_draw = script_ref_create(bandit_draw)
		creator = other
		gunangle = creator.gunangle
		reload = 0
	}
	dostart = 0
}
#define draw
	if (gunangle <= 180)
		draw_sprite_ext(wepspr,0,x + lengthdir_x(wkick,gangle + 180),y  + lengthdir_y(wkick,gangle + 180),1,right,gangle + angle,c_white,1);
	draw_sprite_ext(sprite_index,image_index,x,y ,right,1,angle,c_white,1);
	if (gunangle > 180)
		draw_sprite_ext(wepspr,0,x + lengthdir_x(wkick,gangle + 180),y  + lengthdir_y(wkick,gangle + 180),1,right,gangle + angle,c_white,1);
//menu sprites and stuff
#define area_start
instance_create(x,y,Explosion)
#define race_portrait
return sprBossIntroBackLayer

#define race_mapicon
return sprBanditBossDash

#define race_menu_button
return sprBanditBossIdle

//name, abilities, starting weapon, and throne butt
#define race_name
return "BIG BANDIT";

#define race_text
return "SPECIALIZED MACHINEGUN#DASH";

#define swep
return 1;

#define race_tb_text
return "AIM WHILE FIRING";

#define race_ultra_button
return sprite_index = sprGrenade

#define race_ultra_name
switch(argument0){ //ultra names
	case 1: return "BANDITS";
	case 2: return "SNOWBOT TECHNOLOGY";
}

#define race_ultra_text 
switch (argument0){ //ultra words
	case 1: return "THE TRUE KING"; //ITS A MEME OK
	case 2: return "TURN WHILE DASHING"; //probably bad
}

#define race_ultra_take
with Player{ //make sure you get the ultras
	global.ultra[argument0] = 1;
}
#define race_ttip
return "KING OF THE BANDITS"

#define bandit_step
if speed = 0
{if sprite_index != spr_hurt
sprite_index = spr_idle}
else
{if sprite_index != spr_hurt
sprite_index = spr_walk}
if sprite_index = spr_hurt
{if image_index > 2
sprite_index = spr_idle}
bbs = 0
with instances_matching(Player,"race","bb")
other.bbs += 1

if instance_number(enemy) = (2*bbs)
{
     my_health = 0
}
else
my_health = maxhealth
if instance_exists(creator)
{
	if button_pressed(creator.index,"fire") and reload <= 0
	{
	with instance_create(x,y,CustomObject)
	{
	creator = other
	gunangle = other.gunangle
		with(creator)
						{
							var _o = other;
							var _fire = player_fire_ext(_o.gunangle, wep, x, y, team, id);
							wepangle = _fire.wepangle;
							alarm1 = _fire.reload;
							reload = _fire.reload
						}
	}
	}
	gunangle = creator.gunangle
	if reload > 0
	reload -= 1
	if point_distance(x,y,creator.x,creator.y) > 32
	motion_add(point_direction(x,y,creator.x,creator.y),2)
}
if speed > 3
speed = 3
#define bandit_draw
if gunangle <= 180
draw_sprite_ext(weapon_get_sprite(wep),0,x,y,1,right,gunangle,c_white,1)
draw_sprite_ext(sprite_index,-1,x,y,right,1,0,c_white,1)
if gunangle > 180
draw_sprite_ext(weapon_get_sprite(wep),0,x,y,1,right,gunangle,c_white,1)