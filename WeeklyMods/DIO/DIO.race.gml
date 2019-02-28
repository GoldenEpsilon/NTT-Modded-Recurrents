#define init

global.portrait = sprite_add("sprPortrait.png", 1, 20, 236)
global.sprKnife = sprite_add("sprKnife.png",1,12,4)
global.snd_wrld = sound_add("sndWrld.ogg")
global.snd_lowh = sound_add("sndLow.ogg")
global.snd_lowa = sound_add("sndLowa.ogg")
global.snd_hurt = sound_add("sndHurt.ogg")
global.snd_die = sound_add("sndDie.ogg")
global.snd_punch = sound_add("sndPunch.ogg")
global.snd_punchupg = sound_add("sndPunchUpg.ogg")
global.snd_punchupgend = sound_add("sndPunchUpgEnd.ogg")
global.snd_knives = sound_add("sndKnives.ogg")
global.snd_stand = sound_add("sndStand.ogg")
global.snd_stoptime = sound_add("sndStopTime.ogg")
global.snd_roadroller = sound_add("sndRoadRoller.ogg")
global.snd_freeze = sound_add("sndFreeze.ogg")
global.snd_wry = sound_add("sndWry.ogg")
global.spr_fist = sprite_add("sprFist.png", 1, 0, 6)
global.spr_muda = sprite_add("sprMuda.png", 1, 0, 6)
global.spr_arm = sprite_add("sprArm.png", 1, 0, 4)
global.spr_idle = sprite_add("idle.png", 11, 12, 13)
global.spr_walk = sprite_add("walk.png", 6, 12, 13)
global.spr_hurt = sprite_add("hurt.png", 3, 12, 13)
global.spr_dead = sprite_add("dead.png", 8, 12, 13)
global.spr_mapicon = sprite_add("map.png",1,10,10)
global.spr_theworld = sprite_add("sprTheWorld.png",2,16,21)
global.spr_select = sprite_add("sprSelect.png",1,0,0)
global.spr_ultras = sprite_add("sprUltras.png",2,12,16)

#define race_soundbank
return 1;

#define create
snd_wrld = global.snd_wrld
snd_lowh = global.snd_lowh
snd_hurt = global.snd_hurt
snd_dead = global.snd_die
snd_punch = global.snd_punch
snd_punchupg = global.snd_punchupg
snd_punchupgend = global.snd_punchupgend
snd_knives = global.snd_knives
snd_stand = global.snd_stand
snd_stoptime = global.snd_stoptime
snd_roadroller = global.snd_roadroller
snd_wry = global.snd_wry
snd_freeze = global.snd_freeze
spr_idle = global.spr_idle
spr_walk = global.spr_walk
spr_hurt = global.spr_hurt
spr_dead = global.spr_dead
spr_shadow_y = 4
spr_theworld = global.spr_theworld
timestopped = 0
mywep = 0
stand = 0
canpick = 0
ultra[1] = 0
ultra[2] = 0
nextvoice = -1
speechdelay = 0
punchdelay = 0
maxpunches = 0
timestopspeed = 1
sucking = 0
roadrollering = 0
zspd = 0
z = 0
alrmknives = 0
ammoknives = 0
fist = -1
holding = 0
regencountdown = 300
#define step
wep = 0
	if alrmknives > 0
	alrmknives -= 1
		if alrmknives = 1 and stand = 0
	{
		reload = 30 - 1.5*GameCont.level
		//sound_play(snd_knives)
		//repeat(7)
		with instance_create(x,y,Splinter)
		{
			team = other.team
			motion_add(other.gunangle,12+irandom(8))
			image_angle = direction
			sprite_index = global.sprKnife
			image_speed = 0
		}
		sound_play(sndScrewdriver)
		if ammoknives > 0
		{
			ammoknives -= 1
			alrmknives = 9
		}
	}

	if alrmknives = 1 and stand = 1
	{
		reload = 60 - 3.5*GameCont.level
		sound_play(snd_knives)
		repeat(3)
		with instance_create(x-lengthdir_x(25-irandom(50),gunangle+90),y-lengthdir_y(25-irandom(50),gunangle+90),Splinter)
		{
			team = other.team
			motion_add(other.gunangle-15+irandom(30),12+irandom(8))
			image_angle = direction
			sprite_index = global.sprKnife
			image_speed = 0
			damage = 5
			with instance_create(x,y,BoltTrail)
			{
				image_yscale = 4
				image_angle = other.image_angle+90
				image_xscale = 8
			}
		}
		/*repeat(21)
		with instance_create(x-35+irandom(70),y-35+irandom(70),WepSwap)
		{
			image_speed = 0.2+choose(0,0.1,0.2,0.3,0.4)
		}*/
		sound_play(sndScrewdriver)
		if ammoknives > 0
		{
			ammoknives -= 1
			alrmknives = 5
		}
	}
if button_pressed(index,"fire") and reload <= 0 and stand = 0
{
	if mywep = 0 and fist = -1
	//punch
	{
		reload = 30 - 1.5*GameCont.level
		sound_play(snd_punch)
		fist = instance_create(x,y,Shank)
		with fist
		{
			team = other.team
			direction = other.gunangle
			image_angle = direction
			sprite_index = global.spr_fist
			image_yscale = other.right
			image_speed = 0
			ctime = 0
			ogx = x
			ogy = y
			creator = other
			damage = 6+GameCont.level
		}
	}
	if mywep = 1 //and ammo[3] >= 4
	{
		//daggers
		alrmknives = 15
		ammoknives = 1+GameCont.level/2
		repeat(3)
		with instance_create(x-8+irandom(16),y-8+irandom(16),WepSwap)
		{
			image_speed = 0.2+choose(0,0.1,0.2,0.3,0.4)
		}
		sound_play(sndSwapSword)
	}

	if mywep = 2 and z = 0
	//road roller
	{
		roadrollering = 1
		tx = mouse_x[index]
		ty = mouse_y[index]
		oldmaxspeed = maxspeed
		maxspeed = 0
	}
	if mywep = 3 and reload <= 0// and ammo[4] >= 2
	//space ripper stingy eyes
	{
		with instance_create(x-8,y,Laser)
		{
			team = other.team
			image_angle = other.gunangle
			event_perform(ev_alarm,0)
		}
		with instance_create(x+8,y,Laser)
		{
			team = other.team
			image_angle = other.gunangle
			event_perform(ev_alarm,0)
		}
		sound_play_pitch(sndLaserUpg,1.25)
		reload = 20
	}
	if mywep = 4 and reload <= 0 and holding = 0
	//freeze enemies
	if instance_exists(enemy)
	{
		t = instance_nearest(x,y,enemy)
		if point_distance(x,y,t.x,t.y) < 16*t.size+4
		{
			holding = 1
			with t
			{
				frozen = 1
				freezer = other
				team = other.team
				snd_dead = sndIcicleBreak
				snd_hurt = sndLaserCrystalHit
				image_speed = 0
				spr_dead = sprIcicleDead
				oldshady = spr_shadow_y
				sprite_index = spr_hurt
				image_index = 0
				visible = 0
			}
			sound_play(snd_freeze)
		}
		reload = 5 
	}

}

if button_pressed(index,"fire") and reload <= 0 and stand = 1 and maxpunches = 0
{
	if mywep = 0
	//MUDAMUDAMUDAMUDA
	{
		reload = 75
		sound_play(snd_punchupg)
		maxpunches = 30
		punchdelay = 1
	}
	if mywep = 1 //and ammo[3] >= 4
	{
		//daggers
		alrmknives = 15
		ammoknives = 2+GameCont.level
		repeat(21)
		with instance_create(x-32+irandom(64),y-32+irandom(64),WepSwap)
		{
			image_speed = 0.2+choose(0,0.1,0.2,0.3,0.4)
		}
		sound_play(sndSwapSword)
	}
	if mywep = 2 and sucking = 0
	if instance_exists(enemy)
	{
		t = instance_nearest(x,y,enemy)
		if point_distance(x,y,t.x,t.y) < 16*t.size+4
		{
			sucking = 1
			reload = 5
			oldmaxspeed = maxspeed
			maxspeed = 0
			sound_play(snd_wry)
			with t
			{
				oldshady = spr_shadow_y
			}
		} 
	}
	if mywep = 3 and reload <= 0// and ammo[4] >= 2
	//SUPER space ripper stingy eyes
	{
		with instance_create(x-8,y,Laser)
		{
			team = other.team
			image_angle = other.gunangle
			image_yscale *= 2
			super = 1
			event_perform(ev_alarm,0)
		}
		with instance_create(x+8,y,Laser)
		{
			team = other.team
			image_angle = other.gunangle
			image_yscale *= 2
			super = 1
			event_perform(ev_alarm,0)
		}
		sound_play_pitch(sndLaserUpg,1.5)
		reload = 30
	}
	if mywep = 4 and reload <= 0 and holding = 0
	//freeze enemies
	if instance_exists(enemy)
	{
		t = instance_nearest(x,y,enemy)
		if point_distance(x,y,t.x,t.y) < 16*t.size+4
		{
			holding = 1
			with t
			{
				frozen = 1
				freezer = other
				team = other.team
				snd_dead = sndIcicleBreak
				snd_hurt = sndLaserCrystalHit
				image_speed = 0
				spr_dead = sprIcicleDead
				oldshady = spr_shadow_y
				sprite_index = spr_hurt
				image_index = 0
			}
			with enemy
			if point_distance(x,y,other.x,other.y) <= 64
			{
				frozen = 1
				freezer = other
				fakespeed = 0
				meleedamage = 0
				team = id
				snd_dead = sndIcicleBreak
				snd_hurt = sndLaserCrystalHit
				image_speed = 0
				spr_dead = sprIcicleDead
				oldshady = spr_shadow_y
				sprite_index = spr_hurt
				image_index = 0
			}
			sound_play(snd_freeze)
		}
		reload = 5 
	}
}
if round(reload) = 1 and stand = 1 and mywep = 0
{
	//sound_play(snd_punchupgend)
	with instance_create(x,y,Bullet1)
	{
		team = other.team
		motion_add(other.gunangle,12)
		image_angle = direction
		damage *= 2
		//image_speed = 0.2
		friction = 0.5
		sound_play_pitch(sndScrewdriver,0.5)
		sprite_index = global.spr_muda
		image_yscale = other.right
	}
}


if button_pressed(index,"spec")
{
	if stand = 0 and GameCont.rad > 0
	{
		stand = 1
		sound_play(snd_stand)
		if ultra[1] = 1
		{
			timestopped = 0
			speechdelay = 45
			nextvoice = snd_stoptime
		}
	}
	else
	{
		stand = 0
		if ultra[1] = 1
		with hitme
		{
			image_speed = 0.4
			candie = 1
		}
		with projectile
		image_speed = 1
		with Corpse
		image_speed = 0.4
		timestopspeed = 1
		if ultra[1] = 1
		sound_play_pitch(sndPlasmaReloadUpg,0.7);
	}
}
if GameCont.rad = 0 and stand = 1
{
	{
		stand = 0
		if ultra[1] = 1
		with hitme
		{
			image_speed = 0.4
			candie = 1
		}
		with projectile
		image_speed = 1
		with Corpse
		image_speed = 0.4
		timestopspeed = 1
		if ultra[1] = 1
		sound_play_pitch(sndPlasmaReloadUpg,0.7);
	}
}
if button_pressed(index,"swap")
{
	if mywep < 2+2*ultra[2]
	mywep ++
	else
	mywep = 0
}
if ultra[1] = 1 and stand = 1
{
	timestopped += timestopspeed
	timestopspeed += 0.25
	{
		with hitme
		if team != other.team and point_distance(x,y,other.x,other.y) <= other.timestopped
		{
			if alarm0 > -1
			alarm0 ++
			if alarm1 > -1
			alarm1 ++
			if alarm2 > -1
			alarm2 ++
			if alarm3 > -1
			alarm3 ++
			if alarm4 > -1
			alarm4 ++
			if alarm5 > -1
			alarm5 ++
			image_speed = 0
			x = xprevious
			y = yprevious
			//x -= lengthdir_x(speed,direction)
			//y -= lengthdir_y(speed,direction)
			x -= hspeed
			y -= vspeed
			if "reload" in self
			reload ++
			candie = 0
		}
		with projectile 
		if point_distance(x,y,other.x,other.y) <= other.timestopped and sprite_index != global.spr_muda
		{
			x -= hspeed
			y -= vspeed
			speed += friction
			image_speed = 0
			if object_index = Laser
			image_yscale += 0.3
		}
		with Corpse  
		if point_distance(x,y,other.x,other.y) <= other.timestopped
		{
			x -= hspeed
			y -= vspeed
			speed += friction
			image_speed = 0
		}
	}
}
if timestopped > 0
script_bind_draw(timestop_draw,-10)
with Bullet1
{
	if sprite_index = global.spr_muda
	image_xscale = speed/10
	if speed = 0
	instance_destroy()
}
with Car
{
	if "roadroller" not in self
	roadroller = 0
	if roadroller = 1
	friction = 0.1
}
if speechdelay > 0
{
	speechdelay -= 1
	if speechdelay = 1
	{
		sound_play(nextvoice)
		if nextvoice = snd_stoptime
		sound_play_pitch(sndPlasmaHugeUpg,0.6)
	}

}
if maxpunches > 0
{
	{
		punchdelay -= 1
		if punchdelay = 0
		{
			with instance_create(x-lengthdir_x(10-irandom(20),gunangle+90),y-lengthdir_y(10-irandom(20),gunangle+90),Bullet1)
			{
				team = other.team
				motion_add(other.gunangle,8)
				image_angle = direction
				friction = 0.5
				sound_play_pitch(sndScrewdriver,2)
				sprite_index = global.spr_muda
				image_yscale = other.right
			}
			punchdelay = 2
			maxpunches -= 1
		}
	}
}
if sucking = 1
{
	with t
	{
		if alarm0 > -1
		alarm0 ++
		if alarm1 > -1
		alarm1 ++
		if alarm2 > -1
		alarm2 ++
		if alarm3 > -1
		alarm3 ++
		if alarm4 > -1
		alarm4 ++
		if alarm5 > -1
		alarm5 ++
		x = other.x+8*size*other.right
		y = other.y-8*size
		my_health -= 0.25
		sprite_index = spr_hurt
		sound_play(snd_hurt)
		meleedamage = 0
		spr_shadow_y = 8*size
	}
	if t.my_health <= 0
	{
		sucking = 0
		my_health += 1*t.size
		maxspeed = oldmaxspeed
	}
	else
	with instance_create(t.x-8+irandom(16),t.y-8+irandom(16),BulletHit)
	{
		sprite_index = sprEnemyBulletHit
		image_blend = c_red
		gravity = 0.25
	}
}
if button_pressed(index,"fire") and sucking = 1 and reload <= 0
{
	sucking = 0
	maxspeed = oldmaxspeed
	with t
	{
		fakedirection = other.gunangle
		fakespeed = 18-0.5*size
	}
	sound_play(snd_knives)
	sound_stop(snd_wry)
}
if button_pressed(index,"fire") and holding = 1 and reload <= 0
{
	holding = 0
	with t
	{
		fakedirection = other.gunangle
		fakespeed = 18-0.5*size
	}
	sound_play(snd_knives)
	sound_stop(snd_freeze)
	reload = 5
}
with enemy
{
	if "fakespeed" in self
	if fakespeed > 0
	{
		x += lengthdir_x(fakespeed,fakedirection)
		y += lengthdir_y(fakespeed,fakedirection)
		fakespeed -= 1
		if place_meeting(x + lengthdir_x(fakespeed,fakedirection),y + lengthdir_y(fakespeed,fakedirection),Wall)
		{
			my_health -= fakespeed
			fakespeed = 0
		}
		if spr_shadow_y != oldshady
		spr_shadow_y = oldshady
	}
	if "frozen" in self
	{
		if "fakespeed" not in self
		{
			x = freezer.x+lengthdir_x(8*size,freezer.gunangle)
			y = freezer.y+lengthdir_y(8*size,freezer.gunangle)
		}
		if alarm0 > -1
		alarm0 ++
		if alarm1 > -1
		alarm1 ++
		if alarm2 > -1
		alarm2 ++
		if alarm3 > -1
		alarm3 ++
		if alarm4 > -1
		alarm4 ++
		if alarm5 > -1
		alarm5 ++
	}
}
if roadrollering > 0 and roadrollering < 30
{
	roadrollering += 1
	depth = -10
	mask_index = mskNone
	y -= 8
	spr_shadow_y += 8
}
if roadrollering = 30
{
	sound_play(snd_roadroller)
	x = tx
	y = ty-240
}
if roadrollering >= 30 and roadrollering < 45
{
	roadrollering += 1
	y += 16
	spr_shadow_y -= 16
}
if roadrollering = 45
{
	roadroller = instance_create(tx,ty,CarVenus)
	with roadroller
	{
		my_health = 56
		spr_idle = sprVanDrive
		spr_hurt = sprVanHurt
		mask_index = mskNone
	}
	sound_play(snd_punchupg)
}
if roadrollering >= 45
{
	roadrollering += 1
	if roadrollering mod 3
	{
		fist = instance_create(x-16+irandom(32),y,Shank)
		with fist
		{
			team = other.team
			mask_index = mskNone
			direction = 270-40+irandom(80)
			depth = -9
			image_angle = direction
			sprite_index = global.spr_fist
			if x < other.x
			image_yscale = -1
			image_speed = 0
			ctime = 0
			ogx = x
			ogy = y
			creator = other
			with other.roadroller
			{
				my_health -= 1
				sound_play(sndVanHurt)
				image_index = 0
				sprite_index = spr_hurt
			}
		}
		with enemy
		if point_distance(x,y,other.x,other.y) <= 25
		{
			if my_health > 1
			my_health -= 1
			sound_play(snd_hurt)
			image_index = 0
			sprite_index = spr_hurt
			speed = 0
			walk = 0
		}

	}
	y = ty-12
}
if roadrollering > 45 and !instance_exists(roadroller)
{
	roadrollering = 0
	zspd = 8
	z = 12
	sound_play(snd_wry)
}
if z > 0
{
	z += zspd
	y -= zspd
	zspd -= 0.5
}
if z <= 1 and maxspeed = 0 and roadrollering = 0
{
	z = 0
	maxspeed = oldmaxspeed
	spr_shadow_y = 4
	mask_index = mskPlayer
	depth = -2
}
if stand = 1
{
	GameCont.rad -= 0.5
	if skill_get(5) = 0
	GameCont.rad -= 0.5
}
with Shank
{
	if "ctime" in self
	{
		ctime += 1
		switch(ctime)
		{
			case 1:
			x = ogx+lengthdir_x(6,direction)
			y = ogy+lengthdir_y(6,direction)
			with instance_create(x,y,BoltTrail)
			{
				sprite_index = global.spr_arm
				image_xscale = 7
				image_angle = other.image_angle+180
				depth = other.depth
			}
			break;
			case 2:
			x = ogx+lengthdir_x(14,direction)
			y = ogy+lengthdir_y(14,direction)
			with instance_create(x,y,BoltTrail)
			{
				sprite_index = global.spr_arm
				image_xscale = 9
				image_angle = other.image_angle+180
				depth = other.depth
			}
			break;
			case 3:
			x = ogx+lengthdir_x(24,direction)
			y = ogy+lengthdir_y(24,direction)
			with instance_create(x,y,BoltTrail)
			{
				sprite_index = global.spr_arm
				image_xscale = 11
				image_angle = other.image_angle+180
				depth = other.depth
			}
			break;
			case 4:
			x = ogx+lengthdir_x(12,direction)
			y = ogy+lengthdir_y(12,direction)
			with instance_create(x,y,BoltTrail)
			{
				sprite_index = global.spr_arm
				image_xscale = 13
				image_angle = other.image_angle+180
				depth = other.depth
			}
			break;
			case 5:
			creator.fist = -1
			instance_destroy()
			break;
		}
	}
}
with Laser
{
	if "super" in self
	with instance_create(x,y,PortalClear)
	mask_index = mskBandit
}
script_bind_draw(freeze_draw,-4)
if mouse_y[index] < y
script_bind_draw(standdraw,-1)
else
script_bind_draw(standdraw,-3)
regencountdown -= 1
if regencountdown = 0
{
	regencountdown = 300
	if my_health < maxhealth
	my_health += 1
}
#define standdraw
with Player
{
	if stand = 1 and mywep > 0
	draw_sprite_ext(spr_theworld, 0, x-16*right, y-8+sin(current_frame/8)*3, right, image_yscale, image_angle, image_blend, image_alpha);
	if stand = 1 and mywep = 0 and maxpunches = 0
	draw_sprite_ext(spr_theworld, 0, x+lengthdir_x(16,gunangle), y+lengthdir_y(16,gunangle)+sin(current_frame/8)*3, right, image_yscale, image_angle, image_blend, image_alpha);
	if stand = 1 and mywep = 0 and maxpunches > 0
	draw_sprite_ext(spr_theworld, 1, x+lengthdir_x(16,gunangle), y+lengthdir_y(16,gunangle)+sin(current_frame/8)*3, right, image_yscale, image_angle, image_blend, image_alpha);
}
instance_destroy()
#define timestop_draw
with Player
if stand = 1 and ultra[1] = 1
{
	draw_set_blend_mode_ext(bm_inv_dest_colour, bm_zero);
	draw_circle(x,y,timestopped,false)
	draw_set_blend_mode(bm_normal)
	draw_sprite_ext(sprite_index, image_index, x, y, right, image_yscale, image_angle, image_blend, image_alpha);
	if stand = 1 and mywep > 0
	draw_sprite_ext(spr_theworld, 0, x-16*right, y-8+sin(current_frame/8)*3, right, image_yscale, image_angle, image_blend, image_alpha);
	if stand = 1 and mywep = 0 and maxpunches = 0
	draw_sprite_ext(spr_theworld, 0, x+lengthdir_x(16,gunangle), y+lengthdir_y(16,gunangle)+sin(current_frame/8)*3, right, image_yscale, image_angle, image_blend, image_alpha);
	if stand = 1 and mywep = 0 and maxpunches > 0
	draw_sprite_ext(spr_theworld, 1, x+lengthdir_x(16,gunangle), y+lengthdir_y(16,gunangle)+sin(current_frame/8)*3, right, image_yscale, image_angle, image_blend, image_alpha);
}
instance_destroy()
#define freeze_draw
with enemy
if "frozen" in self
{
	draw_sprite_ext(spr_hurt, 0, x, y, right, image_yscale, image_angle, make_color_rgb(55,139,210), 1);
	draw_sprite_ext(spr_hurt, 0, x, y, right*0.65, image_yscale, image_angle, make_color_rgb(177,209,236), 1);
	draw_sprite_ext(spr_hurt, 0, x, y, right*0.35, image_yscale, image_angle, c_white, 1);
}
instance_destroy()
//menu sprites and stuff
#define race_portrait
return global.portrait;

#define race_mapicon
return global.spr_mapicon

#define race_menu_button
sprite_index = global.spr_select

//name, abilities, starting weapon, and throne butt
#define race_name
return "DIO";

#define race_text
return "@dDOESNT NEED GUNS#@wBRINGS HIS OWN WEAPONS#@rVAMPIRIC REGENERATION#@yTHE WORLD";

#define swep
return 0;

#define race_tb_text
return "LESS RADS NEEDED FOR STAND UPKEEP";

#define race_ultra_button
sprite_index = global.spr_ultras;
image_index = argument0 + 1;

#define race_ultra_name
switch(argument0){ //ultra names
	case 1: return "TOKI WO TOMARE";
	case 2: return "UNENDING CHARISMA";
}

#define race_ultra_text 
switch (argument0){ //ultra words
	case 1: return "TIME STOPS"; //ITS A MEME OK
	case 2: return "RECIEVE NEW TOYS TO PLAY WITH"; //probably bad
}

#define race_ultra_take
with Player{ //make sure you get the ultras
	ultra[argument0] = 1;
}

#define race_ttip
return["GOODBYE JOJO","USELESS","TOKI YO TOMARE","WEAKLING, WEAKLING!"];//i really love tips ok

