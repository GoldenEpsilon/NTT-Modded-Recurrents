#define init
skill_set_active(9, 0)
global.sprSkillIconHUD_9 = sprite_add("MutationHUD/sprSkillIconHUD_9.png", 1, 7, 8);

#define skill_name
return "second stomach x10"

#define skill_text
return "a lot more hp from medkits"

#define skill_take 
sound_play(sndMutSecondStomach)

#define step
with instances_matching(HPPickup,mod_current,null){
	variable_instance_set(self,mod_current,1)
	num = 40
}
//original x10 stomach
 /*
with PopupText {
    if "StomachProc" not in self {
        if text="+2 HP" {
            var tplr=instance_nearest(x,y,Player);
            if instance_exists(tplr) {
                tplr.my_health=min(tplr.my_health+18,tplr.maxhealth)
                if tplr.my_health=tplr.maxhealth
                    text="MAX HP"
                else
                    text="+20 HP"
            }
        }
        StomachProc=1
    }
}

with PopupText {
    if "StomachProc" not in self {
        if text="+4 HP" {
            var tplr=instance_nearest(x,y,Player);
            if instance_exists(tplr) {
                tplr.my_health=min(tplr.my_health+18,tplr.maxhealth)
                if tplr.my_health=tplr.maxhealth
                    text="MAX HP"
                else
                    text="+40 HP"
            }
        }
        StomachProc=1
    }
}
*/

#define skill_icon
return global.sprSkillIconHUD_9

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 9;

#define skill_tip
return "insert i'm so hungery joke here"