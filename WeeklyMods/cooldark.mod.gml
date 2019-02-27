#define init
global.dark = 1
global.sf = surface_create(5000,5000)
with script_bind_draw(drawmyshit,-14){
	persistent = 1
	name = "darkgod"
	global.coolguy = id
}
global.smalb = [Bullet1,Bullet2,EnemyBullet4,UltraShell,UltraBullet,UltraBolt,BulletHit,ScorpionBulletHit,BouncerBullet,LHBouncer,SharpTeeth,AllyBullet]
global.bigb = [EnemyBullet3,Slug,FlakBullet,MeatExplosion,Rocket,HyperSlug,HeavyBullet,EFlakBullet,JockRocket,Nuke,ScrapBossMissile,DogMissile]
global.hugeb = [SuperFlakBullet,Devastator,HeavySlug]
global.lasers = [Laser,EnemyLaser]
global.lightning = [Lightning,EnemyLightning]
global.flames = [TrapFire,Flame]
global.blueboys = [BlueFlame,EliteGruntFlame,IDPDPortalCharge,IDPDBullet,VanSpawn,PopoNade,PopoPlasmaBall,RevivePopoFreak,PopoSlug,IDPDSpawn]
global.tanks = [SnowTank,GoldSnowTank]
global.radboys = [EnemyHorror,DogGuardian,Guardian,ExploGuardian,CrownGuardian,SmallGenerator,Pillar,BigGuardianBullet,GuardianBullet,NothingBeamParticle,NothingBeamChargeParticle,TopDecalPalace]

global.flashlight = 0
global.sight = 45

compat_get()

#define compat_get()
global.mods = []
var b = mod_get_names("mod")
var a = []
for (var i = 0; i< array_length_1d(b);i++){
	if mod_script_exists("mod",b[i],"draw_cooldark") array_push(global.mods,b[i])
}

#define chat_command(cmd,arg)
if cmd = "darkness" {
	if is_real(real(arg)){
		global.sight = real(arg)
		trace("player vision changed to",string(global.sight),"(default: 90)")
		return 1
	}
}
if cmd = "flashlight"{
	global.flashlight =! global.flashlight
	trace("flashlight turned",(global.flashlight ? "ON (its kinda laggy watch out)" : "OFF"))
	return 1
}
return 0

#define step
with TopCont darkness = 0

if !instance_exists(global.coolguy){
	with script_bind_draw(drawmyshit,-14){
		persistent = 1
		name = "darkgod"
		global.coolguy = id
	}
}


if !(current_frame mod 30){ //every second
	compat_get()
}
	
#define drawmyshit
if global.dark{
	if !surface_exists(global.sf) global.sf = surface_create(5000,5000)
	var _xx,_yy;
	var _x = 7500
	var _y = 7500
	if instance_exists(CharSelect) || mod_exists("area","pvparena"){
		_x = -500
		_y = -500
	}
	draw_set_blend_mode(bm_add)
	surface_set_target(global.sf)
	draw_set_alpha(.25)
	draw_rectangle(0,0,5000,5000,0)
	draw_set_alpha(1)
	var col =  c_black
	var col2 = c_white //black
	var col3 = c_purple //green, toxic things
	var col4 = c_aqua //red, base of other reds, baddy eyes
	var col5 = c_green //used to be light purple until i decided i wanted MORE purple, portals, cursed crystals
	var col6 = merge_color(col4,c_black,.6)//light red, flames
	var col7 = merge_color(col5,c_yellow,.7) //DEEEEEP purple, curse particles
	var col8 = merge_color(c_red,c_black,.5) //blue. idpd and cyrstals
	var col9 = merge_color(c_blue,col2,.3)//orange, crystals, larger fires
	var col10 = merge_color(col3,col4,.15) //lime, rad boys
	var col11 = merge_color(col4,col2,.4) //darker red, for lasers
	var col12 = merge_color(c_blue,c_black,.25) //yellow
	var col13 = merge_color(col4,col6,.5) //cyrstals get angry, moderate red
	var col14 = merge_color(col8,c_white,.75) //lightning color
	draw_set_blend_mode_ext(11,3) //i got lucky with guessing numbers feels food man
	with RadChest draw_circle_color(x - _x,y - _y,20+random(2),col10,col2,0)
	with RogueChest draw_circle_color(x - _x,y - _y,20+random(2),col8,col2,0)
	with Generator draw_circle_color(x - _x,y - _y,70+random(2),col3,col2,0)
	with Nothing {
		draw_circle_color(x - _x +30,y - _y,60+random(2),col10,col2,0)
		draw_circle_color(x - _x -30,y - _y,60+random(2),col10,col2,0)
		_xx = x-_x + 80
		_yy = y-_y + 15
		draw_circle_color(_xx,_yy,20+random(2),col10,col2,0)
		draw_circle_color(_xx,_yy - 60,20+random(2),col10,col2,0)
		_xx -= 160
		draw_circle_color(_xx,_yy,20+random(2),col10,col2,0)
		draw_circle_color(_xx,_yy - 60,20+random(2),col10,col2,0)
	}
	with ThroneStatue draw_circle_color(x - _x,y - _y,35+random(2),col10,col2,0)
	with NothingInactive {
		draw_circle_color(x - _x +30,y - _y,60+random(2),col10,col2,0)
		draw_circle_color(x - _x -30,y - _y,60+random(2),col10,col2,0)
		_xx = x-_x + 80
		_yy = y-_y + 15
		draw_circle_color(_xx,_yy,20+random(2),col10,col2,0)
		draw_circle_color(_xx,_yy - 60,20+random(2),col10,col2,0)
		_xx -= 160
		draw_circle_color(_xx,_yy,20+random(2),col10,col2,0)
		draw_circle_color(_xx,_yy - 60,20+random(2),col10,col2,0)
	}
	with LaserCannon draw_circle_color(x - _x,y - _y,30+random(2),col3,col2,0)
	with HorrorBullet{
		if bskin = 1 draw_circle_color(x - _x,y - _y,24+random(2),col5,col2,0)
		else draw_circle_color(x - _x,y - _y,24+random(2),col10,col2,0)
	}
	with Rad draw_circle_color(x - _x,y - _y,4*rad+random(2),col10,col2,0)
	with ToxicGas draw_circle_color(x - _x,y - _y,12+random(2),col3,col2,0)
	with BigRad draw_circle_color(x - _x,y - _y,4*rad+random(2),col10,col2,0)
	with RadMaggot draw_circle_color(x - _x,y - _y,4+random(2),col10,col2,0)
	with Curse draw_circle_color(x - _x,y - _y,10,col7,col2,0)
	with AssassinNotice draw_circle_color(x - _x,y - _y-20,10,col4,col2,0)
	with RogueStrike coolline(x+ix(sprite_width/1.8),y+iy(sprite_width/1.8),x-ix(sprite_width/1.8),y-iy(sprite_width/1.8),2*sprite_height,col8,col2)
	with EmoteIndicator draw_circle_color(x - _x,y - _y,28+random(2),make_color_hsv(color_get_hue(player_get_color(p)) - 255/2,255,255),col2,0)
	with EnemyBullet1 if !object_is_ancestor(object_index,EnemyBullet1) draw_circle_color(x - _x,y - _y,18+random(2),col6,col2,0)
	with EnemyBullet2 draw_circle_color(x - _x,y - _y,25+random(2),col10,col2,0)
	for (var i = 0; i<array_length_1d(global.smalb); i++){
		with global.smalb[i]{
			draw_circle_color(x - _x,y - _y,18+random(2),col,col2,0)
		}
	}
	for (var i = 0; i<array_length_1d(global.bigb); i++){
		with global.bigb[i]{
			draw_circle_color(x - _x,y - _y,32+random(2),col,col2,0)
		}
	}
	for (var i = 0; i<array_length_1d(global.hugeb); i++){
		with global.hugeb[i]{
			draw_circle_color(x - _x,y - _y,64+random(2),col,col2,0)
		}
	}
	for (var i = 0; i<array_length_1d(global.flames); i++){
		with global.flames[i]{
			draw_circle_color(x - _x,y - _y,sprite_width/2+random(2)+(image_index*6),merge_color(merge_color(col, make_color_hsv(255/(1.9-(sprite_index == sprFireLilHunter ? 1 : 0)), 255, 255), min(1, (image_index*2)/image_number)), c_white, image_index/image_number),col2,0)
		}
	}
	for (var i = 0; i<array_length_1d(global.blueboys); i++){
		with global.blueboys[i]{
			draw_circle_color(x - _x,y - _y,15+random(2),col8,col2,0)
		}
	}
	for (var i = 0; i<array_length_1d(global.radboys); i++){
		with global.radboys[i]{
			draw_circle_color(x - _x,y - _y,50+random(2),col10,col2,0)
		}
	}
	with Campfire if sprite_index != sprCampfireOff{
		draw_circle_color(x - _x,y - _y,130+random(3),col6,col2,0)
		draw_circle_color(x - _x,y - _y,60+random(3),col9,col2,0)
	}
	with TV draw_circle_color(x - _x,y - _y,35+random(2),col,col2,0)
	with instances_matching(CampChar,"num",11) draw_circle_color(x - _x,y - _y,25+random(2),col10,col2,0)
	with instances_matching(CampChar,"num",8) draw_circle_color(x - _x+2,y - _y+2,3+random(2),col11,col2,0)
	with Revive draw_circle_color(x - _x,y - _y,60+random(2),col,col2,0)
	with Tangle draw_circle_color(x - _x,y - _y,60+random(2),col,col2,0)
	with LightBeam {
		var colo = merge_color(c_white,c_black,1-min(1,distance_to_object(instance_nearest(x,y,Player))/200));
		var colo2 = merge_color(colo,col2,.5);
		depth = -15
		draw_ellipse_color(x - _x + 180,y - _y + 85,x-_x - 180,y-_y-85,colo,col2,0)
		draw_ellipse_color(x - _x + 80,y - _y + 35,x-_x - 80,y-_y-35,colo,col2,0)
	}
	with FrogQueenBall draw_circle_color(x - _x,y - _y,45+random(2),col3,col2,0)
	with BigMaggot draw_circle_color(x - _x+8*right,y +3- _y,5+random(2),col10,col2,0)
	with Salamander draw_circle_color(x-_x,y-_y,40+random(5),col6,col2,0)
	with Sapling draw_circle_color(x - _x ,y - _y,8,col4,col2,0)
	//thanks to 9joao6 for sick explosions
	with Explosion{
		if(object_index == PopoExplosion) repeat((image_number-image_index)/2) draw_circle_color(x - _x,y - _y,sprite_width/2+random(2)+(sprite_width*2)/(image_index*3),merge_color(make_color_hsv(18, 255, 255), c_white, image_index/image_number),col2,0)
		else if(object_index == GreenExplosion) repeat((image_number-image_index)/2) draw_circle_color(x - _x,y - _y,sprite_width+random(2)+(sprite_width*4)/(image_index*3),merge_color(merge_color(col, make_color_hsv(255/(1.4), 255, 255), min(1, (image_index*2)/image_number)), c_white, image_index/image_number),col2,0)
		else repeat((image_number-image_index)/2) draw_circle_color(x - _x,y - _y,sprite_width+random(2)+(sprite_width*2)/(image_index*3),merge_color(merge_color(col, make_color_hsv(255/(1.9), 255, 255), min(1, (image_index*2)/image_number)), c_white, image_index/image_number),col2,0)
	}
	
	with LightningCrystal draw_circle_color(x - _x,y - _y,48+random(2),(sprite_index = spr_fire ? col13 : col8),col2,0)
	with LaserCharge draw_circle_color(x - _x,y - _y,12+random(2),col4,col2,0)
	with PlasmaTrail draw_circle_color(x - _x,y - _y,2*(5-image_index),col3,col2,0)
	with PlasmaBall draw_circle_color(x - _x,y - _y,32+random(2),col3,col2,0)
	with EnergyShank draw_circle_color(x+dx(20) - _x,y+dy(20) - _y,10*(3-image_index)+random(2),col3,col2,0)
	with EnergyHammerSlash draw_circle_color(x+dx(30) - _x,y+dy(30) - _y,20*(3-image_index)+random(2),col3,col2,0)
	with EnergySlash draw_circle_color(x+dx(20) - _x,y+dy(20) - _y,15*(3-image_index)+random(2),col3,col2,0)
	with PlasmaImpact draw_circle_color(x - _x,y - _y,32+random(2),col3,col2,0)
	with PlasmaBig draw_circle_color(x - _x,y - _y, 60+random(2),col3,col2,0)
	with PlasmaHuge{
		draw_circle_color(x - _x,y - _y, 140+random(2),col3,col2,0)
		draw_circle_color(x - _x,y - _y, 40+random(2),col,col2,0)
	}
	with LaserCrystal draw_circle_color(x - _x,y - _y,48+random(2),(sprite_index = spr_fire ? col13 : col9),col2,0)
	with HyperCrystal draw_circle_color(x - _x,y - _y,150+random(2),(sprite_index = spr_fire ? col13 : col9),col2,0)
	with InvLaserCrystal draw_circle_color(x - _x,y - _y,48+random(10),(sprite_index = spr_fire ? col13 : col5),col2,0)
	with Portal{
		if type = 1 draw_circle_color(x - _x,y - _y,40+random(10),col5,col2,0)
		if type = 2 draw_circle_color(x - _x,y - _y,40+random(10),col10,col2,0)
		if type = 3 draw_circle_color(x - _x,y - _y,40+random(10),col8,col2,0)
	}
	with Wolf if sprite_index != spr_fire{
		draw_circle_color(x - _x + 6*right,y - _y+1,3+random(2),col4,col2,0)
		draw_circle_color(x - _x + 10*right,y - _y+1,3+random(2),col4,col2,0)
	}
	with ReviveArea draw_circle_color(x - _x,y - _y,35+random(2),col5,col2,0)
	with BigPortal draw_circle_color(x - _x,y - _y,120+random(20),col5,col2,0)
	with BanditBoss draw_circle_color(x - _x + 5*right,y - _y - 6,4+random(2),col4,col2,0)
	with Ally draw_circle_color(x - _x + 5*right,y - _y - 2,4+random(2),col3,col2,0)
	with MeleeBandit draw_circle_color(x - _x + 3*right,y - _y - 2,4+random(2),col4,col2,0)
	with JungleAssassin draw_circle_color(x - _x + 3*right,y - _y - 2,4+random(2),col4,col2,0)
	with Bandit draw_circle_color(x - _x + 3*right,y - _y - 1,3+random(2),col4,col2,0)
	with JungleBandit draw_circle_color(x - _x + 4*right,y - _y - 2,3+random(2),col4,col2,0)
	with Scorpion draw_ellipse_color(x-_x + 16*right,y-_y-4,x-_x - 8*right,y-_y+8,col4,col2,0)
	with GoldScorpion draw_ellipse_color(x-_x + 16*right,y-_y-8,x-_x - 14*right,y-_y+8,col3,col2,0)
	with Necromancer draw_circle_color(x - _x + 4*right,y - _y - 1,6+random(2),col4,col2,0)
	/*if GameCont.area = 6 || GameCont.area = "labs"{
		var flow = abs(.5*dsin(1.5*current_frame))
		var wcol = merge_color(col2,col10,flow)
		with Wall draw_roundrect_color(x - _x+32,y - _y + 36,x-_x-24,y-_y-28,wcol,col2,0)
	}*/
	with FrogEgg draw_circle_color(x - _x,y - _y,32+random(2),col3,col2,0)
	with ExploFreak draw_circle_color(x - _x - 2*right,y - _y - 7,10+random(2),col9,col2,0)
	with Turret draw_circle_color(x - _x,y - _y,12+random(2),col4,col2,0)
	with TechnoMancer{
		draw_ellipse_color(x-_x+30,y-_y+12,x-_x-30,y-_y-12,col4,col2,0)
		//draw_circle_color(x - _x+20,y - _y,12+random(2),col4,col2,0)
		draw_circle_color(x - _x+20,y - _y+20,12+random(2),col4,col2,0)//eye
		//draw_circle_color(x - _x-20,y - _y,12+random(2),col4,col2,0)
		draw_circle_color(x - _x-20,y - _y+20,12+random(2),col4,col2,0)//eye
		//draw_circle_color(x - _x,y - _y,12+random(2),col4,col2,0)
		draw_circle_color(x - _x,y - _y-10,12+random(2),col4,col2,0)//his face
		//draw_circle_color(x - _x+10,y - _y,12+random(2),col4,col2,0)
		//draw_circle_color(x - _x-10,y - _y,12+random(2),col4,col2,0)
		//draw_circle_color(x - _x-30,y - _y,12+random(2),col4,col2,0)
		//draw_circle_color(x - _x+30,y - _y,12+random(2),col4,col2,0)
	}
	with FrogQueen{
		draw_circle_color(x - _x + 15*right,y - _y-2,5+random(2),col4,col2,0)
		draw_circle_color(x - _x - 10*right,y - _y-2,5+random(2),col4,col2,0)
		draw_ellipse_color(x-_x + 16*right,y-_y-8,x-_x - 8*right,y-_y+4,col3,col2,0)
	}
	with NecroReviveArea{
		draw_circle_color(x - _x,y - _y,30+random(2),col4,col2,0)
	}
	with Server draw_ellipse_color(bbox_left - _x,bbox_bottom - _y,bbox_right-_x,bbox_top-_y,col4,col2,0)
	with MutantTube draw_ellipse_color(bbox_left - _x,bbox_bottom - _y,bbox_right-_x,bbox_top-_y,col3,col2,0)
	with Terminal draw_circle_color(x - _x-3,y - _y - 2,8+random(2),col3,col2,0)
	if GameCont.area = 2 || GameCont.area = "sewers"{
		with instances_matching(Floor,"styleb",1) draw_circle_color(x+16 - _x,y+16 - _y,32+random(2),col3,col2,0)
	}
	else if GameCont.area = 3 || GameCont.area = "junkyard" with instances_matching(Floor,"sprite_index",sprFloor3){
		if image_index = 3 draw_circle_color(x+16 - _x,y+16 - _y,28+random(2),col3,col2,0)
		if image_index = 2 draw_circle_color(x+16 - _x,y+16 - _y,18+random(2),col3,col2,0)
	}
	with LilHunter{
		_xx = x-_x
		_yy = y-_y - 4
		draw_circle_color(_xx + 5*right,_yy,4,col4,col2,0)
		draw_circle_color(_xx + 2*right,_yy,4,col4,col2,0)
		draw_circle_color(_xx - 1*right,_yy,4,col4,col2,0)
		draw_circle_color(_xx - 6*right,_yy-2,8+random(2),col10,col2,0)
		draw_circle_color(_xx - 4*right,_yy+8,6+random(2),col8,col2,0)
	}
	with LilHunterFly{
		_xx = x-_x
		_yy = y-_y - 4 + z
		draw_circle_color(_xx + 5*image_xscale,_yy,4,col4,col2,0)
		draw_circle_color(_xx + 2*image_xscale,_yy,4,col4,col2,0)
		draw_circle_color(_xx - 1*image_xscale,_yy,4,col4,col2,0)
		draw_circle_color(_xx - 6*image_xscale,_yy-2*image_yscale,8+random(2),col10,col2,0)
		draw_circle_color(_xx - 4*image_xscale,_yy+8*image_yscale,6+random(2),col8,col2,0)
		draw_circle_color(_xx - 4*image_xscale,_yy+12*image_yscale,4+random(2),col8,col2,0)
		draw_circle_color(_xx - 4*image_xscale,_yy+16*image_yscale,4+random(2),col8,col2,0)
	}
	with Sniper{
		draw_circle_color(x-_x+2*right,y-_y,5+random(2),col4,col2,0)
		if alarm2 {
			var q = collision_line_point(x,y,x+lengthdir_x(1000,gunangle),y+lengthdir_y(1000,gunangle),Wall,0,0)
			coolline(x,y,q[1],q[2],8,col11,col2)
		} 
	}
	if GameCont.area = 0 with CampfireOff {
		with Floor if distance_to_object(other) <= 0{
			with instance_create(x+16,y+16,Campfire){ depth = 3; spr_hurt = sprCampfire; mask_index = mskNone}
			with other instance_destroy()
			break
		}
	}
	with Van if meleedamage {
		_yy = y+13+((floor(image_index) + 1) mod 4)
		_xx = x-_x
		//halfcool(x-38*right,_yy-3,x+28*right,_yy-3,20,col8,col2,-1)
		_yy -= _y
		draw_ellipse_color(_xx-56*right,_yy+24,_xx+50*right,_yy-44,col8,col2,0)
		draw_triangle_color(_xx+32*right,_yy-1,_xx+150*right,_yy+40,_xx+150*right,_yy-40,col12,col2,col2,0)
		draw_triangle_color(_xx+32*right,_yy-1,_xx+120*right,_yy+20,_xx+120*right,_yy-20,col12,col2,col2,0)
		_yy += -27
		draw_triangle_color(_xx+32*right,_yy-1,_xx+150*right,_yy+40,_xx+150*right,_yy-40,col12,col2,col2,0)
		draw_triangle_color(_xx+32*right,_yy-1,_xx+120*right,_yy+20,_xx+120*right,_yy-20,col12,col2,col2,0)
		_yy += 27-19
		switch(floor(image_index)){
			case 0:
				draw_circle_color(_xx+20*right,_yy-14,40,col8,col2,0)
				draw_circle_color(_xx+18*right,_yy-7,40,col8,col2,0)
				draw_circle_color(_xx+14*right,_yy,40,col8,col2,0)
				draw_circle_color(_xx+20*right,_yy+7,40,col8,col2,0)
				break
			case 1:
				draw_ellipse_color(_xx-25*right,_yy-8,_xx+70*right,_yy-34,col8,col2,0)
				_yy += 20
				draw_ellipse_color(_xx-25*right,_yy-8,_xx+70*right,_yy-34,col8,col2,0)
				break
			case 2:
				draw_circle_color(_xx+20*right,_yy-14,40,col8,col2,0)
				draw_circle_color(_xx+24*right,_yy-7,40,col8,col2,0)
				draw_circle_color(_xx+27*right,_yy,40,col8,col2,0)
				draw_circle_color(_xx+20*right,_yy+7,40,col8,col2,0)
				break
			case 3:
				draw_ellipse_color(_xx,_yy+20,_xx+30*right,_yy-50,col8,col2,0)
				break
		}
	}
	with Barrel draw_circle_color(x - _x,y - _y,50+random(2),col6,col2,0)
	with FlameBall draw_circle_color(x - _x,y - _y,50+random(2),col6,col2,0)
	with LightningBall draw_circle_color(x - _x,y - _y,50+random(2),col14,col2,0)
	with GroundFlame draw_circle_color(x - _x,y - _y,20+random(3),col6,col2,0)
	with FlameShell draw_circle_color(x - _x,y - _y,20+random(3),col6,col2,0)
	with ToxicBarrel draw_circle_color(x - _x,y - _y,50+random(2),col3,col2,0)
	with GammaBlast draw_circle_color(x - _x,y - _y,80+random(2),col10,col2,0)
	with Torch draw_circle_color(x - _x,y - _y,50+random(2),col10,col2,0)
	for (var i = 0; i<array_length_1d(global.tanks); i++){
		with global.tanks[i]{
			if rest || alarm2{
				var q = collision_line_point(x,y,x+lengthdir_x(1000,gunangle),y+lengthdir_y(1000,gunangle),Wall,0,0)
				coolline(x,y-4,q[1],q[2],8,col11,col2)
			}
			else{
				_xx = x-_x
				draw_triangle_color(_xx+1*right,y-_y+2,_xx+10*right,bbox_bottom-_y+10,_xx+50*right,bbox_bottom-_y+10,col4,col2,col2,0)
			}
		}
	}
	with SnowBot{
		if meleedamage = 4{
			_yy = y-_y -1
			_xx = x-_x
			draw_triangle_color(_xx+5*right,_yy-1,_xx+48*right,_yy+14,_xx+48*right,_yy-14,col4,col2,col2,0)
		}
		else{
			_yy = y-_y - 5 + sin(image_index+1)
			_xx = x-_x + cos(image_index+1)*right
			draw_triangle_color(_xx+2*right,_yy-1,_xx+48*right,_yy+10,_xx+48*right,_yy-10,col4,col2,col2,0)
		}
	}
	with TopDecalCave draw_circle_color(x - _x,y - _y,65+random(2),col8,col2,0)
	with CrystalProp{
		if string_count("Blue",sprite_get_name(sprite_index)) draw_circle_color(x - _x,y - _y,64+random(2),col8,col2,0)
		else if string_count("Green",sprite_get_name(sprite_index)) draw_circle_color(x - _x,y - _y,64+random(2),col3,col2,0)
		else draw_circle_color(x - _x,y - _y,64+random(2),col9,col2,0)
	}
	with InvCrystal draw_circle_color(x - _x,y - _y,64+random(2),col5,col2,0)
	with TopDecalInvCave draw_circle_color(x - _x,y - _y,65+random(2),col5,col2,0)
	with CaveSparkle draw_circle_color(x - _x,y - _y,image_index+5,col6,col2,0)
	with Nothing2 draw_circle_color(x - _x,y - _y-20,200+random(15),col3,col2,0)
	with ProtoStatue if rad draw_circle_color(x - _x,y - _y-6,2*min(rad,40)+random(3),col10,col2,0)
	with instances_matching(Bones,"sprite_index",41) draw_circle_color(x - _x,y - _y-10,80+random(2),col9,col2,0)
	for (var i = 0; i<array_length_1d(global.lasers); i++){
		var lcol = i ? c_aqua : c_purple
		with global.lasers[i]{
			coolline(xstart,ystart,x,y,25*image_yscale,lcol,col2)
		}
	}
	with NothingBeam{
		coolline(xstart,ystart,x,y,300,col3,col2)
	}
	for (var i = 0; i<array_length_1d(global.lightning); i++){
		var lcol = i ? c_aqua : col14
		with global.lightning[i]{
			draw_circle_color(x - _x,y - _y,25+random(2),lcol,col2,0)
		}
	}
	with Player{
		if global.flashlight{
			var angdif = 6
			var times = 3
			for (var i = -times;i<=times;i++){
				if (i mod 2){
					r = q
				}
				else{
					var r = collision_line_point(x,y,x+lengthdir_x(1000,gunangle+angdif*i),y+lengthdir_y(1000,gunangle+angdif*i),Wall,0,0)
				}
				var q = collision_line_point(x,y,x+lengthdir_x(1000,gunangle+angdif*(i+1)),y+lengthdir_y(1000,gunangle+angdif*(i+1)),Wall,0,0)
				draw_triangle_color(x - _x,y - _y,r[1] - _x,r[2] - _y,q[1] - _x,q[2] - _y,col,col2,col2,0)
			}
		}
		if weapon_get_type(bwep) = 5 && weapon_is_melee(bwep){
			if race != "steroids"{
				draw_circle_color(x - _x - 6*right,y - _y-10,12+random(2),col3,col2,0)
			}
			else{
				draw_circle_color(x - _x + lengthdir_x(14,gunangle+bwepangle),y - _y - 4 + lengthdir_y(14,gunangle+bwepangle),12+random(2),col3,col2,0)
			}
		}
		if weapon_get_type(wep) = 5 && weapon_is_melee(wep){
			draw_circle_color(x - _x + lengthdir_x(14,gunangle+wepangle),y - _y + lengthdir_y(14,gunangle+wepangle),12+random(2),col3,col2,0)
		}
		if skill_get(mut_gamma_guts){
			draw_circle_color(x - _x,y - _y,10+random(2),col10,col2,0)
		}
		if weapon_get_laser_sight(wep) && canscope{
			var q = collision_line_point(x,y,x+lengthdir_x(1000,gunangle),y+lengthdir_y(1000,gunangle),Wall,0,0)
			coolline(x,y,q[1],q[2],8,col11,col2)
		} 
		if race = "steroids" && weapon_get_laser_sight(bwep) && canscope{
			var q = collision_line_point(x,y-4,x+lengthdir_x(1000,gunangle),y-4+lengthdir_y(1000,gunangle),Wall,0,0)
			coolline(x,y-4,q[1],q[2],8,col11,col2)
		} 
		if race = "eyes" draw_circle_color(x - _x,y - _y,2*global.sight+30+random(4),col,col2,0)
		else if global.sight draw_circle_color(x - _x,y - _y,global.sight+random(4),col,col2,0)
	}
	
	draw_set_blend_mode_ext(11,4) //i figured out that im a moron and dont need to invert colors, but i already made like 60% of the lights, so i just stick with it, not the modder friends though
	for (var i = 0; i< array_length_1d(global.mods);i++){
		mod_script_call("mod",global.mods[i],"draw_cooldark",_x,_y)
	}
	
	draw_set_blend_mode(bm_subtract)
	surface_reset_target()

	for var i = 0; player_is_active(i); i++{
        draw_set_visible_all(0)
        draw_set_visible(i,1)
        draw_surface_part_ext(global.sf,view_xview_nonsync -_x,view_yview_nonsync - _y, game_width, game_height, view_xview_nonsync, view_yview_nonsync,1,1,merge_color(c_black,merge_color(c_yellow,col2,.8),.9),1)
    }
    draw_set_visible_all(1)

	draw_set_blend_mode(bm_normal)
}

#define dx(dis)
return lengthdir_x(dis,direction)
#define dy(dis)
return lengthdir_y(dis,direction)
#define ix(dis)
return lengthdir_x(dis,image_angle)
#define iy(dis)
return lengthdir_y(dis,image_angle)

#define coolline(x1,y1,x2,y2,width,col,col2)
var _x = 7500
var _y = 7500
if instance_exists(CharSelect) || mod_exists("area","pvparena"){
	_x = -500
	_y = -500
}
var __x = ((x1+x2)/2) -_x
var __y = ((y1+y2)/2) -_y
var dist = point_distance(x1,y1,x2,y2)
var dir = point_direction(x1,y1,x2,y2)
var lx = lengthdir_x(width/2,dir+90)
var ly = lengthdir_y(width/2,dir+90)
draw_line_width_color(__x,__y,__x+lx,__y+ly,dist,col,col2)
draw_line_width_color(__x,__y,__x-lx,__y-ly,dist,col,col2)

#define halfcool(x1,y1,x2,y2,width,col,col2,flp)
//this is peak laziness, im disgusted
var _x = 7500
var _y = 7500
if instance_exists(CharSelect) || mod_exists("area","pvparena"){
	_x = -500
	_y = -500
}
var __x = ((x1+x2)/2) -_x
var __y = ((y1+y2)/2) -_y
var dist = point_distance(x1,y1,x2,y2)
var dir = point_direction(x1,y1,x2,y2)
var lx = lengthdir_x(width,dir+90*flp)
var ly = lengthdir_y(width,dir+90*flp)
draw_line_width_color(__x,__y,__x+lx,__y+ly,dist,col,col2)


#define cleanup
surface_destroy(global.sf)
with instances_matching(CustomDraw,"name","darkgod") instance_destroy()

//thanks yal
#define collision_line_point()
/// collision_line_point(x1, y1, x2, y2, obj, prec, notme)
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var qi = argument4;
var qp = argument5;
var qn = argument6;
var rr, rx, ry;
rr = collision_line(x1, y1, x2, y2, qi, qp, qn);
rx = x2;
ry = y2;
if (rr != noone) {
    var p0 = 0;
    var p1 = 1;
    repeat (ceil(log2(point_distance(x1, y1, x2, y2))) + 1) {
        var np = p0 + (p1 - p0) * 0.5;
        var nx = x1 + (x2 - x1) * np;
        var ny = y1 + (y2 - y1) * np;
        var px = x1 + (x2 - x1) * p0;
        var py = y1 + (y2 - y1) * p0;
        var nr = collision_line(px, py, nx, ny, qi, qp, qn);
        if (nr != noone) {
            rr = nr;
            rx = nx;
            ry = ny;
            p1 = np;
        } else p0 = np;
    }
}
var r;
r[0] = rr;
r[1] = rx;
r[2] = ry;
return r;