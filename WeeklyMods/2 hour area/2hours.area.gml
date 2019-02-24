#define init
global.sprFloor = sprite_add("gfx/sprFloor.png",4,0,0)
global.sprFloorB = sprite_add("gfx/sprFloorB.png",4,0,0)
global.sprWallBot = sprite_add("gfx/sprWallBot.png",1,0,0)
global.sprWallTop = sprite_add("gfx/sprWallTop.png",1,0,0)
global.sprDebris = sprite_add("gfx/sprDebris.png",1,4,4)
global.sprTrans = sprite_add("gfx/sprWallTrans.png",1,0,0)
global.sprExplo = sprite_add("gfx/sprFloorExplo.png",1,0,0)
global.sprClouds = sprite_add("gfx/sprClouds.png",1,0,0)
global.sprDetail = sprite_add("gfx/sprDecoration.png",4,8,8)
global.sprTreeBot = sprite_add("gfx/sprTreeBot.png",1,8,8)
global.sprTreeTop = sprite_add("gfx/sprTreeTop.png",1,40,40)
global.sprBow = sprite_add("gfx/sprBow.png",1,4,4)
global.sprArrow = sprite_add("gfx/sprArrow.png",1,4,4)
global.sprZombieIdle = sprite_add("gfx/sprZombieIdle.png",4,12,12)
global.sprZombieWalk = sprite_add("gfx/sprZombieWalk.png",6,12,12)
global.sprZombieHurt = sprite_add("gfx/sprZombieHurt.png",3,12,12)
global.sprSpiderIdle = sprite_add("gfx/sprSpiderIdle.png",8,12,12)
global.sprSpiderWalk = sprite_add("gfx/sprSpiderWalk.png",6,12,12)
global.sprSpiderHurt = sprite_add("gfx/sprSpiderHurt.png",3,12,12)
with(instances_matching(CustomDraw,"name","treedraw")){
        instance_destroy();
    }
with(script_bind_draw(treedraw,-9)){
        persistent = 1;
        name = "treedraw";
    }
with(instances_matching(CustomDraw,"name","topdraw")){
        instance_destroy();
    }
with(script_bind_draw(topdraw,-11)){
        persistent = 1;
        name = "topdraw";
    }
with(instances_matching(CustomDraw,"name","shadowdraw")){
        instance_destroy();
    }
with(script_bind_draw(shadowdraw,6)){
        persistent = 1;
        name = "shadowdraw";
    }
#define area_name
return "MINECRAFT";

#define area_sprite(q)
switch (q) {
    case sprFloor1: return global.sprFloor;
    case sprFloor1B: return global.sprFloorB;
    case sprFloor1Explo: return global.sprExplo;
    case sprWall1Trans: return global.sprTrans;
    case sprWall1Bot: return global.sprWallBot;
    case sprWall1Out: return sprVoid
    case sprWall1Top: return global.sprWallTop;
    case sprDebris1: return global.sprDebris;
}

#define area_transit
if (lastarea != "2hours" && area == 1) {
    area = "2hours";
}

#define area_finish
area = 2;
subarea = 1;

#define area_setup
goal = 110;
background_color = make_color_rgb(115, 162, 62);
BackCont.shadcol = c_black;
//TopCont.fog = sprFog2;

#define area_make_floor
instance_create(x, y, Floor);
var turn = choose(0, 0, 90, -90, 90, -90, 180);
if irandom(20) = 1
{
    if styleb = 0
    styleb = 1
    else
    styleb = 1
}
direction += turn;
if (turn == 180 && point_distance(x, y, 10016, 10016) > 48) {
    // turnarounds - weapon chests spawn in such
    instance_create(x, y, Floor);
    instance_create(x + 16, y + 16, WeaponChest);
}
if (random(19 + instance_number(FloorMaker)) > 22) {
    // dead ends - ammo chests spawn in such
    if (point_distance(x, y, 10016, 10016) > 48) {
        instance_create(x + 16, y + 16, AmmoChest);
        instance_create(x, y, Floor);
    }
    instance_destroy();
} else if (random(4) < 1) {
    // branching
    instance_create(x, y, FloorMaker);
}

#define area_pop_enemies
if irandom(1) = 1
{
    with instance_create(x+16,y+16,CustomEnemy)
    {
        spr_idle = sprMutant14Idle
        spr_walk = sprMutant14Walk
        spr_hurt = sprMutant14Hurt
        spr_dead = sprMutant14Hurt
        snd_hurt = sndHitRock
        snd_dead = sndBanditDie
        on_step = script_ref_create(skeletonstep)
        on_draw = script_ref_create(skeletondraw)
        on_hurt = script_ref_create(enemyhurt)
        maxhealth = 12
        gunangle = irandom(360)
        walk = 0
        alrm[1] = 45
    }
}
if irandom(1) = 1
{
    with instance_create(x+16,y+16,CustomEnemy)
    {
        spr_idle = global.sprZombieIdle
        spr_walk = global.sprZombieWalk
        spr_hurt = global.sprZombieHurt
        spr_dead = global.sprZombieHurt
        snd_hurt = sndRatHit
        snd_dead = sndRatDie
        on_step = script_ref_create(zombiestep)
        on_draw = script_ref_create(zombiedraw)
        on_hurt = script_ref_create(enemyhurt)
        maxhealth = 12
        gunangle = irandom(360)
        walk = 0
        alrm[1] = 40
    }
}
if irandom(1) = 1
{
    with instance_create(x+16,y+16,CustomEnemy)
    {
        spr_idle = global.sprSpiderIdle
        spr_walk = global.sprSpiderWalk
        spr_hurt = global.sprSpiderHurt
        spr_dead = global.sprSpiderHurt
        snd_hurt = sndToxicBoltGas
        snd_dead = sndToxicBarrelGas
        on_step = script_ref_create(spiderstep)
        on_draw = script_ref_create(spiderdraw)
        on_hurt = script_ref_create(enemyhurt)
        maxhealth = 9
        gunangle = irandom(360)
        walk = 0
        alrm[1] = 30
        z = 0
        zspeed = 0
    }
}

#define area_pop_props
if irandom(2) = 1
{
    with instance_create(x+irandom(32),y+irandom(32),CustomObject)
    {
        sprite_index = global.sprDetail
        visible = 1
        image_speed = 0
        image_index = irandom(3)
    }
}
if irandom(6) = 1
{
    with instance_create(x+choose(0,16)+8,y+choose(0,16)+8,CustomHitme)
    {
        team = -1
        sprite_index = global.sprTreeBot
        snd_hurt = sndHitRock
        on_hurt = script_ref_create(treehurt)
        name = "tree"
        depth = 1
        my_health = 999999
        instance_create(x-8,y,InvisiWall)
    }
}
if irandom(6) = 1
image_index = 3

#define area_mapdata(lx, ly, lp, ls, ws, ll)
return [lx, 9];

#define treehurt(damage, kb_vel, kb_dir)
my_health -= damage;
sound_play(snd_hurt)
nexthurt = current_frame+9

#define treedraw
with instances_matching(CustomHitme,"name","tree")
draw_sprite_ext(global.sprTreeTop,0,x,y,1,1,0,c_white,0.4)

with enemy
{
    if place_meeting(x+hspeed,y+vspeed,InvisiWall)
    {
        direction += 180
    }
}

#define topdraw
draw_sprite_tiled_ext(global.sprClouds, 0, current_frame, y, 64, 64, c_white, 0.1);
with Corpse
{
    if "countdown" not in self
    countdown = 9
    if countdown > 0
    {
        image_angle -= 9
        image_blend += merge_color(image_blend,c_red,0.1)
    }
    countdown -= 1
    if countdown = -9
    {
        visible = 0
        sprite_index = sprVoid
        repeat(3)
        with instance_create(x,y,Dust)
        {
            motion_add(irandom(360),1+irandom(2))
        }
    }
}

#define shadowdraw
with Wall
{
    if place_meeting(x,y+16,Floor)
    draw_sprite_ext(sprite_index, 0, x, y+16, 1, 1, 1, c_black, 0.4);
}

#define skeletonstep
if speed = 0
    {if sprite_index != spr_hurt
    sprite_index = spr_idle}
    else
    {if sprite_index != spr_hurt
    sprite_index = spr_walk}
    if sprite_index = spr_hurt
    {if image_index > 2
    sprite_index = spr_idle}

    if speed > 3
    speed = 3

if walk > 0
{
    walk -= 1
    motion_add(direction,0.6)
}
if alrm[1] > -1
{
    alrm[1] -= 1
    if alrm[1] = 0
    {
        scrTarget()
        if !collision_line(x,y,target.x,target.y,Wall,0,0)
        {
            if irandom(2) = 1
            {
                gunangle = point_direction(x,y,target.x,target.y)
                with instance_create(x,y,EnemyBullet1)
                {
                    sprite_index = global.sprArrow
                    motion_add(other.gunangle,8)
                    image_angle = direction+45
                    team = other.team
                    damage = 3
                    sound_play(sndCrossbow)
                }
                alrm[1] = 45
            }
            else
            {
                walk = 30
                alrm[1] = 45
            }
        }
        else
        {
            walk = 30
            alrm[1] = 45
        }
    }
}

#define zombiestep
if speed = 0
    {if sprite_index != spr_hurt
    sprite_index = spr_idle}
    else
    {if sprite_index != spr_hurt
    sprite_index = spr_walk}
    if sprite_index = spr_hurt
    {if image_index > 2
    sprite_index = spr_idle}

    if speed > 2
    speed = 2

if walk > 0
{
    walk -= 1
    motion_add(direction,0.6)
}
if alrm[1] > -1
{
    alrm[1] -= 1
    if alrm[1] = 0
    {
        scrTarget()
        if !collision_line(x,y,target.x,target.y,Wall,0,0)
        {
            direction = point_direction(x,y,target.x,target.y)
            walk = 40
            alrm[1] = 40
        }
        else
        {
            walk = 25
            alrm[1] = 40
            direction = irandom(360)
        }
    }
}

#define spiderstep
if speed = 0
    {if sprite_index != spr_hurt
    sprite_index = spr_idle}
    else
    {if sprite_index != spr_hurt
    sprite_index = spr_walk}
    if sprite_index = spr_hurt
    {if image_index > 2
    sprite_index = spr_idle}

    if speed > 3
    speed = 3

if walk > 0
{
    walk -= 1
    motion_add(direction,0.6)
}

zspeed += 1
z -= zspeed
if z < 0
z = 0
if alrm[1] > -1
{
    alrm[1] -= 1
    if alrm[1] = 0
    {
        scrTarget()
        if !collision_line(x,y,target.x,target.y,Wall,0,0)
        {
            {
                direction = point_direction(x,y,target.x,target.y)
                walk = 35
                alrm[1] = 35
                zspeed = -6
            }
        }
        else
        {
            walk = 20
            alrm[1] = 35
        }
    }
}
#define enemyhurt(damage, kb_vel, kb_dir)
my_health -= damage;
sound_play(snd_hurt)
nexthurt = current_frame+9
sprite_index = spr_hurt
motion_add(kb_dir,kb_vel)

#define skeletondraw
{
    if sprite_index = spr_hurt and image_index < 1
    d3d_set_fog(1,c_white,0,0)
    else
    d3d_set_fog(0,c_white,0,0)
    draw_self()
    draw_sprite_ext(global.sprBow,0,x,y,1,right,gunangle-45,c_white,1)
    d3d_set_fog(0,c_white,0,0)
}
#define zombiedraw
{
    if sprite_index = spr_hurt and image_index < 1
    d3d_set_fog(1,c_white,0,0)
    else
    d3d_set_fog(0,c_white,0,0)
    draw_self()
    d3d_set_fog(0,c_white,0,0)
}

#define spiderdraw
{
    if sprite_index = spr_hurt and image_index < 1
    d3d_set_fog(1,c_white,0,0)
    else
    d3d_set_fog(0,c_white,0,0)
    draw_sprite_ext(sprite_index,image_index,x,y-z,right,1,0,c_white,1)
    d3d_set_fog(0,c_white,0,0)
}


#define scrTarget
if instance_exists(Player)
target = instance_nearest(x,y,Player)
else
target = Floor