
global.button = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAAACXBIWXMAAAsSAAALEgHS3X78AAAAG3RFWHRTb2Z0d2FyZQBDZWxzeXMgU3R1ZGlvIFRvb2zBp+F8AAAESElEQVRIx52WX0hbVxzHP9eB6IukWtQmI96k0mB00lVZoFBmKuhEyapufVkZwp7EP7CVMehDKRZ8GJRCtyLsZT70qWhcw8RFcG4PG6RLu2JrJMWSyyCpZdplwogI8+zhek7uvf6p3XmRJPj9/M739z3n/LTaykqBY1VWVHDUlTIMhtvGAAi7QvTNdGJMPOHhfJbFfALNCngdYSl+/nQ3QVeIyxf70AeblLhcCvB/xIfbxgi7Qtw2bimIVVwBXlfcWv2QPqq+W8wnSOUTAARdoaMBvM/W+ONk7YE7uHyxD4BPvvkCgCF91AbSgrouDqv0MMD0hbhq6o27UVL5BEFXiPBu9Yv5xKsBB9kDKEC0N66qDrpCqnq1g+WM+Q+NPn3fqp2fU4aBt9pPJDigGisBq7kVbp6d4EyHxwrI0LVTzlxJga6d8j2WLGcyNPp8qnKA4bYxYqlJIsEBwq4Qi/kEsdQkP1+LqbjaAI0+34GWLGcyaJrG9IU4Zzo8vHstQiQ4QCqfoPTBAqkTburdDap662E7MiDaO8+ZDg/6YBN1NX5unp2wpWU1twKgbAOKgMPSIu3bbmln4fdZor1xPv11UPls9V+Cgs9zAGy3tB+cIu+zNeZKCoyEr9ti9/VPV/FW+22NlBAVgt1mH3oOnL4/nM/S/10ndZ8JxJ2Tygp9sIlob9y2G9tVIQHLGUPFVAJGwtdVDKU4sC9Angfn2ncHpj1bjITH+GrxKpoGx7qnqAj0A7CZnuajf1KvBNw2bqEJgbBWLncDAk3T1HfumlMUWsepCPSzmZ7m7ey3DOmjSlhaJHsVS02aOxBCCNAc9hh07ZSx5PZSddyFTw8AkEwm1OdHv/2ibLpxN6r+yibLG9V2kgF+eGMLIczqZdVvGl8C4NMDCvL3n+vUuxuUkDzNVvHwfoAlt5fsWpr3ez4GIGOk2VjPU2gd5xz31E5yL57irfYriFyruRV1ffTNdBYBmqbxVuM7JuRJguYmM/uepSWyzc1srOeVPXIXG+t5ci+emsGo9quTbH2b1W0qk1KevEJ2LQ1oNDdJ4H3zze6Z4hz3SCZNGw4Sl1dKtDdupkiKA4Ril5grKZjV1waoOu7aBQg8tQFaW0PKIqu4XPXuBtujo733b5lIRO7w8nsz47IXcyVbeGrNJodilyiNfKisebx8f0/VMp4yRepNPtY9JaQ4aHTtlAGw8nmBzfQ05ckrNu+lNXJckeLOq0JCFMB8cLYAAWiAoLLHBMgESWvkuCK9ts5CRwDIZQL+mv0Ad80pZY0U75vpBNgzaO0BCIEwq7b6X9hNTREgc299Ep1DllX8x0ezxSZbRdUYuSvufIOtpxdgdWFc3QDWdf50d3Hwer7xUuVcRlUuq22Wu69opIC6Gr8torbrWgjEiapKNfzKEUb2wbmcvTpMXAEAJESC5OxT726g9MGC+m27pd32yDsP2ZA+antK/wNAIr+1JISnpwAAAABJRU5ErkJggg==",1,12,16)

global.icon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAACXBIWXMAAAsSAAALEgHS3X78AAAAG3RFWHRTb2Z0d2FyZQBDZWxzeXMgU3R1ZGlvIFRvb2zBp+F8AAAA+UlEQVQ4y6WTv2rCUBTGf+ch+gKCgYLrxUBeQOjkVMHFTn2BrHXQVXB20kVop06CL5AhuAqFvMzpUOP9q1Y8S869SX73+3K+iKrySAmgAKoqACJyJrZ7twH616mqiIi3/reCCHJBQXjPAj4zGDXewyFMRPRjtmA+LS1AVa3vk/vx2zudTpf5tGQ8Sfe+AgW+MgDM8gmAwcuQ/e476g91xWULr81ZwXa98q5uuSqSAJMXZM89mp8jgNe36+1m5QASFlJ1qCtMv/AgVoHzEU1eRC+03gFMv0gAEmMMqx2lC7VjPAXpWg7CqEdR9qzI9STGUQ5OvO9negDwC5bBsutn2RpFAAAAAElFTkSuQmCC",1,8,8)




#define skill_icon
	return global.icon;

#define skill_button
	sprite_index = global.button;
	
#define skill_name
	return "concentration";
	
#define skill_text
	return "@gchargeable @wenergy weapons";


#define skill_wepspec
	return 1;

#define skill_tip
	return "charging";
	
#define skill_take
	sound_play(sndMutLaserBrain)
	
#define step
with PlasmaBall if place_meeting(x,y,PortalClear){
	energyset = 0
	}
with PlasmaBig if place_meeting(x,y,PortalClear){
	energyset = 0
	}
with (Player) if (weapon_get_type(wep) = 5 || wep = 74)&& (instance_exists(Wall)||GameCont.area = 0){
	if !(weapon_is_melee(wep)){
		can_shoot = 0
		
		if reload <= 1{
			reload = 2
			}
		if ("energycharge" not in self){
			energycharge = 0
			}
		if (button_check(index, "fire")) && reload <= 2 && ammo[5] >= weapon_get_cost(wep){
			if energycharge < 64{
				energycharge +=1.5
				}
			if energycharge > 64{
				sound_play(sndSwapEnergy)
				energycharge = 64
				}
			if energycharge = 64{
				instance_create(x+lengthdir_x(16, gunangle),y+lengthdir_y(16, gunangle),LaserBrain)
				}
			if random(energycharge)>8{
				
				with instance_create(x+lengthdir_x(16, gunangle)+random_range(-10,10),y+lengthdir_y(16, gunangle)+random_range(-10,10),PlasmaTrail){
					motion_set(point_direction(x,y,other.x+lengthdir_x(16, other.gunangle),other.y+lengthdir_y(16, other.gunangle)),(other.energycharge)/32)
					}
				wkick = 2
				}
			}
		if (button_released(index, "fire")) && reload <= 2 && ammo[5] >= weapon_get_cost(wep){
			var w = wep
			repeat(energycharge/weapon_get_load(w)){
				with(player_fire_ext(gunangle, w, x, y, team, self)){accuracy = other.accuracy; ammo[5] = other.ammo[5]}
				}
			if infammo = 0
				ammo[5] -= 1+round((weapon_get_cost(wep)+1)*(energycharge/16))
			
			if weapon_get_load(w)*(energycharge/16) > weapon_get_load(w){
				reload = weapon_get_load(w)*(energycharge/16)
				}
				else{
				reload = weapon_get_load(w)
				}
			with LaserCannon if creator = other && ("energyset" not in self){
				ammo += round(creator.energycharge/4)
				energyset = 1
				}
			with IonBurst if creator = other && ("energyset" not in self){
				ammo += round(creator.energycharge/2)
				energyset = 1
				}
			with Laser if creator = other && ("energyset" not in self){
				image_yscale += creator.energycharge/64
				energyset = 1
				}
			with PlasmaBig if creator = other && ("energyset" not in self){
				energyset = 1
				image_yscale += creator.energycharge/32
				image_xscale = image_yscale
				repeat(round((creator.energycharge-8)/8))
				with instance_create(x,y,PlasmaBig){
					team = other.team
					creator = other.creator
					image_yscale += creator.energycharge/32
					image_xscale = image_yscale
					direction = other.direction
					speed = other.speed
					damage = 0
					energyset = 1
					}
				}
			with PlasmaHuge if creator = other && ("energyset" not in self){
				energyset = 1
				image_yscale += creator.energycharge/32
				image_xscale = image_yscale
				repeat(round((creator.energycharge-16)/8))
				with instance_create(x,y,PlasmaHuge){
					team = other.team
					creator = other.creator
					image_yscale += creator.energycharge/32
					image_xscale = image_yscale
					direction = other.direction
					speed = other.speed
					damage = 0
					energyset = 1
					}
				}
			with LightningBall if creator = other && ("energyset" not in self){
				energyset = 1
				image_yscale += creator.energycharge/32
				image_xscale = image_yscale
				repeat(round((creator.energycharge-8)/8))
				with instance_create(x,y,LightningBall){
					team = other.team
					creator = other.creator
					image_yscale += creator.energycharge/32
					image_xscale = image_yscale
					direction = other.direction
					speed = other.speed
					damage = 0
					energyset = 1
					}
				}
			with Lightning if creator = other && ("energyset" not in self){
				energyset = 1
				image_speed = 0.40 -((creator.energycharge/70)*0.4)
				}
			if ammo[5] < 0{
				ammo[5] = 0
				}
			}
		}
	else{
		if ("energycharge" not in self){
			energycharge = 0
			}
		if (button_check(index, "fire")) && ammo[5] >= weapon_get_cost(wep){
			if energycharge < 64{
				energycharge +=1.5
				}
			if energycharge > 64{
				sound_play(sndSwapEnergy)
				energycharge = 64
				}
			if energycharge = 64{
				instance_create(x,y,LaserBrain)
				}
			if random(energycharge)>8{
				
				with instance_create(x+random_range(-10,10),y+random_range(-10,10),PlasmaTrail){
					motion_set(point_direction(x,y,other.x,other.y),(other.energycharge)/32)
					}
				wkick = 2
				}
			}
		if (button_released(index, "fire")) && energycharge >= 16 && ammo[5] >= weapon_get_cost(wep){
			var w = wep
			var ga = gunangle
			repeat((energycharge)/8){
				with(player_fire_ext(ga-(360/((energycharge)/8)), w, x, y, team, self)){accuracy = other.accuracy; ammo[5] = other.ammo[5]}
				ga += 360/((energycharge)/8)
				}
			if infammo = 0
				ammo[5] -= 1+round(weapon_get_cost(w)*(energycharge/16))
			
			if weapon_get_load(w)*(energycharge/16) > weapon_get_load(w){
				reload = weapon_get_load(w)*(energycharge/16)
				}
				else{
				reload = weapon_get_load(w)
				}
			if ammo[5] < 0{
				ammo[5] = 0
				}
			
			wepangle = -wepangle
			motion_add(gunangle,5)
			
			with EnergyShank{
				motion_add(direction+75,other.energycharge/8)
				}
			with EnergySlash{
				motion_add(direction+75,other.energycharge/8)
				}
			with EnergyHammerSlash{
				motion_add(direction+75,other.energycharge/8)
				}
			with LightningSlash{
				motion_add(direction+75,other.energycharge/8)
				}
			}
		}
		if (button_released(index, "fire")) && energycharge > 0{
			energycharge = 0
			}
		if (button_pressed(index, "swap")) && energycharge > 0{
			energycharge = 0
			}
	}

	
//steroids
with (Player) if race_id = 7 && (weapon_get_type(bwep) = 5 || bwep = 74)&& (instance_exists(Wall)||GameCont.area = 0){
	if !(weapon_is_melee(bwep)){
		bcan_shoot = 0
		
		if breload <= 1{
			breload = 2
			}
		if ("benergycharge" not in self){
			benergycharge = 0
			}
		if (button_check(index, "spec")) && breload <= 2 && ammo[5] >= weapon_get_cost(bwep){
			if benergycharge < 64{
				benergycharge +=1.5
				}
			if benergycharge > 64{
				sound_play(sndSwapEnergy)
				benergycharge = 64
				}
			if benergycharge = 64{
				instance_create(x+lengthdir_x(16, gunangle),y+lengthdir_y(16, gunangle),LaserBrain)
				}
			if random(benergycharge)>8{
				
				with instance_create(x+lengthdir_x(16, gunangle)+random_range(-10,10),y+lengthdir_y(16, gunangle)+random_range(-10,10),PlasmaTrail){
					motion_set(point_direction(x,y,other.x+lengthdir_x(16, other.gunangle),other.y+lengthdir_y(16, other.gunangle)),(other.benergycharge)/32)
					}
				bwkick = 2
				}
			}
		if (button_released(index, "spec")) && reload <= 2 && ammo[5] >= weapon_get_cost(bwep){
			var w = bwep
			repeat(benergycharge/weapon_get_load(w)){
				with(player_fire_ext(gunangle, w, x, y, team, self)){accuracy = other.accuracy; ammo[5] = other.ammo[5]}
				}
			if infammo = 0
				ammo[5] -= 1+round((weapon_get_cost(w)+1)*(benergycharge/16))
			
			if weapon_get_load(w)*(benergycharge/16) > weapon_get_load(w){
				breload = weapon_get_load(w)*(benergycharge/16)
				}
				else{
				breload = weapon_get_load(w)
				}
			with LaserCannon if creator = other && ("energyset" not in self){
				ammo += round(creator.benergycharge/4)
				energyset = 1
				}
			with IonBurst if creator = other && ("energyset" not in self){
				ammo += round(creator.benergycharge/2)
				energyset = 1
				}
			with Laser if creator = other && ("energyset" not in self){
				image_yscale += creator.benergycharge/64
				energyset = 1
				}
			with PlasmaBig if creator = other && ("energyset" not in self){
				energyset = 1
				image_yscale += creator.benergycharge/32
				image_xscale = image_yscale
				repeat(round((creator.benergycharge-8)/8))
				with instance_create(x,y,PlasmaBig){
					team = other.team
					creator = other.creator
					image_yscale += creator.benergycharge/32
					image_xscale = image_yscale
					direction = other.direction
					speed = other.speed
					damage = 0
					energyset = 1
					}
				}
			with PlasmaHuge if creator = other && ("energyset" not in self){
				energyset = 1
				image_yscale += creator.benergycharge/32
				image_xscale = image_yscale
				repeat(round((creator.benergycharge-16)/8))
				with instance_create(x,y,PlasmaHuge){
					team = other.team
					creator = other.creator
					image_yscale += creator.benergycharge/32
					image_xscale = image_yscale
					direction = other.direction
					speed = other.speed
					damage = 0
					energyset = 1
					}
				}
			with LightningBall if creator = other && ("energyset" not in self){
				energyset = 1
				image_yscale += creator.benergycharge/32
				image_xscale = image_yscale
				repeat(round((creator.benergycharge-8)/8))
				with instance_create(x,y,LightningBall){
					team = other.team
					creator = other.creator
					image_yscale += creator.benergycharge/32
					image_xscale = image_yscale
					direction = other.direction
					speed = other.speed
					damage = 0
					energyset = 1
					}
				}
			with Lightning if creator = other && ("energyset" not in self){
				energyset = 1
				image_speed = 0.40 -((creator.benergycharge/70)*0.4)
				}
			if ammo[5] < 0{
				ammo[5] = 0
				}
			}
		}
	else{
		if ("energycharge" not in self){
			benergycharge = 0
			}
		if (button_check(index, "spec")) && ammo[5] >= weapon_get_cost(bwep){
			if benergycharge < 64{
				benergycharge +=1.5
				}
			if benergycharge > 64{
				sound_play(sndSwapEnergy)
				benergycharge = 64
				}
			if benergycharge = 64{
				instance_create(x,y,LaserBrain)
				}
			if random(benergycharge)>8{
				
				with instance_create(x+random_range(-10,10),y+random_range(-10,10),PlasmaTrail){
					motion_set(point_direction(x,y,other.x,other.y),(other.benergycharge)/32)
					}
				bwkick = 2
				}
			}
		if (button_released(index, "spec")) && benergycharge >= 16 && ammo[5] >= weapon_get_cost(bwep){
			var w = bwep
			var ga = gunangle
			repeat((benergycharge)/8){
				with(player_fire_ext(ga-(360/((benergycharge)/8)), w, x, y, team, self)){accuracy = other.accuracy; ammo[5] = other.ammo[5]}
				ga += 360/((benergycharge)/8)
				}
			if infammo = 0
				ammo[5] -= 1+round(weapon_get_cost(bwep)*(benergycharge/16))
			
			if weapon_get_load(w)*(benergycharge/16) > weapon_get_load(w){
				reload = weapon_get_load(w)*(benergycharge/16)
				}
				else{
				reload = weapon_get_load(w)
				}
			if ammo[5] < 0{
				ammo[5] = 0
				}
			
			bwepangle = -bwepangle
			motion_add(gunangle,5)
			
			with EnergyShank{
				motion_add(direction+75,other.benergycharge/8)
				}
			with EnergySlash{
				motion_add(direction+75,other.benergycharge/8)
				}
			with EnergyHammerSlash{
				motion_add(direction+75,other.benergycharge/8)
				}
			with LightningSlash{
				motion_add(direction+75,other.energycharge/8)
				}
			}
		}
		if (button_released(index, "spec")) && benergycharge > 0{
			benergycharge = 0
			}
		if (button_pressed(index, "spec")) && benergycharge > 0{
			benergycharge = 0
			}
	}
	
//yv
with (Player) if (race_id = 6||race_id = 14) && (weapon_get_type(wep) = 5)&& (instance_exists(Wall)||GameCont.area = 0){
	if (button_pressed(index, "spec")){
			can_shoot = 1
			}
	}