// /loadtext cotn

#define init
global.gce = 0;
global.beatmapStartOffset = current_time;
global.last_time = current_time;
global.actionDeadZone = 100;
global.actionOffset = 0;
global.radMultiplier = 0;
global.last_kills = 0;
global.beatAnimation = 0;

// load beatmaps
if(fork())
{
	global.beatmap[1] = "";
	
	wait(file_load([
	"beatmaps/zone1_1.txt"
	]));
	
	global.beatmap[1] = string_load("beatmaps/zone1_1.txt");
	global.beatmap[1] = string_split(global.beatmap[1], ",");
	
	file_unload([
	"beatmaps/zone1_1.txt"
	]);
}

global.maxmusic = 0;

// load music
if(fork())
{
	wait(file_load([
	"music/zone1_1.ogg"
	]));
	
	global.music[1] = sound_add("music/zone1_1.ogg");
	global.maxmusic = 1;
	
	file_unload([
	"music/zone1_1.ogg"
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
		if(GameCont.area <= global.maxmusic)
		{
			sound_play_music(global.music[GameCont.area]);
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
	
	if(GameCont.area <= global.maxmusic)
	{
		for(var i = 0; i < array_length_1d(global.beatmap[GameCont.area]); i += 1)
		{
			if(real(global.beatmap[GameCont.area][i]) >= global.last_time-global.beatmapStartOffset-global.actionDeadZone+global.actionOffset
			&& real(global.beatmap[GameCont.area][i]) < current_time-global.beatmapStartOffset+global.actionDeadZone+global.actionOffset)
			{
				onBeat = 1;
			}
			
			if(real(global.beatmap[GameCont.area][i]) >= global.last_time-global.beatmapStartOffset
			&& real(global.beatmap[GameCont.area][i]) < current_time-global.beatmapStartOffset)
			{
				//trace(global.beatmap[GameCont.area][i]);
				global.beatAnimation = 0;
				
				if(real(global.beatmap[GameCont.area][i]) == 0)
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
			//canwalk = 0;
			
			if(onBeat)
			{
				with(instance_create(x, y+8, SmallExplosion))
				{
					team = other.team;
					image_speed = image_number;
				}
			}
			
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
			/*if(button_pressed(index, "east"))
			{
				if(onBeat)
				{
					speed = maxspeed;
					direction = 0;
				}
				else
				{
					global.radMultiplier = 0;
				}
			}
			if(button_pressed(index, "nort"))
			{
				if(onBeat)
				{
					speed = maxspeed;
					direction = 90;
				}
				else
				{
					global.radMultiplier = 0;
				}
			}
			if(button_pressed(index, "west"))
			{
				if(onBeat)
				{
					speed = maxspeed;
					direction = 180;
				}
				else
				{
					global.radMultiplier = 0;
				}
			}
			if(button_pressed(index, "sout"))
			{
				if(onBeat)
				{
					speed = maxspeed;
					direction = 270;
				}
				else
				{
					global.radMultiplier = 0;
				}
			}*/
		}
		
		if(GameCont.kills > global.last_kills)
		{
			global.radMultiplier += 1;
			global.last_kills += GameCont.kills-global.last_kills;
		}
		
		with(Rad)
		{
			if("multiplied" not in self)
			{
				multiplied = global.radMultiplier;
				
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
