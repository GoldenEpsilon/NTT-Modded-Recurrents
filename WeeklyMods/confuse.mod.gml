#define step
if instance_exists(Player) with (Player) {
    if button_check(index, 'sout') motion_add(90,5);
    if button_check(index, 'nort') motion_add(-90,5);
    if button_check(index, 'east') motion_add(180,5);
    if button_check(index, 'west') motion_add(0,5);
}