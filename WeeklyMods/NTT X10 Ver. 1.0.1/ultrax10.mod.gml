#define init
global.fortressx10 = 0
global.detatchx10 = 0
global.levelstart = 0

#define game_start
init()


#define level_start
//Gun Warrent
with Player if race = "fish"{
	if ultra_get(race,2){
		infammo = (30 * 70);
	}
}
with Player if race = "rebel"{
	if ultra_get(race,1) repeat(9){
		with instance_create(x,y,Ally){
			index = other.index
			creator = other
			team = other.team
		}
	}
}

#define step
if instance_exists(GenCont) || instance_exists(mutbutton){
	global.levelstart = 1
}
else if global.levelstart{
	global.levelstart = 0
	level_start()
}


//Anomaly X10

var anomalyx10 = 0;
var strikex10 = 0;

//Confiscate
if ultra_get("fish",1) && !instance_exists(BigPortal){
	with(AmmoPickup)
	{
		if distance_to_object(Portal) >= 90
		{
			instance_change(AmmoChest, true)
		}
	}
	with(HPPickup)
	{
		if distance_to_object(Portal) >= 90
		{
			instance_change(HealthChest, true)
		}
	}
}

//Fortress
if ultra_get("crystal",1)&&!global.fortressx10{
	global.fortressx10 = 1
	with Player if race = "crystal"{
		my_health += 54
		maxhealth += 54
	}
}

//Juggernaut
if ultra_get("crystal",2){
	with instances_matching([CrystalShield, CrystalShieldDisappear],"visible",1){
		image_xscale = 4
		image_yscale = 4
		with position_meeting(x,y,enemy) if variable_instance_get(self,"my_health") <= 15 my_health = 0
	}
}

//Detatchment
if ultra_get("melting",2) && !global.detatchx10{
	global.detatchx10 = 1
	GameCont.skillpoints += 18
}

//Harder to Kill
if ultra_get("chicken",1){
	with instances_matching_le(enemy,"my_health",0){
		if "hkx10" not in self{
			hkx10 = 1
			with Player if race = "chicken"{
				bleed = 0
			}
		}
	}
}

//Distance
if ultra_get("frog", 1)
{
	with instances_matching(Rad,"distancex10",null)
	{
		distancex10 = 1
		repeat(9)
		{
			instance_create(x,y,ToxicGas)
			distancex10 = 1
		}
	}
}

with(Player)
{
	//Eyes
	if race = "eyes" && ultra_get("eyes",1)
	{
		var eyes = 0;
		var eyers = []
		with instances_matching(Player,"race","eyes")
		{
			if button_check(index,"spec")
			{
				eyes++
				array_push(eyers,id)
			}
		}
		if eyes
		{
			if eyes = 1
			{
				with eyers
				{
					with instances_matching(projectile,"pstyler",null)
					{
						if "creator" in self
						{
							if creator != other
							{
								pstyler = other
								team = other.team
								image_angle+=180
								direction+=180
							}
						}
						else
						{
							creator = -4
							pstyler = other
							team = other.team
							image_angle+=180
							direction+=180
						}
					}
				}
			}
			else
			{
				with instances_matching(projectile,"pstyler",null)
				{
					with eyers
					{
						x+=10000
					}
					pstyler = instance_nearest(x+10000,y,Player)
					with eyers
					{
						x-=10000
					}
					if "creator" in self
					{
						if creator != pstyler
						{
							team = pstyler.team
							image_angle+=180
							direction+=180
						}
					}
					else
					{
						creator = -4
						team = pstyler.team
						image_angle+=180
						direction+=180
					}
				}
			}
			with eyers
			{
				with instances_matching(projectile,"pstyler",id) if creator != other
				{
					x = other.x + hspeed
					y = other.y + vspeed
					speed += friction
				}
			}
		}
	}
	
	//Monstah style
	if race = "eyes" && ultra_get("eyes",2) == 1
	{
		if !button_check(index, "spec")
		{
			with(enemy)
			{
				var _push = 10;
				var _dir = point_direction(other.x, other.y, x, y);
				x += lengthdir_x(_push, _dir);
				y += lengthdir_y(_push, _dir);
			}
		}
	}
	
	//Melting
	if race = "melting" && ultra_get("melting", 1) == 1
	{
		if button_pressed(index, "spec")
		{
			if (instance_number(self) > 0) || instance_exists(Portal)
			{
				with(instances_matching_le(enemy,"my_health",60))
				{
					if(point_seen(x,y,other.index))
					{
						//jsnotes - this used to check for scarier face LUL
						
						 // Create 1 Blood Explosion (Or 3 If You Have Thronebutt) On Enemy:
						if skill_get("thronebuttx10"){
							ang = random(360);
							repeat(9){
								instance_create(x+lengthdir_x(24,ang),y+lengthdir_y(24,ang),MeatExplosion);
								ang += 120;
							}
						}
						else instance_create(x,y + random_range(-1,1),MeatExplosion);
						
						 // Play Sounds:
						if(skill_get("thronebuttx10")) sound_play(sndCorpseExploUpg);
						else sound_play(sndCorpseExplo);
						sound_play(sndExplosion);
						
						 // Kill Enemy:
						my_health = 0;
					}	
				}
			}
		}
	}

//Plant
    if race = "plant" && ultra_get("plant",1) == 1
    {
        with(Tangle)
        {
            if ("trapperx10" not in self)
            {
                trapperx10 = 1
                repeat(9)
                {
                    with instance_create(x,y,Tangle)
                    {
                        trapperx10 = 1
                        creator = other.creator
                        p = other.p
                        team = other.team
                        typ = other.typ
                        bskin = other.bskin
						sprite_index = other.sprite_index
                        while place_meeting(x,y,Tangle){
                            x += lengthdir_x(60, random(360))
                            y += lengthdir_y(60, random(360))
                        }
                        while !place_meeting(x,y,Floor){
                            x += lengthdir_x(8, point_direction(x,y,instance_nearest(x,y,Floor).x,instance_nearest(x,y,Floor).y))
                            y += lengthdir_y(8, point_direction(x,y,instance_nearest(x,y,Floor).x,instance_nearest(x,y,Floor).y))
                        }
                    }
                }
            }
        }
		if button_pressed(index, "spec")
		{
			with(Tangle) if p = other.index
			{
				instance_destroy();
			}
		}
    }

	if race = "plant" && ultra_get("plant", 2) == 1
	{
	    with instances_matching(Sapling,"killerx10",null)
		{
			killerx10 = 1
			repeat (9)
			{
				with instance_create(x,y,Sapling)
				{
					killerx10 = 1
				}
			}
		}
		//jsnotes - luigi youre a fucking mad man
		with instances_matching(MeatExplosion,"killerx10",null)
		{
			killerx10 = 1
			repeat (3)
			{
				with instance_create(x,y,MeatExplosion)
				{
					killerx10 = 1
				}
			}
		}
	}
	
	//YV
	if race = "venuz" && ultra_get(race, 1) == 1
	{
	    if reload > 0
		{
			reload -= 3.6 * current_time_scale
		}
	}

	/*if ultra_get(6, 2) == 1
	{
		if (button_pressed(index,"spec") && reload <= 0)
		{
			if instance_exists(self)
			{
				if skill_get("thronebuttx10")
				{
					repeat(19)
					{
						player_fire_ext(gunangle, wep, x, y, 2, id);
						reload = weapon_get_load(wep)
					}
				}
				else
				{
					repeat(9)
					{
						player_fire_ext(gunangle, wep, x, y, 2, id);
						reload = weapon_get_load(wep)
					}
				}
			}
		}
	}*/
	
	//Steroids
	if race = "steroids" && ultra_get("steroids", 1) == 1
	{
		with(WeaponChest)
		{
			instance_change(GiantWeaponChest, true)
			sprite_index = sprWeaponChestSteroidsUltra
			image_xscale = 3;
			image_yscale = 3;	
		}
		with(ChestOpen)
		{
			if(sprite_index = sprGiantWepChestOpen)
			{
				sprite_index = sprWeaponChestSteroidsUltraOpen
				image_xscale = 3;
				image_yscale = 3;
			}
		}
	}
	
	if race = "steroids" && ultra_get("steroids", 2) == 1
	{
		//jsnotes - hey i coded this
		with PopupText {
			if player_find(target).race = "steroids"
			for(var i = 1;i<=5;i++){
				var p = player_find(target);
				if string_count("+" + string(2*p.typ_ammo[i]),text) && string_count(p.typ_name[i],text) && "loadedx10" not in self{
					text = "+" + string(20*p.typ_ammo[i]) + " " + p.typ_name[i]
					loadedx10 = 1
					with p{
						ammo[i] = min(ammo[i] + 18*typ_ammo[i],typ_amax[i])
						if ammo[i] = typ_amax[i] {other.text = "MAX " + typ_name[i]}
					}
				}
				//IM LAZY AND COPY PASTED, SUE ME but this makes present chests work
				if string_count("+" + string(3*p.typ_ammo[i]),text) && string_count(p.typ_name[i],text) && "loadedx10" not in self{
					text = "+" + string(30*p.typ_ammo[i]) + " " + p.typ_name[i]
					loadedx10 = 1
					with p{
						ammo[i] = min(ammo[i] + 28*typ_ammo[i],typ_amax[i])
						if ammo[i] = typ_amax[i] {other.text = "MAX " + typ_name[i]}
					}
				}
			}
		}
	}
	//Robot
	/*jsnotes - https://cdn.discordapp.com/attachments/303396763283357700/416015698251481101/unknown.png
	i am beyond words
	luigi is on another fucking level
	i am but a worm next to him
	to change this code is to blaspheme
	i shant
	*/
	if race = "robot" && ultra_get("robot", 1) == 1
	{
		with WepPickup
		{
			if "refinedx10" not in self
			{
				wep = choose(choose(2,9,10,11,12,20,22,23,24,25,26,28,35,36,37,49),choose(53,54,60,62,63,65,66,77,83,84,85,86,87,90,92,94),choose(95,96,103,104,105,106,110,111,113,115,119))
				/*if random(2) >= 1
				{
					wep = 92
				}
				else
				{
					wep = 111
				}*/
				refinedx10 = 1
			}	
		}
	}
	
	if race = "robot" && ultra_get("robot", 2) == 1 //Regurgitate X10
	{
		var ranChest = choose(WeaponChest, AmmoChest, RadChest, GoldChest, HealthChest, AmmoChestMystery, IDPDChest);
		if button_pressed(index, "spec")
		{
			if wep != 0
			{
				repeat(10)
				{
					instance_create(x,y,ranChest)
				}
			}
		}
	}
	
	
	if race = "chicken" && ultra_get("chicken", 2) == 1
	{	
		with (WepPickup)
		{
			if alarm0 > 1
			{
				alarm0 = 1
			}
		}
		if (button_check(index, "spec"))
		{
			if (curse <= 0) 
			{
				with (instance_create(x, y, ThrownWep)) 
				{
					creator = other;
					sound_play(sndChickenThrow);
					team = other.team;
					wep = other.wep;
					curse = other.curse;
					sprite_index = weapon_get_sprite(wep);
					direction = other.gunangle;
					speed = 16;
					image_angle = direction;
				}
				wep = 0;
				var twep, tcurse, treload, twkick, twepflip, twepangle, tcan_shoot, tinterfacepop;
				twep = wep;
				tcurse = curse;
				treload = reload;
				twkick = wkick;
				twepflip = wepflip;
				twepangle = wepangle;
				tcan_shoot = can_shoot;
				tinterfacepop = interfacepop;
				wep = bwep;
				curse = bcurse;
				reload = breload;
				wkick = bwkick;
				wepflip = bwepflip;
				wepangle = bwepangle;
				can_shoot = bcan_shoot;
				interfacepop = binterfacepop;
				bwkick = twkick;
				bcurse = tcurse;
				bcan_shoot = tcan_shoot;
				bwepflip = twepflip;
				bwepangle = twepangle;
				breload = treload;
				bwep = twep;
				binterfacepop = tinterfacepop;
				clicked = 0;
				if (reload > 0) 
				{
					can_shoot = 0;
				} 
				else can_shoot = 1;
				drawempty = 30;
				swapmove = 1;
			} else sound_play(sndCursedReminder);
		}
	}
	
	//Horror
	//jsnotes -  this isnt luigi code, and i cant tell who did it, i want to change it but i feel like theres something im missing here
	if race = "horror" && ultra_get("horror", 1) == 1
	{
		with(enemy)
		{
			if instance_exists(self)
			{
				if "x10stalker" not in self
					x10stalker = 0;
				if my_health <= 0 && x10stalker = 0
				{
					if fork(){
						var _x = x;
						var _y = y;
						var _r = raddrop;
						var _i = id;
						x10stalker = 1;
						wait(1);
						if !instance_exists(self)
						{
							repeat((_r * 10) * 0.66)
							{
								with(instance_create(_x,_y,HorrorBullet))
								{
								motion_add(random(360),4 + random(4))
								image_angle = direction
								team = 2;
								}
							}
						}
						exit
					}
				}
			}
		}
	}
	
	if race = "horror" && ultra_get("horror", 2) == 1
	{
	    var a = instances_matching_ge(enemy,"my_health",1);
		with a{
			anomalyx10 += my_health
		}
		if anomalyx10 <= 1400
		{
			with a my_health = 0
			sound_play(sndHorrorPortal)
		}
	}

	if race = "horror" && ultra_get("horror", 3) == 1
	{
	    with(GameCont)
		{
			if radmaxextra = 600
			{
				radmaxextra = 3000
			}
		}
	}
	
//Rebel
	if race = "rebel" && ultra_get("rebel", 1)
	{
		with instances_matching(Ally,"creator",id){
			if "pgx10" not in self{
				pgx10 = 1
				my_health = 192 //why so specific?
			}
		}
	}

	if race = "rebel" && ultra_get("rebel", 2)
	{
		with instances_matching(Ally,"creator",id){
			if "riotx10" not in self
			{
				riotx10 = 1
				repeat(4)
				{
					with instance_create(x,y,Ally)
					{
						riotx10 = 1
						team = other.team
						creator = other.creator
					}
				}
			}
		}
	}
	
//Rogue
if race = "rogue" && ultra_get("rogue", 2)
	{
        if "canblast" not in self
		{
            canblast = 1;
        }
        if (lsthealth > my_health && canblast = 1)
		{
            canblast = 0
			var _dir = 360/3;
			var _len = 16;
			// We set the below two variables for the reason that the code is intended
			// to fork with the Player object, which can delete itself before executing
			// 
			// Setting the x:ypos as temporary variables will remove the following error 
			var _x = x;
			var _y = y;
			var d = 0;
			if(fork())
			{
				while ++d < 10
				{
					for(var i = 1;i<=3;i++)
					{
						with(instance_create(_x+lengthdir_x(_len,_dir+((360/3)*i)),_y+lengthdir_y(_len,_dir+((360/3)*i)),PopoExplosion))
						{
							team = 2;
							image_xscale = 0.5;
							image_yscale = 0.5;
							sound_play(sndExplosion);
						}
						if random(3) < 1
						{
							var f = 40 + irandom(20);
							var __x = _x+lengthdir_x(_len,_dir+((360/3)*i));
							var __y = _y+lengthdir_y(_len,_dir+((360/3)*i))
							if(fork()){
								while(f > 0)
								{
									wait 1;
									if(f && !--f)
									{
										instance_create(__x+random_range(-16,16),__y+random_range(-16,16),PortalL);
										sound_play_pitch(sndLightningHit,random_range(1,2));
										exit;
									}
								}
							}
						}
					}
					_len += 16;
					_dir += 360/20;
					wait 1;
				}
			exit;
			}
        }
        if lsthealth <= my_health && canblast = 0{
            canblast = 1;
        }
	}
	
//Big Dog
//Ultra Spin: better spin attack
    if race = "bigdog" && ultra_get(13, 1)
    {
		with AllyBullet
		{
			if creator <= 0
			{
				creator = instance_nearest(x,y,Player)
			}
		}
		with instances_matching(AllyBullet,"creator",id){
			if "dogax10" not in self{
				dogax10 = 1
				repeat(9)
				{
					with instance_create(x,y,AllyBullet)
					{
						motion_add(other.direction+random(60)-15,other.speed)
						image_angle = direction
						team = other.creator.team
						creator = other;
						dogx10 = 1;
					}
				}
			}
		}
		
			
			//Alternative version that matches X10 loop Big Dog attack pattern
			/*
			dogax10 = 1;
			var c = creator;
			if (instance_exists(c)) switch (c.object_index) 
			{
				case Player:
				{
					repeat(9)
					{
						with instance_create(x+lengthdir_x(24,c.gunangle),y+lengthdir_y(16,c.gunangle),AllyBullet) //with instance_create(x,y,AllyBullet)
						{
							motion_add(c.gunangle,4)
							image_angle = direction
							team = other.creator.team
							creator = other;
							dogx10 = 1;
						}
						c.gunangle += 480/120;
					}
				}
				dogx10 = 1;
			}
			*/
	}


//Ultra Missile: missiles shoot bullets
    if race = "bigdog" && ultra_get(13, 2)
    {
		var me = id;
		with(instances_matching(DogMissile,"creator",me))
		{
			if  "dogtime" not in self{
				dogtime = 0
			}
			else dogtime -= current_time_scale
			if dogtime <= 0
			{
				dogtime = 10
				repeat (9)
				{
                     with instance_create(x,y,AllyBullet)
					{
						motion_add(other.direction+random(60)-15,2.60)
						image_angle = direction
						team = me.team
						creator = me;
                    }
                }
            }
        }
    }
	
//Skeleton
	if race = "skeleton" && ultra_get("skeleton", 2)
	{
		if (button_pressed(index,"spec"))	
		{
			if fork(){
				wait(0)
				reload *= 0.01;
				exit
			}
		}
	}
	
//Frog
	if race = "frog" && ultra_get("frog", 2)
	{
		with Player
		{
			with (instances_matching(ToxicGas, "intimacyx10", null)) 
			{
				intimacyx10 = 1;
				if creator = other
				{
					repeat (9) with instance_create(x,y,ToxicGas) 
					{
						motion_add(other.direction+random(360)-15,other.speed)
						image_angle = direction
						team = other.creator.team
						creator = other.creator;
						intimacyx10 = 1;
					}
				}
			}
		}
	}
}

with (EGSkillIcon)
{
//Fish
	if name = "CONFISCATE"
	{
		name= "CONFISCATE X10"
	}
	if text = "@wENEMIES@s SOMETIMES DROP @wCHESTS@s"
	{
		text = "ALL @wDROPS@s BECOME @wCHESTS@s"
	}

	if name = "GUN WARRANT"
	{
		name= "GUN WARRANT X10"
	}
	if text = "@yINFINITE AMMO@s THE FIRST 7 SECONDS#AFTER EXITING A @pPORTAL@s"
	{
		text = "@yINFINITE AMMO@s THE FIRST 70 SECONDS#AFTER EXITING A @pPORTAL@s"
	}
	
//Crystal
	if name = "FORTRESS"
	{
		name= "FORTRESS X10"
	}
	if text = "+6 MAX @rHP@s"
	{
		text = "+60 MAX @rHP@s"
	}
	if name = "JUGGERNAUT"
	{
		name= "JUGGERNAUT X10"
	}
	if text = "MOVE WHILE @wSHIELDED@s"
	{
		text = "BECOME A WALKING @wTANK@s"
	}

//Eyes
	if name = "PROJECTILE STYLE"
	{
		name= "PROJECTILE STYLE X10"
	}
	if text = "@wTELEKINESIS@s HOLDS YOUR @wPROJECTILES@s"
	{
		text = "@sHOLD ALL@w PROJECTILES @sFOR YOU TO USE"
	}
	
	if name = "MONSTER STYLE"
	{
		name= "MONSTER STYLE X10"
	}
	if text = "PUSH NEARBY @wENEMIES@s AWAY#WHEN NOT USING @wTELEKINESIS@s"
	{
		text = "SHOVE YOUR @wENEMIES@s AWAY FROM YOU"
	}
	
//Melting
	if name = "BRAIN CAPACITY"
	{
		name= "BRAIN CAPACITY X10"
	}
	if text = "BLOW UP @rLOW HP @wENEMIES@s"
	{
		text = "BLOW UP @wPRETTY MUCH EVERYTHING@s"
	}
	if name = "DETACHMENT"
	{
		name= "DETACHMENT X10"
	}
	if text = "3 MORE @gMUTATIONS@s#LOSE HALF OF YOUR @rHP@s"
	{
		text = "FOREVER 1 @rHP@s#INITIATE @gMUTATION X100@s"
	}

	
//Plant
	if name = "TRAPPER"
	{
		name= "TRAPPER X10"
	}
	if text = "BIG @wSNARE@s"
	{
		text = "GIANT @wSNARE@s"
	}

	if name = "KILLER"
	{
		name= "KILLER X10"
	}
	if text = "@wENEMIES@s KILLED ON YOUR @wSNARE@s#SPAWN @wSAPLINGS@s"
	{
		text = "@wENEMIES@s KILLED ON YOUR @wSNARE@s#SPAWN @g10@s @wSAPLINGS@s"
	}
	
//YV	
	if name = "IMA GUN GOD"
	{
		name= "IMA GUN GOD X10"
	}
	if text = "HIGHER @wRATE OF FIRE@s"
	{
		text = "EXTREME @wHIGHER RATE OF FIRE@s"
	}
	if name = "BACK 2 BIZNIZ"
	{
		name= "BACK 2 BIZNIZ X10"
	}
	if text = "FREE @wPOP POP@s UPGRADE"
	{
		text = "@wCAN YOU REACH THE NUCLEAR THRONE.EXE@s#HAS STOPPED @rWORKING@s"
	}

//Steroids	
	if name = "AMBIDEXTROUS"
	{
		name= "AMBIDEXTROUS X10"
	}
	if text = "DOUBLE @wWEAPONS@s FROM @wCHESTS@s"
	{
		text = "PERSONAL @wGUN LOCKER CHESTS@s"
	}

	if name = "GET LOADED"
	{
		name= "GET LOADED X10"
	}
	if text = "@yAMMO CHESTS@s CONTAIN ALL @yAMMO TYPES@s"
	{
		text = "INSTANT @yAMMO@s RECHARGE @yCHESTS@s"
	}

//Robot
	if name = "REFINED TASTE"
	{
		name= "REFINED TASTE X10"
	}
	if text = "HIGH TIER @wWEAPONS@s ONLY#AUTO EAT @wWEAPONS@s LEFT BEHIND"
	{
		text = "@gLUIGI@s'S HAND PICKED#FAVORITE @wWEAPONS@s ONLY"
		if !irandom(10000) text = "jsnotes - im so fucking mad"
	}

	if name = "REGURGITATE"
	{
		name= "REGURGITATE X10"
	}
	if text = "EATING @wWEAPONS@s CAN DROP @wCHESTS@s#AUTO EAT @wWEAPONS@s LEFT BEHIND"
	{
		text = "POOPS OUT @w10@s @yCHESTS@s#AFTER EATING @wWEAPON@s"
	}
//Chicken
	if name = "HARDER TO KILL"
	{
		name = "HARDER TO KILL X10"
	}
	if text = "KILLS EXTEND BLEED TIME"
	{
		text = "BECOME A @rZOMBIE@w CHICKEN@s"
	}	
	if name = "DETERMINATION"
	{
		name = "DETERMINATION X10"
	}
	if text = "THROWN @wWEAPONS@s CAN TELEPORT BACK#TO YOUR SECONDARY SLOT"
	{
		text = "@wBOOMERANG BUILD@s IS THE NEW @rMETA@s"
	}	
	
//Rebel	
	if name = "PERSONAL GUARD"
	{
		name = "PERSONAL GUARD X10"
	}
	if text = "START A LEVEL WITH 2 @wALLIES@s#ALL @wALLIES@s HAVE MORE @rHP@s"
	{
		text = "START A LEVEL WITH 10 @wALLIES@s#ALL @wALLIES@s BECOME @rMEAT SHIELD@s"
	}	
	if name = "RIOT"
	{
		name = "RIOT X10"
	}
	if text = "DOUBLE @wALLY@s SPAWNS"
	{
		text = "YOU AND WHAT @wARMY@s??"
	}
	
//Horror
	if name = "STALKER"
	{
		name= "STALKER X10"
	}
	if text = "@wENEMIES@s EXPLODE IN @gRADIATION@s ON DEATH"
	{
		text = "FLOOD THE WORLD# WITH @gRADIATION@s"
	}
	if name = "ANOMALY"
	{
		name= "ANOMALY X10"
	}
	if text = "@pPORTALS@s APPEAR EARLIER"
	{
		text = "THE @pSWITZERLAND@s HORROR"
	}
	
	if name = "MELTDOWN"
	{
		name= "MELTDOWN X10"
	}
	if text = "DOUBLE @gRAD@s CAPACITY"
	{
		text = "@gRAD@s BANK PUPPER"
	}
	
//Rogue
	if name = "SUPER PORTAL STRIKE"
	{
		name= "SUPER PORTAL STRIKE X10"
	}
	if text = "DOUBLE @bPORTAL STRIKE@s PICKUPS#AND CAPACITY"
	{
		text = "TEN TIMES @bPORTAL STRIKE@s PICKUPS#AND CAPACITY"
	}
	if name = "SUPER BLAST ARMOR"
	{
		name= "SUPER BLAST ARMOR X10"
	}
	if text = "SUPER BLAST ARMOR"
	{
		text = "PANIC FART"
	}

//Big Dog
	if name = "ULTRA SPIN"
	{
		name= "ULTRA SPIN X10"
	}
	if text = "IMPROVED SPIN ATTACK"
	{
		text = "BULLET STORM"
	}

	if name = "ULTRA MISSILES"
	{
		name= "ULTRA MISSILES X10"
	}
	if text = "MISSILES FIRE BULLETS"
	{
		text = "SUPER SPREAD GUN ON MISSILES"
	}

//Skeleton
	if name = "DAMNATION"
	{
		name= "DAMNATION X10"
	}
	if text = "FAST RELOAD AFTER BLOOD GAMBLE"
	{
		text = "WHAT IS THIS @wRELOAD@s YOU SPEAK OF??"
	}

//Frog
	if name = "DISTANCE"
	{
		name= "DISTANCE X10"
	}
	if text = "RADS CAN SPAWN TOXIC GAS"
	{
		text = "CONVERT THE MAP INTO#A GIANT GAS CHAMBER"
	}

	if name = "INTIMACY"
	{
		name= "INTIMACY X10"
	}
	if text = "CONTINUOUSLY SPAWN TOXIC GAS"
	{
		text = "SMELLS LIKE A NEW PERFUME"
	}
}

#define drawmyshit(_x,_y)
draw_vertex_texture(_x,_y,(_x+5)/16,(_y)/16)