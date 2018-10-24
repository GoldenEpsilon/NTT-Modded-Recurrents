#define init
skill_set_active(8, 0)
global.sprSkillIconHUD_8 = sprite_add("MutationHUD/sprSkillIconHUD_8.png", 1, 7, 8);

#define skill_name
return "gamma guts x10"

#define skill_text
return "massive aoe damage and blast"

#define skill_take 
sound_play(sndMutGammaGuts)

#define step
if ultra_get("melting",2){
	var melt = 10;
}
else melt = 1;


with Player if "gammabuddy" not in self || !instance_exists(gammabuddy){
	var q = instance_create(x,y,CustomObject);
	with q{
		creator = other
		team = other.team
		sprite_index = sprGammaBlast
		image_speed = 0
		sizemin = 1 *melt //minimum size
		sizemax = 3 *melt //maximum size
		growtime = 15 //time it takes for the blast to revert back to its original size
		image_xscale = sizemin
		image_alpha = 0
		damage = 20 * melt
		force = 0
		growtimer = 0
		on_step = gammastep
		on_draw = gammadraw
	}
	gammabuddy = q
}
with Player if instance_exists(gammabuddy) {
	gammabuddy.x = x +hspeed
	gammabuddy.y = y +vspeed
}

#define gammadraw
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.25);
draw_set_blend_mode(bm_normal);

#define gammastep
if ultra_get("melting",2){
	var melt = 10;
}
else melt = 1;

with enemy if place_meeting(x,y,other){
	projectile_hit(self, other.damage, other.force);
	if my_health <= 0{
		other.growtimer = other.growtime
		other.image_xscale = other.sizemax
		other.damage = 80*melt
		sound_play(sndGammaGutsKill)
	}
	else{
		sound_play(sndGammaGutsProc)
	}
}
if growtimer > 0{
	growtimer -=1
	image_xscale -= (sizemax-sizemin)/growtime
}
if growtimer = 0 {damage = 40*melt}
image_yscale = image_xscale

if !instance_exists(creator){
	instance_destroy()
}

#define skill_icon
return global.sprSkillIconHUD_8

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 8;

#define skill_tip
return "shiny skin"

//jsburg wrote this, and he says "hell yeah community service hours"