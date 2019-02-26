#define init
global.sprscavenge = sprDeflect;

#define skill_name
return "PSYCHIC SHOCK"

#define skill_text
return "HOMING PROJECTILES BELOW 1/2 MAX HP"

#define skill_take 
//sound_play(sndMutEagleEyes)

#define step
if instance_exists(Player){
if Player.my_health < Player.maxhealth/2 {
if irandom_range(0,8) = 8{
with(projectile){
if "psyseek" not in self{
psyseek = 1;
if team = Player.team
{
if instance_exists(enemy){
if collision_line(x,y,instance_nearest(x,y,enemy).x,instance_nearest(x,y,enemy).y,Wall,0,0) < 0
{	
motion_set(point_direction(x,y,instance_nearest(x,y,enemy).x,instance_nearest(x,y,enemy).y),speed)
image_angle = direction;
}
}}
}
else
{
psyseek = 1;
}}}}
}
#define skill_button 
sprite_index = global.sprscavenge;
//image_index = 19;

#define skill_tip
return "TRY NOT TO PANIC"
 