#define init
global.sprscavenge = sprDeflect;

#define skill_name
return "TOXIC LUNGS"

#define skill_text
return "IMMUNE TO TOXIC"

#define skill_take 
//sound_play(sndMutEagleEyes)

#define step
if instance_exists(Player){
if instance_exists(ToxicGas){
with(ToxicGas){
if distance_to_object(Player) < 10{
team = Player.team;
}
else
{
team = 3;
}}}}
#define skill_button 
sprite_index = global.sprscavenge;
//image_index = 19;

#define skill_tip
return "ROTTING LUNGS"
 