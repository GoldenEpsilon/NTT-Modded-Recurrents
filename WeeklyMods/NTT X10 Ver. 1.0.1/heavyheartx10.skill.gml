#define init
skill_set_active(29, 0)
global.sprSkillIconHUD_29 = sprite_add("MutationHUD/sprSkillIconHUD_29.png", 1, 7, 8);
global.x10killcounter = 0

#define game_start
GameCont.wepmuts = -6

#define skill_name
return "heavy heart x10"

#define skill_text
return "D.I.Y. Y.V.'s crib#weapons disappear when#over 100 weapons exist"

#define skill_take 
sound_play(sndMutHeavyHeart)

#define skill_avail
return 0;

#define step
if instance_number(WepPickup) > 100 {
	with instance_random(WepPickup){
		instance_destroy()
	}
}

with instances_matching_le(enemy,"my_health",0){
	if "heavyheartx10" not in self{
		heavyheartx10 = 1
		if ultra_get("melting",2){
			var melt = 10
		}
		else melt = 1
		make_wep(x,y,GameCont.hard-2,melt)
	}	
}

#define make_wep(_x,_y,hard,count)
var weplist = ds_list_create();
weapon_get_list(weplist, 0, hard);
repeat(count){
	with instance_create(_x,_y,WepPickup){
		wep =(ds_list_find_value(weplist, irandom(ds_list_size(weplist) - 1)));
		roll = 1
		ammo = 1
	}
}
ds_list_destroy(weplist)

//Old X10 Heavy Heart
/*with(enemy)
{
    if "my_health" in self && "heavyheartx10" not in self && my_health <= 0
    {
		heavyheartx10 = 1
		global.x10killcounter += 1
    }
}

if global.x10killcounter = 25{
	instance_create(Corpse.x,Corpse.y,VenuzWeaponSpawn) //using Corpse.x and such to use the newest corpse available
	if ultra_get("melting", 2) == 1 
	{
		if "detachmentx10" not in self
		{
			repeat(10)
			{
				instance_create(Corpse.x,Corpse.y,VenuzWeaponSpawn)
				detachmentx10 = 1
			}
		}
	}
	global.x10killcounter = 0
}
*/

#define instance_random(obj)
var b = irandom(instance_number(obj)-1);
with(obj)
{
    b -= 1;
    if(b == 0)
    {
        return id;
    }
}

#define skill_icon
return global.sprSkillIconHUD_29

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 29;

#define skill_tip
return choose("robot's wet dream", "BAM, weapons from nowhere!")
