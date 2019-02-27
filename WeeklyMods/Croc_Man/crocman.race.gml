#define init

global.sprIdle = sprite_add("Idle.png", 1, 12, 12)
global.sprWalk = sprite_add("Walk.png", 6, 12, 12)
global.sprHurt = sprite_add("Hurt.png", 3, 12, 12)
global.sprTeleport = sprite_add("Teleport.png", 2, 12, 12)
global.sprRadial = sprite_add("Radial.png", 1, 12, 12)
global.sprAnkh = sprite_add("Ankh.png", 1, 4.5, 6)

global.sprSelect = sprite_add("Select.png", 1, 0, 0)
global.sprPortrait = sprite_add("Portrait.png", 1, 40, 243)
global.sprMap = sprite_add("Map.png", 1, 10, 10)
global.sprUltraButtons = sprite_add("Ultras.png", 2, 12, 16)

global.sndTeleport = sound_add("Teleport.ogg")
global.sndCrush = sound_add("CrushHit.ogg")
global.sndAnkh = sound_add("Ankh.ogg")

#define create

	spr_idle = global.sprIdle;
	spr_walk = global.sprWalk;
	spr_hurt = global.sprHurt; // this is only visible in portals and when in fire with boiling veins
	spr_dead = mskNone // no corpse
	spr_sit1 = global.sprIdle;
	spr_sit2 = global.sprIdle;

	snd_hurt = -1; // he's never hurt
	snd_dead = -1; // he's either dead instantly or eternally not dead

	// the Croc Man has 3 HP in Spelunky
	// so why not here as well
	maxhealth = 3
	// his jumping ability doesn't translate well to NT, so we'll make him fast
	maxspeed = 4.5

	// for sound pitch
	teleported = 0

	hasankh = false
	shouldTeleport = false
	
	lastloop = GameCont.loops

#define race_name
	return "CROC MAN"
	
#define race_menu_button
sprite_index = global.sprSelect;

#define race_portrait
return global.sprPortrait;

#define race_menu_select
return global.sndTeleport;

#define race_mapicon
return global.sprMap;

#define race_text
	return "TELEPORTS AWAY FROM DAMAGE"

#define race_soundbank
	return char_steroids

#define race_tb_text
	return "SAFER TELEPORTS"

#define step

	nexthurt = current_frame - 30 // no i-frames
	
	shouldTeleport = false

	script_bind_end_step(health_monitor, 100, self)
	
	/*
	if button_pressed(index, "spec") {
		shouldTeleport = true
	}
	*/

	if GameCont.loops > lastloop { // refresh Ankh every loop
		lastloop = GameCont.loops;
		if ultra_get(mod_current, 1) hasankh = true
	}

	/*
	The teleportation system involves two checks: one in the "step" event which executes at the start of the frame
	before projectiles move and damage is dealt, and one at the end of the frame. Teleportation only occurs at the
	end of the frame, and at most once per frame.
	
	The details of the system were carefully chosen. Most other ways to do this, bullets end up disappearing when
	they shouldn't or melee enemies put their melee attack on cooldown when they shouldn't. Even now, "hit"
	bullets	might disappear rarely (if affected by telekinesis maybe).
	*/	
	
	with projectile if team != other.team && place_meeting(x+hspeed, y+vspeed, other) &&
	!((instance_is(self, TrapFire) || instance_is(self, Flame)) && skill_get(mut_boiling_veins) && other.my_health <= 4) {
		// mark enemy who shot this bullet as killer, should things go wrong
		other.lasthit = hitid
		with other {
			// we are teleporting, so nothing can hurt us this frame
			mask_index = mskNone
			shouldTeleport = true
		}
		break
	}

#define race_ultra_name(i)
switch(i) {
	case 1: return "THE ANKH"
	case 2: return "TELEFRAGGING"
}

#define race_ultra_button(i)
sprite_index = global.sprUltraButtons
image_index = i - 1

#define race_ultra_text(i)
switch(i) {
	case 1: return "PREVENT TELEPORTATION DEATH#ONCE PER LOOP"
	case 2: return "KILL MOST ENEMIES#IN TELEPORT DESTINATION"
}

#define race_ultra_take(i, z)
if z {
	sound_play(sndBasicUltra)
	if i == 1 {
		with instances_matching(Player, "race", mod_current) hasankh = true
	}
}

#define race_ttip
return choose("ELITE TEMPLE GUARD")

#define health_monitor(player)
	with player {
		if my_health < maxhealth || shouldTeleport { // if hurt or about to be hit by projectile
			my_health = maxhealth // no damage
			sprite_index = spr_idle // no hurting
			mask_index = mskPlayer // reset mask if it was disabled
			teleport()
		}
	}
	instance_destroy()

#define in_wall(_x, _y)
	return place_meeting(_x, _y, Wall) || !place_meeting(_x, _y, Floor) || place_meeting(_x, _y, InvisiWall)

#define teleport
	sound_play_pitch(global.sndTeleport, 1.05 - 0.1 * (teleported mod 2)) // unnecessary detail
	teleported += 1
	var lessened = skill_get(mut_bloodlust) + skill_get(mut_rhino_skin) + skill_get(mut_second_stomach) + skill_get(mut_sharp_teeth) + skill_get(mut_stress) + skill_get(mut_strong_spirit)
	var dist = (5 + irandom(3) - (lessened/3)) * 16 // the Spelunky wiki is actually wrong, in HD you never teleport 4 tiles, except through rounding maybe
	var dir = random(360)
	var _x = x; _y = y;
	_x += lengthdir_x(dist,dir); _y += lengthdir_y(dist,dir);
	var isCrushed = false
	
	if in_wall(_x, _y) {
		isCrushed = true
		var directions = [-90, 90, 0, 180]
		for(var i = 0; i < (skill_get(mut_throne_butt) ? 4 : 2); i++) {
			var odir = dir + directions[i]
			for(var o = 1; o <= 3; o++) {
				if !in_wall(_x - lengthdir_x(16*o, odir), _y - lengthdir_y(16*o, odir)) {
					_x -= lengthdir_x(16*o, odir)
					_y -= lengthdir_y(16*o, odir)
					isCrushed = false
					break
				}
			}
			if !isCrushed break
		}
	}

	teleport_afterimage()
	teleport_radial(false)
	
	x = _x
	y = _y
	
	teleport_radial(isCrushed)
	
	if isCrushed {
		if hasankh {
			x = 10016
			y = 10016
			hasankh = false
			sound_play(global.sndAnkh)
		} else {
			with instance_create(x, y, MeltSplat) depth = -8
			// prevent weapon drops
			wep = 0
			bwep = 0
			sound_play(global.sndCrush)
			instance_destroy()
		}
	} else if ultra_get(mod_current, 2) { // telefrag
		with instances_matching_ne(enemy, "team", team) {
			if place_meeting(x, y, other) && !instance_is(self, LaserCrystal) && !instance_is(self, InvCrystal) && !instance_is(self, Van) && !instance_is(self, FrogQueen) &&
			!instance_is(self, ScrapBoss) && !instance_is(self, HyperCrystal) && !instance_is(self, TechnoMancer) &&
			!instance_is(self, Nothing) && !instance_is(self, Nothing2) && !instance_is(self, Last) {
				my_health = 0
				// I'm opting to not go for special effects, just because in NT enemies only have one dying animation
				// unlike in Spelunky, where they can "gib" depending on who they are and what the damage source is
			}
		}
	}
	
#define teleport_afterimage
	with instance_create(x, y, CustomObject) {
		name = "teleport_afterimage"
		x = other.x
		y = other.y
		depth = other.depth
		sprite_index = global.sprTeleport
		image_speed = 0.5
		image_xscale = other.right
		on_step = script_ref_create(afterimage_step)
		t = 0
	}

#define afterimage_step
#macro LIFE 15
	if t >= LIFE {
		instance_destroy()
		exit;
	} else {
		image_alpha = 1 - (t*t / (LIFE*LIFE))
		t += 1
	}
	
#define teleport_radial(high)
	with instance_create(x, y, CustomObject) {
		name = "teleport_radial"
		x = other.x
		y = other.y
		depth = high? -7 : other.depth
		on_step = script_ref_create(radial_step)
		on_draw = script_ref_create(radial_draw)
		right = other.right
		t = 0
	}

#define radial_step
	if t >= 12 {
		instance_destroy()
		exit;
	} else {
		t += 1
	}

#define radial_draw
	// first, "smoke"
	draw_sprite_ext(global.sprRadial, 0, x, y, right*(1 + t/12), 1 + t/12, 0, c_white, 1 - (t/12))
	// next, purple and green colored light
	draw_set_blend_mode_ext(bm_dest_color, bm_one)
	draw_circle_color(x, y, 25 - 7 * max(0, t - 10), floor(t/2) mod 2 ? c_fuchsia : c_lime, c_black, false)
	draw_set_blend_mode(bm_normal)
	
// I'm still missing the sparkles

#define draw_end
if hasankh draw_sprite(global.sprAnkh, 0, x, y-20)
