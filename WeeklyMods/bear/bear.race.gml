#define init
global.idle = sprite_add("bearidle.png",1,30,15)
global.port = sprite_add("bearidle.png",1,-30,170)
global.walk = sprite_add("bear (1).png", 13, 33, 18)
global.hurt = sprite_add("bearhurt.png",3,30,15)


with instances_matching(CustomDraw,"name","beargod"){
	instance_destroy()
}
with(script_bind_draw(coolshit,-10)){
	persistent = 1;
	name = "beargod";
}


#define race_name
return "bear"

#define race_soundbank
return 3

#define race_swep
return "beargun"

#define race_text
return "HAS A FUCKING GUN#@qACCELERATE"

#define race_portrait
return global.port

#define race_menu_button
sprite_index = global.idle

#define create
image_xscale = -.3
image_yscale = .3
mask_index = -1
spr_walk = global.walk
spr_idle = global.idle
spr_hurt = global.hurt
spr_dead = global.hurt
speeeeed = 0

#define step
if sprite_index = spr_walk{
	image_speed = 1
}else{
	image_speed = .4
}
if canspec && button_check(index,"spec"){
	speeeeed += 2
	view_shake_at(x,y,speeeeed/30)
	speed = 0
	sound_play_pitch(sndPortalLoop,speeeeed/30)
	sprite_index = spr_walk
	image_index = (current_frame *(speeeeed/50)) mod image_number
}
if button_released(index,"spec"){
	speeeeed = 0
	sound_stop(sndPortalLoop)
}

if speeeeed > 800{
	sound_play(sndNukeExplosion)
	speeeeed = 0
	with instance_create(x,y,PopupText){
		target = other.index
		text = choose("gimme the succy succ","shit i didnt have a plan for the active","keep calm and", "skate fast#eat ass", "its been 3000 years", "download jsburgs modpack", "sone buckin sauce", "consume the booty")
	}
}

#define coolshit
with Player if race = mod_current && speeeeed > 20{
	draw_set_blend_mode( bm_subtract );
	draw_circle_color(view_xview+game_width/2, view_yview+game_height/2, game_width - (speeeeed/5), c_black, make_color_hsv(0,0,min(speeeeed,255)), 0);
	draw_set_blend_mode( bm_normal );
}