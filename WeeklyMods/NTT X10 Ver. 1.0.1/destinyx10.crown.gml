#define crown_name
return "Crown of Destiny X10"

#define crown_text
return "10 extra mutations
narrow future"

#define crown_tip
return "this was worth it. no?"

#define crown_take
GameCont.skillpoints += 10

#define step
//jsnotes - ehehhehehehhe
with SkillIcon if num = 2 && !mod_exists("mod", "allskills"){
    with SkillIcon{
        if num = 0 num = 1.5
        else instance_destroy()
    }
}
#define crown_button
sprite_index = sprCrownSelect;
image_index = 8;

#define crown_avail // L1
return GameCont.loops > 0;