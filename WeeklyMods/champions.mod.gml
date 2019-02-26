#define init
// sprites
global.sprChampionMissile = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAICAYAAADwdn+XAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABYSURBVChTYyAF/P//HwMzODRA5EAYxEbH2DQhY7hmIAGmkTHRBrRKM/z3AdIgDGMDpcCGoGtAx2ADwAqhNDImygUgRcga0DE2TciYIMCmCRljFSQe/2cAAHTS97nlSm6VAAAAAElFTkSuQmCCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==", 1, 6, 3);
global.sprChampionMissileFlame = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEgAAAAMCAYAAADBJPs9AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACiSURBVEhL7ZIxDoAgDEW5iZubF3DyUu6eyCtia/xG8dcyaEyEl7yllF9BQqXyDjHGonVhm0rShW2CwxRWx7aJc9+d1JqupbAciDxkprmoHfs+hx0E4gAWurbF7EjZ1MtL0f4tliItpjmz2PdfkD5T/Gk2SGvsALJkileh++5AtveCpNUUs6xLyslfkV5TDIEaClH7PexiStKFbSrJSuUJQlgAmr+lpvjW7loAAAAASUVORK5CYII=", 3, 21, 6);

global.sprRedFlame = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGAAAAAQCAYAAADpunr5AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAFHSURBVFhH7ZPRDcIwDES7AeswFVMxF6uUODobp4HaFxHER54U0TTPzqUt2+JP2e+XGy4Xi/+D/UCnf9DMBr/6d2X3GXmY++NK1+AyRmXmAMwGEp4KVGD3YKDziy9nIF9CmtFAmIbYAYg9hKxP98XDZOq0BtPvUR8Ohs7rwgeqO3IAt8c3qTn2PZ1nJL9mz/ppmjAIJL9YfsvRx+2PaPCMK2Q9D5PJPHlpib2Y7AKVvwnuBpY7ahj1kl+d1mAaYv2TBzFf85SBpQ42v/dxK8T6Z/KbLCMT6OhiYLmjOXAmUMH3jWrMkzw6yhzLHZ2POZY7zJcxIf/rAflAJ0XWmDmA885cxWpQh9tv6fIHNdU99A995525itUEWSr0Cxh5Yd7N9te6rJ/Nw/pHN9tf6wK/0hRFcoHxG3dCf2Gm37gT+i8Wi8VP2bYnZaPAZoBM0WAAAAAASUVORK5CYII=", 8, 6, 12);

global.sprGlow = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAMAAAAAYCAYAAACssfJFAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAATgSURBVHhe7ZNNritFFIPvkAETJmyFDTBgJ2yBxbAWZiwLiZwrO3L7+lRX9c+T4LUlK0mXz+dKpfIxo1/++PH3ZCw/evT/VLr0yYif0h3MR9+PLr0/Dvvtz5+iPYfxJTnDjdhp3cV9NKe7zt+5bsTmpcN1yX/9++eh/Y8AzK50pqx/LGeWMbYs57gRe3ST0pmrEVuWcy65PwwXYHPJ//khepORUuBaMZe61P5FMD4lnSsXS+3rGDskZ9FYvkTfkk1j+ZCcdeX561yx0t0pew/GsxJQL/tfYn1eToXAflHq2fMMV8XsXo9yyxifls6OjPghJZ4asUNKvGTEp6WzV5//DNetPcB8FQPvodfF1kufnP4EoyKupc0rS3nv9Zkv8RIzXY9buWVgdqUz5eKofR1jS3JGZ8SX5Iyr9q8zxUlnrvYuYKJG3FP3x8GEpEvv9tJREZ9vNobZjqvZjqtiZnRIX56PDieI2a6HVm4Z41PSObp4zqQxNiWdu3r/I+7Z82dmM/vipbvDV822HQ5O0D1rWSriMz2YmR7l7h1U6mCPdyn3MzP5I5S6nuQVLsU8nXqUS2N8V8xfvf+Oy7PX32H1/BObrOTUEzscXAMj8MgsS0X8zM2sdOmMc1VdBzneV+81O2JTzHQ97NA1nQFmKM37D65sPecyxofSPDllPyNd0xlgohK3WGQrn+81O+pIbOUms0tnvnTwwZ1/AO9gj8/qZzW5iU2ljtRDHt9vsg1blXq6jhUuxRydOpTteWBaMZf279/jvX7wXMrKo7VHs11PYvteO1eu3HY4nAPuBHdXLpV4B3vSfPf8PedfAOo6Eo9Meo+tmu1Z5VLMaYezla/sMjCtnO38es/P7/WJ/e9x3ewp7/Wsst3DDofrxhTgz9xcTyXewZ4Rx5+95/wLQF1H4il3hq1KPcrT9ytcijntSPsnX9llYFo5O/Hr8+r+Z7jJMz0dm05c9bDD4SPozFoq8Q72JE7Ze8hNbCp1aE/qU+5ntmGrUo/v1dkzXIo5uuvgc88D04q5bv+p4+i5kJ349Cbb9CS2Mvc6aq3tcPgerMx1ZtWx5CV+5kbY5Wy1MmnnqroO9ugrrdkRm2Im9ei+dU1ngBlK8/6jK1vPuYzxoTRPjrK9o6wzwER1XD17ddcD3EYjtvL0M5/pTOxweA0lWGfmRyV8ln7QxCw7N/2xVKlDe9ybzA5b1fUkr3Ap5unUo1wa47ti/ur9d9w6a/6e+ttuMjs9ia085ep77Wk7HM5BBY+sRaMvwufcUNfFZ2TSHVfFjB4UnZifzwd7TmK266GVW8b4lHSOLp4zaYxNSeeu3v+Ie/b8mdnMgnn6/jg8gZO9aFTCtdHhOO+9vnhIXY9buWVgdqUz5eKofR1jS3JGZ8SX5Iyr9q8zxUlnrvYuYKJG3NP3J8Ed6peeni55KfXseYarYnavR7lljE9LZ0dG/JAST43YISVeMuLT0tmrz3+G69YeYLI6uF94epOZLXmJudSlVmYZ41PSuXKx1L6OsUNyFo3lS/Qt2TSWD8lZV56/zhUr3Z2y92B8LB0YwelDJS/pTLk4al/H2LKc40bs0U1KZ65GbFnOufT++LDDac9hfEnOcCN2WndxH83prvN3rhuxY0rAZMRP6Q7mo+9Ht94fh9NYfvToP6qPj38BYAaDzhnnrH0AAAAASUVORK5CYII=", 8, 12, 12);

// champion types
global.champions = [
					[c_orange], // explode on death
					[c_yellow], // fast
					[c_aqua], // electric
					[c_red], // missile
					[c_purple], // cursed/hydra
					[c_lime] // laser/overcharged
					];

global.championChance = 100 * (13 / GameCont.hard);
global.hardChange = -1;
global.enemyChange = -1;
global.wantColor = -1;
global.wantChance = -1;

// chat messages on load
trace_color("Use '/champ natural', '/champ double', and '/champ all' to swap between natural, double, and 100% champion chance.", c_lime);
trace_color("You can also set all champion spawns to be one champion with '/champ color', color being the type of champion you want.", c_green);
trace_color("For example, you can enter '/champ all' then '/champ yellow' for 100% champions that are all yellow and fast.", c_lime);
trace_color("The champion colors are Orange, Yellow, Blue, Red, Purple, and Green", c_green);
trace_color("You can go back to random colored champions with '/champ random'.", c_lime);
trace_color("Display these messages again with '/champ help'.", c_green);


#define chat_command
// chat commands
var command = string_upper(argument0);
var parameter = string_upper(argument1);
switch(command){
	case "CHAMP":
	case "CHAMPION":
	case "CHAMPIONS":
		switch(parameter){
			// colors
			case "ORANGE":
				if(global.wantColor != 0){
					trace_color("All champions will now be ORANGE (Explosive).", c_orange);
					global.wantColor = 0;
				}
				else{
					trace_color("All champions are already" + parameter + ". Use '/champ random' to go back to random champions. Use '/champ help' for a list of commands and colors.", c_white);
				}
			break;
			case "YELLOW":
				if(global.wantColor != 1){
					trace_color("All champions will now be YELLOW (Fast).", c_yellow);
					global.wantColor = 1;
				}
				else{
					trace_color("All champions are already" + parameter + ". Use '/champ random' to go back to random champions. Use '/champ help' for a list of commands and colors.", c_white);
				}
			break;
			case "BLUE":
				if(global.wantColor != 2){
					trace_color("All champions will now be BLUE (Electric).", c_aqua);
					global.wantColor = 2;
				}
				else{
					trace_color("All champions are already" + parameter + ". Use '/champ random' to go back to random champions. Use '/champ help' for a list of commands and colors.", c_white);
				}
			break;
			case "RED":
				if(global.wantColor != 3){
					trace_color("All champions will now be RED (Missile).", c_red);
					global.wantColor = 3;
				}
				else{
					trace_color("All champions are already" + parameter + ". Use '/champ random' to go back to random champions. Use '/champ help' for a list of commands and colors.", c_white);
				}
			break;
			case "PURPLE":
				if(global.wantColor != 4){
					trace_color("All champions will now be PURPLE (Hydra).", c_purple);
					global.wantColor = 4;
				}
				else{
					trace_color("All champions are already" + parameter + ". Use '/champ random' to go back to random champions. Use '/champ help' for a list of commands and colors.", c_white);
				}
			break;
			case "GREEN":
				if(global.wantColor != 5){
					trace_color("All champions will now be GREEN (Laser Revenge).", c_lime);
					global.wantColor = 5;
				}
				else{
					trace_color("All champions are already" + parameter + ". Use '/champ random' to go back to random champions. Use '/champ help' for a list of commands and colors.", c_white);
				}
			break;
			case "RANDOM":
			case "DEFAULT":
				if(global.wantColor != -1){
					trace_color("Champion colors are now set to DEFAULT (random).", c_white);
					global.wantColor = -1;
				}
				else{
					trace_color("All champions are already DEFAULT (random). Use '/champ random' to go back to random champions. Use '/champ help' for a list of commands and colors.", c_white);
				}
			break;
			// chance
			case "NATURAL":
			case "DEFAULT":
			case "NORMAL":
				if(global.wantChance != -1){
					trace_color("The champion chance now follows the natural/default curve.", c_white);
					global.wantChance = -1;
				}
				else{
					trace_color("The champion chance already follows the natural/default curve. Use '/champ help' for a list of commands.", c_white);
				}
			break;
			case "DOUBLE":
				if(global.wantChance != 1){
					trace_color("The champion chance is now double the natural/default curve.", c_white);
					global.wantChance = 1;
				}
				else{
					trace_color("The champion chance is already double the natural/default curve. Use '/champ natural' to go back to the natural/default champion chance curve. Use '/champ help' for a list of commands.", c_white);
				}
			break;
			case "ALL":
				if(global.wantChance != 2){
					trace_color("ALL applicable enemies will be champions.", c_white);
					global.wantChance = 2;
				}
				else{
					trace_color("ALL applicable enemies are already champions. Use '/champ natural' to go back to the natural/default champion chance curve. Use '/champ help' for a list of commands.", c_white);
				}
			break;
			//  help
			case "HELP":
				trace_color("Use '/champ natural', '/champ double', and '/champ all' to swap between natural, double, and 100% champion chance.", c_lime);
				trace_color("You can also set all champion spawns to be one champion with '/champ color', color being the type of champion you want.", c_green);
				trace_color("For example, you can enter '/champ all' then '/champ yellow' for 100% champions that are all yellow and fast.", c_lime);
				trace_color("The champion colors are Orange, Yellow, Blue, Red, Purple, and Green", c_green);
				trace_color("You can go back to random colored champions with '/champ random'.", c_lime);
				trace_color("Display these messages again with '/champ help'.", c_green);
			break;
		}
	return true;
	break;
}

#define step
// chance calculator
if(global.hardChange != GameCont.hard){
	global.championChance = 5 * (GameCont.hard / 6);
	global.hardChange = GameCont.hard;
	if(global.wantChance = 1){
		global.championChance *= 2;
	}
	else if(global.wantChance = 2){
		global.championChance = 100;
	}
}

if(global.enemyChange < instance_number(enemy)){
	//trace("Want to spawn champion..."); 								// debug
	with(enemy){
		if("championDecide" not in self){
			if("championDisabled" not in self){
				if(random(100) <= global.championChance){
					if("my_health" in self){
						my_health *= 1.25;
					}
					championType = irandom(array_length_1d(global.champions) - 1);
					
					//trace("Spawned champion"); 							// debug
					if(global.wantColor != -1){
						championType = global.wantColor;
					}
					
					// color
					image_blend = global.champions[championType][0];
					championColor = true;
				}
			}
			championDecide = true;
		}
	}
}

// champion functonality
with(instances_matching_ne(enemy, "championType", null)){
	// exploding champions
	if(championType = 0){
		if(random(10) <= 2){
			var smoke = instance_create(x + random_range(-5, 5), y + random_range(-5, 5), Smoke);
			with(smoke){
				speed = random_range(2, 4);
				direction = random_range(70, 110);
				image_xscale = random_range(0.2, 0.5);
				image_yscale = image_xscale;
			}
		}
		if("my_health" in self){
			if(my_health <= 0){
				if("size" in self){
					repeat(size){
						sound_play(sndExplosion);
						instance_create(x + random_range(-4, 4), y + random_range(-4, 4), Explosion);
					}
				}
				else{
					sound_play(sndExplosion);
					instance_create(x + random_range(-4, 4), y + random_range(-4, 4), Explosion);
				}
			}
		}
	}
	// fast champions
	else if(championType = 1){
		if("speedChange" not in self){
			speed = speed * 1.5;
			speedChange = true;
		}
		for(i = 0; i < 5; i++){
			if(alarm_get(i) > 2){
				alarm_set(i, alarm_get(i) - 2);
			}
		}
		if(random(10) <= 2){
			instance_create(x + random_range(-5, 5), y + random_range(-5, 5), CaveSparkle);
		}
	}
	// electric champions
	else if(championType = 2){
		if("effect" not in self){
			effect = instance_create(x, y, CustomObject);
			with(effect){
				effect = true;
				creator = other;
				sprite_index = sprFishA;
				image_index = 1;
				depth = other.depth - 0.1;
				image_xscale = 1 + (0.2 * other.size);
				image_yscale = image_xscale;
			}
		}
		else{
			with(effect){
				x = other.x + (lengthdir_x(other.speed, other.direction));
				y = other.y + (lengthdir_y(other.speed, other.direction));
				if(image_index = 6){
					image_index = 1;
				}
			}
		}
		if(random(100) <= 2){
			with(instance_create(x + random_range(-5, 5), y + random_range(-5, 5), Lightning)){
				team = other.team;
				ammo = 5;
				alarm_set(0, 1);
			}
		}
		if("my_health" in self){
			if(my_health <= 0){
				instance_delete(effect);
			}
		}
	}
	// missile champions
	else if(championType = 3){
		if("championAlarm" not in self){
			effect = instance_create(x, y, CustomObject);
			with(effect){
				effect = true;
				creator = other;
				sprite_index = global.sprRedFlame;
				depth = other.depth - 0.1;
				image_xscale = 1 + (1 * other.size);
				image_yscale = image_xscale;
				image_speed = 0.5;
				image_blend = c_red;
			}
			championAlarm[0] = irandom_range(100, 280);
		}
		else{
			with(effect){
				x = other.x + (lengthdir_x(other.speed, other.direction));
				y = other.y + (lengthdir_y(other.speed, other.direction)) + (sprite_get_height(sprite_index) / 2);
			}
		}
		if(championAlarm[0] = 0){
			if(instance_exists(Player)){
				var _p = instance_nearest(x, y, Player);
				if(point_distance(x, y, _p.x, _p.y) < 200){
					sound_play_pitch(sndToxicBoltGas, 0.8);
					with instance_create(x, y, CustomObject){
						creator = other;
						team = creator.team;
						name = "ChampionMissile";
						spr_idle = global.sprChampionMissile;
						sprite_index = spr_idle;
						image_speed = 1;
						depth = -7;
						mask_index = mskBullet1;
						friction = 0;
						speed = 3;
						damage = 7;
						on_step = script_ref_create(missile_step);
						on_destroy = script_ref_create(missile_die);
						charging = false;
						
						// targeting
						if(instance_exists(Player)){
							var _p = instance_nearest(x, y, Player);
							if(point_distance(x, y, _p.x, _p.y) < 200){
								target_x = _p.x;
								target_y = _p.y;
							}
							else{
								target_x = x + random_range(-150, 150);
								target_y = y + random_range(-150, 150);
							}
						}
						else{
							target_x = x + random_range(-150, 150);
							target_y = y + random_range(-150, 150);
						}
						direction = point_direction(x, y, target_x, target_y) - random_range(170, 190);
						image_angle = direction;
						
						// alarms
						missileAlarm[0] = irandom_range(30, 45); // close in!
						missileAlarm[1] = -1; // explode
						
						// flame
						flame = instance_create(x, y, CustomObject);
						with(flame){
							creator = other;
							team = creator.team;
							name = "ChampionMissileFlame";
							spr_idle = global.sprChampionMissileFlame;
							sprite_index = spr_idle;
							direction = creator.direction;
							image_angle = direction;
							image_speed = 1;
							depth = creator.depth;
							friction = 0;
							speed = 0;
							damage = 0;
						}
					}
				}
			}
			championAlarm[0] = irandom_range(100, 280);
		}
		
		// alarm management
		if(championAlarm[0] > 0){
			championAlarm[0]--;
		}
		if("my_health" in self){
			if(my_health <= 0){
				instance_delete(effect);
			}
		}
	}
	// cursed/hydra champions
	else if(championType = 4){
		if(random(10) <= 2){
			instance_create(x + random_range(-5, 5), y + random_range(-5, 5), Curse);
		}
		if("my_health" in self){
			if(my_health <= 0){
				corpse = false;
				raddrop = 0;
				repeat(2){
					with(instance_create(x + random_range(-5, 5), y + random_range(-5, 5), self.object_index)){
						championDisabled = true;
						image_xscale = 0.9;
						image_yscale = 0.9;
						my_health /= 2;
						raddrop = floor(raddrop/2);
					}
				}
			}
		}
	}
	// laser champions
	if(championType = 5){
		if(random(10) <= 2){
			var trail = instance_create(x + random_range(-5, 5), y + random_range(-5, 5), PlasmaTrail);
			with(trail){
				speed = random_range(2, 4);
				direction = random_range(70, 110);
			}
		}
		if("my_health" in self){
			if(my_health <= 0){
				with(instance_create(x, y, CustomObject)){
					name = "wantLaser";
					if(instance_exists(Player)){
						var _p = instance_nearest(x, y, Player);
						targetDirection = point_direction(x, y, _p.x, _p.y);
						image_angle = targetDirection;
					}
					else{
						targetDirection = random(360);
					}
					creator = other;
					team = creator.team;
					sprite_index = sprPlasmaBall;
					image_speed = 0.5;
					image_xscale = 0.3;
					image_yscale = image_xscale;
				}
			}
		}
	}
}

with(instances_matching(CustomObject, "name", "wantLaser")){
	if("laserAlarm" not in self){
		sound_play(sndLaserCannonCharge);
		laserAlarm = 45;
	}
	if(laserAlarm > 0){
		image_xscale *= 1.015;
		image_yscale = image_xscale;
		if(random(10) <= 2){
			var trail = instance_create(x + random_range(-5, 5), y + random_range(-5, 5), PlasmaTrail);
			with(trail){
				speed = random_range(2, 4);
				direction = other.targetDirection;
			}
		}
		laserAlarm--;
	}
	else{
		sound_play(LaserCannon);
		with(instance_create(x, y, LaserCannon)){
			damage = 1;
			creator = other;
			time = 2;
			ammo = 5;
			team = creator.team;
			var _p = instance_nearest(x, y, Player);
			direction = other.targetDirection;
			image_angle = direction;
		}
		instance_destroy();
	}
}

// effect debugging
with(instances_matching_ne(CustomObject, "effect", undefined)){
	if!(instance_exists(creator)){
		instance_delete(self);
	}
}

// scaling again
global.hardChange = GameCont.hard;

global.enemyChange = instance_number(enemy);

#define missile_step
// smoke
if(random(10) <= (3 * speed)){
	with(instance_create(x + lengthdir_x(-6, direction), y, Dust)){
		image_xscale = 0.5;
		image_yscale = 0.5;
		var red_smoke = make_color_rgb(255, 43, 43);
		image_blend = red_smoke;
		depth = -6.5;
	}
}

// start charging
if(missileAlarm[0] = 0){
	charging = true;
	// target again
	if(instance_exists(Player)){
		var _p = instance_nearest(x, y, Player);
		if(point_distance(x, y, _p.x, _p.y) < 200){
			target_x = _p.x;
			target_y = _p.y;
		}
		else{
			target_x = x + random_range(-150, 150);
			target_y = y + random_range(-150, 150);
		}
	}
	else{
		target_x = x + random_range(-150, 150);
		target_y = y + random_range(-150, 150);
	}
	missileAlarm[1] = 25;
	missileAlarm[0] = -1;
}


// change direction, accelerate
if(charging == false){
	direction -= angle_difference(direction, point_direction(x, y, target_x, target_y)) / (point_distance(x, y, target_x, target_y) / 2); // 16
}
// charging
else{
	direction -= angle_difference(direction, point_direction(x, y, target_x, target_y)) / (point_distance(x, y, target_x, target_y) / 22); // 16
	speed *= 1.1;
	if(point_in_rectangle(x, y, target_x -10, target_y - 10, target_x + 10, target_y + 10)){
		missileAlarm[1] = 0;
	}
}

// keep image aligned
image_angle = direction;

// keep the flame effect behind
with(flame){
	x = other.x + lengthdir_x(-6, direction);
	y = other.y;
	direction = other.direction;
	image_angle = direction;
}

// alarm management
for(i = 0; i < array_length_1d(missileAlarm); i++){
	if(missileAlarm[i] > 0){
		missileAlarm[i]--;
	}
}

// then perish
if(missileAlarm[1] = 0){
	instance_destroy();
}

#define missile_die
instance_create(x, y, SmallExplosion);
sound_play(sndExplosion);
if(instance_exists(flame)){
	with(flame){
		instance_destroy();
	}
}
