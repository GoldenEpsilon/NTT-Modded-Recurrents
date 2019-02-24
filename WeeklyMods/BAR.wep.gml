#define init
	//weapon sprite
	global.sprBAR = sprite_add_base64( "iVBORw0KGgoAAAANSUhEUgAAABoAAAAMCAYAAAB8xa1IAAAAyklEQVQ4jcWUPQrCQBSE54lnSSXkBpL0qdOFgKVYW4jFCsETeIFgZ23v4g3SphTxEDZjIRt3MQkaow4s7Fse87GzP0ISv9DALkSEIsJwJf2TSIIkAnUvZ4uMAHobxl9MdGYXWoFRnGAchACAoz5U83c1n05AUgBg2NR0Ol9q513lnJFWYOp7TsN+t/0YAuARnYhUkLwoEcVJL6DW6FLfQ24BAoXqGo6uWSdgLSgvSsfc1ma9fNncfqNOdGaxCWJLq2ezNslffoZv6gZoZGfS264G+QAAAABJRU5ErkJggg==", 1, 0, 4)

#define weapon_name
	return "BIG ASS REVOLVER";

#define weapon_sprt
	return global.sprBAR;

#define weapon_type
	return 1;

#define weapon_auto
	return false;

#define weapon_load
	return 12;

#define weapon_swap
	return sndSwapPistol;

#define weapon_area
		return 10;

#define weapon_text
	return "Big gun for big problems"; //loading tip

#define weapon_fire
	sound_play(sndHeavyRevoler)
	weapon_post(6, -6, 40)
	var BAR = instance_create(x, y, HeavyBullet);
	with(BAR){
		team = Player.team
		creator = Player.id
		damage = 30
		speed = 16
		direction = (Player.gunangle + random_range(-1,1))
		on_wall = BAR_wall
		image_angle = direction
		
	}

#define BAR_wall
	instance_destroy()