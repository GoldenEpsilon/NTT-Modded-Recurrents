#define step
with instances_matching(EGSkillIcon, "text", "@yINFINITE AMMO@s THE FIRST 7 SECONDS#AFTER EXITING A @pPORTAL@s"){
		
		name = "GUN WARRANT";
		text = "@yINFINITE AMMO@s THE FIRST @y7@r (+1 per loop)@s #SECONDS AFTER EXITING A @pPORTAL@s"
	}
with instances_matching(Player, "race", "fish"){
	if infammo > 0{
		infammo += min(0.1*((GameCont.loops-1)*0.5),0.9)
		script_bind_draw(gwo,depth+3,self)
		if random(100)<infammo
		with instance_create(x+random_range(-4+(infammo/100),4+(infammo/100)),y-10+random_range(-4+(infammo/100),4+(infammo/100)),LaserBrain){
	        depth = other.depth + choose(-1,4,4)
	        sprite_index = choose(sprPortalL1,sprPortalL2,sprPortalL3)
	        if player_get_outlines(other.index) = 1
            image_blend = player_get_color(other.index)
	        }
	}
	if infammo < 0 && infammo != -1{
		infammo = 0
		}
	}
#define gwo(p)
with p{
    if player_get_outlines(p.index) = 1
    d3d_set_fog(true,player_get_color(p.index),0,0)
    else
    d3d_set_fog(true,c_white,0,0)
    draw_sprite_ext(sprGhostGuardianWalk,image_index,x,y,0.4+(infammo/300),0.4+(infammo/300),0,c_white,1)
    d3d_set_fog(false,c_white,0,0)
    draw_set_color(c_black)
}
instance_destroy()