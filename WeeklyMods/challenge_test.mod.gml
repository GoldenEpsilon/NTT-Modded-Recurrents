#define init 

global.challenge = "GRHG"
global.timeLimit = 60
global.frames = 30
global.flashTimer = 5;
global.flash = false
global.color = 1
global.bColor = 0
if instance_exists(Player) Player.my_health = 0;
#define step
if instance_exists(CharSelect) global.backgroundColor = area_get_background_color(0);
if (GameCont.area == 0) global.backgroundColor = area_get_background_color(0);
if (GameCont.area == 1) global.backgroundColor = area_get_background_color(1);
if (GameCont.area == 2) global.backgroundColor = area_get_background_color(2);
if (GameCont.area == 3) global.backgroundColor = area_get_background_color(3);
if (GameCont.area == 4) global.backgroundColor = area_get_background_color(4);
if (GameCont.area == 5) global.backgroundColor = area_get_background_color(5);
if (GameCont.area == 6) global.backgroundColor = area_get_background_color(6);
if (GameCont.area == 7) global.backgroundColor = area_get_background_color(7);
//Setting Global.color
if (global.timeLimit > 10) global.color = 1
if (global.timeLimit == 10) global.color = 0.9
if (global.timeLimit == 9) global.color = 0.8
if (global.timeLimit == 8) global.color = 0.7
if (global.timeLimit == 7) global.color = 0.6
if (global.timeLimit == 6) global.color = 0.5
if (global.timeLimit == 5) global.color = 0.4
if (global.timeLimit == 4) global.color = 0.3
if (global.timeLimit == 3) global.color = 0.2
if (global.timeLimit == 2) global.color = 0.1
if (global.timeLimit == 1) global.color = 0

//Color Change
with Player image_blend = merge_color(c_black, c_white, global.color)
with Floor image_blend = merge_color(merge_color(c_red, c_white, global.color), c_white, global.color)
with Wall image_blend = merge_color(c_black, c_white, global.color)
with enemy image_blend = merge_color(c_black, c_white, global.color)
with prop image_blend = merge_color(c_red, c_white, global.color)
with projectile image_blend = merge_color(c_black, c_white, global.color)
with Corpse image_blend = merge_color(c_red, c_white, global.color)
with Pickup image_blend = merge_color(c_black, c_white, global.color)
with Debris image_blend = merge_color(c_black, c_white, global.color)
with Effect image_blend = merge_color(c_red, c_white, global.color)
with TopSmall image_blend = merge_color(c_black, c_white, global.color)
with Portal image_blend = merge_color(c_red, c_white, global.color)
background_color = merge_color(c_black,global.backgroundColor,global.color)
with chestprop image_blend = merge_color(c_black, c_white, global.color)
with hitme image_blend = merge_color(c_black, c_white, global.color)
with Tangle image_blend = merge_color(c_black, c_white, global.color)
with BigDogExplo image_blend = merge_color(c_black, c_white, global.color)
with NothingDeath image_blend = merge_color(c_black, c_white, global.color)
with Nothing2Death image_blend = merge_color(c_black, c_white, global.color)
with RevivePopoFreak image_blend = merge_color(c_black, c_white, global.color)
with SnowTankExplode image_blend = merge_color(c_black, c_white, global.color)
with Scorch image_blend = merge_color(c_red, c_white, global.color)
with ScorchTop image_blend = merge_color(c_black, c_white, global.color)
with YungCuz image_blend = merge_color(c_red, c_white, global.color)
with CampChar image_blend = merge_color(c_red, c_white, global.color)
with BulletHit image_blend = merge_color(c_black, c_white, global.color)
with Explosion image_blend = merge_color(c_black, c_white, global.color)
with GreenExplosion image_blend = merge_color(c_black, c_white, global.color)
with MeatExplosion image_blend = merge_color(c_black, c_white, global.color)
with Debris image_blend = merge_color(c_black, c_white, global.color)
with Bones image_blend = merge_color(c_black, c_white, global.color)
with MeatExplosion image_blend = merge_color(c_black, c_white, global.color)
with Detail image_blend = merge_color(c_red, c_white, global.color)
with TopDecalDesert image_blend = merge_color(c_black, c_white, global.color)
with TopDecalScrapyard image_blend = merge_color(c_black, c_white, global.color)
with TopDecalCave image_blend = merge_color(c_black, c_white, global.color)
with TopDecalCity image_blend = merge_color(c_black, c_white, global.color)
with TopDecalPalace image_blend = merge_color(c_black, c_white, global.color)
with Spiral image_blend = merge_color(c_red, c_white, global.color)
with PizzaEntrance image_blend = merge_color(c_red, c_white, global.color)
with RainDrop color = merge_color(c_black, c_white, global.color)
with RainSplash image_blend = merge_color(c_black, c_white, global.color)
with SnowFlake image_blend = merge_color(c_black, c_white, global.color)
with Trap image_blend = merge_color(c_red, c_white, global.color)
with ProtoStatue image_blend = merge_color(c_black, c_white, global.color);

with instances_matching_le(Nothing,"my_health",0){
			    with(instance_create(Player.x, Player.y, PopupText)){
                text = "CHALLENGE";
                vspeed = -5;
                friction = 0.4;
                hspeed = 0;
				time = 10;
}
}
with instances_matching_le(Nothing,"my_health",0){
			    with(instance_create(Player.x, Player.y, PopupText)){
                text = "COMPLETE";
                vspeed = -4.5;
                friction = 0.4;
                hspeed = 0;
				time = 10;
}
}
with instances_matching_le(Nothing,"my_health",0){
			    with(instance_create(Player.x, Player.y, PopupText)){
                text = "@2(sprUltraLevel:10)";
                vspeed = -4;
                friction = 0.4;
                hspeed = 0;
				time = 10;
}

//sound_play(sndMenuGoldwep);
//sound_play(sndGoldUnlock);
sound_play(sndGoldChest);
}
if global.timeLimit > 9 {
    global.flash = false;
}

if global.flashTimer > 0 {
    global.flashTimer -= 1
 } else {
    if (global.flash == true) {
        global.flash = false
    } else global.flash = true;
    global.flashTimer = 5;
}


if (global.timeLimit < 0 && instance_exists(Player  )) Player.my_health = 0;

if (global.frames > 0) {
    global.frames -= 1
} else {
    global.timeLimit -= 1
    global.frames = 30
}

if (instance_number(enemy) == 0) {
    if (GameCont.area == 7 && GameCont.subarea == 3) {
    global.frames = 30
    global.timeLimit = 120
    } else {
    global.frames = 30
    global.timeLimit = 60
    }
}

if (!instance_exists(Player)) {
    global.timeLimit = 60
    global.frames = 30
}

#define draw_gui
draw_set_font(fntM0);
if instance_exists(CharSelect)  {
draw_text_nt(65, 15, "@rGRIM REAPER'S HOUR GLASS");
draw_set_font(fntSmall);
draw_text_nt(95, 23, "@r60 SECONDS TO COMPLETE EACH LEVEL");
} else {

}

if (global.challenge == "GRHG" && !instance_exists(CharSelect)) {
    draw_set_font(fntM0);

//Frames
if instance_exists(Player) {
if (global.timeLimit) > 9 {  
draw_text_nt(109, 7, "@w" + string(global.timeLimit));
 } else {
if global.flash == true {
 draw_text_nt(109, 7, "@r0");
 draw_text_nt(117, 7, "@r" + string(global.timeLimit));    
 } else {
      draw_text_nt(109, 7, "@w0");
 draw_text_nt(117, 7, "@w" + string(global.timeLimit));    
 }

 }




 //Frames
draw_set_font(fntSmall);
if global.timeLimit > 9 {
if (global.frames > 9) {
draw_set_font(fntSmall);
draw_text_nt(127, 7, "@w" + string(global.frames));
} else {
 draw_text_nt(131, 7, "@w" + string(global.frames));
  draw_text_nt(127, 7, "@w0");
}
} else {
if (global.flash == true) {
if (global.frames > 9){
draw_text_nt(127, 7, "@r" + string(global.frames));
} else {
 draw_text_nt(131, 7, "@r" + string(global.frames));
  draw_text_nt(127, 7, "@r0");
}
} else {
    if (global.frames > 9){
draw_text_nt(127, 7, "@w" + string(global.frames));
} else {
 draw_text_nt(131, 7, "@w" + string(global.frames));
  draw_text_nt(127, 7, "@w0");
}
}
}
}
}