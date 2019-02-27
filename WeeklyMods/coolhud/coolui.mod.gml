#define draw_gui
with Player{
	snd_hurt = global.oof
	for (var o=0; o<curp(); o++){
		draw_set_visible(o,0)
	}
	draw_set_visible(index,1)
	var _x = 5;
	var _y = 5;
	for (var i = 0;i<maxhealth;i+=2){
		if my_health <= 4 var n = random(1)-1
		if lsthealth != my_health && !(current_frame mod 5) d3d_set_fog(1,c_white,0,0)
		draw_sprite(global.hearts,0,_x+4*i,_y+n)
		d3d_set_fog(0,0,0,0)
		for (var o = 0;o<my_health-i;o++){
			draw_sprite(global.heart,o mod 2,_x + 4*i + 4*o,_y+n)
		}
	}
	_y += 10
	draw_sprite(global.xbar,0,_x,_y)
	var w = 182*(GameCont.rad/(60*GameCont.level+GameCont.radmaxextra));
	draw_sprite_part(global.xpbar,0,0,0,w,5,_x,_y)
	for(var i = 0; i < 360; i += 90){
		craft_num(_x+89+lengthdir_x(1, i), _y+lengthdir_y(1, i)-3,GameCont.level,c_black,1);
	}
	craft_num(_x+89,_y-3,GameCont.level,make_color_rgb(142,255,35),1)
	_y += 11
	if curse draw_rectangle_color(_x+2,_y+16,_x+18,_y-2,c_purple,c_purple,c_purple,c_purple,0)
	if bcurse draw_rectangle_color(_x+20,_y+16,_x+38,_y-2,c_purple,c_purple,c_purple,c_purple,0)
	draw_sprite(global.bar,0,_x,_y)
	_x += 6
	_y += 11
	var sprt = weapon_get_sprite(wep);
	draw_sprite_ext(sprt,0,_x,_y,1,1,45,c_white,1)
	_x+=20
	if bwep{
		sprt = weapon_get_sprite(bwep)
		draw_sprite_ext(sprt,0,_x,_y,1,1,45,c_white,1)
		_x+=20
	}
	_y++
	for (var i = 0; i<=5;i++){
		var col = c_white;
		if !ammo[i] col = c_gray;
		draw_sprite_ext(global.ammo[i],0,_x, _y,1,1,0,col,1)
		if i{
			if weapon_get_type(wep) = i || (race = "steroids" && weapon_get_type(bwep) = i) draw_sprite(global.box,0,_x,_y)
			craft_num(_x+13,_y,ammo[i],merge_color(col,c_black,.75),0)
			craft_num(_x+12,_y-1,ammo[i],col,0)
		}
		_x+=20
	}
	if race = "rogue" {
		var col = c_white;
		if !rogueammo col = c_gray;
		draw_sprite_ext(sprRogueAmmo,0,_x+5,_y-5,1,1,0,col,1)
		craft_num(_x+13,_y,rogueammo,merge_color(col,c_black,.75),0)
		craft_num(_x+12,_y-1,rogueammo,col,0)
	}

}

#define draw
/*draw_set_color(c_white)
draw_set_alpha(1)
for (var i = 0; i<= curp(); i++){
	for (var o=0; o<curp(); o++){
		draw_set_visible(o,0)
	}
	draw_set_visible(i,1)
	draw_set_blend_mode_ext(10,4)
	draw_line_width(mouse_x[i],mouse_y[i]+3,mouse_x[i],mouse_y[i]-4,1)
	draw_line_width(mouse_x[i]-4,mouse_y[i],mouse_x[i]-1,mouse_y[i],1)
	draw_line_width(mouse_x[i]+3,mouse_y[i],mouse_x[i],mouse_y[i],1)
	draw_set_blend_mode(bm_normal)
}*/

#define craft_num(_x,_y,num,col,cen)
var n = 6
if cen > 0 n = 3
var a = string(num)
var l = string_length(a)
for (var o = l;o>0;o--){
	draw_sprite_ext(global.numbers,real(string_char_at(a,o)),_x+6*o - n*l,_y+1,1,1,0,col,1)
}

#define init
for (var i=0; i<maxp; i++){
	player_set_show_hud(i,i,0)
	//player_set_show_cursor(i,i,0)
}
global.oof = sound_add("oof.ogg")
global.heart = sprite_add("coolheart.png",2,0,0)
global.hearts = sprite_add("coolhearts.png",1,0,0)
global.bar = sprite_add("coolbar.png",1,0,4)
global.box = sprite_add("coolbox.png",1,7,17)
global.xbar = sprite_add("coolxp.png",1,0,0)
global.xpbar = sprite_add("coolxpf.png",1,0,0)
global.numbers = sprite_add("coolnumbers.png",10,4,4)
global.ammo = [mskNone,sprite_add("coolbullet.png",1,3,13),sprite_add("coolshell.png",1,3,12),sprite_add("coolbolt.png",1,3,13),sprite_add("coolexplo.png",1,3,13),sprite_add("coolenergy.png",1,3,13)]


#define cleanup
for (var i=0; i<maxp; i++){
	player_set_show_hud(i,i,1)
	//player_set_show_cursor(i,i,1)
}


#define curp()
var n = 0;
for (var i=0; i<maxp; i++){
	if player_is_active(i) n++
}
return n