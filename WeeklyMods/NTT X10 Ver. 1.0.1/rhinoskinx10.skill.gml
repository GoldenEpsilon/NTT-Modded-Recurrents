#define init
skill_set_active(1, 0);
global.sprSkillIconHUD_1 = sprite_add("MutationHUD/sprSkillIconHUD_1.png", 1, 7, 8);

#define skill_name
return "rhino skin x10"

#define skill_text
return "+40 HP"

#define skill_take
sound_play(sndMutRhinoSkin)
with(Player) if ((race = "melting" xor ultra_get("melting",2)) || race != "melting")
{
    maxhealth += 40;
    my_health += 40;
}

#define step

#define skill_icon
return global.sprSkillIconHUD_1

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 1;

#define skill_tip
return "obsidian skin"