#define init
	global.sprite = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAABYAAAAHCAYAAAAMPr0FAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTczbp9jAAAAfElEQVQoU52PwQmAMAxFO4VC770oPbqEQidw/y0k9qdE2zQIVXgEfsxL6ohomPxdgtUHZqipRUJcNzS6HPCMlljgZz8HFsWlCNNxckWOJTXIM/3GL9JehNbFWCILM+UKgCGrAj+FB5Gg1q/Cskb8B0vcXCyNUXhYid+M3A147iDWovU8yQAAAABJRU5ErkJggg==",0,3);
	
#macro defmaxcharge 3 //change this number to change the maximum amount of charges for the weapon
	
#define weapon_name 			return "Charge Template";			
#define weapon_sprt 			return global.sprite;		
#define weapon_swap				return sndSwapHammer;		
#define weapon_area				return -1;					
#define weapon_type				return 5; 					
#define weapon_cost				return 1; 	
#define weapon_auto				return true; //keep this set to true		
#define weapon_load				return 12;					
#define weapon_melee			return true;					
#define weapon_text				return "sample text";
	
#define weapon_fire
	//setup lightweight object
	if !is_object(wep)
		wep = {wep: mod_current, maxcharge: defmaxcharge, charge: 0};
	//charging
	if wep.charge < wep.maxcharge
		wep.charge += 1;
	if wep.charge > 1
	{
		if weapon_is_melee(wep) //melee telegraph effect
			if wepangle
				wepangle += 10;
			else
				wepangle -= 10;
		gunshine = 7; //shine
		if wep.charge == wep.maxcharge //max charge tell
		{
			if fork()
			{
				wait(0)
					sleep(100); //freeze frames my dude
				exit;
			}
			with instance_create(x+lengthdir_x(0.5*sprite_get_width(weapon_get_sprite(wep)),gunangle+wepangle),y+lengthdir_y(0.5*sprite_get_width(weapon_get_sprite(wep)),gunangle+wepangle),ImpactWrists)
				depth = -3;
			sound_play_pitchvol(weapon_get_swap(wep),0.6,0.4);
		}
		else //charge tell
			with instance_create(x+lengthdir_x(0.5*sprite_get_width(weapon_get_sprite(wep)),gunangle+wepangle),y+lengthdir_y(0.5*sprite_get_width(weapon_get_sprite(wep)),gunangle+wepangle),ThrowHit)
				depth = -3;
		if !weapon_is_melee(wep)
			sound_play_gun(sndMeleeFlip,0,-6); //melee reload sound
		weapon_post(2,0,0); //some subtle wkick
	}
	
#define step
	with(Player)
	{
		if lq_get(wep,"wep") == mod_current //check if the gun held is the right gun
		{
			if lq_get(wep,"charge") == lq_get(wep,"maxcharge")
			{
				//max charge effects
				reload = weapon_get_load(wep); //disable charging at max charge
				if !gunshine //make the gun shine
					gunshine = 7;
				if random(4) < current_time_scale
					with instance_create(x+lengthdir_x(0.5*sprite_get_width(weapon_get_sprite(wep)),gunangle+wepangle),y+lengthdir_y(0.5*sprite_get_width(weapon_get_sprite(wep)),gunangle+wepangle),ThrowHit)
						depth = -3;
			}
			if ((button_released(index,"fire") && canfire) || (button_pressed(index,"swap") && canswap)) && lq_get(wep,"charge") //firing script
			{
				if weapon_is_melee(wep) //melee weapon flip
					if wepangle 
						wepangle = -100;
					else
						wepangle = 100;
				mod_script_call("weapon",mod_current,"real_weapon_fire",self,lq_get(wep,"charge"),lq_get(wep,"maxcharge"))
				lq_set(wep,"charge",0); //reset charge
			}
		}
		if lq_get(bwep,"wep") == mod_current //check if the gun held is the right gun
		{
			if lq_get(bwep,"charge") == lq_get(bwep,"maxcharge")
			{
				//max charge effects
				breload = weapon_get_load(bwep); //disable charging at max charge
				if !gunshine //make the gun shine
					gunshine = 7;
				if random(4) < current_time_scale
					with instance_create(x+lengthdir_x(0.5*sprite_get_width(weapon_get_sprite(wep)),gunangle+bwepangle),y+lengthdir_y(0.5*sprite_get_width(weapon_get_sprite(wep)),gunangle+bwepangle),ThrowHit)
						depth = -3;
			}
			if ((button_released(index,"spec") && canfire && canspec) || (button_pressed(index,"swap") && canswap)) && lq_get(bwep,"charge") //firing script
			{
				if weapon_is_melee(bwep) //melee weapon flip
					if bwepangle 
						bwepangle = -100;
					else
						bwepangle = 100;
				mod_script_call("weapon",mod_current,"real_weapon_fire",self,lq_get(bwep,"charge"),lq_get(bwep,"maxcharge"))
				lq_set(bwep,"charge",0); //reset charge
			}
		}
	}
	
#define real_weapon_fire(_target,_charge,_maxcharge) //put the real fire code here
	with(_target)
	{
		sound_play_gun(sndEnergySword,0.2,0.3);
		if _charge < _maxcharge
			with instance_create(x,y,EnergySlash)
			{
				projectile_init(_target.team,_target);
				motion_add(_target.gunangle,2);
				image_angle = direction;
			}
		else
			with instance_create(x,y,EnergyHammerSlash)
			{
				projectile_init(_target.team,_target);
				motion_add(_target.gunangle,2);
				image_angle = direction;
				image_yscale = 2; //for fun
			}
	}