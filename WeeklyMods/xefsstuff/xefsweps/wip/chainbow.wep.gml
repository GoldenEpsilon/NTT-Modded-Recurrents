#define init
global.sprChainbow = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAB8AAAAMCAMAAACtMpY+AAAAD1BMVEUAAAAAAAAaFyYtKzZOS10Iw687AAAAAXRSTlMAQObYZgAAAFxJREFUeNp9kAEKACEMw9bW/7/52qEcipiBQ9INsXYQ6kprjTGEmzGt7wErCfYkdw+TRiu5cuLHgrlTvbkrqGH8Ah0Njqzx6sBalYGCx48XzBai9foC26e2fXDaDyNWAWD810UUAAAAAElFTkSuQmCC", 4, 3);

global.spr_cbBolt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABwAAAAHCAMAAAAswt3+AAAAG1BMVEUAAAAuNz5MVl1seoQAAAAuNz4/GRNMVl1seoSD9NCoAAAABHRSTlMAAAAAs5NmmgAAAE1JREFUeNp9jVsKADEIA61GzP1PvI19QH92QJohlFgzIiCWLbkpDEkyd+uYojw6oOaBhUN1C1YKwsH5VqOg9u/nMI2/m3Y2w7eLsCvqPiL9AtKilSbEAAAAAElFTkSuQmCC",1,10,3);
global.msk_cbBolt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABwAAAAHCAMAAAAswt3+AAAACVBMVEUAAAAAAAD///+D3c/SAAAAAXRSTlMAQObYZgAAABBJREFUeAFjoBVgxAloZSMACxoAG/LiygcAAAAASUVORK5CYII=",1,10,3);

global.spr_cbChain = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAEAAAADCAQAAAD41K0JAAAADklEQVQI12Ng+M8AAv8BCAEB/71LLrwAAAAASUVORK5CYII=",1,0,2);

global.cbBoltDrawer = noone;

#define weapon_name
return "CHAINBOW";

#define weapon_sprt
return global.sprChainbow;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
/*
with(self) if (instance_exists(self)) && ("wep" in self) && (wep = "chainbow") && ("cbAmmoMax" in self){
	return (5 + 25/cbAmmoMax);
}
else return 40;
*/
return 5;

#define weapon_cost
return 10;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return -1;

#define weapon_text
return "BALL IN A CUP";

#define step

if (argument0) {
	if !instance_exists(global.cbBoltDrawer) {
		global.cbBoltDrawer = instance_create(0, 0, CustomObject);
		with(global.cbBoltDrawer){
			script_bind_draw(draw_cbBolt, depth+0.1);
		}
	}

	cbAmmoMax = (ammo[3] div 10) + array_length(instances_matching(CustomProjectile,"cbCreator",id));
}

#define weapon_fire

sound_play_pitch(sndCrossbow, random_range(1.1,1.3));
sound_play_pitchvol(sndDiscgun, random_range(0.8,0.9), 0.5);

with instance_create(x+lengthdir_x(20,gunangle),y+lengthdir_y(20,gunangle),CustomProjectile) {
	iscbBolt = true;
	cbCreator = other;

	creator = other;
	team = other.team;

	damage = 10;
	speed = 16;
	
	direction = other.direction;
	speed = other.speed / 2;
	motion_add(other.gunangle, 16);
	image_angle = direction;
	
	sprite_index = global.spr_cbBolt;
	mask_index = global.msk_cbBolt;
	
	cbReturn = false;
	cbHold = 10;
	
	script_bind_step(cbBolt_step, 0, id);
	
	on_hit = script_ref_create(cbHurt);
	on_wall = script_ref_create(cbWall);
}

#define cbBolt_step(Me)
with(Me) {
	if ((cbReturn) && (instance_exists(creator))) {
		direction += angle_difference(point_direction(x,y,creator.x,creator.y), direction)/2;
		image_angle = direction + 180;
		speed += 0.5;
		if (distance_to_object(creator) < 25) {
			image_alpha -= 0.25;
			speed *= 0.5;
		}
		if (image_alpha <= 0) {
			creator.ammo[3] += 10;
			instance_destroy();
		}
		
	} else {
		if (skill_get(21)) {
			var target = instance_nearest(x,y,enemy);
			direction += angle_difference(point_direction(x,y,target.x,target.y), direction)/15;
			image_angle = direction
		}
	
		if (speed > 0) {speed -= 1;}
		else {
			cbReturn = true;
			direction += 180;
		}
	}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define cbHurt
if ((other.team != team) && (other.sprite_index != other.spr_hurt) && (speed > 0)) {
	if (cbReturn) {
		projectile_hit(other, damage/2, 5, direction + 180);
	} else {
		projectile_hit(other, damage, 10, direction);
		speed = 0;
		direction += 180;
		cbReturn = true;
	}
}

#define cbWall
if (cbReturn) {
	x += lengthdir_x(speed,direction);
	y += lengthdir_y(speed,direction);
} else {
	x += lengthdir_x(speed/2,direction);
	y += lengthdir_y(speed/2,direction);
	speed = 0;
}


#define draw_cbBolt
with instances_matching(Player,"wep","chainbow") {
	if (ammo[3] >= 10) {
		var cbAmmo = ammo[3] div 10
		var cbAngleMod = 50/cbAmmo;
		var cbAngle = gunangle;
		repeat(cbAmmo) {
			draw_sprite_ext(global.spr_cbBolt,0,x+lengthdir_x(10,gunangle)+lengthdir_x(5,cbAngle),y+lengthdir_y(10,gunangle)+lengthdir_y(5,cbAngle),1,1,cbAngle, c_white, image_alpha);
			cbAngle += (5 + cbAngleMod) * right;
		}
	}
}

with instances_matching(CustomProjectile,"iscbBolt",true) {
	if (instance_exists(creator)) {
		draw_sprite_ext(global.spr_cbChain, 0, x, y, distance_to_object(creator) + 15, 1, point_direction(x,y,creator.x,creator.y), c_white, image_alpha);
	}
}