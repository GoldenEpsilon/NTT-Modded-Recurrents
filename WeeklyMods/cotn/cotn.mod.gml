// /loadtext cotn

#define init
global.gce = 0;
global.actionDeadZone = 100;
global.beatmapStartOffset = current_time;
global.last_time = current_time-global.actionDeadZone/2;
global.actionOffset = 0;
global.radMultiplier = 0;
global.last_kills = 0;
global.beatAnimation = 0;
global.pseudoArea=0;

// load beatmaps
if(fork())
{
	global.beatmap[1] = "";
	global.beatmap[2] = "";
	global.beatmap[3] = "";
	global.beatmap[4] = "";
	global.beatmap[5] = "";
	global.beatmap[6] = "";
	global.beatmap[7] = "";
	global.beatmap[8] = "";
	global.beatmap[9] = "";
	global.beatmap[10] = "";
	global.beatmap[11] = "";
	global.beatmap[12] = "";
	
	wait(file_load([
	"beatmaps/zone1_1.txt",
	"beatmaps/zone1_2.txt",
	"beatmaps/zone1_3.txt",
	"beatmaps/zone2_1.txt",
	"beatmaps/zone2_2.txt",
	"beatmaps/zone2_3.txt",
	"beatmaps/zone4_1.txt",
	"beatmaps/zone4_2.txt",
	"beatmaps/zone4_3.txt",
	"beatmaps/zone3_1.txt",
	"beatmaps/zone3_2.txt",
	"beatmaps/zone3_3.txt"
	]));
	
	global.beatmap[1] = string_load("beatmaps/zone1_1.txt");
	global.beatmap[1] = string_split(global.beatmap[1], ",");
	
	global.beatmap[2] = string_load("beatmaps/zone1_2.txt");
	global.beatmap[2] = string_split(global.beatmap[2], ",");
	
	global.beatmap[3] = string_load("beatmaps/zone1_3.txt");
	global.beatmap[3] = string_split(global.beatmap[3], ",");
	
	global.beatmap[4] = string_load("beatmaps/zone2_1.txt");
	global.beatmap[4] = string_split(global.beatmap[4], ",");
	
	global.beatmap[5] = string_load("beatmaps/zone2_2.txt");
	global.beatmap[5] = string_split(global.beatmap[5], ",");
	
	global.beatmap[6] = string_load("beatmaps/zone2_3.txt");
	global.beatmap[6] = string_split(global.beatmap[6], ",");
	
	global.beatmap[7] = string_load("beatmaps/zone4_1.txt");
	global.beatmap[7] = string_split(global.beatmap[7], ",");
	
	global.beatmap[8] = string_load("beatmaps/zone4_2.txt");
	global.beatmap[8] = string_split(global.beatmap[8], ",");
	
	global.beatmap[9] = string_load("beatmaps/zone4_3.txt");
	global.beatmap[9] = string_split(global.beatmap[9], ",");
	
	global.beatmap[10] = string_load("beatmaps/zone3_1.txt");
	global.beatmap[10] = string_split(global.beatmap[10], ",");
	
	global.beatmap[11] = string_load("beatmaps/zone3_2.txt");
	global.beatmap[11] = string_split(global.beatmap[11], ",");
	
	global.beatmap[12] = string_load("beatmaps/zone3_3.txt");
	global.beatmap[12] = string_split(global.beatmap[12], ",");
	
	global.beatmap[13] = string_load("beatmaps/zone3_1.txt");
	global.beatmap[13] = string_split(global.beatmap[13], ",");
	
	global.beatmap[14] = string_load("beatmaps/zone3_2.txt");
	global.beatmap[14] = string_split(global.beatmap[14], ",");
	
	global.beatmap[15] = string_load("beatmaps/zone3_3.txt");
	global.beatmap[15] = string_split(global.beatmap[15], ",");
	
	file_unload([
	"beatmaps/zone1_1.txt",
	"beatmaps/zone1_2.txt",
	"beatmaps/zone1_3.txt",
	"beatmaps/zone2_1.txt",
	"beatmaps/zone2_2.txt",
	"beatmaps/zone2_3.txt",
	"beatmaps/zone4_1.txt",
	"beatmaps/zone4_2.txt",
	"beatmaps/zone4_3.txt",
	"beatmaps/zone3_1.txt",
	"beatmaps/zone3_2.txt",
	"beatmaps/zone3_3.txt"
	]);
}

global.maxmusic = 0;

// load music
if(fork())
{
	wait(file_load([
	"music/zone1_1.ogg",
	"music/zone1_2.ogg",
	"music/zone1_3.ogg",
	"music/zone2_1.ogg",
	"music/zone2_2.ogg",
	"music/zone2_3.ogg",
	"music/zone4_1.ogg",
	"music/zone4_2.ogg",
	"music/zone4_3.ogg",
	"music/zone3_1c.ogg",
	"music/zone3_2c.ogg",
	"music/zone3_3c.ogg",
	"music/zone3_1h.ogg",
	"music/zone3_2h.ogg",
	"music/zone3_3h.ogg"
	]));
	
	global.music[1] = sound_add("music/zone1_1.ogg");
	global.maxmusic = 1;
	
	global.music[2] = sound_add("music/zone1_2.ogg");
	global.maxmusic = 2;
	
	global.music[3] = sound_add("music/zone1_3.ogg");
	global.maxmusic = 3;
	
	global.music[4] = sound_add("music/zone2_1.ogg");
	global.maxmusic = 4;
	
	global.music[5] = sound_add("music/zone2_2.ogg");
	global.maxmusic = 5;
	
	global.music[6] = sound_add("music/zone2_3.ogg");
	global.maxmusic = 6;
	
	global.music[7] = sound_add("music/zone4_1.ogg");
	global.maxmusic = 7;
	
	global.music[8] = sound_add("music/zone4_2.ogg");
	global.maxmusic = 8;
	
	global.music[9] = sound_add("music/zone4_3.ogg");
	global.maxmusic = 9;
	
	global.music[10] = sound_add("music/zone3_1c.ogg");
	global.maxmusic = 10;
	
	global.music[11] = sound_add("music/zone3_2c.ogg");
	global.maxmusic = 11;
	
	global.music[12] = sound_add("music/zone3_3c.ogg");
	global.maxmusic = 12;
	
	global.music[13] = sound_add("music/zone3_1h.ogg");
	global.maxmusic = 13;
	
	global.music[14] = sound_add("music/zone3_2h.ogg");
	global.maxmusic = 14;
	
	global.music[15] = sound_add("music/zone3_3h.ogg");
	global.maxmusic = 15;
	
	file_unload([
	"music/zone1_1.ogg",
	"music/zone1_2.ogg",
	"music/zone1_3.ogg",
	"music/zone2_1.ogg",
	"music/zone2_2.ogg",
	"music/zone2_3.ogg",
	"music/zone4_1.ogg",
	"music/zone4_2.ogg",
	"music/zone4_3.ogg",
	"music/zone3_1c.ogg",
	"music/zone3_2c.ogg",
	"music/zone3_3c.ogg",
	"music/zone3_1h.ogg",
	"music/zone3_2h.ogg",
	"music/zone3_3h.ogg"
	]);
}

#define game_start
global.radMultiplier = 0;
global.last_kills = 0;

#define step
if(instance_exists(GenCont))
{
	sound_play_music(-1);
	
	global.gce = 1;
}
else
{
	if(global.gce)
	{
		global.pseudoArea = -1;
		if(GameCont.area <= global.maxmusic)
		{
			sound_play_music(global.music[GameCont.area]);
			global.pseudoArea = GameCont.area;
		}
		else if(GameCont.area == 104){
			sound_play_music(global.music[4]);
			global.pseudoArea = 4;
		}
		else if(GameCont.area == 101){
			sound_play_music(global.music[10]);
			global.pseudoArea = 10;
		}
		else if(GameCont.area == 100){
			sound_play_music(global.music[11]);
			global.pseudoArea = 11;
		}
		else if(GameCont.area == 105){
			sound_play_music(global.music[12]);
			global.pseudoArea = 12;
		}
		else if(GameCont.area == 103 || GameCont.area == 107){
			sound_play_music(global.music[13]);
			global.pseudoArea = 13;
		}
		else if(GameCont.area == 102){
			sound_play_music(global.music[14]);
			global.pseudoArea = 14;
		}
		else if(GameCont.area == 106){
			sound_play_music(global.music[15]);
			global.pseudoArea = 15;
		}
		
		
		global.beatmapStartOffset = current_time;
		global.last_time = current_time;
		
		global.gce = 0;
	}
	
	/*with(Player)
	{
		if("cotn" not in self)
		{
			cotn = 1;
			maxspeed *= 1.5;
			friction *= 1.5;
		}
	}*/
	
	//trace(current_time-global.beatmapStartOffset);
	var onBeat = 0;
	
	if(global.pseudoArea <= global.maxmusic && global.pseudoArea > 0)
	{
		for(var i = 0; i < array_length_1d(global.beatmap[global.pseudoArea]); i += 1)
		{
			if(real(global.beatmap[global.pseudoArea][i]) >= global.last_time-global.beatmapStartOffset-global.actionDeadZone+global.actionOffset
			&& real(global.beatmap[global.pseudoArea][i]) < current_time-global.beatmapStartOffset+global.actionDeadZone+global.actionOffset)
			{
				onBeat = 1;
			}
			
			if(real(global.beatmap[global.pseudoArea][i]) >= global.last_time-global.beatmapStartOffset
			&& real(global.beatmap[global.pseudoArea][i]) < current_time-global.beatmapStartOffset)
			{
				//trace(global.beatmap[global.pseudoArea][i]);
				global.beatAnimation = 0;
				
				if(real(global.beatmap[global.pseudoArea][i]) == 0)
				{
					// ready up floors for blinkage
					with(Floor)
					{
						if((x+y)/((sprite_width+sprite_height)/2) mod 2)
						{
							dark = 1;
						}
						else
						{
							dark = 0;
						}
					}
				}
				else
				{
					if(global.radMultiplier)
					{
						// make floor tiles blink
						with(Floor)
						{
							if("dark" in self)
							{
								if(dark)
								{
									image_blend = c_white;
									dark = 0;
								}
								else
								{
									image_blend = c_ltgray;
									dark = 1;
								}
							}
							else
							{
								if("dark" in instance_nearest(x, y, Floor))
								{
									dark = instance_nearest(x, y, Floor).dark^1;
								}
							}
						}
					}
					else
					{
						// reset floors
						with(Floor)
						{
							image_blend = c_white;
						}
					}
				}
			}
		}
		
		with(Player)
		{
			if(!variable_instance_exists(self, "beatSpeed")){beatSpeed=maxspeed;}
			if(global.radMultiplier){
				maxspeed=beatSpeed*1.4;
				canwalk = 0;
			}else{
				maxspeed=beatSpeed;
				canwalk = 1;
			}
			
			if(onBeat)
			{
				with(instance_create(x, y+8, SmallExplosion))
				{
					team = other.team;
					image_speed = image_number;
				}
			}
			if(global.radMultiplier){
				// punish players for off-beat actions
				if(button_pressed(index, "fire"))
				{
					if(onBeat)
					{
						reload = min(reload, 1);
					}
					else
					{
						global.radMultiplier = 0;
					}
				}
				if(button_pressed(index, "spec"))
				{
					if(!onBeat)
					{
						global.radMultiplier = 0;
					}
				}
				if(onBeat && button_pressed(index, "east"))
				{
					speed = maxspeed;
					direction = 0;
				}
				else if(!onBeat && button_pressed(index, "east"))
				{
					global.radMultiplier = 0;
				}
				
				if(onBeat && button_pressed(index, "nort"))
				{
					speed = maxspeed;
					direction = 90;
				}
				else if(!onBeat && button_pressed(index, "nort"))
				{
					global.radMultiplier = 0;
				}
				
				if(onBeat && button_pressed(index, "west"))
				{
					speed = maxspeed;
					direction = 180;
				}
				else if(!onBeat && button_pressed(index, "west"))
				{
					global.radMultiplier = 0;
				}
				
				if(onBeat && button_pressed(index, "sout"))
				{
					speed = maxspeed;
					direction = 270;
				}
				else if(!onBeat && button_pressed(index, "sout"))
				{
					global.radMultiplier = 0;
				}
			}
		}
		
		if(GameCont.kills > global.last_kills)
		{
			global.radMultiplier += GameCont.kills-global.last_kills;
			global.last_kills += GameCont.kills-global.last_kills;
		}
		
		with(Rad)
		{
			if("multiplied" not in self)
			{
				multiplied = (global.radMultiplier+random(4))/5;
				
				if(multiplied >= 1)
				{
					repeat(floor(multiplied))
					{
						multiplied -= 1;
						
						with(instance_create(x, y, Rad))
						{
							multiplied = 0;
							speed = other.speed;
							direction = other.direction+90+random(180);
						}
					}
				}
				if(multiplied < 1)
				{
					if(random(1) <= multiplied)
					{
						with(instance_create(x, y, Rad))
						{
							multiplied = 0;
							speed = other.speed;
							direction = other.direction+90+random(180);
						}
					}
					multiplied = 0;
				}
			}
		}
		with(instances_matching_ne(Corpse, "cotn", 1)){
			with(Player){
				if(global.radMultiplier > 0){if(random(100) < global.radMultiplier){instance_create(other.x,other.y,AmmoPickup);}}
				if(global.radMultiplier > 0){if(random(200) < global.radMultiplier){instance_create(other.x,other.y,HPPickup);}}
				if(global.radMultiplier > 0){if(random(500) < global.radMultiplier){instance_create(other.x,other.y,WeaponChest);}}
				if(global.radMultiplier > 0){if(random(1000) < global.radMultiplier){instance_create(other.x,other.y,AmmoChest);}}
				if(global.radMultiplier > 0){if(random(2000) < global.radMultiplier){instance_create(other.x,other.y,HealthChest);}}
			}
			cotn = 1;
		}
		
		global.last_time = current_time;
	}
}

#define draw_gui
if(!instance_exists(GenCont)
&& !instance_exists(SkillIcon)
&& instance_exists(Player))
{
	draw_sprite(sprExplosion, global.beatAnimation, 160, 240-16);

	if(global.beatAnimation+0.4 < sprite_get_number(sprExplosion))
	global.beatAnimation += 0.4;
}
