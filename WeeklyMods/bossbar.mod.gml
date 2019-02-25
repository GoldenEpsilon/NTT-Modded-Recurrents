#define draw
if instance_number(Player) != 0{
with(BanditBoss) if my_health > 0{
    draw_bossbar(x-50,y-30,100,"BIG BANDIT",c_red,my_health,maxhealth,true)
}

with(ScrapBoss) if my_health > 0{
    draw_bossbar(x-50,y-30,100,"BIG DOG",c_red,my_health,maxhealth,true)
}

with(LilHunter) if my_health > 0{
    draw_bossbar(x-25,y-30,60,"LIL' HUNTER",c_red,my_health,maxhealth,true)
}

with(NothingInactive) if my_health > 0{
    draw_bossbar(x-75,y+50,150,"THE THRONE...",c_red,my_health,maxhealth,false)
}

with(Nothing) if my_health > 0{
    draw_bossbar(x-75,y+40,150,"THE NUCLEAR THRONE",make_colour_rgb(72, 252, 8),my_health,maxhealth,true)
}

with(Generator) if my_health > 0{
    draw_bossbar(x-30,y-40,80,"GENERATOR",make_colour_rgb(72, 252, 8),my_health,maxhealth,true)
}

with(FrogQueen) if my_health > 0 if GameCont.loops <= 6{
    draw_bossbar(x-50,y-30,100,"MOM",c_red,my_health,maxhealth,true)
}

with(TechnoMancer) if my_health > 0 if GameCont.loops <= 6{
    if "trashed" not in self{
        trash = floor(random_range(1, 50))
    }
    trashed = 1
    if trash = 1{
        draw_bossbar(x-50,y-60,100,"TRASH CAN PROP",c_red,my_health,maxhealth,true)
    }else{
        draw_bossbar(x-50,y-60,100,"TECHNOMANCER",c_red,my_health,maxhealth,true)
    }
}

with(HyperCrystal) if my_health > 0{
    if GameCont.area = 104{
        draw_bossbar(x-50+random_range(-2,2),y-70+random_range(-2,2),100,GameCont.cursedbarname,c_purple,my_health,maxhealth,string(my_health+floor(random_range(-10,10)))+"/"+string(maxhealth+floor(random_range(-10,10))))
    }
    else{
        draw_bossbar(x-50,y-70,100,"HYPER CRYSTAL",c_orange,my_health,maxhealth,true)
    }
}

//Hyper crystal distortion
with(GameCont) if GameCont.area = 104 if !(current_frame mod 10){
    randtxtchance = floor(random_range(0,6))
    if randtxtchance = 2{
        cursedbarname = choose("@qKERNAL @qPANIC", "@qLET @qME @qOUT", "@qPRINTER @qON @qFIRE", "@qOUT @qOF @qMEMORY", "JAVA.LANG.NULLPOINTEREXCEPTION", "@qHIT @qME", "LITTLE BANDIT", "LITTLE DOG", "BIG HUNTER", "AIRHORN.WAV", "BIG BANDIT", "BIG DOG", "LITTLE HUNTER", "THE NUCLEAR CAPTAIN", "THE NUCLEAR THRONE", "PLEASE DIE.", "DIE.", "@qG@qE@qT @qO@qU@qT @qO@qF @qM@qY @qH@qE@qA@qD", "@qA@qA@qA@qA@qA@qA@qA@qA@qA@qA", "TOKI YO TOMARE", "LICENSE EXPIRED", "PLEASE RENEW WINRAR", "NO SUCH FILE OR DIRECTORY", "@qABORT, @qRETRY, @qFAIL?", "I AM ERROR", "@qG@qR@qU@qB@q @qR@qE@qS@qC@qU@qE@q>", "@qD@qK@qA@qG@qO@qS@qD@qK@qF@qD@qS@qK@qF@qF@qK@qO@qA@qS", "NUCLEARTHRONE.EXE DELETED", "TO BE FAIR YOU HAVE TO HAVE A VERY HIGH IQ TO UNDERSTAND CURSES")
    }
    else{
        cursedbarname = "@qC@qU@qR@qS@qE@qD @qH@qY@qP@qE@qR @qC@qR@qY@qS@qT@qA@qL"
    }
}
}

#define draw_gui
with(Nothing2) if my_health > 0{
    draw_bossbar(game_width/2-80,20,160,"THRONE II",make_colour_rgb(72, 252, 8),my_health,maxhealth,true)
}
with(Last) if my_health > 0{
    draw_bossbar(game_width/2-80,20,160,"CAPTAIN",c_blue,my_health,maxhealth,true)
}

//After loop 6, mom gets pretty fast, might as well give her a GUI  bar
with(FrogQueen) if my_health > 0 if GameCont.loops >= 7{
    draw_bossbar(game_width/2-80,20,160,"MOM",c_red,my_health,maxhealth,true)
}

#define draw_bossbar(rx, ry, length, text, color, my_val, maxval, showval)
rx = floor(rx)
ry = ceil(ry)
//Filled space and text
draw_set_halign(fa_center)
draw_text_nt(rx+(length/2), ry-10, text)
draw_set_colour(c_black);
draw_rectangle(rx, ry, rx+length, ry+10, false)
//colored bar that halves depending on what "my_val" and "maxval" is
draw_set_colour(color);
//If the boss' health is somehow greater than it's max, cap it off and don't go beyond the bar itself
if my_val > maxval{
    draw_rectangle(rx, ry, rx+length, ry+10, false)
}else{
    draw_rectangle(rx, ry, rx+((my_val/maxval)*length), ry+10, false)
}
//my_val out of maxval, if enabled
if showval = true {
    draw_text_nt(rx+(length/2), ry+2, string(my_val)+"/"+string(maxval))
}else if showval = false{
    //Do nothing
}else{
    draw_text_nt(rx+(length/2), ry+2, string(showval))
}
//Outline
draw_set_colour(c_black);
draw_rectangle(rx-1, ry-1, rx+length+1, ry+11, true)
draw_set_colour(c_white);
draw_rectangle(rx, ry, rx+length, ry+10, true)
