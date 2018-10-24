#define init
global.l = 1;
#define game_start
global.l = 1;
#define step
if GameCont.level > global.l and !instance_exists(Portal) and instance_exists(Player){
    with instance_nearest(0,0,Player)
        ball_create(x,y,gunangle+180)
    global.l+=1;
}
#define ball_create(_x,_y,_d)
with instance_create(_x,_y,CustomHitme){
    name = "mutball"
    sprite_index = mskGuardianBullet
    friction = 0.1
    team = 1
    my_health = 10
    alarm1 = 30
    on_step = ball_step
    on_hurt = ball_hurt
    on_destroy = ball_open
    sound_play(asset_get_index("sndConfetti"+string(irandom(7))))
    motion_add(_d,4)
    return id;
}
#define ball_step
if alarm1>0 alarm1--
if current_frame mod 30 < 1
with instance_create(x+hspeed,y+vspeed+8,CaveSparkle){
    sprite_index = sprMindPowerTB
    depth = other.depth-1
}
if place_meeting(x,y,Wall) and speed>friction{
    move_bounce_solid(1)
    sound_play(sndHitRock)
    instance_create(x,y,Dust)
    speed += 0.01
}
if instance_exists(self) and instance_exists(Portal){
    motion_add(point_direction(x,y,Portal.x,Portal.y),1)
    if place_meeting(x+hspeed,y+vspeed,Portal){
        global.l-=1
        instance_delete(id)
    }
}
#define ball_hurt	
if alarm1<=0{
my_health -= argument0;
sound_play(asset_get_index("sndConfetti"+string(irandom(7))))
}
if my_health <= 0
	instance_destroy()
#define ball_open
repeat 6
sound_play(asset_get_index("sndConfetti"+string(irandom(7))))
with instance_create(x,y+5,GreenExplosion){sprite_index = sprMutant6BDead; image_index = 9;team = 2;}
var i = 45;
var n = 4;

with instances_matching(Player,"race","horror")
    n+=1
with instances_matching(GameCont,"crown",8)
    n-=3
//trace(n)

if fork(){
n = max(n,1)
for(var m=0;m<n;m++){
    var skill = irandom(27)+1;
    while skill_get(skill){
        var skill = irandom(27)+1
    }
    with instances_matching(CustomObject,"upmutcard",1) while mut = skill var skill = irandom(27)+1
    i+=360/n;
        var ski = skill;
        var _i = i;
        //skill_set(skill,1)
        //with instance_create(x,y,PopupText) text = string(skill_get_name(skill)+"!")
        card_create(x,y,ski,_i)
    }
    wait 10
    
    exit;
}
#define card_create(_x,_y,_m,_i)
with instance_create(_x,_y,CustomObject){
    sprite_index = sprSkillIcon
    image_speed = 0
    upmutcard = 1
    mut = _m
    mask_index = mskDebris
	image_index = mut
    image_xscale = 0.5
    image_yscale = 0.5
    name = skill_get_name(_m)
    rot = 0.02 * random(10)
    on_step = card_step
    depth = -11
    friction = 0.1
    motion_add(_i,2.5)
//    on_draw = card_draw
    return id;
}
#define card_step
image_xscale = abs((rot-1)/2)
rot += 0.02
//if rot mod 2 >= 2 
//if sprite_index = sprSkillSelected{
//    sprite_index = sprSkillIcon
//	image_index = mut
//    image_blend = c_white
//}
//else if sprite_index = sprSkillIcon{
//    sprite_index = sprSkillSelected
//	image_index = 0
//    image_blend =- c_black
//}
rot = rot mod 2;
y+=0.5*sin(current_frame/8)

if random(10)<1 instance_create(x+random_range(-2,2),y+random_range(-6,6)-12,FireFly)
if place_meeting(x,y,Wall){
    move_bounce_solid(1)
    speed *= 0.6
}
with instance_nearest(x,y,Player)
    with other if distance_to_object(other)<16{
        with script_bind_draw("E",-11)
        	creator = other
        if button_pressed(other.index,"pick"){
            skill_set(mut,1)
            GameCont.skillpoints -= 1;
            sound_play(sndMut)
            with instance_create(x,y,PopupText) text = string(skill_get_name(other.mut)+"!")
            with Player{
                if other.mut = mut_last_wish my_health = maxhealth
                else if other.mut = mut_hammerhead hammerhead += 10
            }
            with instances_matching(CustomObject,"upmutcard",1){
	            instance_create(x,y,ChestOpen)
	            repeat 3
	            with instance_create(x,y,Dust) vspeed -= 3
                instance_destroy()
            }
        }
    }
if instance_exists(self) and instance_exists(Portal){
    motion_add(point_direction(x,y,Portal.x,Portal.y),1)
    if place_meeting(x+hspeed,y+vspeed,Portal){
        global.l-=1
        with instances_matching(CustomObject,"upmutcard",1)
            instance_delete(id)
    }
}
#define E
	with creator{
		draw_sprite(sprEPickup,0,x,y-7)
		draw_set_color(c_black)
		draw_text(x-4*string_length(skill_get_name(mut)),y-30,skill_get_name(mut))
		draw_text(x+1-4*string_length(skill_get_name(mut)),y-30,skill_get_name(mut))
		draw_text(x+1-4*string_length(skill_get_name(mut)),y-31,skill_get_name(mut))
		draw_set_color(c_white)
		draw_text(x-4*string_length(skill_get_name(mut)),y-31,skill_get_name(mut))
		}
instance_destroy()      