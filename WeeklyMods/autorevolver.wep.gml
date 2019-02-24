#define init
global.gun = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAAAoAAAAHCAYAAAAxrNxjAAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4gUbBSsOT6NdQgAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAAAZ0lEQVQY02NggID/UIwTMMEYutpmyBrg2M879j8DA8N/RiRN/6XE1RhMTMwZGBgYGM6cOckgLCLAwMDAwHD56ikGmML/utpmDG/ffECRRAYsMJNgAEkBI7I4I7LCZy9vwcRwAoK+BgBoPyKhuYePGwAAAABJRU5ErkJggg==",-2,2)

#define weapon_fire(w)
wep = 1
player_fire()
wep = w
reload-=6
if infammo = 0 ammo[1]++

#define weapon_reloaded
if ammo[1] >= 1 player_fire()

#define weapon_auto
return false

#define weapon_load
return 6

#define weapon_swap
return sndSwapPistol

#define weapon_sprt
return global.gun

#define weapon_area
return 4

#define weapon_text
return "Oh no"

#define weapon_cost
return 1

#define weapon_type
return 1

#define weapon_name
return "AUTO REVOLVER"