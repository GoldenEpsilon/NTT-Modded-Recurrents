global.button = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAAACXBIWXMAAAsSAAALEgHS3X78AAAAG3RFWHRTb2Z0d2FyZQBDZWxzeXMgU3R1ZGlvIFRvb2zBp+F8AAADAUlEQVRIx52WP0gbYRjGn8Op0GI6WKhCSYsgORxCFoOLZwQdAodNwbWCUEy9CuLgVvS2DkUISkQoOHSSRovgEEHjJB6U4FAiBZEomIIOHs7CdQjv5/t9d5de/Lbku7y/PO+f5z3N1FMe2NmpVWEZtvg8HBvg10iN9qC6d4V3P8cwnR6R7hp3t1CPxgFq8DAAAHzd3MLK4WcfRAUJQFDwVoAwFSpEM/WUFxY8CBBVBUE0AF4mmYUeECgoeLsqtEwy66nBa64DPTYQCQCgJUTLJLPeTHwWFdcRwQFEAhCk4jqhqZIAFPyscQpTnwwFRFHRdXOImy6jCQCAmfgsVusFnDVOAaBtQJgKAaCUzB3l2wLE8/0AgHrxN4YWTVxen0sQASAVlKqwGqRGe0RQANh6Wxb126ltoLc7gYOTXQGRABxCbcoLyouqwlfrBdEcAES6fAAA+Pbhiy9g2IxUXAfzEznx7NxRHsuDRVF07dWLNx4A9HYnxI/1FrnnAK6ElKp10CzD9mqug7PGqQSZic/6UsDBVCeeyni+H5oGuciWYXt8wLgCXoPq3pUEaQW4TwMWRmSAOsU8zwSZWl8Qdzu1DZj6JABgfiIn/fsV7LcGqFbB80tBCXJ5fS6lkqenaP0KBtA0Lw8WfVuM2zp/Pgi0drwPrTRe9qjduIKDk11f51iGDWoIfpYHi0iN9uD1x36UxsvCNrzvnfIcUCep3aIGpGeGYwPIbY8BAD4N2yJl92mgw+rE1o/NhzngsxAWMKjw1b0r5LbHfIClmw7YS0+bKSIX7e1O+FSolsCnmu44gM77ZxfNLiqNl72K6wijijrJqpqp9QXfnwyd5McAhhZNqJZzcLL7eC9S0zd3lA9s1f92URQApVhdNmIfcH+hfRwVQA3CLVp6bbEM2+NS1cURdmquI4bRMmyhhkMad7cPk8zbkBuZagvqhGeSWcm7CCBeHVXAar0QaBNBZgYAa8f7QgWtSlNPyfuA5FHw6fQIKhcNtHP+/G1Of9/LBPqePxHf/wPhzA9Z521yawAAAABJRU5ErkJggg==",1,12,16)
global.icon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAACXBIWXMAAAsSAAALEgHS3X78AAAAG3RFWHRTb2Z0d2FyZQBDZWxzeXMgU3R1ZGlvIFRvb2zBp+F8AAAA/0lEQVQ4y73TMWvCQBTA8f/R7voZDiIIrhKKWmix30GISLYsHV3NkEDbIWOXbq3op7C4iCDOQiQFv4MfQF4XEzBeVNrSt72D+7137+6UiPCbUH8OKKUEQESUKb8ImExnPNy3EBGVz38EDIKI0O9j6sQIDIIIINuUAqZOjEPMV63bDSrVGlpb3DbtA6QQcFyPJF5Rqday9SRe8fT8YgbSaadRtxssF/Ms98OIzeYLrS1Cv28GJtMZAO/DEW6vS/uuBezdcZnuZ+c04LgeWltZpUCH4Gz3iGJ3A9cLDm6j8AiO6/GxfuPqsQTA7nV7tPloiHmkKM5e4yns7EP699/4DWc9tOEofri6AAAAAElFTkSuQmCC",1,8,8)


#define skill_name
	return "Flaming Palms";
	
#define skill_text
	return "@rfire @smelts @wprojectiles";

#define skill_button
	sprite_index = global.button;
	
#define skill_icon
	return global.icon;
	
#define skill_wepspec
	return 1;

#define skill_tip
	return "spicy";
	
#define skill_take
	sound_play(sndMutEagleEyes)
	
#define step
with FlameShell{
	with instance_create(x,y,Flame){
		team = other.team
		creator = other
		captainflameshell = 1
		image_speed = 3
		motion_add(other.direction,1)
		}
	}
with Flare{
	with instance_create(x,y,Flame){
		team = other.team
		creator = other
		captainflameshell = 1
		image_speed = 3
		motion_add(other.direction,1)
		}
	}
with instances_matching_ne(projectile,"object_index",Flame,EnemyLaser,Laser,LastBall,Throne2Ball,BigGuardianBullet,FrogQueenBall,TrapFire,CustomProjectile) if ((place_meeting(x,y,Flame) && team != Flame.team)||(place_meeting(x,y,CustomProjectile)and team != CustomProjectile.team)){
	with instance_create(x,y,TrapFire){
		team = 0
		sprite_index = sprSmallExplosion
		sound_play_pitchvol(sndExplosionS,1,0.5)
		hitid = [SmallExplosion,"Exploded Bullet"]
		damage = 4
		image_blend=c_red
		image_speed = 0.8
		//image_xscale = 1.3
		//image_yscale = 1.3
		}
	with Flame if distance_to_object(other)<10 
			{
			x = -100;
			y = -100;
			}
	with instances_matching(CustomProjectile,"sprite_index",sprTrapFire) if distance_to_object(other)<10 
			{
			x = -100;
			y = -100;
			}
	instance_destroy()
	}
with instances_matching(Flame,"captainflameshell",1) if place_meeting(x,y,TrapFire){
	if instance_exists(creator){
		with creator instance_destroy()
		//trace("hwes ded")
		}
	instance_destroy()
	}
with Flame if place_meeting(x,y,Explosion) && !place_meeting(x,y,enemy){
	instance_destroy()
	}