global.button = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAAACXBIWXMAAAsSAAALEgHS3X78AAAAG3RFWHRTb2Z0d2FyZQBDZWxzeXMgU3R1ZGlvIFRvb2zBp+F8AAACaUlEQVRIx62WP0gbcRTHv3cEwalFhNChw20tCWQQsUKhkA4ROkSyXEAQ3NqQqW61Y9tB6CanUwtFobcccRDPRVoQIoiDcIJbxlqQYLt0kbsOx/vl3e/PJYa8JeGSfD/vfX/v9/Ksx08XEkjx4OEjjBN/bn8pzywOGFc4DyQAkxKPuh21gkmIk/Cu18JSo4Uw8HB6djUZQNTtCGGKMPDSCsqLy8mkxXMBVGp5cXlkwM11pBU3AuY2Cjj/eDcUYsr+yHEBAMnnF3qLRoXI2YeBh+a3NHv/omQ+Axmgs03OPgw8WOs/4VYuxXf8i5LeIqduY6ZsZwB70yWs/Bv8WM6cxClzeq8FbB5OwT+JFYBbucT31azfZAkA3HZS6NvKS3xxfqsAk7gM4RYAQK3nIww8YVcuYG6jAACZA+YQbg8XpdZcarRw5LiqRVy8H8Xo7cfKoRLk5joS4rpX3kkZgGyPrrsIIneQLvtus5gCKHv3uZ0L0FWS10kZwObhVFrWEABBVotF1P7Ootbzxc3l0W0WBxeNA7Z37hT/h838vemSIrz19Xh8gM4uOUjPApDwB/cByGMFgDhLMU3b7z4kW5/eiw8IcN+Qhek8reqrRnJ8EMCp23jzuoDtnTSTUSFOfSA6U7bVrYIsoizoolFwkOlucIgC4BdNroIyIiDB5BsuR3utCgA46P9QZxFB/JMY/ShWyqYxYopdr6WvQDfwuKjJY16dfLONe5EOIp8ND1k8Mz5MexH/ZzMF2ZW7tuStjrxDOEg+B9PaIja7vOWXukTXir39GO21Kp7NP1FGtxYwCojDOECO07MrAMB/k7APZzYmR54AAAAASUVORK5CYII=",1,12,16)
//thanks   _killburn   icon design concept
// and mutation name

global.icon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAQCAYAAADJViUEAAAACXBIWXMAAAsSAAALEgHS3X78AAAAG3RFWHRTb2Z0d2FyZQBDZWxzeXMgU3R1ZGlvIFRvb2zBp+F8AAAA1klEQVQoz42TMQrCUAyGv4j0QiIOeoGewMHFzQtIF9FB6VK8gJuLgyfoBXQQ6YVKMS6+ktI8asaW78ufhCeqSqxERAFUVdz/Q/BkN6bKG1fgwqFjUSbcHx+qvMFL0INFRIsyAeiBIqJW0IFDzOViBECW1r2OVtDCNmqoLK39WX8CUVVERPfHM6fD9i84CATQ1XoDwO166cB2ZlcAKMB0Nuf9enbgoeht7PDRLszrbrfeW5i9r5W4p/PubAVANEkUtvGDJFQUHhLY+aMPw+7AK3fmfwThdF/smb3t8rq4sQAAAABJRU5ErkJggg==",1,8,8)



#define skill_icon
	return global.icon;

#define skill_button
	sprite_index = global.button;

#define skill_name
	return "compound elbow";
	
#define skill_text
	return "@wbolts @sricochet";


#define skill_wepspec
	return 1;

#define skill_tip
	return "simple geometry";
	
#define skill_take
	sound_play(sndMutBoltMarrow)
	
#define step
with BoltTrail {
	image_yscale += 0.07
	}

with Bolt{
alarm1 = 0

if speed = 0{
	
	if ("wallbounce" not in self){
		wallbounce = 1
		}
		else wallbounce += 1
		
	if wallbounce > 5{
		friction = 100
		speed = 0
		canhurt = 0
		}
	else{
	if ("bowcharge" in self){
		speed = bowcharge-(wallbounce*2)
		}
		else{
		speed = 24-(wallbounce*2)
		}
	
	move_bounce_solid(false);
	direction += random_range(-2,2)
	image_angle = direction
	canhurt = 1 
	damage -= 2

	}
		
	}
	}
	
with Splinter{
alarm1 = 0
if speed = 0{
	
	if ("wallbounce" not in self){
		wallbounce = 1
		}
		else wallbounce += 1
		
	if wallbounce > 5{
		friction = 100
		speed = 0
		canhurt = 0
		}
	else{
	speed = 24-(wallbounce*2)
	move_bounce_solid(false);
	image_angle = direction
	canhurt = 1 
	damage -= 1
	}
		
	}
	}

with HeavyBolt{
alarm1 = 0
if speed = 0{
	
	if ("wallbounce" not in self){
		wallbounce = 1
		}
		else wallbounce += 1
		
	if wallbounce > 5{
		friction = 100
		speed = 0
		canhurt = 0
		}
	else{
	speed = 16-(wallbounce*2)
	move_bounce_solid(false);
	image_angle = direction
	canhurt = 1 
	damage -= 5
	}
		
	}
	}

with UltraBolt{
alarm1 = 0
if speed = 0{
	
	if ("wallbounce" not in self){
		wallbounce = 1
		}
		else wallbounce += 1
		
	if wallbounce > 5{
		friction = 100
		speed = 0
		canhurt = 0
		}
	else{
	speed = 16-(wallbounce)
	move_bounce_solid(false);
	image_angle = direction
	canhurt = 1 
	damage -= 3
	}
		
	}
	}

with Seeker{
alarm1 = 0
if speed = 0{
	
	if ("wallbounce" not in self){
		wallbounce = 1
		}
		else wallbounce += 1
		
	if wallbounce > 3{
		friction = 100
		speed = 0
		canhurt = 0
		}
	else{
	speed = 5
	move_bounce_solid(false);
	image_angle = direction
	canhurt = 1 
	damage -= 2
	}
		
	}
	}
	
with Disc dist -= 0.66

with DiscTrail image_speed = 0.5