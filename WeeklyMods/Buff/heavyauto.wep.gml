weapon_set_area(105,-1)
weapon_set_name(105,"old HEAVY AUTO CROSSBOW")
#define weapon_name
	return "HEAVY AUTO CROSSBOW"; // Name

#define weapon_type
	return 3; //  Bolt Wep

#define weapon_cost
	return 2; //cost

#define weapon_load
	return 7; //reload

#define weapon_auto
	return 1; // automatic

#define weapon_area
	return 16; //+1 each portal

#define weapon_laser_sight
	return true; //bolt weapon without laser sight
	
#define weapon_swap
	return sndSwapBow; // Swap sound

#define weapon_sprt
	return sprHeavyAutoCrossbow

#define weapon_text
	return "the classic"; // Loading Tip
	
#define weapon_fire
sound_play(sndHeavyCrossbow)
with instance_create(x, y, HeavyBolt){
	team = other.team
	creator = other
	hitid = [sprite_index, "HEAVY BOLT"];
	motion_set(other.gunangle+(random_range(1,-1)*other.accuracy),16)
	image_angle = direction
	//damage = 50
	//sprite_index = sprHeavyBolt
	}
weapon_post(4, 10, 3);