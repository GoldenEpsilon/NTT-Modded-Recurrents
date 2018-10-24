#define init
skill_set_active(2, 0)
global.sprSkillIconHUD_2 = sprite_add("MutationHUD/sprSkillIconHUD_2.png", 1, 7, 8);

#define skill_name
return "extra feet x10"

#define skill_text
return "sonic speed"

#define skill_take
sound_play(sndMutExtraFeet)

#define step
with(Player)
{
    if("extrafeetx10" not in self)
    {
        extrafeetx10 = 1;
        maxspeed += 5;
		friction++
    }
    if ultra_get("melting", 2) == 1 && "xtrafeetx100" not in self
    {
        xtrafeetx100 = 1
        maxspeed += 45;
		friction+=3
    }
}

#define skill_icon
return global.sprSkillIconHUD_2

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 2;

#define skill_tip
return "make that blue hedgehog jealous"