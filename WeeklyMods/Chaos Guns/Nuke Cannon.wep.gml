
#define init 
global.blunderbuss = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAL0AAAAOCAYAAAB6iR3rAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAACAUlEQVRoQ+2WMXLDMAwE/YdU+UDaPMHp0rhO50mRJs/IzxUAOnosECJBiUJsRztzY5EUcTyIhQ87OzsdGYZBFEGkF/OIuXavdbAD+WxvxiYgJBhxybYxYT0kwrzYBPyt19sPHvowHN9P0sRxOKWn15hnBFMZUdnutYfEzXyv0LvxqE1korLdaw+Jf33pU/BV4gaePs5pnMFeOEtXUD4jKpuVi6YXydNDYrLHi963xKskL/RuRu9vlaBxTjI7Pj8Nn68vIn7mja3iBt7ipd8621wuq05Nnh4SWSYvPbyua2h5kKqKLb7VnNfFLBldzEhpc6u4nlRVzF2OtaB8RlS2Ui6rhkdUdraHhJnJSw8vXeNaNaSqIupbJaSwNjp/fTerZobM3UF5i5BsOMYsVr051XpIFDN56eFVUgnU1iz20nLkGs20eL5VyRDjDGTuDspn8FpQNjlHCX7Ho1oPiWomLz28SpqD1ixWeV3LkSs347lxqRkx5N9xOAWZM7DcBLYKmMrAckQ2qa3BWivFHhKTPGsy8RkjvRKY0nTzImq5ZGEi/n9lyUHzpbd8WDWwXcBUBpYFHrIsL5aD4qVPSlgeLAfVi6hl+bBq4KipjsXEh2X5sGrASsCUppsXUb30vQkzQw/DghFR2R6yh7AK8SLCeihwrqStifJJROfavZaTex0Ov6YcE6ivhvNiAAAAAElFTkSuQmCC", 7, 0, 7);

#define weapon_name
	return "nuke cannon"; // Name

#define weapon_type
	return 4;

#define weapon_cost
	return 30; //cost

#define weapon_load
	return 40; //reload

#define weapon_auto
	return 0;

#define weapon_area
	return 5;

#define weapon_laser_sight
	return false; //bolt weapon without laser sight

#define weapon_melee
    return false;
	
#define weapon_swap
	return sndSwapShotgun; // Swap sound

#define weapon_sprt
	return global.blunderbuss; // Wep Sprite, needs to be set the same name as what was defined in init

#define weapon_text
	return "DESTRUCTION SUPREME"; // Loading Tip
	
#define weapon_fire

with instance_create(x,y,Nuke){
	motion_set(other.gunangle+random_range(-1,1)*other.accuracy, random_range(2,0)+3)
	nukeCannon = 1;
	team = other.team
	creator = other.team; 
}
weapon_post(6, -4, 4);

#define step
with instances_matching(projectile,"nukeCannon",1){
	if(random_range(0,5) < 1){
		with instance_create(x,y,Nuke){
			motion_set(other.image_angle+random_range(0,360), 0)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndNukeFire)
		}
	}
}