#define init
global.sprscavenge = sprDeflect;

#define skill_name
return "CANNON PALMS"

#define skill_text
return "BIGGER BULLETS, BIGGER DAMAGE"

#define skill_take 
//sound_play(sndMutEagleEyes)

#define step
if instance_exists(enemy){
with(projectile){
if "cannonpalm" not in self
{
if team = 2
{
image_xscale = image_yscale*1.4;
image_yscale = image_xscale
damage=+1
cannonpalm = 1;
}
else
{cannonpalm = 1;}}}}



#define skill_button 
sprite_index = global.sprscavenge;


#define skill_tip
return "RIP AND TEAR"
 