#define init
global.sprite = sprite_add_weapon("BusterGun.png",2,1);

#define weapon_name
return "BUSTER GUN";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 19;

#define weapon_cost
return 6;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 7;

#define weapon_text
return "LONG RANGER";

#define weapon_fire
    motion_add(gunangle - 180, 1);
    bulSped = 14;
    repeat(6){
        bulSped -= 0.5;
        weapon_post(3,5,5);
        sound_play_pitchvol(sndFlakCannon, 1.5, 0.8);
        with(instance_create(x, y, Bullet1)){
            creator = other;
            team = other.team;
            hitid = [global.sprite, "BUSTER GUN"];
            direction = other.gunangle + random_range(-18,18) * other.accuracy;
            image_angle = direction;
            motion_add(direction, other.bulSped);
        }
    }