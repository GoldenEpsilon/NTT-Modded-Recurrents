#define init
skill_set_active(24, 0)
global.sprSkillIconHUD_24 = sprite_add("MutationHUD/sprSkillIconHUD_24.png", 1, 7, 8);

#define skill_name
return "sharp teeth x10"

#define skill_text
return "getting hurt massively#damages enemies on screen"

#define skill_take 
sound_play(sndMutSharpTeeth)

#define step
/*
Old code that Saniblues wrote. uses custom object

with(Player){
    if "lasthealth" not in self{
        lasthealth = lsthealth;
    }
    if (lasthealth > my_health){
        with(enemy){
            if x > view_xview[other.index] && x < view_xview[other.index] + 320 && y > view_yview[other.index] && y < view_yview[other.index] + 240
			{
                ID = instance_create(x,y,CustomObject);
                ID.damage = (other.lsthealth - other.my_health) * 10;
                with(ID){
                    sprite_index = sprSharpTeeth;
                    image_speed = 0;
                    visible = false;
                    depth = other.depth - 1;
                    
                    creator = other.id;
                    on_step = script_ref_create(teeth_step);
                    alrm0 = 15;
                }
            }
        }
        lasthealth = my_health;
    }
    if lasthealth < my_health lasthealth = my_health;
}

#define teeth_step
    if (alrm0 && !--alrm0){
        image_speed = 0.4;
        visible = true;
    }
    if instance_exists(creator){
        x = creator.x;
        y = creator.y;
        if floor(image_index) = 2 && damage > 0 {
            with(creator){
                sprite_index = spr_hurt;
                image_index = 0;
                my_health -= other.damage;
                sound_play(snd_hurt);
            }
            damage = 0;
        }
    }
    if image_index + image_speed >= image_number instance_destroy();
*/

//jsnotes - smells like sani code to me, looks fine, ill leave it
with(Player)
{
    if "lasthealth" not in self{
        lasthealth = lsthealth;
    }
	if (lasthealth > my_health)
	{
        var _frame = current_frame;
        var _team = team;
        var _index = index;
        var _x = x, _y = y;
        var _damage = (lasthealth - my_health) * 25;
        with (hitme) if (team != _team && nexthurt <= _frame && sprite_index != spr_hurt && point_seen(x, y, _index)
        && object_get_parent(object_index) != prop && object_get_parent(object_index) != becomenemy) 
		{
            with (instance_create(x, y, SharpTeeth)) 
			{
                creator = other.id;
                damage = _damage;
                alarm0 = point_distance(x, y, _x, _y) / 8 + 1;
            }
        }
	}
	lasthealth = my_health;
}
	
	
#define skill_icon
return global.sprSkillIconHUD_24

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 24;

#define skill_tip
return "talk about fair trade"
