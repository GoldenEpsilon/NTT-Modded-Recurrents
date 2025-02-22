
/*@rMods@w=#  Baldi#  bow#  Freak Arena#  Clasweps#  Brimthrone#@bCharacter@w=#  Choose#@yCrown@w=#  slots#@gWeapon@w=#  chargedisc#@pSeed@w=13333#Limited Tries:false*/
/*|Baldi[Baldi's Basics in Education and Learning#is a state-of-the-art, fully 3D interactive,#fun-time educational game that teaches a slew of subjects!]|bow[It's a bow.]|Freak Arena[Do you think you can survive#in the @qFREAK ARENA???]|Clasweps[You got ultra weapons,#you got zappy weapons,#call now and you'll even get#some crowns thrown in for free!]|Brimthrone[A portable throne, to#know how it feels to#zap people with that laser.]*/
#define init
#macro weeklyButtonX 6
#macro weeklyButtonY 41
#macro weeklyButtonW 18
#macro weeklyButtonH 24
#macro weeklyButtonLW 12
#macro weeklyButtonLH 8
#macro weeklyCurrentW 2
#macro weeklyCurrentH 8
#macro weeklyCurrentLH 6.6
#macro weeklyCurrentLW 4.4
#macro swapX 35
#macro swapY 36
#macro swapW 17
#macro swapH 10
#macro ChooseCharacter true
#macro ChooseCrown false
#macro LimitedTries false
#macro Github "https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/"
#macro data "data/"+mod_current+".mod/"

global.sprWeekly = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACAAAAAYCAYAAACbU/80AAABNklEQVRIDWO0doj8z0ABOLJ/GQW6GRhYQLofvbpPliFyYopgfXLalmTpf3T1OAMTWTqpqGnUAYMrBECJAoRxAVrIg3MByMLHYUfg9iKz4YJIDJC87CobJBHy9Q94FMBDAOQdG8coiK8cFqP4DsahhTyKA47isBjmAFrIwx3wv54ZZg9RtNwqVGXk6seaBhgZGRnuPvjAAKcb/0L4jX9RbcXBg+uDmYNHPzwEkM36/x9SP8HpepCsAMN/MI2sEjsbrg9mDh79KCHACHMpzOUwGiZOIATI0Y8SApB4FGAgxQfIYUCO/qEZApPmXkD2OJxNbAgg6ycuBBgZ4ZYga4YLQhk40wAe/cSlAWhqxmc5yA04QwCPfrgDyG1WwUKBXP0oUQAzjJ70gDsAHAWw1i25PsfXiCFkJgCiFgWoHcePfAAAAABJRU5ErkJggg==",2,0,0);
global.sprEvent = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACAAAAAYCAIAAAAUMWhjAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAFiUAABYlAUlSJPAAAAAYdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjEuNWRHWFIAAAC/SURBVEhL7Y+xDQIxDEW9CAswwUk0rMFY9LcTDSUSIzBC+D7fnRzLJHaTArC+IufnWy+m0/mSUkkWAw7HKSgBGLOhP6CrsQBc3GHta4D2tbSPZgUUussDN0abj9gO0L7V5g8HoOF5k1a+AUTyFaArA+iqBgSqAgTKBxDR4/mSE7+QU55cQDvPgYEbLPzEBoE8p35mg+t8s4BmSR5NawOc7C9pBxDIc6q7gaQdwIfSeVxXQFA7IKivAaSEmUSV8gZDGKxrqTAwHQAAAABJRU5ErkJggg==",2,0,0);
global.menu = ("Daily" == "D"+"aily") + ("Daily" == "Event")*2;
global.active = true;
global.leaderboard="";
global.leaderboardLoaded = 0;
global.leaderboardPos = 0;
global.leaderboardOpening = 0;
global.descriptionOpening = 0;
global.weekly = "";
global.weeklyFlavor = "";
global.weeklyHeight = 0;
global.weeklyWidth = 0;
global.daily = "";
global.dailyFlavor = "";
global.dailyHeight = 0;
global.dailyWidth = 0;
global.details = "";
global.detailsFlavor = "";
global.detailsHeight = 0;
global.detailsWidth = 0;
global.weeklyCurrentX = 60;
global.weeklyCurrentY = -1000;
global.weeklyCurrentMax = 36;
global.weeklyCurrentBH = 16;
global.weeklyScoreboardX = 159;
global.weeklyScoreboardY = 36;
global.weeklyScoreboardW = 160;
global.weeklyScoreboardH = 0;
global.weeklyScoreboardMin = 0;
global.weeklyScoreboardMax = 152;
global.canStart = false;
global.qualified = false;
global.alias = "";
global.seed = 13333;
global.start = true;
global.finished = false;
global.ModNames = "";
while(!mod_sideload()){wait 1;}
global.qualified = true;
global.alias = "";
global.Race = "Choose";
if(global.qualified == true){
	with(Player){
		instance_destroy();
		global.qualified = false;
		trace("Disqualified for uploading results. reload the Daily mod from the character select screen to qualify again.");
	}
	with(Revive){
		instance_destroy();
		global.qualified = false;
		trace("Disqualified for uploading results. reload the Daily mod from the character select screen to qualify again.");
	}
}
var i = 0;
for(i = 0; array_length(mod_get_names("mod")) > 1; i=i){
	if(mod_get_names("mod")[i] != mod_current){mod_unload(mod_get_names("mod")[i]);}
}
for(i = 0; array_length(mod_get_names("weapon")) > 0; i=i){
	mod_unload(mod_get_names("weapon")[i]);
}
for(i = 0; array_length(mod_get_names("area")) > 0; i=i){
	mod_unload(mod_get_names("area")[i]);
}
for(i = 0; array_length(mod_get_names("crown")) > 0; i=i){
	mod_unload(mod_get_names("crown")[i]);
}
for(i = 0; array_length(mod_get_names("race")) > 0; i=i){
	mod_unload(mod_get_names("race")[i]);
}
for(i = 0; array_length(mod_get_names("skill")) > 0; i=i){
	mod_unload(mod_get_names("skill")[i]);
}
for(i = 0; array_length(mod_get_names("skin")) > 0; i=i){
	mod_unload(mod_get_names("skin")[i]);
}
downloadmod("Baldi/baldi.race.gml");
downloadmod("Baldi/ruler.wep.gml");
downloadmod("Baldi/ultraruler.wep.gml");
downloadmod("Baldi/aha.ogg");
downloadmod("Baldi/baldi.png");
downloadmod("Baldi/dead.png");
downloadmod("Baldi/goodjob.ogg");
downloadmod("Baldi/GoSit.png");
downloadmod("Baldi/hurt.png");
downloadmod("Baldi/mapicon.png");
downloadmod("Baldi/nothing.ogg");
downloadmod("Baldi/nothing.png");
downloadmod("Baldi/Portrait.png");
downloadmod("Baldi/reee.ogg");
downloadmod("Baldi/ruler.png");
downloadmod("Baldi/select.ogg");
downloadmod("Baldi/select.png");
downloadmod("Baldi/sit.png");
downloadmod("Baldi/smack.ogg");
downloadmod("Baldi/sprMapIcon.png");
downloadmod("Baldi/ultraa.png");
downloadmod("Baldi/ultrab.png");
downloadmod("Baldi/ultraruler.png");
downloadmod("Baldi/ultras.png");
downloadmod("Baldi/wow.ogg");
downloadmod("bow.wep.gml");
downloadmod("freakarena_daily.mod.gml");
downloadmod("clasweps/widesword.wep.gml");
downloadmod("clasweps/ultrasuperdiscgun.wep.gml");
downloadmod("clasweps/ultrasplinter.wep.gml");
downloadmod("clasweps/ultraseeker.wep.gml");
downloadmod("clasweps/ultrarifle.wep.gml");
downloadmod("clasweps/ultrapopgun.wep.gml");
downloadmod("clasweps/ultraplasmagun.wep.gml");
downloadmod("clasweps/ultralightning.wep.gml");
downloadmod("clasweps/ultradiscgun.wep.gml");
downloadmod("clasweps/torch.wep.gml");
downloadmod("clasweps/swiftsword.wep.gml");
downloadmod("clasweps/splintergatling.wep.gml");
downloadmod("clasweps/snl.wep.gml");
downloadmod("clasweps/slc.wep.gml");
downloadmod("clasweps/shrineroom.area.gml");
downloadmod("clasweps/shine.wep.gml");
downloadmod("clasweps/scorpionarm.wep.gml");
downloadmod("clasweps/scorcher.wep.gml");
downloadmod("clasweps/ringofplasma.wep.gml");
downloadmod("clasweps/ringoffire.wep.gml");
downloadmod("clasweps/racingthoughts.skill.gml");
downloadmod("clasweps/quickdraw.wep.gml");
downloadmod("clasweps/plasmashotty.wep.gml");
downloadmod("clasweps/orbitalstriker.wep.gml");
downloadmod("clasweps/orbitalbarrage.wep.gml");
downloadmod("clasweps/multislicer.wep.gml");
downloadmod("clasweps/multiflakcannon.wep.gml");
downloadmod("clasweps/longsword.wep.gml");
downloadmod("clasweps/lightningscrew.wep.gml");
downloadmod("clasweps/lightningflak.wep.gml");
downloadmod("clasweps/kirbyhammer.wep.gml");
downloadmod("clasweps/iceslugger.wep.gml");
downloadmod("clasweps/iceshotgun.wep.gml");
downloadmod("clasweps/hypershotgun.wep.gml");
downloadmod("clasweps/hyperrevolver.wep.gml");
downloadmod("clasweps/hyperflare.wep.gml");
downloadmod("clasweps/hyperflak.wep.gml");
downloadmod("clasweps/heavywave.wep.gml");
downloadmod("clasweps/heavystriker.wep.gml");
downloadmod("clasweps/heavyshovel.wep.gml");
downloadmod("clasweps/heavyshot.wep.gml");
downloadmod("clasweps/goldscorpionarm.wep.gml");
downloadmod("clasweps/goldenblazer.wep.gml");
downloadmod("clasweps/funnyxd.wep.gml");
downloadmod("clasweps/executioner.wep.gml");
downloadmod("clasweps/evilsbane.wep.gml");
downloadmod("clasweps/energywrench.wep.gml");
downloadmod("clasweps/energyshovel.wep.gml");
downloadmod("clasweps/energyjackhammer.wep.gml");
downloadmod("clasweps/enemyloot.mod.gml");
downloadmod("clasweps/doubleiceshotgun.wep.gml");
downloadmod("clasweps/doghead.wep.gml");
downloadmod("clasweps/crowns/slots.crown.gml");
downloadmod("clasweps/crowns/Slaughter.crown.gml");
downloadmod("clasweps/crowns/Pain.crown.gml");
downloadmod("clasweps/crowns/Choice.crown.gml");
downloadmod("clasweps/claswepsshit.mod.gml");
downloadmod("clasweps/chimerashell.wep.gml");
downloadmod("clasweps/chimeraexplosive.wep.gml");
downloadmod("clasweps/chimeraenergy.wep.gml");
downloadmod("clasweps/chimerabullet.wep.gml");
downloadmod("clasweps/chimerabolt.wep.gml");
downloadmod("clasweps/catalyst.wep.gml");
downloadmod("clasweps/casey.wep.gml");
downloadmod("clasweps/cannon.wep.gml");
downloadmod("clasweps/brokenflak.wep.gml");
downloadmod("clasweps/bossintros.mod.gml");
downloadmod("clasweps/bloodyrifle.wep.gml");
downloadmod("clasweps/bloodyrevolver.wep.gml");
downloadmod("clasweps/blazer.wep.gml");
downloadmod("clasweps/battleshovel.wep.gml");
downloadmod("clasweps/autoiceshotgun.wep.gml");
downloadmod("clasweps/autoburstshotty.wep.gml");
downloadmod("clasweps/ZapMachineGun.wep.gml");
downloadmod("clasweps/Zap shotgun.wep.gml");
downloadmod("clasweps/Zap gun.wep.gml");
downloadmod("clasweps/Zap Cannon.wep.gml");
downloadmod("clasweps/Ultraflamethrower.wep.gml");
downloadmod("clasweps/UltraSlug.wep.gml");
downloadmod("clasweps/UltraFlak.wep.gml");
downloadmod("clasweps/UltraBazook.wep.gml");
downloadmod("clasweps/TurboLauncher.wep.gml");
downloadmod("clasweps/TrailerPistol.wep.gml");
downloadmod("clasweps/TrailerGun.wep.gml");
downloadmod("clasweps/TrailerCannon.wep.gml");
downloadmod("clasweps/Toxinballer.wep.gml");
downloadmod("clasweps/ToxicShotty.wep.gml");
downloadmod("clasweps/ToxicFlak.wep.gml");
downloadmod("clasweps/ToxicDiscGun.wep.gml");
downloadmod("clasweps/ToxicBlazer.wep.gml");
downloadmod("clasweps/ToxicBazooka.wep.gml");
downloadmod("clasweps/ThroneGun.wep.gml");
downloadmod("clasweps/ThroneCannon.wep.gml");
downloadmod("clasweps/ThroneBeam.wep.gml");
downloadmod("clasweps/SuperIceFlakCannon.wep.gml");
downloadmod("clasweps/SuperFocusedFlak.wep.gml");
downloadmod("clasweps/SuperBurstShotty.wep.gml");
downloadmod("clasweps/Sniper.wep.gml");
downloadmod("clasweps/SlotMachine.wep.gml");
downloadmod("clasweps/Ricochetcrossbow.wep.gml");
downloadmod("clasweps/RapidPistol.wep.gml");
downloadmod("clasweps/RageBlaster.wep.gml");
downloadmod("clasweps/Poposcorcher.wep.gml");
downloadmod("clasweps/PopoZapper.wep.gml");
downloadmod("clasweps/PopoSpreader.wep.gml");
downloadmod("clasweps/PopoSMG.wep.gml");
downloadmod("clasweps/PopoRevolver.wep.gml");
downloadmod("clasweps/PopoGuider.wep.gml");
downloadmod("clasweps/PopoGenocide.wep.gml");
downloadmod("clasweps/PopoFireballer.wep.gml");
downloadmod("clasweps/PopoExplosionGun.wep.gml");
downloadmod("clasweps/PopoCharger.wep.gml");
downloadmod("clasweps/PopoBurstShotty.wep.gml");
downloadmod("clasweps/PopoBADS.wep.gml");
downloadmod("clasweps/PlasmaNuker.wep.gml");
downloadmod("clasweps/PlasmaFlak.wep.gml");
downloadmod("clasweps/PlasmaBazooka.wep.gml");
downloadmod("clasweps/OmegaRevolver.wep.gml");
downloadmod("clasweps/NecroMachine.wep.gml");
downloadmod("clasweps/MiniNukeLauncher.wep.gml");
downloadmod("clasweps/MineShotgun.wep.gml");
downloadmod("clasweps/MineLauncher.wep.gml");
downloadmod("clasweps/MegaNuker.wep.gml");
downloadmod("clasweps/LilGunther.wep.gml");
downloadmod("clasweps/LightningWrench.wep.gml");
downloadmod("clasweps/Laserwave.wep.gml");
downloadmod("clasweps/KingBlade.wep.gml");
downloadmod("clasweps/InvCrystalLaser.wep.gml");
downloadmod("clasweps/IceFlakCannon.wep.gml");
downloadmod("clasweps/IceCannon.wep.gml");
downloadmod("clasweps/HuntingRifle.wep.gml");
downloadmod("clasweps/Hellfire.wep.gml");
downloadmod("clasweps/HeavySMG.wep.gml");
downloadmod("clasweps/HeavyLaser.wep.gml");
downloadmod("clasweps/HeavyGlove.wep.gml");
downloadmod("clasweps/HeavyFlare.wep.gml");
downloadmod("clasweps/HeavyFlak.wep.gml");
downloadmod("clasweps/GuiderShotty.wep.gml");
downloadmod("clasweps/GuiderPistol.wep.gml");
downloadmod("clasweps/GuiderMinigun.wep.gml");
downloadmod("clasweps/GuiderBlaster.wep.gml");
downloadmod("clasweps/GoldenFireballer.wep.gml");
downloadmod("clasweps/GigaHammer.wep.gml");
downloadmod("clasweps/Genocide.wep.gml");
downloadmod("clasweps/GatlingNader.wep.gml");
downloadmod("clasweps/GatlingMiniNader.wep.gml");
downloadmod("clasweps/FocusedFlak.wep.gml");
downloadmod("clasweps/FocusShotty.wep.gml");
downloadmod("clasweps/Flamesword.wep.gml");
downloadmod("clasweps/Fireballer.wep.gml");
downloadmod("clasweps/ExplosionPistol.wep.gml");
downloadmod("clasweps/ExplosionGun.wep.gml");
downloadmod("clasweps/DemolitionsLauncher.wep.gml");
downloadmod("clasweps/DartlingGun.wep.gml");
downloadmod("clasweps/DartGun.wep.gml");
downloadmod("clasweps/CrystalLaser.wep.gml");
downloadmod("clasweps/ChargeSlugger.wep.gml");
downloadmod("clasweps/ChargePlasma.wep.gml");
downloadmod("clasweps/ChargeLaser.wep.gml");
downloadmod("clasweps/ChargeGun.wep.gml");
downloadmod("clasweps/ChargeFlamethrower.wep.gml");
downloadmod("clasweps/ChargeFlak.wep.gml");
downloadmod("clasweps/ChargeDisc.wep.gml");
downloadmod("clasweps/ChargeCrossbow.wep.gml");
downloadmod("clasweps/ChargeBlade.wep.gml");
downloadmod("clasweps/ChargeBazooka.wep.gml");
downloadmod("clasweps/BusterGun.wep.gml");
downloadmod("clasweps/BurstShotty.wep.gml");
downloadmod("clasweps/BoxingGlove.wep.gml");
downloadmod("clasweps/BouncerFlak.wep.gml");
downloadmod("clasweps/BluntHammer.wep.gml");
downloadmod("clasweps/Bloodballer.wep.gml");
downloadmod("clasweps/BloodMineLauncher.wep.gml");
downloadmod("clasweps/BloodGenocide.wep.gml");
downloadmod("clasweps/BloodExplosionGun.wep.gml");
downloadmod("clasweps/BlinkSword.Wep.gml");
downloadmod("clasweps/BigBlaster.wep.gml");
downloadmod("clasweps/BanditBlaster.wep.gml");
downloadmod("clasweps/BallMomBlaster.wep.gml");
downloadmod("clasweps/BADS.wep.gml");
downloadmod("clasweps/Acelauncher.wep.gml");
downloadmod("clasweps/AccuserHand.wep.gml");
downloadmod("clasweps/multislicer.wep.gml");
downloadmod("clasweps/casey.wep.gml");
downloadmod("clasweps/longsword.wep.gml");
downloadmod("clasweps/widesword.wep.gml");
downloadmod("clasweps/multiflakcannon.wep.gml");
downloadmod("clasweps/Blazer.wep.gml");
downloadmod("clasweps/scorcher.wep.gml");
downloadmod("clasweps/poposcorcher.wep.gml");
downloadmod("clasweps/goldenblazer.wep.gml");
downloadmod("clasweps/torch.wep.gml");
downloadmod("clasweps/flamesword.wep.gml");
downloadmod("clasweps/lightningflak.wep.gml");
downloadmod("clasweps/brokenflak.wep.gml");
downloadmod("clasweps/focusedflak.wep.gml");
downloadmod("clasweps/superfocusedflak.wep.gml");
downloadmod("clasweps/zap gun.wep.gml");
downloadmod("clasweps/zapmachinegun.wep.gml");
downloadmod("clasweps/zap shotgun.wep.gml");
downloadmod("clasweps/zap cannon.wep.gml");
downloadmod("clasweps/popozapper.wep.gml");
downloadmod("clasweps/ExplosionPistol.wep.gml");
downloadmod("clasweps/ExplosionGun.wep.gml");
downloadmod("clasweps/BloodExplosionGun.wep.gml");
downloadmod("clasweps/popoexplosiongun.wep.gml");
downloadmod("clasweps/MineLauncher.wep.gml");
downloadmod("clasweps/MineShotgun.wep.gml");
downloadmod("clasweps/BloodMineLauncher.wep.gml");
downloadmod("clasweps/DemolitionsLauncher.wep.gml");
downloadmod("clasweps/bouncerflak.wep.gml");
downloadmod("clasweps/poporevolver.wep.gml");
downloadmod("clasweps/popoSMG.wep.gml");
downloadmod("clasweps/quickdraw.wep.gml");
downloadmod("clasweps/hyperrevolver.wep.gml");
downloadmod("clasweps/hypershotgun.wep.gml");
downloadmod("clasweps/hyperflare.wep.gml");
downloadmod("clasweps/hyperflak.wep.gml");
downloadmod("clasweps/fireballer.wep.gml");
downloadmod("clasweps/toxinballer.wep.gml");
downloadmod("clasweps/bloodballer.wep.gml");
downloadmod("clasweps/popofireballer.wep.gml");
downloadmod("clasweps/goldenfireballer.wep.gml");
downloadmod("clasweps/cannon.wep.gml");
downloadmod("clasweps/BusterGun.wep.gml");
downloadmod("clasweps/Catalyst.wep.gml");
downloadmod("clasweps/EvilsBane.wep.gml");
downloadmod("clasweps/kingblade.wep.gml");
downloadmod("clasweps/popospreader.wep.gml");
downloadmod("clasweps/slc.wep.gml");
downloadmod("clasweps/battleshovel.wep.gml");
downloadmod("clasweps/burstshotty.wep.gml");
downloadmod("clasweps/autoburstshotty.wep.gml");
downloadmod("clasweps/superburstshotty.wep.gml");
downloadmod("clasweps/popoburstshotty.wep.gml");
downloadmod("clasweps/guiderpistol.wep.gml");
downloadmod("clasweps/guiderblaster.wep.gml");
downloadmod("clasweps/guidershotty.wep.gml");
downloadmod("clasweps/guiderminigun.wep.gml");
downloadmod("clasweps/accuserhand.wep.gml");
downloadmod("clasweps/popoguider.wep.gml");
downloadmod("clasweps/chargegun.wep.gml");
downloadmod("clasweps/chargeslugger.wep.gml");
downloadmod("clasweps/chargeflak.wep.gml");
downloadmod("clasweps/chargecrossbow.wep.gml");
downloadmod("clasweps/chargedisc.wep.gml");
downloadmod("clasweps/chargebazooka.wep.gml");
downloadmod("clasweps/chargeflamethrower.wep.gml");
downloadmod("clasweps/chargelaser.wep.gml");
downloadmod("clasweps/chargeplasma.wep.gml");
downloadmod("clasweps/chargeblade.wep.gml");
downloadmod("clasweps/popocharger.wep.gml");
downloadmod("clasweps/focusshotty.wep.gml");
downloadmod("clasweps/bloodyrevolver.wep.gml");
downloadmod("clasweps/bloodyrifle.wep.gml");
downloadmod("clasweps/iceshotgun.wep.gml");
downloadmod("clasweps/doubleiceshotgun.wep.gml");
downloadmod("clasweps/autoiceshotgun.wep.gml");
downloadmod("clasweps/iceslugger.wep.gml");
downloadmod("clasweps/iceflakcannon.wep.gml");
downloadmod("clasweps/supericeflakcannon.wep.gml");
downloadmod("clasweps/icecannon.wep.gml");
downloadmod("clasweps/trailerpistol.wep.gml");
downloadmod("clasweps/trailergun.wep.gml");
downloadmod("clasweps/trailercannon.wep.gml");
downloadmod("clasweps/HeavySMG.wep.gml");
downloadmod("clasweps/heavyFlare.wep.gml");
downloadmod("clasweps/heavyshot.wep.gml");
downloadmod("clasweps/heavyshovel.wep.gml");
downloadmod("clasweps/energywrench.wep.gml");
downloadmod("clasweps/energyshovel.wep.gml");
downloadmod("clasweps/energyjackhammer.wep.gml");
downloadmod("clasweps/lightningwrench.wep.gml");
downloadmod("clasweps/lightningscrew.wep.gml");
downloadmod("clasweps/Ricochetcrossbow.wep.gml");
downloadmod("clasweps/laserwave.wep.gml");
downloadmod("clasweps/heavywave.wep.gml");
downloadmod("clasweps/plasmashotty.wep.gml");
downloadmod("clasweps/plasmaflak.wep.gml");
downloadmod("clasweps/plasmabazooka.wep.gml");
downloadmod("clasweps/plasmanuker.wep.gml");
downloadmod("clasweps/splintergatling.wep.gml");
downloadmod("clasweps/gatlingnader.wep.gml");
downloadmod("clasweps/gatlingmininader.wep.gml");
downloadmod("clasweps/turboLauncher.wep.gml");
downloadmod("clasweps/DartGun.wep.gml");
downloadmod("clasweps/DartlingGun.wep.gml");
downloadmod("clasweps/heavyflak.wep.gml");
downloadmod("clasweps/orbitalbarrage.wep.gml");
downloadmod("clasweps/scorpionarm.wep.gml");
downloadmod("clasweps/goldscorpionarm.wep.gml");
downloadmod("clasweps/huntingrifle.wep.gml");
downloadmod("clasweps/BlinkSword.wep.gml");
downloadmod("clasweps/BluntHammer.wep.gml");
downloadmod("clasweps/GigaHammer.wep.gml");
downloadmod("clasweps/Ringoffire.wep.gml");
downloadmod("clasweps/Ringofplasma.wep.gml");
downloadmod("clasweps/chimerabullet.wep.gml");
downloadmod("clasweps/chimerashell.wep.gml");
downloadmod("clasweps/chimerabolt.wep.gml");
downloadmod("clasweps/chimeraexplosive.wep.gml");
downloadmod("clasweps/chimeraenergy.wep.gml");
downloadmod("clasweps/rageblaster.wep.gml");
downloadmod("clasweps/slc.wep.gml");
downloadmod("clasweps/meganuker.wep.gml");
downloadmod("clasweps/mininukelauncher.wep.gml");
downloadmod("clasweps/snl.wep.gml");
downloadmod("clasweps/boxingglove.wep.gml");
downloadmod("clasweps/heavyglove.wep.gml");
downloadmod("clasweps/toxicshotty.wep.gml");
downloadmod("clasweps/toxicbazooka.wep.gml");
downloadmod("clasweps/toxicflak.wep.gml");
downloadmod("clasweps/toxicdiscgun.wep.gml");
downloadmod("clasweps/toxicblazer.wep.gml");
downloadmod("clasweps/orbitalstriker.wep.gml");
downloadmod("clasweps/heavystriker.wep.gml");
downloadmod("clasweps/orbitalbarrage.wep.gml");
downloadmod("clasweps/shine.wep.gml");
downloadmod("clasweps/AceLauncher.wep.gml");
downloadmod("clasweps/BADS.wep.gml");
downloadmod("clasweps/popobads.wep.gml");
downloadmod("clasweps/Hellfire.wep.gml");
downloadmod("clasweps/Genocide.wep.gml");
downloadmod("clasweps/BloodGenocide.wep.gml");
downloadmod("clasweps/popogenocide.wep.gml");
downloadmod("clasweps/banditblaster.wep.gml");
downloadmod("clasweps/sniper.wep.gml");
downloadmod("clasweps/rapidpistol.wep.gml");
downloadmod("clasweps/bigblaster.wep.gml");
downloadmod("clasweps/doghead.wep.gml");
downloadmod("clasweps/lilgunther.wep.gml");
downloadmod("clasweps/ballmomblaster.wep.gml");
downloadmod("clasweps/crystallaser.wep.gml");
downloadmod("clasweps/invcrystallaser.wep.gml");
downloadmod("clasweps/NecroMachine.wep.gml");
downloadmod("clasweps/omegarevolver.wep.gml");
downloadmod("clasweps/thronegun.wep.gml");
downloadmod("clasweps/thronecannon.wep.gml");
downloadmod("clasweps/thronebeam.wep.gml");
downloadmod("clasweps/ultrarifle.wep.gml");
downloadmod("clasweps/ultraslug.wep.gml");
downloadmod("clasweps/ultrasplinter.wep.gml");
downloadmod("clasweps/ultrabazook.wep.gml");
downloadmod("clasweps/ultraplasmagun.wep.gml");
downloadmod("clasweps/ultradiscgun.wep.gml");
downloadmod("clasweps/ultrapopgun.wep.gml");
downloadmod("clasweps/ultraflak.wep.gml");
downloadmod("clasweps/ultraseeker.wep.gml");
downloadmod("clasweps/ultraflamethrower.wep.gml");
downloadmod("clasweps/ultralightning.wep.gml");
downloadmod("clasweps/ultrasuperdiscgun.wep.gml");
downloadmod("clasweps/kirbyhammer.wep.gml");
downloadmod("clasweps/slotmachine.wep.gml");
downloadmod("clasweps/shrineroom.area.gml");
downloadmod("clasweps/racingthoughts.skill.gml");
downloadmod("clasweps/enemyloot.mod.gml");
downloadmod("clasweps/claswepsshit.mod.gml");
downloadmod("clasweps/crowns/choice.crown.gml");
downloadmod("clasweps/crowns/slaughter.crown.gml");
downloadmod("clasweps/crowns/pain.crown.gml");
downloadmod("clasweps/crowns/slots.crown.gml");
downloadmod("clasweps/widesword.png");
downloadmod("clasweps/ultraseekerpro.png");
downloadmod("clasweps/ultraplasmaproj.png");
downloadmod("clasweps/ultraplasmaimpact.png");
downloadmod("clasweps/ultramegaseeker.png");
downloadmod("clasweps/ultraflame.png");
downloadmod("clasweps/thoughtslightning.png");
downloadmod("clasweps/swiftsword.png");
downloadmod("clasweps/sprBaseball.png");
downloadmod("clasweps/shine.ogg");
downloadmod("clasweps/ringofplasma.png");
downloadmod("clasweps/ringoffire.png");
downloadmod("clasweps/racingthoughtsbutton.png");
downloadmod("clasweps/orbitalstriker.png");
downloadmod("clasweps/orbitalbarrage.png");
downloadmod("clasweps/multiflakcannon.png");
downloadmod("clasweps/longsword.png");
downloadmod("clasweps/lightningshank.png");
downloadmod("clasweps/lightningflak.png");
downloadmod("clasweps/heavy shovel.png");
downloadmod("clasweps/evilsbane.png");
downloadmod("clasweps/crowns/Crown of Slots.png");
downloadmod("clasweps/crowns/Crown of Slaughter.png");
downloadmod("clasweps/crowns/Crown of Pain.png");
downloadmod("clasweps/crowns/ChoiceBuddyWalk.png");
downloadmod("clasweps/crowns/ChoiceBuddyIdle.png");
downloadmod("clasweps/catalyst.png");
downloadmod("clasweps/bulletcannon.png");
downloadmod("clasweps/barragemarker.png");
downloadmod("clasweps/bads.png");
downloadmod("clasweps/ZapSlug.png");
downloadmod("clasweps/ZapMG.png");
downloadmod("clasweps/ZapBullet.png");
downloadmod("clasweps/Zap Shotgun.png");
downloadmod("clasweps/Zap Gun.png");
downloadmod("clasweps/Zap Cannon.png");
downloadmod("clasweps/Ultrasuperdiscgun.png");
downloadmod("clasweps/UltraslugDissapear.png");
downloadmod("clasweps/Ultradiscgun.png");
downloadmod("clasweps/Ultrabazooka.png");
downloadmod("clasweps/UltraSuperDisc.png");
downloadmod("clasweps/UltraSplinterPro.png");
downloadmod("clasweps/UltraSplinter.png");
downloadmod("clasweps/UltraSmoke.png");
downloadmod("clasweps/UltraSlugger.png");
downloadmod("clasweps/UltraSlugHit.png");
downloadmod("clasweps/UltraSlug.png");
downloadmod("clasweps/UltraSeeker.png");
downloadmod("clasweps/UltraRocketFlame.png");
downloadmod("clasweps/UltraRocket.png");
downloadmod("clasweps/UltraRifle.png");
downloadmod("clasweps/UltraPop.png");
downloadmod("clasweps/UltraPlasmaTrail.png");
downloadmod("clasweps/UltraPlasma.png");
downloadmod("clasweps/UltraMainRocket.png");
downloadmod("clasweps/UltraLightning.png");
downloadmod("clasweps/UltraFlamethrower.png");
downloadmod("clasweps/UltraFlakBullet.png");
downloadmod("clasweps/UltraFlak.png");
downloadmod("clasweps/UltraDisc.png");
downloadmod("clasweps/TurboRocket.png");
downloadmod("clasweps/TurboLauncher.png");
downloadmod("clasweps/TrueUltraSuperDiscGun.png");
downloadmod("clasweps/TrailerPistol.png");
downloadmod("clasweps/TrailerGun.png");
downloadmod("clasweps/TrailerCannon.png");
downloadmod("clasweps/ToxinBaller.png");
downloadmod("clasweps/Toxicball.png");
downloadmod("clasweps/ToxicShotty.png");
downloadmod("clasweps/ToxicRocket.png");
downloadmod("clasweps/ToxicFlak.png");
downloadmod("clasweps/ToxicDiscGun.png");
downloadmod("clasweps/ToxicDisc.png");
downloadmod("clasweps/ToxicBlazer.png");
downloadmod("clasweps/ToxicBazooka.png");
downloadmod("clasweps/Torch.png");
downloadmod("clasweps/ThroneGun.png");
downloadmod("clasweps/ThroneCannon.png");
downloadmod("clasweps/ThroneBeam.png");
downloadmod("clasweps/SuperNukeLauncher.png");
downloadmod("clasweps/SuperIceFlakCannon.png");
downloadmod("clasweps/SuperIceFlakBullet.png");
downloadmod("clasweps/SuperFocusedFlakCannon.png");
downloadmod("clasweps/SuperBurstShotty.png");
downloadmod("clasweps/Super Laser Cannon.png");
downloadmod("clasweps/Strikemarker.png");
downloadmod("clasweps/SniperBullet.png");
downloadmod("clasweps/Sniper.png");
downloadmod("clasweps/SlotMachine.png");
downloadmod("clasweps/ShineMask.png");
downloadmod("clasweps/Shine.png");
downloadmod("clasweps/ScorpionArm.png");
downloadmod("clasweps/Scorcher.png");
downloadmod("clasweps/Ricochetcrossbow.png");
downloadmod("clasweps/Ricochetbolt.png");
downloadmod("clasweps/Reflector.png");
downloadmod("clasweps/RapidPistol.png");
downloadmod("clasweps/RageBlaster.png");
downloadmod("clasweps/RacingThoughtsIcon.png");
downloadmod("clasweps/Quickdraw.png");
downloadmod("clasweps/PopoZapper.png");
downloadmod("clasweps/PopoSpreader.png");
downloadmod("clasweps/PopoScorcher.png");
downloadmod("clasweps/PopoSMG.png");
downloadmod("clasweps/PopoRevolver.png");
downloadmod("clasweps/PopoGuider.png");
downloadmod("clasweps/PopoGenocide.png");
downloadmod("clasweps/PopoFireballer.png");
downloadmod("clasweps/PopoFireball.png");
downloadmod("clasweps/PopoExplosiongun.png");
downloadmod("clasweps/PopoCharger.png");
downloadmod("clasweps/PopoBurstShotty.png");
downloadmod("clasweps/PopoBads.png");
downloadmod("clasweps/PlasmaShotty.png");
downloadmod("clasweps/PlasmaRocket.png");
downloadmod("clasweps/PlasmaNukeLauncher.png");
downloadmod("clasweps/PlasmaNuke.png");
downloadmod("clasweps/PlasmaFlak.png");
downloadmod("clasweps/PlasmaBazooka.png");
downloadmod("clasweps/OmegaRevolver.png");
downloadmod("clasweps/NecroMachine.png");
downloadmod("clasweps/NecroAllyRez.png");
downloadmod("clasweps/NecroAllyArea.png");
downloadmod("clasweps/Multislicer.gif");
downloadmod("clasweps/MiniNukeLauncher.png");
downloadmod("clasweps/MiniNuke.png");
downloadmod("clasweps/MiniMineBlink.png");
downloadmod("clasweps/MiniMine.png");
downloadmod("clasweps/MiniGrenadeGatling.png");
downloadmod("clasweps/MineShotgun.png");
downloadmod("clasweps/MineLaunchr.png");
downloadmod("clasweps/Mine.png");
downloadmod("clasweps/MegaNukeLauncher.png");
downloadmod("clasweps/MegaNuke.png");
downloadmod("clasweps/LilGunther.png");
downloadmod("clasweps/LightningWrench.png");
downloadmod("clasweps/LightningScrewdriver.png");
downloadmod("clasweps/LightningFlakCannon.png");
downloadmod("clasweps/LaserWave.png");
downloadmod("clasweps/LULDisc.png");
downloadmod("clasweps/KirbyHammer.png");
downloadmod("clasweps/KingBladeSword.png");
downloadmod("clasweps/KingBladeGhost.png");
downloadmod("clasweps/Jab.png");
downloadmod("clasweps/InvCrystalGun.png");
downloadmod("clasweps/IceSlugger.png");
downloadmod("clasweps/IceSlugHit.png");
downloadmod("clasweps/IceSlugDissapear.png");
downloadmod("clasweps/IceSlug.png");
downloadmod("clasweps/IceShot.png");
downloadmod("clasweps/IceShellHit.png");
downloadmod("clasweps/IceShellDissapear.png");
downloadmod("clasweps/IceShell.png");
downloadmod("clasweps/IceShard.png");
downloadmod("clasweps/IceFlakCannon.png");
downloadmod("clasweps/IceFlakBullet.png");
downloadmod("clasweps/IceCannon.png");
downloadmod("clasweps/Hyper_Revolver.png");
downloadmod("clasweps/HyperShotty.png");
downloadmod("clasweps/HyperFlaregun.png");
downloadmod("clasweps/HyperFlakCannon.png");
downloadmod("clasweps/HuntingRifle.png");
downloadmod("clasweps/Hellfire.png");
downloadmod("clasweps/Heavystrikemarker.png");
downloadmod("clasweps/HeavyWaveGun.png");
downloadmod("clasweps/HeavyStriker.png");
downloadmod("clasweps/HeavySMG.png");
downloadmod("clasweps/HeavyLaser.png");
downloadmod("clasweps/HeavyJab.png");
downloadmod("clasweps/HeavyGlove.png");
downloadmod("clasweps/HeavyFlaregun.png");
downloadmod("clasweps/HeavyFlare.png");
downloadmod("clasweps/HeavyFlak.png");
downloadmod("clasweps/Heavy shotty.png");
downloadmod("clasweps/GuidedShotty.png");
downloadmod("clasweps/GuidedPistol.png");
downloadmod("clasweps/GuidedMinigun.png");
downloadmod("clasweps/GuidedBlaster.png");
downloadmod("clasweps/Greensmallexplosion.png");
downloadmod("clasweps/GoldenFireballer.png");
downloadmod("clasweps/GoldenBlazer.png");
downloadmod("clasweps/GoldScorpionArm.png");
downloadmod("clasweps/GigaHammer.png");
downloadmod("clasweps/Genocide.png");
downloadmod("clasweps/GatlingSplinter.png");
downloadmod("clasweps/GatlingLauncher.png");
downloadmod("clasweps/FocusedFlakCannon.png");
downloadmod("clasweps/FocusShotgun.png");
downloadmod("clasweps/FlameSword.png");
downloadmod("clasweps/Fireballer.png");
downloadmod("clasweps/Explosiongun.png");
downloadmod("clasweps/ExplosionPistol.png");
downloadmod("clasweps/ExecutionerHand.png");
downloadmod("clasweps/Executioner.png");
downloadmod("clasweps/Evilsbanebeam.png");
downloadmod("clasweps/Energy Wrench.png");
downloadmod("clasweps/Energy Shovel.png");
downloadmod("clasweps/Energy Jackhammer.png");
downloadmod("clasweps/DoubleIceShot.png");
downloadmod("clasweps/DogHead.png");
downloadmod("clasweps/DemolitionsLauncher.png");
downloadmod("clasweps/Demolitionbomb.png");
downloadmod("clasweps/DartlingGun.png");
downloadmod("clasweps/DartGun.png");
downloadmod("clasweps/Dart.png");
downloadmod("clasweps/CrystalGun.png");
downloadmod("clasweps/ChimeraShell.png");
downloadmod("clasweps/ChimeraExplosive.png");
downloadmod("clasweps/ChimeraEnergy.png");
downloadmod("clasweps/ChimeraBullet.png");
downloadmod("clasweps/ChimeraBolt.png");
downloadmod("clasweps/ChargeSlugger.png");
downloadmod("clasweps/ChargePlasmagun.png");
downloadmod("clasweps/ChargeLaser.png");
downloadmod("clasweps/ChargeGun.png");
downloadmod("clasweps/ChargeFlamethrower.png");
downloadmod("clasweps/ChargeFlakCannon.png");
downloadmod("clasweps/ChargeDiscGun.png");
downloadmod("clasweps/ChargeCrossbow.png");
downloadmod("clasweps/ChargeBlade.png");
downloadmod("clasweps/ChargeBazooka.png");
downloadmod("clasweps/Casey.png");
downloadmod("clasweps/Cannon.png");
downloadmod("clasweps/BusterGun.png");
downloadmod("clasweps/BurstShotty.png");
downloadmod("clasweps/BrokenFlakCannon.png");
downloadmod("clasweps/BoxingGlove.png");
downloadmod("clasweps/Bouncer Flak.png");
downloadmod("clasweps/BluntHammer.png");
downloadmod("clasweps/BloodyTrail.png");
downloadmod("clasweps/BloodyRifle.png");
downloadmod("clasweps/BloodyRevolver.png");
downloadmod("clasweps/BloodyBullet.png");
downloadmod("clasweps/BloodsuckerProj.png");
downloadmod("clasweps/Bloodballer.png");
downloadmod("clasweps/Bloodball.png");
downloadmod("clasweps/BloodMineLauncher.png");
downloadmod("clasweps/BloodMine.png");
downloadmod("clasweps/BloodGenocide.png");
downloadmod("clasweps/BloodFlame.png");
downloadmod("clasweps/BloodExplosionGun.png");
downloadmod("clasweps/BlinkSword.png");
downloadmod("clasweps/Blazer.png");
downloadmod("clasweps/BigBlaster.png");
downloadmod("clasweps/Battleshovel.png");
downloadmod("clasweps/BanditBlaster.png");
downloadmod("clasweps/BallMomBlaster.png");
downloadmod("clasweps/BADSRocket.png");
downloadmod("clasweps/AutoIceShot.png");
downloadmod("clasweps/AutoBurstShotty.png");
downloadmod("clasweps/AceLauncher.png");
downloadmod("clasweps/Ace.png");
downloadmod("clasweps/AccuserHand.png");
downloadmod("brimthrone.wep.gml");
wait mod_load(string_trim("data/Daily.mod/Baldi/baldi.race.gml"));
wait mod_load(string_trim("data/Daily.mod/Baldi/ruler.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/Baldi/ultraruler.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/bow.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/freakarena_daily.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/multislicer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/casey.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/longsword.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/widesword.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/multiflakcannon.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Blazer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/scorcher.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/poposcorcher.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/goldenblazer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/torch.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/flamesword.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/lightningflak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/brokenflak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/focusedflak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/superfocusedflak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/zap gun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/zapmachinegun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/zap shotgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/zap cannon.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/popozapper.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ExplosionPistol.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ExplosionGun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BloodExplosionGun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/popoexplosiongun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/MineLauncher.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/MineShotgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BloodMineLauncher.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/DemolitionsLauncher.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/bouncerflak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/poporevolver.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/popoSMG.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/quickdraw.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/hyperrevolver.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/hypershotgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/hyperflare.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/hyperflak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/fireballer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/toxinballer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/bloodballer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/popofireballer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/goldenfireballer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/cannon.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BusterGun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Catalyst.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/EvilsBane.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/kingblade.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/popospreader.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/slc.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/battleshovel.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/burstshotty.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/autoburstshotty.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/superburstshotty.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/popoburstshotty.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/guiderpistol.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/guiderblaster.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/guidershotty.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/guiderminigun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/accuserhand.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/popoguider.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chargegun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chargeslugger.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chargeflak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chargecrossbow.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chargedisc.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chargebazooka.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chargeflamethrower.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chargelaser.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chargeplasma.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chargeblade.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/popocharger.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/focusshotty.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/bloodyrevolver.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/bloodyrifle.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/iceshotgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/doubleiceshotgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/autoiceshotgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/iceslugger.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/iceflakcannon.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/supericeflakcannon.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/icecannon.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/trailerpistol.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/trailergun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/trailercannon.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/HeavySMG.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/heavyFlare.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/heavyshot.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/heavyshovel.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/energywrench.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/energyshovel.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/energyjackhammer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/lightningwrench.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/lightningscrew.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Ricochetcrossbow.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/laserwave.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/heavywave.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/plasmashotty.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/plasmaflak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/plasmabazooka.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/plasmanuker.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/splintergatling.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/gatlingnader.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/gatlingmininader.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/turboLauncher.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/DartGun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/DartlingGun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/heavyflak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/orbitalbarrage.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/scorpionarm.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/goldscorpionarm.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/huntingrifle.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BlinkSword.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BluntHammer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/GigaHammer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Ringoffire.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Ringofplasma.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chimerabullet.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chimerashell.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chimerabolt.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chimeraexplosive.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chimeraenergy.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/rageblaster.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/slc.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/meganuker.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/mininukelauncher.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/snl.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/boxingglove.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/heavyglove.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/toxicshotty.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/toxicbazooka.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/toxicflak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/toxicdiscgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/toxicblazer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/orbitalstriker.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/heavystriker.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/orbitalbarrage.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/shine.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/AceLauncher.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BADS.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/popobads.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Hellfire.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Genocide.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BloodGenocide.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/popogenocide.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/banditblaster.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/sniper.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/rapidpistol.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/bigblaster.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/doghead.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/lilgunther.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ballmomblaster.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/crystallaser.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/invcrystallaser.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/NecroMachine.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/omegarevolver.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/thronegun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/thronecannon.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/thronebeam.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultrarifle.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultraslug.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultrasplinter.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultrabazook.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultraplasmagun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultradiscgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultrapopgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultraflak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultraseeker.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultraflamethrower.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultralightning.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultrasuperdiscgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/kirbyhammer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/slotmachine.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/shrineroom.area.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/racingthoughts.skill.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/enemyloot.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/claswepsshit.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/crowns/choice.crown.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/crowns/slaughter.crown.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/crowns/pain.crown.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/crowns/slots.crown.gml"));
wait mod_load(string_trim("data/Daily.mod/brimthrone.wep.gml"));


global.ModNames = "";
		     
var i = 0;
for(i = 0; array_length(mod_get_names("mod")) > i; i++){
	global.ModNames += mod_get_names("mod")[i]
}
for(i = 0; array_length(mod_get_names("weapon")) > i; i++){
	global.ModNames += mod_get_names("weapon")[i]
}
for(i = 0; array_length(mod_get_names("area")) > i; i++){
	global.ModNames += mod_get_names("area")[i]
}
for(i = 0; array_length(mod_get_names("crown")) > i; i++){
	global.ModNames += mod_get_names("crown")[i]
}
for(i = 0; array_length(mod_get_names("race")) > i; i++){
	global.ModNames += mod_get_names("race")[i]
}
for(i = 0; array_length(mod_get_names("skill")) > i; i++){
	global.ModNames += mod_get_names("skill")[i]
}
for(i = 0; array_length(mod_get_names("skin")) > i; i++){
	global.ModNames += mod_get_names("skin")[i]
}

trace("Current Daily:");
trace("Mods=Baldi,bow,Freak Arena,Clasweps,Brimthrone");
trace("Character:Choose");
trace("Crown:slots");
trace("Weapon:chargedisc");
trace("Seed:13333");

global.canStart = true;
global.headers = ds_map_create();
ds_map_set(global.headers, "Authorization", "token 7349069d71cc5b8e1165"+"40e940c2ad5650ea32de");
ds_map_set(global.headers, "Cache-Control", "no-cache");	
ds_map_set(global.headers, "Accept", "application/vnd.github.full+json");	file_delete("dl.txt");
while (file_exists("dl.txt")) {wait 1;}
http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Daily.txt'
, "GET", global.headers,
''
, "dl.txt");
while (!file_loaded("dl.txt")) {wait 1;}
var dl = "";
if(array_length(string_split(string_load("dl.txt"), chr(34)+"message"+chr(34)+":"+chr(34)+"Not Found"+chr(34))) == 1){dl = string_split(string_split(string_load("dl.txt"), chr(34)+","+chr(34)+"encoding"+chr(34)+":"+chr(34)+"base64"+chr(34))[0],chr(34)+"content"+chr(34)+":"+chr(34))[1];}
file_unload("dl.txt");
dl = string_replace_all(dl, "\" + "n", "");
var leaderboard = string_split(base64Decode(dl), "|");
global.leaderboard = [];
for(var i = 1; i < array_length(leaderboard); i++){
	array_push(global.leaderboard, [string_split(leaderboard[i], ":")[0], string_split(string_split(leaderboard[i], "Area ")[1], "Kills")[0], real(string_split(string_split(leaderboard[i], "Character: ")[0], "Kills: ")[1]), array_length(string_split(leaderboard[i], "Character: ")) > 1 ? string_split(leaderboard[i], "Character: ")[1] : ""]);
}
array_sort_sub(global.leaderboard, 2, 0);
global.leaderboardLoaded = 1;
file_unload("dl.txt");


file_delete("Daily.txt");
while (file_exists("Daily.txt")) {wait 1;}
file_download("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/Daily.mod.gml", "Daily.txt");
while (!file_loaded("Daily.txt")) {wait 1;}
global.Daily = string_replace_all(string_replace_all(string_split(string_split(string_load("Daily.txt"), "*/")[0], "/*")[1],chr(10),""),chr(13),"");
global.Flavor = string_replace_all(string_replace_all(string_split(string_split(string_load("Daily.txt"), "*/")[1], "/*")[1],chr(10),""),chr(13),"");
global.DailyHeight = string_count("#", global.Daily);
global.DailyWidth = 0;
var temp = string_split(global.Daily, "#");
for(var i = 0; i < array_length(temp); i++){
	if(string_length(temp[i]) > global.DailyWidth){global.DailyWidth = string_length(temp[i]);}
}
file_unload("Daily.txt");

global.details = global.Daily;
global.detailsHeight = global.DailyHeight;
global.detailsWidth = global.DailyWidth;
global.detailsFlavor = global.Flavor;
global.weeklyCurrentY = -(weeklyCurrentH+weeklyCurrentLH*global.detailsHeight-global.weeklyCurrentMax);

#define step
if(!global.active){return;}
if(instance_exists(Menu)){
	if(gp_button_check(weeklyButtonX-5, 32, weeklyButtonW+3, weeklyButtonH+10)){
		trace("LOADING MODDED RECURRENTS. PLEASE WAIT.");
		file_delete("ModdedRecurrents.mod.gml");
		while (file_exists("ModdedRecurrents.mod.gml")) {wait 1;}
		file_download("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/ModdedRecurrents.mod.gml", "ModdedRecurrents.mod.gml");
		file_load("ModdedRecurrents.mod.gml");
		while (!file_exists("ModdedRecurrents.mod.gml")) {wait 1;}
		string_save("/loadtext load2", "load.txt");
		string_save("/allowmod ModdedRecurrents", "load2.txt");
		file_load("load.txt");
		while (!file_loaded("load.txt")) {wait 1;}
		mod_load("data/"+mod_current+".mod/ModdedRecurrents.mod.gml");
		mod_loadtext("data/"+mod_current+".mod/load.txt");
		mod_unload(mod_current);
	}
	if(button_pressed(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], global.weeklyScoreboardX, global.weeklyScoreboardY, global.weeklyScoreboardX + global.weeklyScoreboardW, global.weeklyScoreboardY + global.weeklyScoreboardH/2) && global.menu >= 0){
		global.leaderboardPos-=floor(((global.weeklyScoreboardH)/15)/2);
		global.leaderboardPos = max(global.leaderboardPos, 0);
	}
	if(button_pressed(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], global.weeklyScoreboardX, global.weeklyScoreboardY + global.weeklyScoreboardH/2, global.weeklyScoreboardX + global.weeklyScoreboardW, global.weeklyScoreboardY + global.weeklyScoreboardH) && global.menu >= 0){
		global.leaderboardPos+=floor(((global.weeklyScoreboardH)/15)/2);
		global.leaderboardPos = min(global.leaderboardPos, max(array_length(global.leaderboard)-floor((global.weeklyScoreboardH)/15), 0));
	}
	if(button_pressed(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], global.weeklyScoreboardX + global.weeklyScoreboardW/4, 35 + global.weeklyScoreboardH, global.weeklyScoreboardX+global.weeklyScoreboardW * 3/4, 48 + global.weeklyScoreboardH) && global.menu >= 0){
		global.leaderboardOpening = !global.leaderboardOpening;
	}
	if(global.leaderboardOpening){
		global.weeklyScoreboardH += (global.weeklyScoreboardMax - global.weeklyScoreboardH)/2;
		if(abs(global.weeklyScoreboardMax - global.weeklyScoreboardH) <= 8){global.weeklyScoreboardH = global.weeklyScoreboardMax;}
	}else{
		global.weeklyScoreboardH += (global.weeklyScoreboardMin - global.weeklyScoreboardH)/2;
		if(abs(global.weeklyScoreboardMin - global.weeklyScoreboardH) <= 8){global.weeklyScoreboardH = global.weeklyScoreboardMin;}
	}
	if(button_pressed(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], global.weeklyCurrentX, global.weeklyCurrentY, global.weeklyCurrentX+(weeklyCurrentW+weeklyCurrentLW*global.detailsWidth), global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight) + global.weeklyCurrentBH) && global.menu >= 0){
		global.descriptionOpening = !global.descriptionOpening;
	}
	if(global.descriptionOpening){
		global.weeklyCurrentY += (global.weeklyCurrentMax - global.weeklyCurrentY)/2;
		if(abs(global.weeklyCurrentMax - global.weeklyCurrentY) <= 8){global.weeklyCurrentY = global.weeklyCurrentMax;}
	}else{
		global.weeklyCurrentY += (-(weeklyCurrentH+weeklyCurrentLH*global.detailsHeight-global.weeklyCurrentMax) - global.weeklyCurrentY)/2;
		if(abs(-(weeklyCurrentH+weeklyCurrentLH*global.detailsHeight-global.weeklyCurrentMax) - global.weeklyCurrentY) <= 8){global.weeklyCurrentY = -(weeklyCurrentH+weeklyCurrentLH*global.detailsHeight-global.weeklyCurrentMax);}
	}
}

if(global.qualified == true && global.canStart && global.ModNames != ""){
	var ModNames = "";
		     
	var i = 0;
	for(i = 0; array_length(mod_get_names("mod")) > i; i++){
		ModNames += mod_get_names("mod")[i]
	}
	for(i = 0; array_length(mod_get_names("weapon")) > i; i++){
		ModNames += mod_get_names("weapon")[i]
	}
	for(i = 0; array_length(mod_get_names("area")) > i; i++){
		ModNames += mod_get_names("area")[i]
	}
	for(i = 0; array_length(mod_get_names("crown")) > i; i++){
		ModNames += mod_get_names("crown")[i]
	}
	for(i = 0; array_length(mod_get_names("race")) > i; i++){
		ModNames += mod_get_names("race")[i]
	}
	for(i = 0; array_length(mod_get_names("skill")) > i; i++){
		ModNames += mod_get_names("skill")[i]
	}
	for(i = 0; array_length(mod_get_names("skin")) > i; i++){
		ModNames += mod_get_names("skin")[i]
	}
	if(ModNames != global.ModNames){
		trace("Disqualified for uploading results. reload the weekly mod from the character select screen to qualify again. Reason: Incorrect mod list");
		global.qualified = false;
	}
}

if(global.qualified == true){
	var i = 0;
	repeat(4){
		if(button_check(i, "talk")){
			trace("Disqualified for uploading results. reload the Daily mod from the character select screen to qualify again.");
		}
		i++
	}
}
var i = 0;
repeat(4){
	if(button_check(i, "talk")){
		global.qualified = false;
	}
	i++
}
if(global.start){
	global.alias = "";
	with(Player){
		give_wep(string_trim("chargedisc"));
		ammo[0] = 0;
		ammo[1] = 0;
		ammo[2] = 0;
		ammo[3] = 0;
		ammo[4] = 0;
		ammo[5] = 0;
		if(fork()){while(instance_exists(GenCont)){wait 1;}repeat(3){instance_create(x,y,AmmoPickup)}exit;}
		if(global.alias != ""){
			global.alias += ", "
		}
		global.alias += alias;
	}
	global.start = false;
}
if(!global.canStart){
	with(CharSelect){
		temp_image_index = image_index;
		instance_change(CustomObject, 0);
		name=mod_current;
		if(!ChooseCharacter){
			race="Choose";
		}
	}
}
else{
	with(instances_matching(CustomObject, "name", mod_current)){
		instance_change(CharSelect, 0);
	}
	with(CharSelect){
		if(instance_exists(self)){
			if(variable_instance_exists(self, "temp_image_index")){image_index = temp_image_index;}
			xstart=5+(game_width-10)*(index/instance_number(CharSelect));
			visible=true;
		}
		if(instance_exists(self) && !ChooseCharacter){
			if(string_lower(string_trim(race))!=string_lower(string_trim("Choose")) && fork()){
				wait(0);
				if(string_lower(string_trim(race))!=string_lower(string_trim("Choose"))){
					instance_destroy();
				}
				exit;
			}
			xstart=(game_width-10)/2;
		}
		with(CharSelect){
			if(instance_exists(self) && instance_exists(other) && id != other.id && race==other.race){
				instance_destroy();
			}
		}
	}
}
if(!global.finished && !instance_exists(Player) && !instance_exists(Menu)){
	var score = "";
	with(GameCont){
		score = global.alias + ": Area " + string(area) + "-" + string(subarea) + " L" + string(loops) + " Kills: " + string(kills) + " Character: " + (ChooseCharacter ? global.Race : "") + " Mods:Baldi,bow,Freak Arena,Clasweps,Brimthrone" + " Character:Choose" + " Crown:slots" + " Weapon:chargedisc" + " Seed:13333";
	}
	trace(score);
	global.finished = true;
	if(file_exists(global.alias + " 2019-09-21 Daily.txt")){
		prevScores = string_load(global.alias + " 2019-09-21 Daily.txt");
		while(!file_loaded(global.alias + " 2019-09-21 Daily.txt")){wait 1;}
		string_save(prevScores, global.alias + " 2019-09-21 Daily.txt");
	}else{
		string_save(score, global.alias + " 2019-09-21 Daily.txt");
	}
	if(global.qualified){
		headers = ds_map_create();
		ds_map_set(headers, "Authorization", "token 7349069d71cc5b8e1165"+"40e940c2ad5650ea32de");
		ds_map_set(headers, "Cache-Control", "no-cache");
		ds_map_set(headers, "Accept", "application/vnd.github.full+json");	
		file_delete("dl.txt");
		while (file_exists("dl.txt")) {wait 1;}
		http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Daily.txt'
		, "GET", headers,
		''
		, "dl.txt");
		while (!file_loaded("dl.txt")) {wait 1;}
		var dl = "404";
			if(array_length(string_split(string_load("dl.txt"), '"message":"Not Found"')) == 1 || array_length(string_split(string_load("dl.txt"), '"Bad Credentials"')) == 1){dl = string_split(string_split(string_load("dl.txt"), '","encoding":"base64"')[0],'"content":"')[1];
			dl = string_replace_all(dl, "\" + "n", "");
			var leaderboard = base64Decode(dl);
		}else{
			leaderboard = dl;
		}
		file_unload("dl.txt");
		if(string_copy(leaderboard, 0, 3) == "404"){
			http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Daily.txt'
			, "PUT", headers,
			'{
			"message":"Leaderboard Update",
			"content":"'+base64("Mods:Baldi,bow,Freak Arena,Clasweps,Brimthrone" + " Character:Choose" + " Crown:slots" + " Weapon:chargedisc" + " Seed:13333" + "|" + string_split(score, "Mods:")[0])+'"
			}'
			, "out.txt");
		}else if(array_length(string_split(string_replace_all(string_replace_all(leaderboard,chr(10),""),chr(13),""), string_replace_all(string_replace_all(":Baldi,bow,Freak Arena,Clasweps,Brimthrone" + " Character:Choose" + " Crown:slots" + " Weapon:chargedisc" + " Seed:13333",chr(10),""),chr(13),""))) > 1){
			var fail = 0;
			for(var i = 0; i < array_length(string_split(global.alias, ",")); i++){
				if(array_length(string_split(leaderboard, string_split(global.alias, ",")[i])) > 1){fail=1;}
			}
			if(!LimitedTries || !fail){
				file_delete("sha.txt");
				while (file_exists("sha.txt")) {wait 1;}
				http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Daily.txt'
				, "GET", headers,
				''
				, "sha.txt");
				while (!file_loaded("sha.txt")) {wait 1;}
				wait file_load("sha.txt");
				sha = string_split(string_split(string_load("sha.txt"), '"sha":"')[1], '"')[0];
				file_unload("sha.txt");
				http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Daily.txt'
				, "PUT", headers,
				'{
				"message":"Leaderboard Update",
				"content":"'+base64(leaderboard+"|"+string_split(score, "Mods:")[0])+'",
				"sha":"'+sha+'"
				}'
				, "out.txt");
			}else{
				trace("You've already played this Daily!");
			}
		}else{
			trace("You are playing on an older modded Daily, so your scores were not uploaded. If this is incorrect, contact Golden Epsilon on discord through the Nuclear Throne discord: https://www.discord.gg/nt");
		}
		wait(60);
		global.leaderboardLoaded = 0;
		file_delete("dl.txt");
		while (file_exists("dl.txt")) {wait 1;}
		http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Daily.txt'
		, "GET", global.headers,
		''
		, "dl.txt");
		while (!file_loaded("dl.txt")) {wait 1;}
		var dl = "";
		if(array_length(string_split(string_load("dl.txt"), chr(34)+"message"+chr(34)+":"+chr(34)+"Not Found"+chr(34))) == 1){dl = string_split(string_split(string_load("dl.txt"), chr(34)+","+chr(34)+"encoding"+chr(34)+":"+chr(34)+"base64"+chr(34))[0],chr(34)+"content"+chr(34)+":"+chr(34))[1];}
		file_unload("dl.txt");
		dl = string_replace_all(dl, "\" + "n", "");
		var leaderboard = string_split(base64Decode(dl), "|");
		global.leaderboard = [];
		for(var i = 1; i < array_length(leaderboard); i++){
			array_push(global.leaderboard, [string_split(leaderboard[i], ":")[0], string_split(string_split(leaderboard[i], "Area ")[1], "Kills")[0], real(string_split(string_split(leaderboard[i], "Character: ")[0], "Kills: ")[1]), array_length(string_split(leaderboard[i], "Character: ")) > 1 ? string_split(leaderboard[i], "Character: ")[1] : ""]);
		}
		array_sort_sub(global.leaderboard, 2, 0);
		global.leaderboardLoaded = 1;
		file_unload("dl.txt");
	}else{
		trace("You were disqualified, so your scores were not uploaded.");
	}
}
#define draw_pause
if(!global.active){return;}
//Anti-Cheat
if(global.qualified == true){
	var i = 0;
	repeat(4){
		if(button_check(i, "talk")){
			global.qualified = false;
			trace("Disqualified for uploading results. reload the Daily mod from the character select screen to qualify again.");
		}
		i++
	}
}
#define draw_gui
if(!global.active){return;}
draw_set_font(fntSmall);
if(global.qualified == true){
	draw_text_nt(game_width - 25, game_height - 6, "Daily");
}else{
	draw_text_nt(game_width - 7*4 - 25, game_height - 12, "DISQUALIFIED#       Daily");
}
if(instance_exists(Menu)){
	var valign = draw_get_valign();
	var halign = draw_get_halign();
	draw_set_color(make_color_rgb(0,0,0));
	draw_roundrect(weeklyButtonX-5, 32, weeklyButtonX + weeklyButtonW+3, weeklyButtonY + weeklyButtonH+10, 0);
	draw_sprite_stretched(global.menu==0?global.sprWeekly:(global.menu==1?1600:(global.menu==2?global.sprEvent:1599)), point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], weeklyButtonX-5, 32, weeklyButtonX + weeklyButtonW+3, weeklyButtonY + weeklyButtonH+10), weeklyButtonX, weeklyButtonY, weeklyButtonW, weeklyButtonH);
	draw_set_halign(1);
	draw_set_font(fntSmall);
	draw_set_color(point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], weeklyButtonX-5, 32, weeklyButtonX + weeklyButtonW+3, weeklyButtonY + weeklyButtonH+10)?make_color_rgb(255,255,255):make_color_rgb(100,100,100));
	draw_text(weeklyButtonX + weeklyButtonW/2, weeklyButtonY + weeklyButtonH + 1, global.menu==0?"Weekly":(global.menu==1?"Daily":(global.menu==2?"Event":"")));
	if(global.details != ""){
		draw_set_color(make_color_rgb(0,0,0));
		draw_roundrect(global.weeklyCurrentX, 0, global.weeklyCurrentX + (weeklyCurrentW+weeklyCurrentLW*global.detailsWidth), global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight)+global.weeklyCurrentBH, 0);
		draw_set_color(make_color_rgb(100,100,100));
		draw_rectangle(global.weeklyCurrentX+1, 0, global.weeklyCurrentX + (weeklyCurrentW+weeklyCurrentLW*global.detailsWidth), global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight)-1, 0);
		draw_set_color(point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], global.weeklyCurrentX, global.weeklyCurrentY, global.weeklyCurrentX+(weeklyCurrentW+weeklyCurrentLW*global.detailsWidth), global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight) + global.weeklyCurrentBH)?make_color_rgb(255,255,255):make_color_rgb(100,100,100));
		draw_text(global.weeklyCurrentX + (weeklyCurrentW+weeklyCurrentLW*global.detailsWidth)/2, global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight) + global.weeklyCurrentBH/2-2, string_copy("Description", 1, floor((weeklyCurrentW+weeklyCurrentLW*global.detailsWidth)/4)));
		draw_set_halign(0);
		draw_set_font(fntSmall);
		draw_text_nt(global.weeklyCurrentX + (weeklyCurrentW+weeklyCurrentLW*global.detailsWidth)/20 + 1, global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight)/20 + 1, global.details);
		draw_set_color(make_color_rgb(0,0,0));
		draw_rectangle(global.weeklyCurrentX, 0, global.weeklyCurrentX + (weeklyCurrentW+weeklyCurrentLW*global.detailsWidth), 35, 0);
	}
	draw_set_color(make_color_rgb(100,100,100));
	draw_roundrect(global.weeklyScoreboardX + global.weeklyScoreboardW/4, 30 + global.weeklyScoreboardH, global.weeklyScoreboardX+global.weeklyScoreboardW*3/4, 48 + global.weeklyScoreboardH, 0);
	draw_roundrect(global.weeklyScoreboardX, 32 + global.weeklyScoreboardH, global.weeklyScoreboardX+global.weeklyScoreboardW, 35 + global.weeklyScoreboardH, 0);
	draw_set_color(make_color_rgb(150,150,150));
	draw_roundrect(global.weeklyScoreboardX + global.weeklyScoreboardW/2-10, 30 + global.weeklyScoreboardH, global.weeklyScoreboardX+global.weeklyScoreboardW/2+10, 46 + global.weeklyScoreboardH, 0);
	draw_set_color(make_color_rgb(0,0,0));
	draw_rectangle(global.weeklyScoreboardX, 30, global.weeklyScoreboardX+global.weeklyScoreboardW, 33 + global.weeklyScoreboardH, 0);
	draw_rectangle(global.weeklyScoreboardX, 30, global.weeklyScoreboardX+global.weeklyScoreboardW, 35, 0);
	draw_triangle(global.weeklyScoreboardX + global.weeklyScoreboardW/2-8, 37 + floor(global.weeklyScoreboardH), global.weeklyScoreboardX + global.weeklyScoreboardW/2+8, 37 + floor(global.weeklyScoreboardH), global.weeklyScoreboardX + global.weeklyScoreboardW/2, 45 + floor(global.weeklyScoreboardH), 0);
	if(global.leaderboardLoaded && array_length(global.leaderboard) > 0){
		draw_set_valign(0);
		draw_set_halign(0);
		draw_set_font(fntM0);
		draw_set_color(make_color_rgb(255,255,255));
		for(var i = 0; (i+global.leaderboardPos) < array_length(global.leaderboard) && i < floor((global.weeklyScoreboardH)/15); i++){
			draw_set_font(fntM0);
			draw_text_nt(global.weeklyScoreboardX + 1, global.weeklyScoreboardY + i*15 + 1, ((i+global.leaderboardPos) == 0 ? "@(color:"+string(make_color_rgb(255, 175, 0))+")" : (i+global.leaderboardPos)==1 ? "@(color:"+string(make_color_rgb(200, 200, 200))+")" : (i+global.leaderboardPos)==2 ? "@(color:"+string(make_color_rgb(150, 100, 0))+")" : "") + "\#" + string_copy(string(i+global.leaderboardPos+1), 1, floor((global.weeklyScoreboardW)/8) + (0 - string_length(string(i+global.leaderboardPos+1)))));
			draw_text_nt(global.weeklyScoreboardX + 35 - (10 * (2 - string_length(string(i+global.leaderboardPos+1)))), global.weeklyScoreboardY + i*15 + 1, ((i+global.leaderboardPos) == 0 ? "@(color:"+string(make_color_rgb(255, 175, 0))+")" : (i+global.leaderboardPos)==1 ? "@(color:"+string(make_color_rgb(200, 200, 200))+")" : (i+global.leaderboardPos)==2 ? "@(color:"+string(make_color_rgb(150, 100, 0))+")" : "") + string_copy(string(global.leaderboard[i+global.leaderboardPos][0]), 1, floor((global.weeklyScoreboardW)/8) + (-2 - string_length(string(i+global.leaderboardPos+1)))));
			draw_set_font(fntSmall);
			draw_text_nt(global.weeklyScoreboardX  + 37 - (10 * (2 - string_length(string(i+global.leaderboardPos+1)))), global.weeklyScoreboardY + i*15 + 9, string_copy("L: " + global.leaderboard[i+global.leaderboardPos][1] + " K: " + string(global.leaderboard[i+global.leaderboardPos][2]) + ((string_trim(global.leaderboard[i+global.leaderboardPos][3]) != "") ? (" C: " + global.leaderboard[i+global.leaderboardPos][3]) : ""), 1, floor((global.weeklyScoreboardW)/4) + (-5 - 2*string_length(string(i+global.leaderboardPos+1)))));
		}
	}else if(global.leaderboardOpening){
		draw_set_valign(1);
		draw_set_halign(1);
		draw_set_font(fntM0);
		draw_set_color(make_color_rgb(255,255,255));
		draw_text_nt(global.weeklyScoreboardX + global.weeklyScoreboardW/2 + 1, global.weeklyScoreboardY + global.weeklyScoreboardH/2 + 1, "LOADING SCORES#(if there are any!)")
	}
	if(global.details != ""){
		temp = string_split(global.detailsFlavor, "|");
		for(var i = 0; i < array_length(temp); i++){
			temp2 = string_split(temp[i], "[")[0];
			if(array_length(string_split(global.details, temp2)) > 1){
				if(point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], global.weeklyCurrentX, global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight)/20 + 1 + array_length(string_split(string_split(global.details, temp2)[0], "#")) * 6 - 6, global.weeklyCurrentX + (weeklyCurrentW+weeklyCurrentLW*global.detailsWidth), global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight)/20 + 1 + array_length(string_split(string_split(global.details, temp2)[0], "#")) * 6) && array_length(string_split(temp[i], "[")) > 1){
					draw_set_font(fntSmall);
					draw_tooltip(global.weeklyCurrentX + (weeklyCurrentW+weeklyCurrentLW*global.detailsWidth)/2, global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight)/20 + 1 + array_length(string_split(string_split(global.details, temp2)[0], "#")) * 6 - 6, string_split(string_split(temp[i], "[")[1], "]")[0]);
				}
			}
		}
	}
	draw_set_valign(valign);
	draw_set_halign(halign);
}
#define game_start
if(!global.active){return;}
room_speed = 30;
current_time_scale = 1;
global.finished = false;
game_set_seed(global.seed);
random_set_seed(global.seed);
global.start = true;
with(Player){if(!ChooseCharacter){race=string_trim("Choose");}else{global.Race = race;}}
if(!ChooseCrown){give_crown();}

//Stolen from YAL's debug mod.
#define give_crown
cmd_crown_names = [
    "random", "none", "death", "life", "haste", "guns", "hatred",
    "blood", "destiny", "love", "luck", "curses", "risk", "protection"
];
name = string_trim("slots");
if(name == ""){return;}
var lqn = string_lower(name);
//
var pre = "crown of ";
var prl = string_length(pre);
if (string_length(lqn) >= prl && string_copy(lqn, 1, prl) == pre) {
    lqn = string_delete(lqn, 1, prl);
}
//
var r = null;
var i, n = array_length_1d(cmd_crown_names);
for (i = 0; i < n; i++) {
    if (cmd_crown_names[i] == lqn) { r = i; break; }
}
if (r == null) {
    var m = mod_get_names("crown");
    n = array_length_1d(m);
    for (i = 0; i < n; i++) {
        if (string_lower(scr_crown_name(m[i])) == lqn) { r = m[i]; break; }
    }
    if (r == null) for (i = 0; i < n; i++) {
        if (string_lower(m[i]) == lqn) { r = m[i]; break; }
    }
}
if (r != null) {
    var c = GameCont.crown;
    if (c != r) {
        if (is_string(c)) mod_script_call("crown", c, "crown_lose");
        if (c == crwn_death) {
            with (Player) maxhealth += 1;
            with (Revive) maxhealth += 1;
        }
        if (c == crwn_destiny) GameCont.skillpoints = max(GameCont.skillpoints - 1, 0);
        if (r == crwn_none) {
            with (Crown) instance_destroy();
            GameCont.crown = r;
            exit;
        }
        if (is_string(r)) mod_script_call("crown", r, "crown_take");
        //
        GameCont.crown = r;
        if (r == crwn_death) {
            with (Player) {
                maxhealth -= 1;
                my_health = min(my_health, maxhealth);
            }
            with (Revive) maxhealth -= 1;
        }
        if (r == crwn_destiny) if (GameCont.candestiny) {
            GameCont.candestiny = false;
            GameCont.skillpoints += 1;
        }
        if (c != crwn_none) {
            if (is_real(r)) with (Crown) {
                spr_idle = asset_get_index("sprCrown" + string(r) + "Idle");
                spr_walk = asset_get_index("sprCrown" + string(r) + "Walk");
            } else with (Crown) {
                spr_idle = sprCrown1Idle;
                spr_walk = sprCrown1Walk;
                mod_script_call("crown", r, "crown_object");
            }
        } else {
            if (!instance_exists(Crown)) instance_create(player_find(0).x, player_find(0).y, Crown);
        }
    }
}
#define scr_crown_name(crwn)
if (is_string(crwn)) {
    var s = mod_script_call("crown", crwn, "crown_name");
    return is_string(s) ? s : "";
} else {
    if (crwn >= 0 && crwn < array_length_1d(cmd_crown_names)) {
        return "CROWN OF " + string_upper(cmd_crown_names[crwn]);
    } else return "";
}
#define give_wep(name)
var lq_name = string_lower(name);
var r = null, i;
for (i = 1; i < 128; i++) {
    if (string_lower(weapon_get_name(i)) == lq_name) { r = i; break; }
}
if (r == null) {
    var m = mod_get_names("weapon");
    var n = array_length_1d(m);
    for (i = 0; i < n; i++) {
        var s = m[i];
        if (string_lower(weapon_get_name(s)) == lq_name) { r = s; break; }
    }
    if (r == null) for (i = 0; i < n; i++) {
        var s = m[i];
        if (string_lower(s) == lq_name) { r = s; break; }
    }
}
//
if (r != null) {
	wep = r;
	reload = 0;
	wkick = 0;
	can_shoot = 1;
	curse = 0;
	exit;
}
//end of stealing from YAL's debug mod
#define base64(str)
var retVal = "";
for(var i = 0; i < string_length(str)/3; i++){
	if(string_length(str)/3-i>=1){
		ord1 = string_ord_at(str, i*3+1);
		ord2 = string_ord_at(str, (i*3)+2);
		ord3 = string_ord_at(str, (i*3)+3);
		char1 = base64Char((ord1&252)/4);
		char2 = base64Char((ord1&3)*16+(ord2&240)/16);
		char3 = base64Char((ord2&15)*4+(ord3&192)/64);
		char4 = base64Char(ord3&63);
		retVal += string(char1)+string(char2)+string(char3)+string(char4);
	}else if(string_length(str) - i*3 == 2){
		ord1 = string_ord_at(str, i*3+1);
		ord2 = string_ord_at(str, (i*3)+2);
		char1 = base64Char((ord1&252)/4);
		char2 = base64Char((ord1&3)*16+(ord2&240)/16);
		char3 = base64Char((ord2&15)*4);
		retVal += string(char1)+string(char2)+string(char3)+"=";
	}else if(string_length(str) - i*3 == 1){
		ord1 = string_ord_at(str, i*3+1);
		char1 = base64Char((ord1&252)/4);
		char2 = base64Char((ord1&3)*16);
		retVal += string(char1)+string(char2)+"==";
	}
}
return retVal;
#define base64Char(num)
var retVal = "=";
switch(num){
	case 0:retVal = "A";break;
	case 1:retVal = "B";break;
	case 2:retVal = "C";break;
	case 3:retVal = "D";break;
	case 4:retVal = "E";break;
	case 5:retVal = "F";break;
	case 6:retVal = "G";break;
	case 7:retVal = "H";break;
	case 8:retVal = "I";break;
	case 9:retVal = "J";break;
	case 10:retVal = "K";break;
	case 11:retVal = "L";break;
	case 12:retVal = "M";break;
	case 13:retVal = "N";break;
	case 14:retVal = "O";break;
	case 15:retVal = "P";break;
	case 16:retVal = "Q";break;
	case 17:retVal = "R";break;
	case 18:retVal = "S";break;
	case 19:retVal = "T";break;
	case 20:retVal = "U";break;
	case 21:retVal = "V";break;
	case 22:retVal = "W";break;
	case 23:retVal = "X";break;
	case 24:retVal = "Y";break;
	case 25:retVal = "Z";break;
	case 26:retVal = "a";break;
	case 27:retVal = "b";break;
	case 28:retVal = "c";break;
	case 29:retVal = "d";break;
	case 30:retVal = "e";break;
	case 31:retVal = "f";break;
	case 32:retVal = "g";break;
	case 33:retVal = "h";break;
	case 34:retVal = "i";break;
	case 35:retVal = "j";break;
	case 36:retVal = "k";break;
	case 37:retVal = "l";break;
	case 38:retVal = "m";break;
	case 39:retVal = "n";break;
	case 40:retVal = "o";break;
	case 41:retVal = "p";break;
	case 42:retVal = "q";break;
	case 43:retVal = "r";break;
	case 44:retVal = "s";break;
	case 45:retVal = "t";break;
	case 46:retVal = "u";break;
	case 47:retVal = "v";break;
	case 48:retVal = "w";break;
	case 49:retVal = "x";break;
	case 50:retVal = "y";break;
	case 51:retVal = "z";break;
	case 52:retVal = "0";break;
	case 53:retVal = "1";break;
	case 54:retVal = "2";break;
	case 55:retVal = "3";break;
	case 56:retVal = "4";break;
	case 57:retVal = "5";break;
	case 58:retVal = "6";break;
	case 59:retVal = "7";break;
	case 60:retVal = "8";break;
	case 61:retVal = "9";break;
	case 62:retVal = "+";break;
	case 63:retVal = "/";break;
}
return retVal;
#define base64Decode(str)
var retVal = "";
for(var i = 0; i < string_length(str)/4; i++){
	if(string_length(str)/4-i>=1){
		ord1 = base64CharDecode(string_char_at(str, (i*4)+1));
		ord2 = base64CharDecode(string_char_at(str, (i*4)+2));
		ord3 = base64CharDecode(string_char_at(str, (i*4)+3));
		ord4 = base64CharDecode(string_char_at(str, (i*4)+4));
		char1 = chr(ord1 * 4 + (ord2 & 48) / 16);
		char2 = chr((ord2 & 15) * 16 + (ord3 & 60)/4);
		char3 = chr((ord3&3)*64+ord4);
		retVal += string(char1)+string(char2)+string(char3);
	}
}
return retVal;
#define base64CharDecode(str)
var retVal = 0;
switch(str){
	case "A":retVal = 0;break;
	case "B":retVal = 1;break;
	case "C":retVal = 2;break;
	case "D":retVal = 3;break;
	case "E":retVal = 4;break;
	case "F":retVal = 5;break;
	case "G":retVal = 6;break;
	case "H":retVal = 7;break;
	case "I":retVal = 8;break;
	case "J":retVal = 9;break;
	case "K":retVal = 10;break;
	case "L":retVal = 11;break;
	case "M":retVal = 12;break;
	case "N":retVal = 13;break;
	case "O":retVal = 14;break;
	case "P":retVal = 15;break;
	case "Q":retVal = 16;break;
	case "R":retVal = 17;break;
	case "S":retVal = 18;break;
	case "T":retVal = 19;break;
	case "U":retVal = 20;break;
	case "V":retVal = 21;break;
	case "W":retVal = 22;break;
	case "X":retVal = 23;break;
	case "Y":retVal = 24;break;
	case "Z":retVal = 25;break;
	case "a":retVal = 26;break;
	case "b":retVal = 27;break;
	case "c":retVal = 28;break;
	case "d":retVal = 29;break;
	case "e":retVal = 30;break;
	case "f":retVal = 31;break;
	case "g":retVal = 32;break;
	case "h":retVal = 33;break;
	case "i":retVal = 34;break;
	case "j":retVal = 35;break;
	case "k":retVal = 36;break;
	case "l":retVal = 37;break;
	case "m":retVal = 38;break;
	case "n":retVal = 39;break;
	case "o":retVal = 40;break;
	case "p":retVal = 41;break;
	case "q":retVal = 42;break;
	case "r":retVal = 43;break;
	case "s":retVal = 44;break;
	case "t":retVal = 45;break;
	case "u":retVal = 46;break;
	case "v":retVal = 47;break;
	case "w":retVal = 48;break;
	case "x":retVal = 49;break;
	case "y":retVal = 50;break;
	case "z":retVal = 51;break;
	case "0":retVal = 52;break;
	case "1":retVal = 53;break;
	case "2":retVal = 54;break;
	case "3":retVal = 55;break;
	case "4":retVal = 56;break;
	case "5":retVal = 57;break;
	case "6":retVal = 58;break;
	case "7":retVal = 59;break;
	case "8":retVal = 60;break;
	case "9":retVal = 61;break;
	case "+":retVal = 62;break;
	case "/":retVal = 63;break;
}
return retVal;

#define gp_button_check
//x,y,w,h,?hold,?index
var retVal = false;
if(argument_count == 4 || (argument_count == 5 && argument[4] == 0)){
	var mouseX = mouse_x[0]-view_xview[0];
	var mouseY = mouse_y[0]-view_yview[0];
	var x = argument[0];
	var y = argument[1];
	var w = argument[2];
	var h = argument[3];
	for(var i = 0; i < 4; i++){
		var mouseX = mouse_x[i]-view_xview[i];
		var mouseY = mouse_y[i]-view_yview[i];
		if(!retVal){retVal = (button_pressed(i, "fire") && point_in_rectangle(mouseX,mouseY,x,y,x+w,y+h));}
	}
}else if(argument_count == 5){
	var mouseX = mouse_x[0]-view_xview[0];
	var mouseY = mouse_y[0]-view_yview[0];
	var x = argument[0];
	var y = argument[1];
	var w = argument[2];
	var h = argument[3];
	for(var i = 0; i < 4; i++){
		var mouseX = mouse_x[i]-view_xview[i];
		var mouseY = mouse_y[i]-view_yview[i];
		if(!retVal){retVal = (button_check(i, "fire") && point_in_rectangle(mouseX,mouseY,x,y,x+w,y+h));}
	}
}
else if(argument_count == 6 && argument[4] == 0){
	var mouseX = mouse_x[argument[5]]-view_xview[argument[5]];
	var mouseY = mouse_y[argument[5]]-view_yview[argument[5]];
	var x = argument[0];
	var y = argument[1];
	var w = argument[2];
	var h = argument[3];
	if(!retVal){retVal = (button_pressed(argument[5], "fire") && point_in_rectangle(mouseX,mouseY,x,y,x+w,y+h));}
}
else if(argument_count == 6){
	var mouseX = mouse_x[argument[5]]-view_xview[argument[5]];
	var mouseY = mouse_y[argument[5]]-view_yview[argument[5]];
	var x = argument[0];
	var y = argument[1];
	var w = argument[2];
	var h = argument[3];
	if(!retVal){retVal = (button_check(argument[5], "fire") && point_in_rectangle(mouseX,mouseY,x,y,x+w,y+h));}
}
return retVal;

#define downloadmod(name)
var n = string_trim(name);
file_delete(data+n);while(file_exists(data+n)){wait 1;}wait(file_download(Github+n,n));trace(n+" downloaded.");file_load(data+n);
while (!file_exists(data+n)) {wait 1;file_load(data+n);}

