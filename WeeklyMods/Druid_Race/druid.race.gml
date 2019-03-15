
	
	#define init // When Mod is First Loaded

 // Define Sprites Using Base64, sprite_add_base64("Base64", # of Frames, XOffset, YOffset);
global.Dead = sound_add("Storagething/DruidPooff.ogg")
global.ult2 = sound_add("Storagething/Directionalswitch.ogg")
global.ult1 = sound_add("Storagething/Shatter.ogg")
global.Blank = sound_add("Storagething/Silent.ogg")

global.spr_idle = sprite_add("Storagething/DruidIdle.png", 12, 12,12)
global.spr_walk = sprite_add("Storagething/DruidWalk.png", 8, 12,12)
global.spr_hurt = sprite_add("Storagething/DruidHurt.png", 3, 12,12)
global.spr_dead = sprite_add("Storagething/DruidDeath.png", 30, 12,12)
global.icon = sprite_add("Storagething/DruidIcon.png", 1, 12,12)
global.loadout = sprite_add("Storagething/DruidIcon.png", 1, 12,12)
global.turret = sprite_add("Storagething/MechanicTurret.png", 1, 12,12)
global.turretA = sprLightningBall
global.turretB = sprite_add("Storagething/DruidIcon.png", 1, 12,12)
global.turretAB = sprite_add("Storagething/DruidIcon.png", 1, 12,12)
//10
global.spr_ult[1] = global.turretA
global.spr_ult[2] = global.turretB
global.active = 1;
global.switchh = 0;
global.xy = 0;
global.new = 0

#define create
timer = 0; 
maxhealth = 6;
global.active = 1;
snd_wrld = sndMutant10Wrld;
snd_hurt = sndMutant10Hurt;
snd_lowa = sndMutant10LowA;
snd_lowh = sndMutant10LowH;
snd_valt = sndMutant10Valt;
snd_crwn = sndMutant10Crwn;
snd_spch = sndMutant10Spch;
snd_idpd = sndMutant10IDPD;
snd_cptn = sndMutant10Cptn;
snd_dead = global.Dead;

global.ultra[1] = 0;
global.ultra[2] = 0;
global.thronebutt = 0;
global.switchh = 0;
global.xy = 0;

//set the sprites. spr_chrg is the only one that isnt a default character sprite
spr_idle = global.spr_idle;
spr_walk = global.spr_walk;
spr_hurt = global.spr_hurt;
spr_dead = global.spr_dead;

#define step
with(Player){
if place_meeting(x,y,Portal){
	global.new = 1
}
}

with(Player){
if place_meeting(x,y,BigPortal){
	global.new = 1
}
}

with(Player){
if(sprite_index = spr_walk){
	global.new = 0
}
}




if my_health <= 0
{
	sound_play(global.Blank);
}

if my_health > 1
{
	global.active = 1;
}

if my_health <= 1
{
	global.active = 0;
}

if skill_get(5)
{
	global.thronebutt = 1;
}

with instances_matching(GuardianBullet,"team",2)
{
		image_blend = make_color_rgb(0,0,(255));
		image_xscale = 1 + (global.ultra[2] * (1))
		image_yscale = 1 + (global.ultra[2] * (1))	
}

with instances_matching(projectile,"force",120)
{
	image_alpha = 0.8
		if speed = 0{
			speed = 0.000001
			instance_create(x,y,PlasmaImpact){
				with instances_matching(PlasmaImpact,"team",2){
				image_xscale = 2
				image_yscale = 2
				image_speed = 0.6
				image_alpha = 0.5
				image_blend = make_color_rgb(0,0,(255));
				}
}
		}
}

with instances_matching(projectile,"force",120)
{
		image_xscale = 2+(sin(current_frame/8))
		image_yscale = 2+(sin(current_frame/8))
}

with instances_matching(projectile,"force",120)
{
	global.xy = image_xscale
}

with instances_matching(projectile,"team",1)
{
	if damage < 10000 and force < 1000
	{
		force = 1
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 2 and force < 1000
	{
		damage = 1
		force = 1000
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 3 and force < 1000
	{
		damage = 2
		force = 1000
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 4 and force < 1000
	{
		damage = 3
		force = 1000
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 5 and force < 1000
	{
		damage = 4
		force = 1000
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 6 and force < 1000
	{
		damage = 5
		force = 1000
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 7 and force < 1000
	{
		damage = 6
		force = 1000
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 8 and force < 1000
	{
		damage = 7
		force = 1000
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 9 and force < 1000
	{
		damage = 8
		force = 1000
	}
}
		
		with instances_matching(projectile,"team",1)
		{
	if damage = 10 and force < 1000
	{
		damage = 9
		force = 1000
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 11 and force < 1000
	{
		damage = 10
		force = 1000
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 12 and force < 1000
	{
		damage = 11
		force = 1000
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 13 and force < 1000
	{
		damage = 12
		force = 1000
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 14 and force < 1000
	{
		damage = 13
		force = 1000
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 15 and force < 1000
	{
		damage = 14
		force = 1000
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 16 and force < 1000
	{
		damage = 15
		force = 1000
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 17 and force < 1000
	{
		damage = 16
		force = 1000
	}
}

with instances_matching(projectile,"team",1
){
	if damage = 18 and force < 1000
	{
		damage = 17
		force = 1000
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 19 and force < 1000
	{
		damage = 18
		force = 1000
	}
}

with instances_matching(projectile,"team",1)
{
	if damage = 20 and force < 1000
	{
		damage = 19
		force = 1000
	}
}


//40
if instance_exists(Player)
{
	if my_health >= 0
	{
		if timer >= 0
		{
			timer-=1;
		}
		if timer == 0
		{
			repeat(3)
			{
				instance_create(x,y,Dust)
			}
		}
	}
}
//68
if instance_exists(Player)
{
	if (wep == 1) 
	{
		wep = race_swep();
		ammo[1] = max(ammo[1], typ_ammo[1] * (1));
	}
}

//active code
if (my_health > 1)
{
    if button_pressed(index,"spec") && timer <= 0
	{
		if global.ultra[1] = 1
		{
			sound_play(global.ult1);
			with instances_matching(projectile,"team",1)
			{
				speed = 0
				force = 120
				image_xscale = global.xy
				image_yscale = global.xy
				team = 1 + global.active;
				damage += 3
                image_blend = make_color_rgb(0,0,(global.active *255));
			}
		}
	}
}
	

if (my_health > 1)
{
    if button_pressed(index,"spec") && timer <= 0
	{
		if global.ultra[1] = 1
		{
			with instances_matching(projectile,"team",3)
			{
				speed = 0
				force = 120
				image_xscale = global.xy
				image_yscale = global.xy
				damage += 3
				team = 1 + global.active;
                image_blend = make_color_rgb(0,0,(global.active *255));
			}
		}
	}
}

if button_pressed(index,"spec") && timer <= 0{
if global.ultra[2] = 1{
sound_play(global.ult2);
}
}
	
if instance_exists(Player)
{
	if (my_health > 1)
	{
        if button_pressed(index,"spec") && timer <= 0
		{
            with(instances_matching(projectile,"team",1))
			{
                team = 1 + global.active;
                image_blend = make_color_rgb(0,0,(global.active *255));
				repeat(0 + global.ultra[2])
				{
					motion_add(point_direction(x,y,mouse_x,mouse_y),(global.ultra[2] * (12)))
					damage += (global.ultra[2] * (3))
					image_xscale = 1 + (global.ultra[2] * (1))
					image_yscale = 1 + (global.ultra[2] * (1))
				}
            }
            timer = 10;
            my_health --;
            sound_play(sndGrenade);
            sound_play(sndLaser);
        }
}else{
        //
}
	

	
	
if (my_health > 1){
        if button_pressed(index,"spec") && timer <= 0{
            with(instances_matching(projectile,"team",3)){
                team = 1 + global.active;
                image_blend = make_color_rgb(0,0,(global.active *255));
				repeat(0 + global.ultra[2]){
					motion_add(point_direction(x,y,mouse_x,mouse_y),(global.ultra[2] * (12)))
					damage += (global.ultra[2] * (3))
					image_xscale = 1 + (global.ultra[2] * (1))
					image_yscale = 1 + (global.ultra[2] * (1))
				}
            }
            timer = 10;
            my_health --;
            sound_play(sndGrenade);
            sound_play(sndLaser);
        }
}else{
        //
	
}
//oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
if instance_exists(Player){
		if global.thronebutt = 1{
			if global.new = 0{
	if(sprite_index = spr_hurt){
		if global.ultra[1] = 1
		{
			sound_play(global.ult1);
			with instances_matching(projectile,"team",1)
			{
				speed = 0
				force = 120
				image_xscale = global.xy
				image_yscale = global.xy
				damage += 3
				team = 1 + global.thronebutt;
                image_blend = make_color_rgb(0,0,(global.thronebutt *255));
			}
		}
	}
		}
		}
	
		if global.thronebutt = 1{
			if global.new = 0{
	if(sprite_index = spr_hurt){
		if global.ultra[1] = 1
		{
			with instances_matching(projectile,"team",1)
			{
				speed = 0
				force = 120
				image_xscale = global.xy
				image_yscale = global.xy
				damage += 3
				team = 1 + global.thronebutt;
                image_blend = make_color_rgb(0,0,(global.active *255));
			}
		}
	}
		}
		}
	
	if global.thronebutt = 1{	
		if global.new = 0{
if(sprite_index = spr_hurt){
	if global.ultra[2] = 1{
		sound_play(global.ult2);
	}
            with(instances_matching(projectile,"team",1)){
                team = 1 + global.thronebutt;
				image_blend = make_color_rgb(0,0,(global.thronebutt *255));
				repeat(0 + global.ultra[2]){
					motion_add(point_direction(x,y,mouse_x,mouse_y),(global.ultra[2] * (12)))
					damage += (global.ultra[2] * (3))
						image_xscale = 1 + (global.ultra[2] * (1))
					image_yscale = 1 + (global.ultra[2] * (1))
				}
            }
        }
	}
}
}

	
	
	if global.thronebutt = 1{
		if global.new = 0{
if(sprite_index = spr_hurt){
            with(instances_matching(projectile,"team",3)){
                team = 1 + global.thronebutt;
                image_blend = make_color_rgb(0,0,(global.thronebutt *255));
				repeat(0 + global.ultra[2]){
					motion_add(point_direction(x,y,mouse_x,mouse_y),(global.ultra[2] * (12)))
					damage += (global.ultra[2] * (3))
						image_xscale = 1 + (global.ultra[2] * (1))
					image_yscale = 1 + (global.ultra[2] * (1))
				}
            }
        }
		}
	}
}	
#define draw

//menu sprites and stuff
#define race_mapicon
return global.icon;

//name, abilities, starting weapon, and throne butt
#define race_name
return "DRUID";

#define race_text
return "@sENEMY SHOTS DEAL 1 LESS #@rDAMAGE @s(MINIMUM:1) #@s@gREVERSE @sFIRE";

#define race_swep
return 1;

#define race_skins
return 1;

#define race_tb_text
return "AUTOMATICALLY REVERSE#@s FIRE WHEN HURT.";

 // Ultra Portraits
#define race_ultra_button
sprite_index = global.spr_ult[argument0];
// Add More Ultra Icon "global.spr_ult[#]" Sprites For More Ultras

 // Ultra Names:
#define race_ultra_name
switch(argument0){
	case 1: return "DIMENSIONAL SHATTER"; // Ultra A
	case 2: return "CHANNEL FORCE"; // Ultra B
	// Add More Cases For More Ultras
	default: return "";
}

 // Ultra Descriptions:
#define race_ultra_text 
switch (argument0){
	case 1: return "ALL CONVERTED SHOTS FREEZE#@s AND CREATE A PLASMA EXPLOSION"; // Ultra A
	case 2: return "CHANNEL REVERSED SHOTS AT MOUSE#@s REVERSED SHOTS DEAL MORE DAMAGE."; // Ultra B
	// Add More Cases For More Ultras
	default: return "";
}

 // When Player Takes An Ultra:
#define race_ultra_take
global.ultra[argument0] = 1; // Confirm Which Ultra Was Taken
if(global.ultra[1] = 1) sound_play(sndRogueUltraA);
 // Ultra B : Half Health, 3 Mutations
if global.ultra[2] = 1{
	sound_play(sndRogueUltraB);
}
sound_play(sndBasicUltra);

 // Loading Screen Tips:
#define race_ttip
return choose("RUSTY SCREWDRIVER", "RUNNING LOW", "OOF!", "THE LIMIT IS YOUR IMAGINATION.", "DRIVE OFF A CLIFF, NOW WITH SMASHABLE CARS!");


#define game_start
//reset ultras
global.ultra[1] = 0;
global.ultra[2] = 0;
global.thronebutt = 0;