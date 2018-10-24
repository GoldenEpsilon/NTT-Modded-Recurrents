#define init
GameCont.heartx10 = 2
global.ammonames = ["MELEE", "BULLETS", "SHELLS", "BOLTS", "EXPLOSIVES", "ENERGY"]
global.ammoicons = sprite_add("MutationHUD/sprAmmoIcons.png", 5, 4, 4.5)
global.ammo = 0
global.words = ["Disabled custom ammo indicators", "Enabled custom ammo indicators"]
#define game_start
GameCont.heartx10 = 2

#define chat_command(cmd,arg,ind)
if cmd = "x10ammo"{
	global.ammo = !global.ammo
	var a = global.ammo;
	trace_color(global.words[a],a ? c_green : c_red)
	if !a with instances_matching(CustomObject,"name","x10ammo") instance_destroy()
	return 1
}
return 0

#define step
//Heavy Heart Spawning
if mod_exists("skill","heavyheartx10"){ //if statements split up like this for optimization
	if instance_exists(SkillIcon){
		if (GameCont.wepmuts = -3  && GameCont.heartx10 = 2 && (10 - (GameCont.level - GameCont.skillpoints)) != 1) {
			with SkillIcon if num = 0{
				skill = "heavyheartx10"
				name = "heavy heart x10"
				text = "D.I.Y. Y.V.'s crib#weapons disappear when#over 100 weapons exist"
				sprite_index = sprSkillIcon
				image_index = 29
				GameCont.heartx10 = 1
			}
		}
	}
}

//Custom ammo tracker designed to reduce clutter caused by x10 ammo mutations
if global.ammo{
	with Player if "ammotracker" not in self || !instance_exists(ammotracker){
		var q = instance_create(x,y,CustomObject)
		with q {
			name = "x10ammo"
			creator = other
			on_step = ammo_step
			on_draw = ammo_draw
			ammo = [0,0,0,0,0,0]
			depth = -20
			ammotimers = [1,0,0,0,0,0]
		}
		ammotracker = q
		for(var h=0;h<=5;h+=1){
			lastammo[h] = ammo[h]
		}
	}
}
#define ammo_step
if instance_exists(creator){
	with PopupText if "target" in self{
		if target == other.creator.index{
			var ammocount = [0,0,0,0,0,0];
			for(var j=1;j<=5;j+=1){
				if string_count(global.ammonames[j], mytext) >=1{
					ammocount[j] = string_replace(mytext, global.ammonames[j], "");
					if !string_count("MAX", mytext) {ammocount[j] = string_replace(ammocount[j],"+", "")}
					else {ammocount[j] = other.creator.ammo[j] - other.creator.lastammo[j]}
					other.ammo[j] += real(ammocount[j])
					other.ammotimers[j] = 0
					instance_destroy();
					with other.creator{
						for(var h=0;h<=5;h+=1){
							lastammo[h] = ammo[h]
						}
					}
				}
				if !instance_exists(self) break;
				if string_count(global.ammonames[j], text) >=1{
					ammocount[j] = string_replace(text, global.ammonames[j], "");
					if !string_count("MAX", text) {ammocount[j] = string_replace(ammocount[j],"+", "")}
					else {ammocount[j] = other.creator.ammo[j] - other.creator.lastammo[j]}
					other.ammo[j] += real(ammocount[j])
					other.ammotimers[j] = 0
					instance_destroy()
					with other.creator{
						for(var h=0;h<=5;h+=1){
							lastammo[h] = ammo[h]
						}
					}
				}
				if !instance_exists(self) break;
			}
		}
	}
	var counter = 0;
	for(var j=1;j<=5;j+=1){
		if ammo[j] != 0{
			if ammotimers[j] >= 0 {ammotimers[j] += 1}
		}
		if ammotimers[j] = 30 {ammotimers[j] = -1}
		if ammotimers[j] = -1 && ammo[j] > 0 {
			ammo[j] -= max(round(ammo[j]/20),1)
		}
		if ammo[j] <= creator.typ_ammo[j]/25 {
			counter += 1
		}
	}
	if counter = 5 && ammotimers[0] < 30{
		ammotimers[0] += .025
	}
	else {ammotimers[0] = 0}
	with creator{
		other.x = x + hspeed;
		other.y = y + vspeed;
		for(var h=0;h<=5;h+=1){
			lastammo[h] = ammo[h]
		}
	}
}
else instance_destroy()

#define ammo_draw
var _x = creator.x;
var _y = creator.y + 20;
var xoffset = -24;
var lastalpha = draw_get_alpha();

with Player{draw_set_visible(index,0)}
if instance_exists(creator) {draw_set_visible(creator.index,1)}

draw_set_halign(fa_right);
draw_set_font(fntSmall);
draw_set_alpha(1 - ammotimers[0]);
for (var f=1;f<=5;f+=1){
	var st = "+";
	if ammo[f] = 0 {st = "";}
	var str = string(ammo[f])
	//if creator.ammo[f] = creator.typ_amax[f] {str = "MAX"; st = "";}
	var l = string_length(string(ammo[min(f+1,5)]) + st) + 1;
	//if creator.ammo[min(f+1,5)] = creator.typ_amax[min(f+1,5)] {l = 4;}
	draw_sprite(global.ammoicons, f - 1, _x + xoffset - 3, _y - 6)
	draw_text_nt(_x + xoffset, _y, st + str);
	xoffset += max(12,4*l);
};
draw_set_alpha(lastalpha);
draw_set_halign(2);
with Player{draw_set_visible(index,1)}
draw_set_font(fntM)