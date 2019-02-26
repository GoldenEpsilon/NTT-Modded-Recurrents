#define init
global.F1 = sprite_add("spr/F1.png",4,14,15)
global.F1E = sprite_add("spr/F1E.png",4,8,9)
global.W1T = sprite_add("spr/W1T.png",8,8,7)
global.W1B = sprite_add("spr/W1B.png",4,7,12)
global.W1O = sprite_add("spr/W1O.png",1,11,12)
#define area_name(sub)
return "8-" + string(sub)


#define area_sprite(q)
switch (q) {
	case sprFloor1: return global.F1;
    case sprFloor1B: return global.F1;
    case sprFloor1Explo: return global.F1E;
    case sprWall1Trans: return global.W1T;
    case sprWall1Bot: return global.W1B;
    case sprWall1Out: return global.W1O;
    case sprWall1Top: return global.W1T;
    case sprDebris1: return sprDebris7;
}

#define area_setup
goal = 80;
background_color = make_color_rgb(149, 48, 48);
BackCont.shadcol = c_black;

#define area_make_floor
instance_create(x, y, Floor);
var turn = choose(0, 0, 0, 0, 0, 0, 0, 0, 0, 90, -90, 90, -90, 180);
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
if (random(2) < 1) instance_create(x + 16, y + 16, PopoFreak);
if (random(3) < 1) instance_create(x + 12, y + 8, GoldSnowTank);
if (random(4) < 1) instance_create(x + 6, y + 6, SuperFireBaller);
if (random(2) < 1) instance_create(x + 48, y + 32, Mimic);
if (random(3) < 1) instance_create(x + 12, y + 8, GoldScorpion);

#define area_pop_props
if (random(4) < 1) instance_create(x + 16, y + 16, WeaponChest);

#define area_mapdata(lx, ly, lp, ls, ws, ll)
return [lx, 9];

#define area_transit
if (area = 0 && subarea == 1) {
	loops -= 1
    area = "crimson";
	subarea = 1
	hard += 2
}

#define area_finish
area = "crimson";
subarea += 1;
if subarea = 7 {
	area = 1
	subarea = 3
	loops += 1
	}
