#define init
skill_set_active(28, 0)
global.gce = 0;
global.sprSkillIconHUD_28 = sprite_add("MutationHUD/sprSkillIconHUD_28.png", 1, 7, 8);

#define skill_name
return "open mind x10"

#define skill_text
return "more chests, all the chests"

#define skill_take 
sound_play(sndMutOpenMind)

#define step
if(instance_exists(GenCont)) global.gce = 1; else if(global.gce)
{
	global.gce = 0; spawnExtraChests(); 
}

//jsnotes - im not gonna touch this, just gonna make it do proper rng
#define spawnExtraChests
var chestType = choose(WeaponChest, AmmoChest, RadChest);

with(chestType)
{
	if ultra_get("melting", 2) == 1
	{
		repeat(90)
		{
			var randomFloor = irandom(instance_number(Floor)-1);
			
			with(Floor)
			{
				randomFloor -= 1;
				
				if(randomFloor == 0)
				{
					instance_create(x+choose(8, 24), y+choose(8, 24), chestType);
				}
			}
		}
	}
	else
	{
		repeat(9)
		{
			var randomFloor = irandom(instance_number(Floor)-1);
			
			with(Floor)
			{
				randomFloor -= 1;
				
				if(randomFloor == 0)
				{
					instance_create(x+choose(8, 24), y+choose(8, 24), chestType);
				}
			}
		}
	}
}

with(GiantWeaponChest)
{
	repeat(4)
	{
		instance_create(x,y,GiantWeaponChest)
	}
}

#define skill_icon
return global.sprSkillIconHUD_28

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 28;

#define skill_tip
return "you seek for the grand knowledge?"
