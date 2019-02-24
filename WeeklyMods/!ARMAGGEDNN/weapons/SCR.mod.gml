#define scr_sound(name)
var r = global.sounds[?name];
if (r == null) {
	r = sound_add("sounds/" + name + ".ogg");
	global.sounds[?name] = r;
}
return r;

#define scr_create(rx, ry, name)
// Used for translation of scr's object names to NTT object indexes.
var r = null;
switch (name) {
	case "Bullet3": r = BouncerBullet; break;
	case "Bullet4": r = UltraBullet; break;
	case "Bullet6": r = FlameShell; break;
	case "SmallGrenade": r = MiniNade; break;
	case "MiniPlasmaBall": r = PlasmaBall; break; // (is that the right one?)
	default:
		trace("scr: Can't create " + name);
		return noone;
}
if (is_real(r)) {
	return instance_create(rx, ry, r);
}

// The following are used by weapon scripts:
#define scr_wep_laser_brain
return skill_get(17);

#define scr_wep_dist
// Returns distance to mouse cursor, if applicable.
if (instance_is(self, Player)) {
	return point_distance(x, y, mouse_x[index], mouse_y[index]);
} else return 100;

#define scr_wep_long_arms
return skill_get(13);

#define scr_wep_eagle_eyes
return skill_get(19);

#define scr_wep_rad(num)
if (object_index != Player) return false;
if (GameCont.rad >= num) {
	GameCont.rad -= num;
	return false;
} else {
	ammo[weapon_get_type(wep)] += weapon_get_cost(wep);
	clicked = 0;
	sound_play(sndUltraEmpty);
	var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "NOT ENOUGH RADS";
	wkick = -2;
	drawempty = 30;
	return true;
}