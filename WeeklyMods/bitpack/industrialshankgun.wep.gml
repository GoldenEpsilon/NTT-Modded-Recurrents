#define init
global.ISG = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABUAAAAICAYAAAAWX7TTAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAB+SURBVChTY0AC/9Eww////+EYnY8PIwM4DyoBpCA0KRhmKIYEMo6xVgbjrmnz/htZ2hGkofoY4JybW1zBGMYG0atyHWEKScEIDsgAEAYZiEyD5EDeIhYjGEAmzKsww2EYZinRGNlQbBhmEb5wRKbB+mCG4sLIFhCD////zwAAmukhXWSMChMAAAAASUVORK5CYIIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",4,1);

#define weapon_sprt
return global.ISG

#define weapon_name
return "INDUSTRIAL SHANK GUN"

#define weapon_text
return "WHY THE FUCK ARE YOU USING THIS";

#define weapon_type
return 3;

#define weapon_auto
return true;

#define weapon_load
return 6;

#define weapon_cost
return 2;

#define weapon_area
return 1;

#define weapon_swap
return sndSwapPistol;

#define weapon_fire
// weapon' sound:
sound_play_gun(sndPistol, 0.2, 0.3);
// weapon shift, camera offset, screenshake:
weapon_post(0, 0, 0);
// creating the actual projectile:
repeat(7){
with (instance_create(x, y, Splinter)) {
damage = 1;
sprite_index = sprScrewDriver;
speed = 27;
    creator = other;
    team = other.team;
    direction = other.gunangle + random_range(14, -14);
    image_angle = direction;
global.storedirect = direction;
if(fork()){
    while(instance_exists(self)){
with (instance_create(x, y, Shank)){
direction = other.direction;
creator = other;
team = other.team;
 image_angle = direction;
wait(0)
instance_delete(self)}
    }
    exit;
}}
wait(2)
}

