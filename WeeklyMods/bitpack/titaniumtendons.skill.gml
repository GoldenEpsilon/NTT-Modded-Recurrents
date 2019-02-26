#define init
global.sprscavenge = sprDeflect;

#define skill_name
return "TITANIUM TENDONS"

#define skill_text
return "WIDER MELEE SWINGS"

#define skill_take 
//sound_play(sndMutEagleEyes)

#define step
if instance_exists(Slash){
with(Slash){
if "hev" not in self{
if team = Player.team
{
image_yscale = image_yscale + image_yscale*0.27;
hev = 1;
}}}}

if instance_exists(GuitarSlash){
with(GuitarSlash){
if "hev" not in self{
if team = Player.team
{
image_yscale = image_yscale + image_yscale*0.27;
hev = 1;
}}}}

if instance_exists(BloodSlash){
with(BloodSlash){
if "hev" not in self{
if team = Player.team
{
image_yscale = image_yscale + image_yscale*0.27;
hev = 1;
}}}}


if instance_exists(EnergySlash){
with(EnergySlash){
if "hev" not in self{
if team = Player.team
{
image_yscale = image_yscale + image_yscale*0.27;
hev = 1;
}}}}

if instance_exists(EnergyHammerSlash){
with(EnergyHammerSlash){
if "hev" not in self{
if team = Player.team
{
image_yscale = image_yscale + image_yscale*0.27;
hev = 1;
}}}}

if instance_exists(LightningSlash){
with(LightningSlash){
if "hev" not in self{
if team = Player.team
{
image_yscale = image_yscale + image_yscale*0.27;
hev = 1;
}}}}

#define skill_button 
sprite_index = global.sprscavenge;


#define skill_tip
return "CREAKING JOINTS"
 