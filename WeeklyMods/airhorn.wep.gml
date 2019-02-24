#define init
global.sprAirhorn = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAAAkAAAANCAYAAAB7AEQGAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABiSURBVChTtY9BCsAwCATXvsFjj/3/i3oMePEPKQYVW2jx0oGwG1lwRQdyNaarYfP40+ZmofvhDrN43EIF4nG6fQ8ZtnLViU61T5B9M6SqbgFmNsnQ17rkh5CI5HvSuq4BcAE/lxVg3lo0uwAAAABJRU5ErkJggg==", -3, 6)

#define weapon_name
return "AIRHORN";

#define weapon_type
return 5;

#define weapon_cost
return 0;

#define weapon_load
if race_id = 7
{
	return 4;
}
else
{
	return 0;
}

#define weapon_auto
return 0;

#define weapon_area
return -1;

#define weapon_sprt
return global.sprAirhorn;

#define weapon_swap
return sndSwapBow;

#define weapon_text
return "AIRHORN.WEP.GML";

#define weapon_fire

sound_play(sndVenuz);
weapon_post(0, 0, 5);

