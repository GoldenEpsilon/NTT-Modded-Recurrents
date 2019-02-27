#define init // Global Variables, These Load When Mod Loads
global.gce = 0;
global.button = sprite_add("Crown Of Slaughter.png",1,12,16);
global.spr_idle = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABHUlEQVQ4ja2TMU7DQBBFH9xgJUsh9ClcTI+EtKSgR3IaKuqILg2HQEmbA0BjuYhEGaUiEhJ9ii1ygDhcYijImvV6lVDwJUve8f43f8c2/LM0utdEraXz8GEp0hhra/GXrz0PBh1ICACgFKG2lsfNpqnV1lIYw0O/TwxpAe4PptDcy3N6ed7Un7ZbgLMYoKUIpQhDY5j/HKUBjaoKgKssiwP/koIZMDSmlcBr7xwvu10rRWcGXmH3vXOMqqpjPpkgnMVchIv1OuVrSQ8gLUW0MEZra7UwJvVNpAGvt6ibZvr1eamh3DRLAuIoCnB9c9chf7y/JT2psxyL2dkfvwUdT2b4FIvlCr9eLFen4E13v0nHk1lr/RdA3OXonwjwDez0h924Yi0iAAAAAElFTkSuQmCC",1,8,8);
global.spr_walk = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGAAAAAQCAYAAADpunr5AAACHElEQVRYheVYv0sjQRh9prAfbkW93mKL6QQFZbXw0E6IIFbWQWyCYuGfIC52wfpsloUL2JlLpSBcfSlWsFWMIvgnfBY6w+zO7GY2E5GwD5aEb/a99735sRsCjBaU+U6G2ldi7PxrrgLqWMS55PWDAOIStZO5uYEaVfOvuQpkEXGOfhBgr9eTtX4QoM4YdmdnUaBRSf/sCXAJgJ1Pjsqd9n1M+76sH93fA8DEqAKMu3/NVeATFHGOiHOsMobWx06SOltxDABY9Ly83JX1n1AFAGCVsRT5z/Z2SqBgB2kaIoDAc5Lg99OTSaOy/oVNlAig8fd6PbQ4T31+4QSOrb/2DhBQj89zkmArjovMNQhTodXiXHCtUBV/q2MoBGdubkw8FQR8vMgAIH54kI20394GcivuLwUo4pwizqnOGPWDgOqMmX4TG/kXa6Dk1KOXfz9JRXLqWfGr5q89xy7WgPkNDz+WJzG18CgH7sIp+IevJk42AJZWNrWB2+vLPM9K+2sL4BgAAKjRDHF+dpA37hrAWuPgeB9/r/7LXtqdLurrv4r4LvkH5bbpHdRohupxy142kPcvrWxSu9OlRjOkdqdrq5Hrb6khMxRkKd2/Bdc0XnoOtP8+DE3YIBXAovkUt9EM88JbLeCACSucxEzOlJbFBBr9ymbQVtFyBxi1Si5ciuPiW/J+laflV2rD9KLyhu3LifwdDQ8d1II70p7eAWBnOC6cbAGJAAAAAElFTkSuQmCC",6,8,8);
//Set Sprites
#define crown_object
spr_idle = global.spr_idle;
spr_walk = global.spr_walk;
#define step

// Friendly Projectiles Dmg Times 1.5
with(enemy){
if object_index = BanditBoss||object_index = ScrapBoss||object_index = LilHunter||object_index = FrogQueen||object_index = HyperCrystal||object_index = TechnoMancer||object_index = Nothing||object_index = Nothing2{
	if random(1)<=.3 && "new" not in self{
		new = 1;
		meleedamage *= 2;
		raddrop *= 2;
		if raddrop=0 raddrop=2
		image_blend = make_colour_rgb(200, 100, 225);
		hypercharged = 1
		maxhealth *= 3
		my_health = maxhealth
	}
}
	if random(1)<=.1 && "new" not in self{
		new = 1;
		meleedamage *= 2;
		raddrop *= 2;
		if raddrop=0 raddrop=2
		image_blend = make_colour_rgb(200, 100, 225);
		hypercharged = 1
		maxhealth *= 3
		my_health = maxhealth
	}
		new = 1;
	if "hypercharged" in self && hypercharged == 1{
	if random(1) < .5{
			instance_create(x+irandom_range(-sprite_width/2,sprite_width/2),y+irandom_range(-sprite_width/2,sprite_width/2),Curse)
}
}
	if "hypercharged" in self && my_health <= 0{
sound_play(sndCursedPickup);
repeat(10){
instance_create(x+irandom_range(-sprite_width,sprite_width),y+irandom_range(-sprite_width,sprite_width),Curse)}
pickup_drop(50,20)
if object_index = BanditBoss{
instance_create(x,y,HealthChest)
instance_create(x,y,BigWeaponChest)
}
if object_index = ScrapBoss{
instance_create(x,y,HealthChest)
instance_create(x,y,BigWeaponChest)
}
if object_index = LilHunter{
instance_create(x,y,HealthChest)
instance_create(x,y,BigWeaponChest)
}
if object_index = FrogQueen{
instance_create(x,y,HealthChest)
instance_create(x,y,BigWeaponChest)
}
if object_index = HyperCrystal{
instance_create(x,y,HealthChest)
instance_create(x,y,BigWeaponChest)
}
if object_index = TechnoMancer{
instance_create(x,y,HealthChest)
instance_create(x,y,BigWeaponChest)
}
if object_index = Nothing{
instance_create(x,y,VenuzAmmoSpawn)
instance_create(x,y,VenuzWeaponSpawn) // throne drops lots of shit
}
}
}

with projectile{
	if instance_exists(enemy) and "hyper" not in self and team <> 2{
		near = instance_nearest(xstart,ystart,enemy)
		// if "hypercharged" in creator and creator.hypercharged == 1{
		if "hypercharged" in near and near.hypercharged == 1{
		image_blend = make_colour_rgb(150, 100, 250);
			damage*=2;
		}
	hyper = 1
	}
}


#define crown_name // Crown Name
return "CROWN OF SLAUGHTER";

#define crown_take
sound_play(sndMenuCrown);

#define crown_text // Description
return "SOME @wENEMIES# @sARE @wHYPERCHARGED";

#define crown_button // Icon
sprite_index = global.button;

#define crown_tip // Loading Tip
return choose("THE BIGGER THEY ARE","@pHYPERCHARGED @wBOSSES@s DROP SEVERAL @wREWARDS","JAMMED @bSHIELDERS @sJAM PROJECTILES#THEY REFLECT");

#define crown_avail // L0
return GameCont.loops = 0;