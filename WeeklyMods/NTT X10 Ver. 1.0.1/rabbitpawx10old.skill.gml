#define init
skill_set_active(4, 0)
global.sprSkillIconHUD_4 = sprite_add("MutationHUD/sprSkillIconHUD_4.png", 1, 7, 8);

#define skill_name
return "rabbit paw x10"

#define skill_text
return "100% ITEM DROPS AND X10 AMMO VALUE"

#define skill_take 
sound_play(sndMutRabbitPaw)

#define step
with(Player)
{
	if "x10_paw" not in self
	{
	x10_paw = 1;
	for(var i = 1;i<=5;i++)typ_ammo[i] *= 10;
	}
}


with(enemy)
{
    if "my_health" in self && "pawx10" not in self && my_health <= 0
    {
		pawx10 = 1
		if instance_exists(Player)
		{
			if random(maxhealth) > my_health and random(3) < 2
			{
				instance_create(x,y,HPPickup)
			}
			else
			{
				instance_create(x,y,AmmoPickup)
			}
		}
	}
}


#define skill_icon
return global.sprSkillIconHUD_4

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 4;

#define skill_tip
return "[7][7][7]"
