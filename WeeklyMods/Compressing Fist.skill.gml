#define init
global.sprCompButton = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAIAAACHPC9vAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwAAADsABataJCQAAABl0RVh0U29mdHdhcmUAcGFpbnQubmV0IDQuMC4xOdTWsmQAAAGbSURBVEhLrZUxTgMxEEX3IIibIKRQRyjiKlyAho6CA1DQUNBScwKugDgDBS2CZ3/rezLeXYWIry/HO/PnrXelJNPddhP9uLs40Gmwg1LuQHu8gVL7T+6g1DjC/wpKpaO9BroclALR8yCNvT3fJKuewnIHKSSl+eQWqvJ4A1FyiPXj+lyXS5uY7yBXYyJOjrg0sgeKt4q516tT7MsY8EgB8RGrDqmOBGoXgYINQhM735MGdm7JBJRk79kCitdYoBWcW3FqEjg2nGMzSvWIwEDKiXROE5VesQNxsD2a7XtarluORU/xhGr7aKpYLioQK0AKyHbvbFnpNtPUCHuPRhURZeD7/WV2lZy/f3hiLXvG6ngRVTWIft7uxhWWcBGkkaKfrxPMRiUO7LFxNaiONrVLgxAlPdoSiJVunGqn0wtD5YVV+R1pUjYlgcQqEH/73WOzAqKF2rNUMd5+RsrH/h3WQaL4NTeC/44oSeTqXRdFwCxWZvP/GoeM0sC4t0TpILPojelZKWZKB4mlRHIdnK+bgjsILw0s1fvsdvMLYlQY4M2ZSLkAAAAASUVORK5CYII=", 1, 12, 16)
global.sprCompIcon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAAAjElEQVQ4T6WRXQ6AIAyDuRiH9AAmPHkmb4O2WkLmSLb48LGldA0/pff+C1fM4IoZnoXFN6zQzNOcBR2FCPBu+8GZISik1rrEhrBaAcbWGgdsVQi86QD19N2n1YnHsO40D1iwJz9gj0UiajTg+4hvEEwrhnf6NQpKgxCBXvsGsyGCZj4bWVwxgyvG6eUC6OWZFL7rcZkAAAAASUVORK5CYII=", 1, 8, 8)

#define skill_name
	return "Compressing Fist";
	
#define skill_text
	return "Double ammo usage, Extra damage";

#define skill_button
	sprite_index = global.sprCompButton;
	
#define skill_icon
	return global.sprCompIcon;

#define skill_tip
	return "Fused ammo is surprisingly effective";
	
#define skill_take
	sound_play(sndMutHammerhead);
	
#define step

with Player {
    if (fork()) {
        var OldAmmo = array_copy(ammo, 0, ammo, 0, array_length_1d(ammo));
		wait 0;
		if(instance_exists(self)){
			for(var i = 0; i < array_length(ammo); i++){
				if(ammo[i] < OldAmmo[i]){
					ammo[i] += ammo[i] - OldAmmo[i];
					if(ammo[i] < 0){ammo[i] = 0;}
				}
			}
		}
	}
	exit
}
with(instances_matching(instances_matching(projectile,"comp_fist",null),"team",2)){
  damage*= 1.5;
  comp_fist = true;
}