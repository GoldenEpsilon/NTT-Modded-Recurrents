#define init
skill_set_active(27, 0)
global.sprSkillIconHUD_27 = sprite_add("MutationHUD/sprSkillIconHUD_27.png", 1, 7, 8);
    // Create a custom object to handle drawing that destroys itself
    // I would use script_bind_draw, but I noticed that CustomDraw objects don't clean themselves up upon unloading a mod,
    // causing the game to lag quite a bit. Perhaps it is the case that they delete themselves upon unloading, but do not 
    // do the same when reloading. Should notify yal. ~Sani
	
	//sani you dummy, you can just destroy them yourself. ~js
	
	//im not gonna change it tho. ~also js

with instances_matching(CustomObject,"name","x10spiritdraw") instance_destroy()
with(instance_create(0,0,CustomObject)){
    name = "x10spiritdraw";
    persistent = true;
    depth = -3;
    on_draw = script_ref_create(draw_halo);
}

#define skill_name
return "strong spirit x10"

#define skill_text
return "prevents death 10 times"

#define skill_take 
sound_play(sndMutStrongSpirit)

#define skill_icon
return global.sprSkillIconHUD_27

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 27;

#define skill_tip
return "determination"

#define step
    with(Player){
        if ("x10_spirit" not in self){
			x10_spirit = 10;// 10 charges
			x10_canspirit = false;// Dictates whether or not you can recharge your Spirits
			spirit_drawspr = sprStrongSpiritRefill;
			spirit_drawind = 0;
			spirit_nexthurt = 0;
            candie = false;// Cannot die unless charges are depleted
        }else{
			if instance_exists(GenCont) && x10_spirit = 0{
				x10_canspirit = true;
			}
			// Checks if Player has MAXHEALTH of 1. If yes, disable regaining spirit
			if maxhealth = 1
			{
				x10_canspirit = false
			}
			// Handles loss. Better than most, on that note.
			// Try not to be too jealous.
            if my_health <= 0 && x10_spirit > 0 && spirit_nexthurt = 0{
				my_health = 1;
				lsthealth = 1;
                x10_spirit -= 1;
				spirit_nexthurt = 10;
                if x10_spirit = 0{
					candie = true;
					spirit_drawspr = sprStrongSpirit;
					spirit_drawind = 0;
					spirit_nexthurt = 60;
					sound_play(sndStrongSpiritLost);
				}
            }
			
			// Mercy Invincibility
			if (spirit_nexthurt && --spirit_nexthurt){
				nexthurt = current_frame + spirit_nexthurt;
			}
				
			// Regain spirit when health is fully depleted
            if my_health = maxhealth && maxhealth > 1 && x10_spirit = 0 && x10_canspirit = true{
                x10_spirit = 10;
				x10_canspirit = false;
				sound_play(sndStrongSpiritGain);
				spirit_drawspr = sprStrongSpiritRefill;
				sprite_drawind = 0;
			}
			//Animation handler for Strong Spirit Halo
			if spirit_drawind + 0.40 >= sprite_get_number(spirit_drawspr) 
				spirit_drawind = sprite_get_number(spirit_drawspr) - 1;
			else spirit_drawind += 0.40
        }
		if ultra_get("melting", 2) == 1 && "detachmentx10" not in self
		{
			x10_spirit += 90
			detachmentx10 = 1
		}
		if place_meeting(x,y,HyperCrystal)
		{
			if "crystaldmgx10" not in self
			{
				x10_spirit = 1
				crystaldmgx10 = 1
			}
		}
    }
	
#define draw_halo
var xx = draw_get_halign();
draw_set_halign(1)
with(Player)
{
	if (visible)
	{
		if ("x10_spirit" in self)
		{
			draw_sprite(spirit_drawspr,spirit_drawind,x,y);
			if x10_spirit >= 10
			{
				draw_text_nt(x+8,y-24,string(x10_spirit));
			}
			else
			{
                if x10_spirit > 0
				{
					draw_text_nt(x-4,y-24,string(x10_spirit));
				}
			}
		}
	}
}
draw_set_halign(xx)