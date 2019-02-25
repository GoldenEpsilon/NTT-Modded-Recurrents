#define init
global.spr_BulwarkIdle = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAWgAAAAYCAMAAADgbpeSAAAAJFBMVEUAAAAAAAAOHikdGhcgN0YyLitGWntITDxVepJ5fmuqr5f///8+GmDeAAAAAXRSTlMAQObYZgAAAUJJREFUeAHt1NHKKyEMBOBONmrdvv/7nrhNhTOILL/sjTq9KHxCBhLY1xTZ2dlBTd+fL57bob+wvz1P9HLB/A7tecq5Ocd9oJcLZndoz9NpeYMe3EcOxgUrezp/ft6ec/9gXDC/p46r2uJUeU71gYNRwRquTTeIQIwRvB+N3wwczAtgibBM74CqfjzO1WP0TdN+3IHuQhu9XPDFuIQfR6iLDvjf4RsNoDnurfnk3EsF/hKwhpdN5zN/2MtGzSM7fNMtv9dbCwArQMASLqqpfFxTx3lOHOzlgvkdSUQ0F8+44cO97YLp/YWUzUXsz7X69SMvc0zHe7l4fvfFqTG5iFrcaU5qH6Z9sNrbKp7fPRAJci0UN5wOwN7sFeptFszvL4SAkqPjD/RSwRpuguO+j/f6Q5GHfbvRJXjAt/8xOzs7O/8AQUQ3xjK4lyIAAAAASUVORK5CYII=",15,12,12);
global.spr_BulwarkWalk = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAMAAAAie4Q/AAAAIVBMVEUAAAAAAAAOHikdGhcgN0YyLitGWntITDxVepJ5fmuqr5c3BMIkAAAAAXRSTlMAQObYZgAAAX9JREFUeNrtlmFvgzAMRHchkIb//4NnF8ONHMKakCZNqpFa6Rzei90v/frU88JRf8HJz6O+ovCQUxNO7iWn9S4gMYt3yAOUcdSrnLZavYBsAvUyJwj55tTLRlv3xop0AvWSc4Bws7nc65xa7XytbMgEubcRhHxz6mXDkmUB4B/ZBOplI0DOud8cvaE9eX2CSJdkAnoBEENOgAYOQeK10zLANM11v+eMYQLLN/fgZUrOT5BujmJ6j0XMY8NBfe1xIZrDC4hXFzoFqDlo3FyI771sFFuo/8bt3WB+bIK5etlwUHuDznyuIvN6GbqUUrs3OpBMIF5WcDobOsGtl6BujVLsi7FMcOslx6ulm1PvGWSZPfWcY8s5ATmeWvVLDvnJBHKe5nm2N2ot1MoEA993FykLlhvKGwNnf4ZGUa+X3QdbTcOF4Hh5A9i9cqOgyIbc4LNdi6cJIyYCvWmMIG8Ihz2N3wOAmyMfQfv1360rNUONFbTtYowf/BNMszz+1P+tb0+uFXrNJWz0AAAAAElFTkSuQmCC",6,12,12);
global.spr_BulwarkHurt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEgAAAAYCAMAAABuvUuCAAAAJ1BMVEUAAAD///8AAAAOHikdGhcgN0YyLitGWntITDxVepJ5fmuqr5f///8kLqcOAAAAAnRSTlMAf7YpoZUAAAD2SURBVHgB5dPRboMwDIVh5xinrun7P+8M8bKslrdcTtqpBBKF75eQoL+71xx9G+Y2nQKCPGMBtZ8Lrwy14VyQmiUoFcLJUmu3I+6cvidQF+YTGfLdkJ6f0LmWc6GAQoI6JOJhkRWqCi1BMagLcRULVBVKB+JObHGi8ID/HkCCkoTj6BPqeCsMxA+0B12SnTah+QdC6tiCWESvl6oJEme8gB0IysxiF2QA/VpomZnv1NRU1XhhqkJAWWo07vcxH3grsC8VKEPxjXAP6QtqN8RqAzuw9/X3jntv94O5RyFD40wJus9+3CpQQGkYUB6KAhUQAeX1f7IPkIcUnLWFsL8AAAAASUVORK5CYII=",3,12,12);
global.spr_BulwarkDead = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAMAAAAie4Q/AAAAJ1BMVEUAAAD///8AAAAOHikdGhcgN0YyLitGWntITDxVepJ5fmuqr5f///8kLqcOAAAAAnRSTlMAf7YpoZUAAAGWSURBVHgB7dXRjuMgDIVhOATqOHn/510cUtBpjdJK2d2b/iNNJZjiT0k6Db8+be8FCr3/5WEQ8np2guK/ke7voNg8BhJVBrH073lIFKNNNZBstRWYSm8uRhcUDpBsT9A2Bk+kfvEukB0FqaCcRTVnBrH07qIHsiBVsrdAIJbeeX2sqQe5e3Yby9IH6s8DQxpjvPuZZhGWpXRQwYu0Yeqv0EFfi/DsC5CJdFMG2QZOUcHFLYrTydDtDB+DUs5iD6+8gXLlVCkKLv/lw58M1XNdyToHQVJKWaW9JVxL+SgePEaPT4bUnfwM/qfs5dnVpPa+ZH9NUmEpc+gw9Lk8GcnOTjnROoFYFEO7QrWUFrxIU42lu9MxV6XNZRFKSZLagPUo+2d1T7TDyikaoLrcpIYa0t3Nbq80eh3bQ7vtRe2UsY4Pvu1LwVEH9ctdSLr7VbouxUCiK4MsOagzUHsNb6DjlTwkvQBZaczlybZFIBIFLxjICyydqPrcGoPObMcFBR/EE6/XXVAj+aAAAt3f/IuRCv5GuOzXH5WfJfD+9xz4AAAAAElFTkSuQmCC",6,12,12);

global.spr_BulwarkSit = sprite_add_base64("",1,12,12);
global.spr_BulwarkGoSit = sprite_add_base64("",3,12,12);

//global.spr_BulwarkPort = sprite_add_base64("",1,40,243);
global.spr_BulwarkIcon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAMAAAC6V+0/AAAAJ1BMVEUAAAAAAAAVJC8jIB4mO0o2MzBKXHxMUEFXepF5fmt6f22nrZeqr5egA2GrAAAAAXRSTlMAQObYZgAAAGlJREFUeAGVyEECAiEMQ1HDZKgU7n9egSltXbjwr5L3+jN4yfi2iG8bIys2jtnGR9EytkCSrZEMFBIWKYZ4rNalMLzu6npfga4J11Vd6ohSULV33esgikqfiRZMPHrQ7DBEEOQa5jn96gNwjgPnjn/tWAAAAABJRU5ErkJggg==",1,10,10);
global.spr_BulwarkSlct = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAYCAMAAADEfo0+AAAAIVBMVEUAAAAOHikZIDMgN0YzNik7YntGWntITDxVepJ5fmuqr5fxsOlEAAAAZElEQVR42q3IQQ7DQAhDUbuEULj/gTsMQkWjLPM34IfP0QNgllO/Ix5bhdiPR7a2SIF5tnZBhO8iGjovUO8sQf9gniATmKC0lgKhHyCAXWZ2ARRiIYkdM3DWAFQFmM1533VfkB+1kwXA0c5WvAAAAABJRU5ErkJggg==",1,0,0);

//global.spr_ult[1] = sprite_add_base64("",1,12,16);
//global.spr_ult[2] = sprite_add_base64("",1,12,16);

///////////////////////////////////////////////////////////////////////////////////////////
#define game_start
global.ultra[1] = 0;
global.ultra[2] = 0;

#define create

if bskin = 0{
	spr_idle = global.spr_BulwarkIdle;
	spr_walk = global.spr_BulwarkWalk;
	spr_hurt = global.spr_BulwarkHurt;
	spr_dead = global.spr_BulwarkDead;
	spr_sit1 = global.spr_BulwarkGoSit;
	spr_sit2 = global.spr_BulwarkSit;
}

snd_hurt = sndInspectorHurtF;
snd_dead = sndInspectorDeadF;
snd_lowh = sndInspectorStartF;
snd_lowa = sndInspectorStartF;
	
snd_wrld = sndInspectorEnterF;
	
snd_cptn = sndInspectorEnterF;
snd_thrn = sndInspectorEnterF;
snd_valt = sndInspectorEnterF;
snd_chst = sndInspectorEnterF;
snd_spch = sndInspectorEnterF;
snd_idpd = sndInspectorEnterF;

if ("wep" in self) && (wep = 1) {
	if mod_exists("weapon", "uniqueweapon"){
		wep = "uniqueweapon";
	}
	else {
		wep = 1;
	}
}

shieldmax = 40;
shieldmin = 5;
shieldframestomin = 120;

shieldangle = 0;
shieldwidth = shieldmax;

shieldactua = 0;

speedbak = 0;

#define step

if button_pressed(index,"spec"){
shieldactua = 0;
}

if button_check(index,"spec"){
	if speed > 2 speed -= 2;
	can_shoot = 0;
	if reload = 0 reload += 1;
	reload += 1;
	
	shieldwidth -= (shieldwidth - shieldmin)/shieldframestomin;
	shieldactua += (shieldwidth - shieldactua)/5;
}
else {
	if instance_exists(self) && speedbak != 0{
		speedbak = 0;
	}
	if (shieldwidth < shieldmax) shieldwidth += (2/(shieldmax-shieldwidth));
	if (shieldwidth > shieldmax) && (global.ultra[1] = 1) shieldwidth = shieldmax;
	
	shieldactua += (0 - shieldactua)/2;
	if shieldactua < 0.5 shieldactua = 0;
}

if (shieldwidth > shieldmax) && (global.ultra[1] = 0) shieldwidth = shieldmax;
else if (shieldwidth > shieldmax) shieldwidth -= (shieldwidth - shieldmin)/(shieldframestomin);

shieldangle += angle_difference(gunangle,shieldangle)/10;



if (shieldactua > 0){
	shieldxl = x + lengthdir_x(20, shieldangle) + lengthdir_x(shieldactua, shieldangle + 90);
	shieldyl = y + lengthdir_y(20, shieldangle) + lengthdir_y(shieldactua, shieldangle + 90);
	shieldxr = x + lengthdir_x(20, shieldangle) + lengthdir_x(shieldactua, shieldangle - 90);
	shieldyr = y + lengthdir_y(20, shieldangle) + lengthdir_y(shieldactua, shieldangle - 90);
	
	with(projectile) if typ != 0 && collision_line(other.shieldxl,other.shieldyl,other.shieldxr,other.shieldyr, self, 0, 0) {
		instance_destroy();
		if (global.ultra[1] = 1) other.shieldwidth += ((other.shieldmax*2) - other.shieldwidth)/10;
	}
}

#define draw
if (shieldactua > 0){
/* temp diamond
draw_triangle_color(
	x+lengthdir_x(15,shieldangle),y+lengthdir_y(15,shieldangle),
	x+lengthdir_x(25,shieldangle),y+lengthdir_y(25,shieldangle),
	shieldxl,shieldyl,
	player_get_color(index),player_get_color(index),player_get_color(index),0);
draw_triangle_color(
	x+lengthdir_x(15,shieldangle),y+lengthdir_y(15,shieldangle),
	x+lengthdir_x(25,shieldangle),y+lengthdir_y(25,shieldangle),
	shieldxr,shieldyr,
	player_get_color(index),player_get_color(index),player_get_color(index),0);
	
draw_triangle(
	x+lengthdir_x(17.5,shieldangle),y+lengthdir_y(17.5,shieldangle),
	x+lengthdir_x(22.5,shieldangle),y+lengthdir_y(22.5,shieldangle),
	shieldxl,shieldyl,
	0);
draw_triangle(
	x+lengthdir_x(17.5,shieldangle),y+lengthdir_y(17.5,shieldangle),
	x+lengthdir_x(22.5,shieldangle),y+lengthdir_y(22.5,shieldangle),
	shieldxr,shieldyr,
	0);
*/

/* temp wings
	draw_triangle_color(
		x+lengthdir_x(17.5,shieldangle),y+lengthdir_y(17.5,shieldangle),
		x+lengthdir_x(22.5, shieldangle)+lengthdir_x(shieldactua/3,shieldangle+90),y+lengthdir_y(22.5, shieldangle)+lengthdir_y(shieldactua/3,shieldangle+90),
		x+lengthdir_x(22.5, shieldangle)+lengthdir_x(shieldactua/3,shieldangle-90),y+lengthdir_y(22.5, shieldangle)+lengthdir_y(shieldactua/3,shieldangle-90),
		player_get_color(index),player_get_color(index),player_get_color(index),0);
	
	draw_triangle_color(
		x+lengthdir_x(17.5,shieldangle),y+lengthdir_y(17.5,shieldangle),
		x+lengthdir_x(22.5, shieldangle)+lengthdir_x(shieldactua/3,shieldangle+90),y+lengthdir_y(22.5, shieldangle)+lengthdir_y(shieldactua/3,shieldangle+90),
		x+lengthdir_x(19-(0.2*(shieldactua-shieldmin)), shieldangle)+lengthdir_x(shieldactua,shieldangle+90),y+lengthdir_y(19-(0.2*(shieldactua-shieldmin)), shieldangle)+lengthdir_y(shieldactua,shieldangle+90),
		player_get_color(index),player_get_color(index),player_get_color(index),0);
	draw_triangle_color(
		x+lengthdir_x(17.5,shieldangle),y+lengthdir_y(17.5,shieldangle),
		x+lengthdir_x(22.5, shieldangle)+lengthdir_x(shieldactua/3,shieldangle-90),y+lengthdir_y(22.5, shieldangle)+lengthdir_y(shieldactua/3,shieldangle-90),
		x+lengthdir_x(19-(0.2*(shieldactua-shieldmin)), shieldangle)+lengthdir_x(shieldactua,shieldangle-90),y+lengthdir_y(19-(0.2*(shieldactua-shieldmin)), shieldangle)+lengthdir_y(shieldactua,shieldangle-90),
		player_get_color(index),player_get_color(index),player_get_color(index),0);
	
	
	
	draw_triangle(
		x+lengthdir_x(18.5,shieldangle),y+lengthdir_y(18.5,shieldangle),
		x+lengthdir_x(21, shieldangle)+lengthdir_x(shieldactua/5,shieldangle+90),y+lengthdir_y(21, shieldangle)+lengthdir_y(shieldactua/5,shieldangle+90),
		x+lengthdir_x(21, shieldangle)+lengthdir_x(shieldactua/5,shieldangle-90),y+lengthdir_y(21, shieldangle)+lengthdir_y(shieldactua/5,shieldangle-90),
		0);

	draw_triangle(
		x+lengthdir_x(18.5,shieldangle),y+lengthdir_y(18.5,shieldangle),
		x+lengthdir_x(21, shieldangle)+lengthdir_x(shieldactua/5,shieldangle+90),y+lengthdir_y(21, shieldangle)+lengthdir_y(shieldactua/5,shieldangle+90),
		x+lengthdir_x(20-(0.2*(shieldactua-shieldmin)), shieldangle)+lengthdir_x(shieldactua/1.25,shieldangle+90),y+lengthdir_y(20-(0.2*(shieldactua-shieldmin)), shieldangle)+lengthdir_y(shieldactua/1.25,shieldangle+90),
		0);
	draw_triangle(
		x+lengthdir_x(18.5,shieldangle),y+lengthdir_y(18.5,shieldangle),
		x+lengthdir_x(21, shieldangle)+lengthdir_x(shieldactua/5,shieldangle-90),y+lengthdir_y(21, shieldangle)+lengthdir_y(shieldactua/5,shieldangle-90),
		x+lengthdir_x(20-(0.2*(shieldactua-shieldmin)), shieldangle)+lengthdir_x(shieldactua/1.25,shieldangle-90),y+lengthdir_y(20-(0.2*(shieldactua-shieldmin)), shieldangle)+lengthdir_y(shieldactua/1.25,shieldangle-90),
		0);
*/

	var m = merge_color(player_get_color(index), c_white, 0.25);
	var o = player_get_color(index);
	
	draw_line_width_colour(
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle+90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle+90)+5,
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)+5,
		2*(shieldactua/shieldwidth), o, o)
	draw_line_width_colour(
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)+5,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle-90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle-90)+5,
		2*(shieldactua/shieldwidth), o, o)
	draw_line_width_colour(
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle-90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle-90)+5,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle-90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle-90)-5,
		2*(shieldactua/shieldwidth), o, o)
	draw_line_width_colour(
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle-90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle-90)-5,
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)-5,
		2*(shieldactua/shieldwidth), o, o)
	draw_line_width_colour(
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)-5,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle+90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle+90)-5,
		2*(shieldactua/shieldwidth), o, o)
	draw_line_width_colour(
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle+90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle+90)-5,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle+90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle+90)+5,
		2*(shieldactua/shieldwidth), o, o)
	draw_circle_colour(
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle+90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle+90)+5,
		shieldactua/shieldwidth, o, o, 0);
	draw_circle_colour(
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)+5,
		shieldactua/shieldwidth, o, o, 0);
	draw_circle_colour(
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle-90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle-90)+5,
		shieldactua/shieldwidth, o, o, 0);
	draw_circle_colour(
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle-90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle-90)-5,
		shieldactua/shieldwidth, o, o, 0);
	draw_circle_colour(
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)-5,
		shieldactua/shieldwidth, o, o, 0);
	draw_circle_colour(
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle+90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle+90)-5,
		shieldactua/shieldwidth, o, o, 0);
	
	draw_triangle_colour(
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)+5,
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)-5,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle+90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle+90)-5,
		m,m,m,0);
	draw_triangle_colour(
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)+5,
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)-5,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle-90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle-90)-5,
		m,m,m,0);
		
	draw_triangle_colour(
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)+5,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle+90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle+90)+5,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle+90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle+90)-5,
		m,m,m,0);
	draw_triangle_colour(
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)+5,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle-90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle-90)+5,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle-90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle-90)-5,
		m,m,m,0);
	
	draw_triangle_colour(
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)+5,
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)-5,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle+90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle+90)-5,
		m,m,m,0);
	draw_triangle_colour(
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)+5,
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)-5,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle-90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle-90)-5,
		m,m,m,0);
		
	draw_triangle_colour(
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)+5,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle+90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle+90)+5,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle+90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle+90)-5,
		m,m,m,0);
	draw_triangle_colour(
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)+5,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle-90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle-90)+5,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua,shieldangle-90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua,shieldangle-90)-5,
		m,m,m,0);

	draw_triangle(
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)+3,
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)-3,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua/1.2,shieldangle+90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua/1.2,shieldangle+90)-3,
		0);
	draw_triangle(
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)+3,
		x+lengthdir_x(20+(0.1*shieldactua),shieldangle),y+lengthdir_y(20+(0.1*shieldactua),shieldangle)-3,
		x+lengthdir_x(20-(0.1*shieldactua),shieldangle)+lengthdir_x(shieldactua/1.2,shieldangle-90),y+lengthdir_y(20-(0.1*shieldactua),shieldangle)+lengthdir_y(shieldactua/1.2,shieldangle-90)-3,
		0);

}

#define race_ultra_take
global.ultra[argument0] = 1;
if(global.ultra[1] = 1){
	with(Player) if string_lower(race) = "bulwark" shieldframestomin = 60;
}
if(global.ultra[2] = 1){
}
sound_play(sndBasicUltra);

///////////////////////////////////////////////////////////////////////////////////////////
#define race_name
return "Bulwark";

#define race_text
return "ACTIVE#PASSIVE";

//#define race_portrait
//return global.spr_BulwarkPort;

#define race_menu_button
sprite_index = global.spr_BulwarkSlct;

#define race_mapicon
return global.spr_BulwarkIcon;

#define race_ttip
return["TIP1", "TIP2", "TIP3"];

#define race_tb_text
return "THRONE BUTT TEXT";

//#define race_ultra_button
//sprite_index = global.spr_ult[1];

#define race_ultra_name
switch(argument0){
case 1: return "ULTRA A";
case 2: return "ULTRA B";
default: return "";
}

#define race_ultra_text 
switch (argument0){
	case 1: return "ULTRA A DESC";
	case 2: return "ULTRA B DESC";
}

#define race_skins
return 1;