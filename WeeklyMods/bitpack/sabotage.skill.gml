#define init
global.sprscavenge = sprDeflect;

#define skill_name
return "SABOTAGE"

#define skill_text
return "SMALLER ENEMY BULLETS"

#define skill_take 
//sound_play(sndMutEagleEyes)

#define step
if instance_exists(enemy){
with(projectile){
if "sabot" not in self{
if team = 2
{}
else
{
image_xscale = image_yscale*0.1;
image_yscale = image_xscale
sabot = 1;
}}}}



#define skill_button 
sprite_index = global.sprscavenge;


#define skill_tip
return "THAT WAS CLOSE"
 