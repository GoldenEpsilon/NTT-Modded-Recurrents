#define init
skill_set_active(18, 0)
global.sprSkillIconHUD_18 = sprite_add("MutationHUD/sprSkillIconHUD_18.png", 1, 7, 8);

#define skill_name
return "last wish x10"

#define skill_text
return "restore full hp and large sum of ammo"

#define skill_take 
sound_play(sndMutLastWish)

with(Player)
{
ammo[1] += 2000
ammo[2] += 200
ammo[3] += 200
ammo[4] += 200
ammo[5] += 200
my_health = maxhealth
//jsnotes - this disgusts me, but i dont need to change it so i wont
if ammo[1] > typ_amax[1]
ammo[1] = typ_amax[1]

if ammo[2] > typ_amax[2]
ammo[2] = typ_amax[2]

if ammo[3] > typ_amax[3]
ammo[3] = typ_amax[3]

if ammo[4] > typ_amax[4]
ammo[4] = typ_amax[4]

if ammo[5] > typ_amax[5]
ammo[5] = typ_amax[5]

if curse = 1 or bcurse = 1
{
repeat(10)
instance_create(x+random(16)-8,y+random(16)-8,Curse)
}
curse = 0
bcurse = 0
}

#define step
if GameCont.area = 5 && GameCont.subarea = 1 && !instance_exists(IceFlower){
	with instance_random(prop){
		instance_create(x,y,IceFlower)
		instance_delete(self)
	}
}

if GameCont.area = 105 && GameCont.skillpoints{
	skill_set(mod_current,0)
	skill_set_active(mod_current,1)
}

#define instance_random(obj)
var b = irandom(instance_number(obj));
with(obj)
{
    if(b == 0)
    {
        return id;
    }
	else  b -= 1;
}
return -4

#define skill_icon
return global.sprSkillIconHUD_18

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 18;

#define skill_tip
return "iodbc you listening??"
