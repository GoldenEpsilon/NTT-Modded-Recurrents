#define step
//YV's active, recreated with x10 in mind
with instances_matching(Player,"race","venuz"){
    canspec = 0
    if button_pressed(index,"spec") {
        var _t = weapon_get_type(wep);
        var _c = weapon_get_cost(wep);
        var _l = weapon_get_load(wep);
        var _b = skill_get(5);
        var _b10 = skill_get("thronebuttx10");
        if (reload <= 0 && ammo[_t] >= ((2 + (_b * 2) + (_b10 * 18)) * _c) && !weapon_is_melee(wep)){
            repeat(2 + (_b * 2) + (_b10 * 18)) {player_fire(gunangle)};
            reload = ((2 + _b + (_b10 * 13))* _l);
            motion_add(180 + gunangle, 4)
            if !_b || (mod_exists("skill","thronebuttx10") && !_b10){sound_play_pitchvol(sndPopPop,1,1)};
            else {sound_play_pitchvol(sndPopPopUpg,1,1)};
            if (ultra_get("venuz",2)) {
                var oldrad = GameCont.rad;
                repeat((1 + _b + (_b10 * 9)) * (mod_exists("mod","ultrax10") * 9 + 1)){
                    player_fire(gunangle);
                    ammo[_t] += _c;
                    reload -= _l
                    GameCont.rad = oldrad
                };
                repeat(irandom_range(2,4)){
                    with instance_create(x,y,Feather) {
                        sprite_index = sprMoney
                    };
                }
            }
        }
        else if ammo[_t] <= 0 && !weapon_is_melee(wep){
            sound_play_pitchvol(sndEmpty,1,1)
        }
    }
}