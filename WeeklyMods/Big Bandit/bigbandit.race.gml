#define init
global.spr_icon = sprite_add("BigBanditIcon.png", 1, 0, 0);
global.spr_mapi = sprite_add("BigBanditMap.png", 1, 10, 10);
global.spr_port = sprite_add("BigBanditPortrait.png", 1, 150, 276);
global.spr_ultr[1] = sprite_add("BigBanditA.png", 1, 12, 16);
global.spr_ultr[2] = sprite_add("BigBanditB.png", 1, 12, 16);
global.spr_ulti[1] = sprite_add("BigBanditIconA.png", 1, 9, 9);
global.spr_ulti[2] = sprite_add("BigBanditIconB.png", 1, 9, 9);

#define race_mapicon
return global.spr_mapi;

#define race_menu_button
sprite_index = global.spr_icon;

#define race_portrait
return global.spr_port;

#define race_name
return "BIG BANDIT";

#define race_text
return "BIG BANDIT BLASTER#MORE @rHEALTH#@sCHARGE@w";

#define race_tb_text
return "FASTER CHARGE BUILDRATE";

#define race_ultra_name
switch(argument0){
	case 1: return "BULLET PURIST";
	case 2: return "MANY BIG MANS";
}

#define race_ultra_text 
switch (argument0){
	case 1: return "CAN PICK UP @yBULLET WEAPONS@s";
	case 2: return "@rHP@s CREATES @wDUPLICATES@s"; 
}

#define race_ultra_button
sprite_index = global.spr_ultr[argument0];
	
#define race_ultra_icon
return global.spr_ulti[argument0];

#define race_swep
return "bigrifle";

#define create
spr_idle = sprBanditBossIdle;
spr_walk = sprBanditBossWalk;
spr_hurt = sprBanditBossHurt;
spr_dead = sprBanditBossDead;

snd_hurt = sndBigBanditHit;
snd_dead = sndBigBanditDie;
snd_lowa = sndBigBanditHalfHP;
snd_lowh = sndBigBanditHalfHP;
snd_crwn = sndBigBanditMelee;
snd_chst = sndBigBanditMeleeStart;
snd_wrld = sndBigBanditIntro;
snd_valt = sndBigBanditIntro;
snd_spch = sndBigBanditTaunt;
snd_idpd = sndBigBanditIntro;
snd_cptn = sndBigBanditTaunt;

spr_shadow = shd32;
mask_index = mskBanditBoss;

spr_shadow_y += 6;

canpick = 0;

maxhealth = 100;
my_health = maxhealth;

band_charge = 0;
maxb_charge = 4;
charge_dir = 0;

#define step
if(button_check(index, "spec"))
{
	if(button_pressed(index, "spec"))
	sound_play(sndBigBanditMeleeStart);

	if(skill_get(5)){ band_charge += floor((maxb_charge-band_charge)/2); }
	else{ band_charge += maxb_charge/8; }
	
	if(band_charge > maxb_charge)
	band_charge = maxb_charge;
}

if(band_charge > 0)
{
	canwalk = 0;
	if(band_charge > 0.40)
	{
		spr_idle = sprBanditBossTell;
		spr_walk = sprBanditBossDash;
	}
	else
	{
		spr_idle = sprBanditBossStop;
		spr_walk = sprBanditBossStop;
	}
	
	if(button_released(index, "spec"))
	{
		charge_dir = point_direction(x, y, mouse_x[index], mouse_y[index]);
		sound_play(sndBigBanditMelee);
	}
	
	if(!button_check(index, "spec"))
	{
		motion_add(charge_dir, maxspeed * (band_charge/maxb_charge));
		band_charge -= maxb_charge/40;
	}
	
	if(button_pressed(index, "spec") and band_charge > 0.40)
	{
		band_charge = 0.40;
	}
	
	with(instances_matching_ne(hitme, "team", team))
	{
		if(point_distance(x, y, other.x, other.y) < 24)
		{
			nexthurt = current_frame+3;
			my_health -= 2 * GameCont.level;
			sound_play(snd_hurt);
			sprite_index = spr_hurt;
			image_index = 0;
		}
	}
	
	if(band_charge < 0)
	band_charge = 0;
}
else
{
	canwalk = 1;
	spr_idle = sprBanditBossIdle;
	spr_walk = sprBanditBossWalk;
}

if(ultra_get(mod_current, 2) and !instance_exists(SpiralCont) and my_health > lsthealth)
{
	buddy_create(x, y);
}

if(ultra_get(mod_current, 1) and instance_exists(nearwep) and weapon_get_type(nearwep.wep) = 1){ canpick = 1; } else { canpick = 0; }

with(instances_matching(projectile, "team", 2))
{
	if(instance_exists(creator) and ((creator.object_index = Player and creator.race = other.race)or (creator.object_index = CustomHitme and "name" in creator and creator.name = "BANDIT BUDDY")) and object_index != EnemyBullet1)
	{
		with(instance_create(x, y, EnemyBullet1))
		{
			direction = other.direction;
			team = other.team;
			creator = other.creator;
			speed = other.speed;
			image_xscale = 1 + (other.damage/damage)/10;
			image_yscale = 1 + (other.damage/damage)/10;
			damage = other.damage;
			image_angle = other.image_angle;
		}
		instance_delete(self);
	}
}

#define buddy_create(_x, _y)
with(instance_create(_x, _y, CustomHitme))
{
	name = "BANDIT BUDDY";

	spr_idle = sprBanditBossIdle;
	spr_walk = sprBanditBossWalk;
	spr_hurt = sprBanditBossHurt;
	spr_dead = sprBanditBossDead;

	snd_hurt = sndBigBanditHit;
	snd_dead = sndBigBanditDie;
	
	spr_shadow = shd32;
	mask_index = mskBanditBoss;

	spr_shadow_y += 6;
	
	maxhealth = 8;
	my_health = maxhealth;
	
	team = other.team;
	creator = other;
	maxspeed = other.maxspeed;
	wep = other.wep;
	friction = other.friction;
	reload = Player.reload;
	right = other.right;
	aimDirection = other.aimDirection;
	accuracy = other.accuracy;
	wkick = other.wkick;
	
	sprite_index = spr_idle;
	image_speed = other.image_speed;
	alarm0 = 40;
	walk = 0;
	
	on_step = buddy_step;
	on_draw = buddy_draw;
	on_hurt = buddy_hurt;
	on_destroy = buddy_destroy;
}

#define buddy_step
if(my_health > 0)
{
	alarm0--;
	if(reload > 0)
	reload--;
	aimDirection = point_direction(x, y, mouse_x[creator.index], mouse_y[creator.index]);

	if(instance_exists(creator))
	{
		wep = creator.wep;
		wkick = creator.wkick;

		if(alarm0 = 0)
		{
			alarm0 = 10 + irandom(30);
			
			if(point_distance(x, y, creator.x, creator.y) > 16)
			{
				walk = 120;
				direction = point_direction(x, y, creator.x, creator.y);
			}		
		}
		
		if(button_check(creator.index, "fire") and reload <= 0)
		{
			player_fire_ext(aimDirection, wep, x, y, team, id);
			reload += weapon_get_load(wep);
		}
	}
	else
	{
		my_health = 0;
	}

	if(walk > 0 and point_distance(x, y, creator.x, creator.y) > 24)
	{
		walk--;
		direction = angle_rotate(direction, point_direction(x, y, creator.x, creator.y), speed * random(3));
		motion_add(direction, 3);
	}

	if(speed > maxspeed)
	{
		speed = maxspeed;
	}

	// stolen from thestruggle.mod.gml, thanks YAL
	if (place_meeting(x, y, prop)) with (prop) if (place_meeting(x, y, other)) {
		with (other) motion_add(point_direction(other.x, other.y, x, y), 1);
	}
	if (place_meeting(x, y, CustomHitme)) with (CustomHitme) if (place_meeting(x, y, other)) {
		motion_add(point_direction(other.x, other.y, x, y), 1);
		with (other) motion_add(point_direction(other.x, other.y, x, y), 1);
	}
	if (place_meeting(x, y, Player)) with (Player) if (place_meeting(x, y, other)) {
		with (other) motion_add(point_direction(other.x, other.y, x, y), 1);
	}
	if (!place_free(x + hspeed, y + vspeed)) move_bounce_solid(1);
	if(aimDirection > 90)
	right = -1;
	else
	right = 1;
	
	if(nexthurt > current_frame)
	{
		sprite_index = spr_hurt;
	}
	else if(speed > 0)
	{
		sprite_index = spr_walk;
	}
	else
	{
		sprite_index = spr_idle;
	}
}

if(my_health <= 0)
{
	instance_destroy();
}

#define buddy_draw
//also stolen from thestruggle
var c = image_blend;
var a = image_alpha;
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * right, image_yscale, image_angle, c, a);
var d = -30;
d = (weapon_is_melee(wep) ? -120 * right : 0) + aimDirection;
draw_sprite_ext(weapon_get_sprite(wep), 0, x - lengthdir_x(wkick, aimDirection), y - lengthdir_y(wkick, aimDirection), 1, right, d, c, a);

#define buddy_hurt
my_health -= argument0;
sprite_index = spr_hurt;
image_index = 0;
sound_play(snd_hurt);
nexthurt = current_frame + 3;

#define buddy_destroy
with instance_create(x, y, Corpse)
{
	sprite_index = other.spr_dead;
	image_index = 0;
}

sound_play(snd_dead);

#define cycle
/// cycle(value, min, max)
var result, delta;
delta = (argument2 - argument1);
result = (argument0 - argument1) mod delta;
if (result < 0) result += delta;
return result + argument1;

#define angle_rotate
/// angle_rotate(angle, target, speed)
var diff;
// 180 is to be replaced by "pi" for radians
diff = cycle(argument1 - argument0, -180, 180);
// clamp rotations by speed:
if (diff < -argument2) return argument0 - argument2;
if (diff > argument2) return argument0 + argument2;
// if difference within speed, rotation's done:
return argument1;