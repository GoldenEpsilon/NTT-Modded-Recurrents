
/*@pDesc@w=Do you have the luck o' the irish?#@rMods@w=#  Clasweps#@bCharacter@w=#  Choose#@yCrown@w=#  slots#@gWeapon@w=#  slot machine#@pSeed@w=11898#Limited Tries:false*/
/*|Clasweps[You got ultra weapons,#you got zappy weapons,#call now and you'll even get#some crowns thrown in for free!]*/
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
global.menu = ("Event" == "D"+"aily") + ("Event" == "Event")*2;
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
global.seed = 11898;
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
		trace("Disqualified for uploading results. reload the Event mod from the character select screen to qualify again.");
	}
	with(Revive){
		instance_destroy();
		global.qualified = false;
		trace("Disqualified for uploading results. reload the Event mod from the character select screen to qualify again.");
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
downloadmod("clasweps/widesword.wep.gml
");
downloadmod("clasweps/ultrasuperdiscgun.wep.gml
");
downloadmod("clasweps/ultrasplinter.wep.gml
");
downloadmod("clasweps/ultraseeker.wep.gml
");
downloadmod("clasweps/ultrarifle.wep.gml
");
downloadmod("clasweps/ultrapopgun.wep.gml
");
downloadmod("clasweps/ultraplasmagun.wep.gml
");
downloadmod("clasweps/ultralightning.wep.gml
");
downloadmod("clasweps/ultradiscgun.wep.gml
");
downloadmod("clasweps/torch.wep.gml
");
downloadmod("clasweps/swiftsword.wep.gml
");
downloadmod("clasweps/splintergatling.wep.gml
");
downloadmod("clasweps/snl.wep.gml
");
downloadmod("clasweps/slc.wep.gml
");
downloadmod("clasweps/shrineroom.area.gml
");
downloadmod("clasweps/shine.wep.gml
");
downloadmod("clasweps/scorpionarm.wep.gml
");
downloadmod("clasweps/scorcher.wep.gml
");
downloadmod("clasweps/ringofplasma.wep.gml
");
downloadmod("clasweps/ringoffire.wep.gml
");
downloadmod("clasweps/racingthoughts.skill.gml
");
downloadmod("clasweps/quickdraw.wep.gml
");
downloadmod("clasweps/plasmashotty.wep.gml
");
downloadmod("clasweps/orbitalstriker.wep.gml
");
downloadmod("clasweps/orbitalbarrage.wep.gml
");
downloadmod("clasweps/multislicer.wep.gml
");
downloadmod("clasweps/multiflakcannon.wep.gml
");
downloadmod("clasweps/longsword.wep.gml
");
downloadmod("clasweps/lightningscrew.wep.gml
");
downloadmod("clasweps/lightningflak.wep.gml
");
downloadmod("clasweps/kirbyhammer.wep.gml
");
downloadmod("clasweps/iceslugger.wep.gml
");
downloadmod("clasweps/iceshotgun.wep.gml
");
downloadmod("clasweps/hypershotgun.wep.gml
");
downloadmod("clasweps/hyperrevolver.wep.gml
");
downloadmod("clasweps/hyperflare.wep.gml
");
downloadmod("clasweps/hyperflak.wep.gml
");
downloadmod("clasweps/heavywave.wep.gml
");
downloadmod("clasweps/heavystriker.wep.gml
");
downloadmod("clasweps/heavyshovel.wep.gml
");
downloadmod("clasweps/heavyshot.wep.gml
");
downloadmod("clasweps/goldscorpionarm.wep.gml
");
downloadmod("clasweps/goldenblazer.wep.gml
");
downloadmod("clasweps/funnyxd.wep.gml
");
downloadmod("clasweps/executioner.wep.gml
");
downloadmod("clasweps/evilsbane.wep.gml
");
downloadmod("clasweps/energywrench.wep.gml
");
downloadmod("clasweps/energyshovel.wep.gml
");
downloadmod("clasweps/energyjackhammer.wep.gml
");
downloadmod("clasweps/enemyloot.mod.gml
");
downloadmod("clasweps/doubleiceshotgun.wep.gml
");
downloadmod("clasweps/doghead.wep.gml
");
downloadmod("clasweps/crowns/slots.crown.gml
");
downloadmod("clasweps/crowns/Slaughter.crown.gml
");
downloadmod("clasweps/crowns/Pain.crown.gml
");
downloadmod("clasweps/crowns/Choice.crown.gml
");
downloadmod("clasweps/claswepsshit.mod.gml
");
downloadmod("clasweps/chimerashell.wep.gml
");
downloadmod("clasweps/chimeraexplosive.wep.gml
");
downloadmod("clasweps/chimeraenergy.wep.gml
");
downloadmod("clasweps/chimerabullet.wep.gml
");
downloadmod("clasweps/chimerabolt.wep.gml
");
downloadmod("clasweps/catalyst.wep.gml
");
downloadmod("clasweps/casey.wep.gml
");
downloadmod("clasweps/cannon.wep.gml
");
downloadmod("clasweps/brokenflak.wep.gml
");
downloadmod("clasweps/bossintros.mod.gml
");
downloadmod("clasweps/bloodyrifle.wep.gml
");
downloadmod("clasweps/bloodyrevolver.wep.gml
");
downloadmod("clasweps/blazer.wep.gml
");
downloadmod("clasweps/battleshovel.wep.gml
");
downloadmod("clasweps/autoiceshotgun.wep.gml
");
downloadmod("clasweps/autoburstshotty.wep.gml
");
downloadmod("clasweps/ZapMachineGun.wep.gml
");
downloadmod("clasweps/Zap shotgun.wep.gml
");
downloadmod("clasweps/Zap gun.wep.gml
");
downloadmod("clasweps/Zap Cannon.wep.gml
");
downloadmod("clasweps/Ultraflamethrower.wep.gml
");
downloadmod("clasweps/UltraSlug.wep.gml
");
downloadmod("clasweps/UltraFlak.wep.gml
");
downloadmod("clasweps/UltraBazook.wep.gml
");
downloadmod("clasweps/TurboLauncher.wep.gml
");
downloadmod("clasweps/TrailerPistol.wep.gml
");
downloadmod("clasweps/TrailerGun.wep.gml
");
downloadmod("clasweps/TrailerCannon.wep.gml
");
downloadmod("clasweps/Toxinballer.wep.gml
");
downloadmod("clasweps/ToxicShotty.wep.gml
");
downloadmod("clasweps/ToxicFlak.wep.gml
");
downloadmod("clasweps/ToxicDiscGun.wep.gml
");
downloadmod("clasweps/ToxicBlazer.wep.gml
");
downloadmod("clasweps/ToxicBazooka.wep.gml
");
downloadmod("clasweps/ThroneGun.wep.gml
");
downloadmod("clasweps/ThroneCannon.wep.gml
");
downloadmod("clasweps/ThroneBeam.wep.gml
");
downloadmod("clasweps/SuperIceFlakCannon.wep.gml
");
downloadmod("clasweps/SuperFocusedFlak.wep.gml
");
downloadmod("clasweps/SuperBurstShotty.wep.gml
");
downloadmod("clasweps/Sniper.wep.gml
");
downloadmod("clasweps/SlotMachine.wep.gml
");
downloadmod("clasweps/Ricochetcrossbow.wep.gml
");
downloadmod("clasweps/RapidPistol.wep.gml
");
downloadmod("clasweps/RageBlaster.wep.gml
");
downloadmod("clasweps/Poposcorcher.wep.gml
");
downloadmod("clasweps/PopoZapper.wep.gml
");
downloadmod("clasweps/PopoSpreader.wep.gml
");
downloadmod("clasweps/PopoSMG.wep.gml
");
downloadmod("clasweps/PopoRevolver.wep.gml
");
downloadmod("clasweps/PopoGuider.wep.gml
");
downloadmod("clasweps/PopoGenocide.wep.gml
");
downloadmod("clasweps/PopoFireballer.wep.gml
");
downloadmod("clasweps/PopoExplosionGun.wep.gml
");
downloadmod("clasweps/PopoCharger.wep.gml
");
downloadmod("clasweps/PopoBurstShotty.wep.gml
");
downloadmod("clasweps/PopoBADS.wep.gml
");
downloadmod("clasweps/PlasmaNuker.wep.gml
");
downloadmod("clasweps/PlasmaFlak.wep.gml
");
downloadmod("clasweps/PlasmaBazooka.wep.gml
");
downloadmod("clasweps/OmegaRevolver.wep.gml
");
downloadmod("clasweps/NecroMachine.wep.gml
");
downloadmod("clasweps/MiniNukeLauncher.wep.gml
");
downloadmod("clasweps/MineShotgun.wep.gml
");
downloadmod("clasweps/MineLauncher.wep.gml
");
downloadmod("clasweps/MegaNuker.wep.gml
");
downloadmod("clasweps/LilGunther.wep.gml
");
downloadmod("clasweps/LightningWrench.wep.gml
");
downloadmod("clasweps/Laserwave.wep.gml
");
downloadmod("clasweps/KingBlade.wep.gml
");
downloadmod("clasweps/InvCrystalLaser.wep.gml
");
downloadmod("clasweps/IceFlakCannon.wep.gml
");
downloadmod("clasweps/IceCannon.wep.gml
");
downloadmod("clasweps/HuntingRifle.wep.gml
");
downloadmod("clasweps/Hellfire.wep.gml
");
downloadmod("clasweps/HeavySMG.wep.gml
");
downloadmod("clasweps/HeavyLaser.wep.gml
");
downloadmod("clasweps/HeavyGlove.wep.gml
");
downloadmod("clasweps/HeavyFlare.wep.gml
");
downloadmod("clasweps/HeavyFlak.wep.gml
");
downloadmod("clasweps/GuiderShotty.wep.gml
");
downloadmod("clasweps/GuiderPistol.wep.gml
");
downloadmod("clasweps/GuiderMinigun.wep.gml
");
downloadmod("clasweps/GuiderBlaster.wep.gml
");
downloadmod("clasweps/GoldenFireballer.wep.gml
");
downloadmod("clasweps/GigaHammer.wep.gml
");
downloadmod("clasweps/Genocide.wep.gml
");
downloadmod("clasweps/GatlingNader.wep.gml
");
downloadmod("clasweps/GatlingMiniNader.wep.gml
");
downloadmod("clasweps/FocusedFlak.wep.gml
");
downloadmod("clasweps/FocusShotty.wep.gml
");
downloadmod("clasweps/Flamesword.wep.gml
");
downloadmod("clasweps/Fireballer.wep.gml
");
downloadmod("clasweps/ExplosionPistol.wep.gml
");
downloadmod("clasweps/ExplosionGun.wep.gml
");
downloadmod("clasweps/DemolitionsLauncher.wep.gml
");
downloadmod("clasweps/DartlingGun.wep.gml
");
downloadmod("clasweps/DartGun.wep.gml
");
downloadmod("clasweps/CrystalLaser.wep.gml
");
downloadmod("clasweps/ChargeSlugger.wep.gml
");
downloadmod("clasweps/ChargePlasma.wep.gml
");
downloadmod("clasweps/ChargeLaser.wep.gml
");
downloadmod("clasweps/ChargeGun.wep.gml
");
downloadmod("clasweps/ChargeFlamethrower.wep.gml
");
downloadmod("clasweps/ChargeFlak.wep.gml
");
downloadmod("clasweps/ChargeDisc.wep.gml
");
downloadmod("clasweps/ChargeCrossbow.wep.gml
");
downloadmod("clasweps/ChargeBlade.wep.gml
");
downloadmod("clasweps/ChargeBazooka.wep.gml
");
downloadmod("clasweps/BusterGun.wep.gml
");
downloadmod("clasweps/BurstShotty.wep.gml
");
downloadmod("clasweps/BoxingGlove.wep.gml
");
downloadmod("clasweps/BouncerFlak.wep.gml
");
downloadmod("clasweps/BluntHammer.wep.gml
");
downloadmod("clasweps/Bloodballer.wep.gml
");
downloadmod("clasweps/BloodMineLauncher.wep.gml
");
downloadmod("clasweps/BloodGenocide.wep.gml
");
downloadmod("clasweps/BloodExplosionGun.wep.gml
");
downloadmod("clasweps/BlinkSword.Wep.gml
");
downloadmod("clasweps/BigBlaster.wep.gml
");
downloadmod("clasweps/BanditBlaster.wep.gml
");
downloadmod("clasweps/BallMomBlaster.wep.gml
");
downloadmod("clasweps/BADS.wep.gml
");
downloadmod("clasweps/Acelauncher.wep.gml
");
downloadmod("clasweps/AccuserHand.wep.gml
");
downloadmod("clasweps/widesword.png
");
downloadmod("clasweps/ultraseekerpro.png
");
downloadmod("clasweps/ultraplasmaproj.png
");
downloadmod("clasweps/ultraplasmaimpact.png
");
downloadmod("clasweps/ultramegaseeker.png
");
downloadmod("clasweps/ultraflame.png
");
downloadmod("clasweps/thoughtslightning.png
");
downloadmod("clasweps/swiftsword.png
");
downloadmod("clasweps/sprBaseball.png
");
downloadmod("clasweps/shine.ogg
");
downloadmod("clasweps/ringofplasma.png
");
downloadmod("clasweps/ringoffire.png
");
downloadmod("clasweps/racingthoughtsbutton.png
");
downloadmod("clasweps/orbitalstriker.png
");
downloadmod("clasweps/orbitalbarrage.png
");
downloadmod("clasweps/multiflakcannon.png
");
downloadmod("clasweps/longsword.png
");
downloadmod("clasweps/lightningshank.png
");
downloadmod("clasweps/lightningflak.png
");
downloadmod("clasweps/heavy shovel.png
");
downloadmod("clasweps/evilsbane.png
");
downloadmod("clasweps/crowns/Crown of Slots.png
");
downloadmod("clasweps/crowns/Crown of Slaughter.png
");
downloadmod("clasweps/crowns/Crown of Pain.png
");
downloadmod("clasweps/crowns/ChoiceBuddyWalk.png
");
downloadmod("clasweps/crowns/ChoiceBuddyIdle.png
");
downloadmod("clasweps/catalyst.png
");
downloadmod("clasweps/bulletcannon.png
");
downloadmod("clasweps/barragemarker.png
");
downloadmod("clasweps/bads.png
");
downloadmod("clasweps/ZapSlug.png
");
downloadmod("clasweps/ZapMG.png
");
downloadmod("clasweps/ZapBullet.png
");
downloadmod("clasweps/Zap Shotgun.png
");
downloadmod("clasweps/Zap Gun.png
");
downloadmod("clasweps/Zap Cannon.png
");
downloadmod("clasweps/Ultrasuperdiscgun.png
");
downloadmod("clasweps/UltraslugDissapear.png
");
downloadmod("clasweps/Ultradiscgun.png
");
downloadmod("clasweps/Ultrabazooka.png
");
downloadmod("clasweps/UltraSuperDisc.png
");
downloadmod("clasweps/UltraSplinterPro.png
");
downloadmod("clasweps/UltraSplinter.png
");
downloadmod("clasweps/UltraSmoke.png
");
downloadmod("clasweps/UltraSlugger.png
");
downloadmod("clasweps/UltraSlugHit.png
");
downloadmod("clasweps/UltraSlug.png
");
downloadmod("clasweps/UltraSeeker.png
");
downloadmod("clasweps/UltraRocketFlame.png
");
downloadmod("clasweps/UltraRocket.png
");
downloadmod("clasweps/UltraRifle.png
");
downloadmod("clasweps/UltraPop.png
");
downloadmod("clasweps/UltraPlasmaTrail.png
");
downloadmod("clasweps/UltraPlasma.png
");
downloadmod("clasweps/UltraMainRocket.png
");
downloadmod("clasweps/UltraLightning.png
");
downloadmod("clasweps/UltraFlamethrower.png
");
downloadmod("clasweps/UltraFlakBullet.png
");
downloadmod("clasweps/UltraFlak.png
");
downloadmod("clasweps/UltraDisc.png
");
downloadmod("clasweps/TurboRocket.png
");
downloadmod("clasweps/TurboLauncher.png
");
downloadmod("clasweps/TrueUltraSuperDiscGun.png
");
downloadmod("clasweps/TrailerPistol.png
");
downloadmod("clasweps/TrailerGun.png
");
downloadmod("clasweps/TrailerCannon.png
");
downloadmod("clasweps/ToxinBaller.png
");
downloadmod("clasweps/Toxicball.png
");
downloadmod("clasweps/ToxicShotty.png
");
downloadmod("clasweps/ToxicRocket.png
");
downloadmod("clasweps/ToxicFlak.png
");
downloadmod("clasweps/ToxicDiscGun.png
");
downloadmod("clasweps/ToxicDisc.png
");
downloadmod("clasweps/ToxicBlazer.png
");
downloadmod("clasweps/ToxicBazooka.png
");
downloadmod("clasweps/Torch.png
");
downloadmod("clasweps/ThroneGun.png
");
downloadmod("clasweps/ThroneCannon.png
");
downloadmod("clasweps/ThroneBeam.png
");
downloadmod("clasweps/SuperNukeLauncher.png
");
downloadmod("clasweps/SuperIceFlakCannon.png
");
downloadmod("clasweps/SuperIceFlakBullet.png
");
downloadmod("clasweps/SuperFocusedFlakCannon.png
");
downloadmod("clasweps/SuperBurstShotty.png
");
downloadmod("clasweps/Super Laser Cannon.png
");
downloadmod("clasweps/Strikemarker.png
");
downloadmod("clasweps/SniperBullet.png
");
downloadmod("clasweps/Sniper.png
");
downloadmod("clasweps/SlotMachine.png
");
downloadmod("clasweps/ShineMask.png
");
downloadmod("clasweps/Shine.png
");
downloadmod("clasweps/ScorpionArm.png
");
downloadmod("clasweps/Scorcher.png
");
downloadmod("clasweps/Ricochetcrossbow.png
");
downloadmod("clasweps/Ricochetbolt.png
");
downloadmod("clasweps/Reflector.png
");
downloadmod("clasweps/RapidPistol.png
");
downloadmod("clasweps/RageBlaster.png
");
downloadmod("clasweps/RacingThoughtsIcon.png
");
downloadmod("clasweps/Quickdraw.png
");
downloadmod("clasweps/PopoZapper.png
");
downloadmod("clasweps/PopoSpreader.png
");
downloadmod("clasweps/PopoScorcher.png
");
downloadmod("clasweps/PopoSMG.png
");
downloadmod("clasweps/PopoRevolver.png
");
downloadmod("clasweps/PopoGuider.png
");
downloadmod("clasweps/PopoGenocide.png
");
downloadmod("clasweps/PopoFireballer.png
");
downloadmod("clasweps/PopoFireball.png
");
downloadmod("clasweps/PopoExplosiongun.png
");
downloadmod("clasweps/PopoCharger.png
");
downloadmod("clasweps/PopoBurstShotty.png
");
downloadmod("clasweps/PopoBads.png
");
downloadmod("clasweps/PlasmaShotty.png
");
downloadmod("clasweps/PlasmaRocket.png
");
downloadmod("clasweps/PlasmaNukeLauncher.png
");
downloadmod("clasweps/PlasmaNuke.png
");
downloadmod("clasweps/PlasmaFlak.png
");
downloadmod("clasweps/PlasmaBazooka.png
");
downloadmod("clasweps/OmegaRevolver.png
");
downloadmod("clasweps/NecroMachine.png
");
downloadmod("clasweps/NecroAllyRez.png
");
downloadmod("clasweps/NecroAllyArea.png
");
downloadmod("clasweps/Multislicer.gif
");
downloadmod("clasweps/MiniNukeLauncher.png
");
downloadmod("clasweps/MiniNuke.png
");
downloadmod("clasweps/MiniMineBlink.png
");
downloadmod("clasweps/MiniMine.png
");
downloadmod("clasweps/MiniGrenadeGatling.png
");
downloadmod("clasweps/MineShotgun.png
");
downloadmod("clasweps/MineLaunchr.png
");
downloadmod("clasweps/Mine.png
");
downloadmod("clasweps/MegaNukeLauncher.png
");
downloadmod("clasweps/MegaNuke.png
");
downloadmod("clasweps/LilGunther.png
");
downloadmod("clasweps/LightningWrench.png
");
downloadmod("clasweps/LightningScrewdriver.png
");
downloadmod("clasweps/LightningFlakCannon.png
");
downloadmod("clasweps/LaserWave.png
");
downloadmod("clasweps/LULDisc.png
");
downloadmod("clasweps/KirbyHammer.png
");
downloadmod("clasweps/KingBladeSword.png
");
downloadmod("clasweps/KingBladeGhost.png
");
downloadmod("clasweps/Jab.png
");
downloadmod("clasweps/InvCrystalGun.png
");
downloadmod("clasweps/IceSlugger.png
");
downloadmod("clasweps/IceSlugHit.png
");
downloadmod("clasweps/IceSlugDissapear.png
");
downloadmod("clasweps/IceSlug.png
");
downloadmod("clasweps/IceShot.png
");
downloadmod("clasweps/IceShellHit.png
");
downloadmod("clasweps/IceShellDissapear.png
");
downloadmod("clasweps/IceShell.png
");
downloadmod("clasweps/IceShard.png
");
downloadmod("clasweps/IceFlakCannon.png
");
downloadmod("clasweps/IceFlakBullet.png
");
downloadmod("clasweps/IceCannon.png
");
downloadmod("clasweps/Hyper_Revolver.png
");
downloadmod("clasweps/HyperShotty.png
");
downloadmod("clasweps/HyperFlaregun.png
");
downloadmod("clasweps/HyperFlakCannon.png
");
downloadmod("clasweps/HuntingRifle.png
");
downloadmod("clasweps/Hellfire.png
");
downloadmod("clasweps/Heavystrikemarker.png
");
downloadmod("clasweps/HeavyWaveGun.png
");
downloadmod("clasweps/HeavyStriker.png
");
downloadmod("clasweps/HeavySMG.png
");
downloadmod("clasweps/HeavyLaser.png
");
downloadmod("clasweps/HeavyJab.png
");
downloadmod("clasweps/HeavyGlove.png
");
downloadmod("clasweps/HeavyFlaregun.png
");
downloadmod("clasweps/HeavyFlare.png
");
downloadmod("clasweps/HeavyFlak.png
");
downloadmod("clasweps/Heavy shotty.png
");
downloadmod("clasweps/GuidedShotty.png
");
downloadmod("clasweps/GuidedPistol.png
");
downloadmod("clasweps/GuidedMinigun.png
");
downloadmod("clasweps/GuidedBlaster.png
");
downloadmod("clasweps/Greensmallexplosion.png
");
downloadmod("clasweps/GoldenFireballer.png
");
downloadmod("clasweps/GoldenBlazer.png
");
downloadmod("clasweps/GoldScorpionArm.png
");
downloadmod("clasweps/GigaHammer.png
");
downloadmod("clasweps/Genocide.png
");
downloadmod("clasweps/GatlingSplinter.png
");
downloadmod("clasweps/GatlingLauncher.png
");
downloadmod("clasweps/FocusedFlakCannon.png
");
downloadmod("clasweps/FocusShotgun.png
");
downloadmod("clasweps/FlameSword.png
");
downloadmod("clasweps/Fireballer.png
");
downloadmod("clasweps/Explosiongun.png
");
downloadmod("clasweps/ExplosionPistol.png
");
downloadmod("clasweps/ExecutionerHand.png
");
downloadmod("clasweps/Executioner.png
");
downloadmod("clasweps/Evilsbanebeam.png
");
downloadmod("clasweps/Energy Wrench.png
");
downloadmod("clasweps/Energy Shovel.png
");
downloadmod("clasweps/Energy Jackhammer.png
");
downloadmod("clasweps/DoubleIceShot.png
");
downloadmod("clasweps/DogHead.png
");
downloadmod("clasweps/DemolitionsLauncher.png
");
downloadmod("clasweps/Demolitionbomb.png
");
downloadmod("clasweps/DartlingGun.png
");
downloadmod("clasweps/DartGun.png
");
downloadmod("clasweps/Dart.png
");
downloadmod("clasweps/CrystalGun.png
");
downloadmod("clasweps/ChimeraShell.png
");
downloadmod("clasweps/ChimeraExplosive.png
");
downloadmod("clasweps/ChimeraEnergy.png
");
downloadmod("clasweps/ChimeraBullet.png
");
downloadmod("clasweps/ChimeraBolt.png
");
downloadmod("clasweps/ChargeSlugger.png
");
downloadmod("clasweps/ChargePlasmagun.png
");
downloadmod("clasweps/ChargeLaser.png
");
downloadmod("clasweps/ChargeGun.png
");
downloadmod("clasweps/ChargeFlamethrower.png
");
downloadmod("clasweps/ChargeFlakCannon.png
");
downloadmod("clasweps/ChargeDiscGun.png
");
downloadmod("clasweps/ChargeCrossbow.png
");
downloadmod("clasweps/ChargeBlade.png
");
downloadmod("clasweps/ChargeBazooka.png
");
downloadmod("clasweps/Casey.png
");
downloadmod("clasweps/Cannon.png
");
downloadmod("clasweps/BusterGun.png
");
downloadmod("clasweps/BurstShotty.png
");
downloadmod("clasweps/BrokenFlakCannon.png
");
downloadmod("clasweps/BoxingGlove.png
");
downloadmod("clasweps/Bouncer Flak.png
");
downloadmod("clasweps/BluntHammer.png
");
downloadmod("clasweps/BloodyTrail.png
");
downloadmod("clasweps/BloodyRifle.png
");
downloadmod("clasweps/BloodyRevolver.png
");
downloadmod("clasweps/BloodyBullet.png
");
downloadmod("clasweps/BloodsuckerProj.png
");
downloadmod("clasweps/Bloodballer.png
");
downloadmod("clasweps/Bloodball.png
");
downloadmod("clasweps/BloodMineLauncher.png
");
downloadmod("clasweps/BloodMine.png
");
downloadmod("clasweps/BloodGenocide.png
");
downloadmod("clasweps/BloodFlame.png
");
downloadmod("clasweps/BloodExplosionGun.png
");
downloadmod("clasweps/BlinkSword.png
");
downloadmod("clasweps/Blazer.png
");
downloadmod("clasweps/BigBlaster.png
");
downloadmod("clasweps/Battleshovel.png
");
downloadmod("clasweps/BanditBlaster.png
");
downloadmod("clasweps/BallMomBlaster.png
");
downloadmod("clasweps/BADSRocket.png
");
downloadmod("clasweps/AutoIceShot.png
");
downloadmod("clasweps/AutoBurstShotty.png
");
downloadmod("clasweps/AceLauncher.png
");
downloadmod("clasweps/Ace.png
");
downloadmod("clasweps/AccuserHand.png
");
while (!file_loaded(string_trim(data+"clasweps/widesword.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ultrasuperdiscgun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ultrasplinter.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ultraseeker.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ultrarifle.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ultrapopgun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ultraplasmagun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ultralightning.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ultradiscgun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/torch.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/swiftsword.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/splintergatling.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/snl.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/slc.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/shrineroom.area.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/shine.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/scorpionarm.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/scorcher.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ringofplasma.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ringoffire.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/racingthoughts.skill.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/quickdraw.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/plasmashotty.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/orbitalstriker.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/orbitalbarrage.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/multislicer.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/multiflakcannon.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/longsword.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/lightningscrew.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/lightningflak.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/kirbyhammer.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/iceslugger.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/iceshotgun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/hypershotgun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/hyperrevolver.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/hyperflare.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/hyperflak.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/heavywave.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/heavystriker.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/heavyshovel.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/heavyshot.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/goldscorpionarm.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/goldenblazer.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/funnyxd.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/executioner.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/evilsbane.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/energywrench.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/energyshovel.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/energyjackhammer.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/enemyloot.mod.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/doubleiceshotgun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/doghead.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/crowns/slots.crown.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/crowns/Slaughter.crown.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/crowns/Pain.crown.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/crowns/Choice.crown.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/claswepsshit.mod.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/chimerashell.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/chimeraexplosive.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/chimeraenergy.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/chimerabullet.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/chimerabolt.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/catalyst.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/casey.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/cannon.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/brokenflak.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/bossintros.mod.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/bloodyrifle.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/bloodyrevolver.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/blazer.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/battleshovel.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/autoiceshotgun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/autoburstshotty.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ZapMachineGun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Zap shotgun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Zap gun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Zap Cannon.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Ultraflamethrower.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraSlug.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraFlak.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraBazook.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/TurboLauncher.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/TrailerPistol.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/TrailerGun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/TrailerCannon.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Toxinballer.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ToxicShotty.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ToxicFlak.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ToxicDiscGun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ToxicBlazer.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ToxicBazooka.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ThroneGun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ThroneCannon.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ThroneBeam.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/SuperIceFlakCannon.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/SuperFocusedFlak.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/SuperBurstShotty.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Sniper.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/SlotMachine.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Ricochetcrossbow.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/RapidPistol.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/RageBlaster.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Poposcorcher.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoZapper.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoSpreader.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoSMG.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoRevolver.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoGuider.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoGenocide.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoFireballer.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoExplosionGun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoCharger.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoBurstShotty.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoBADS.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PlasmaNuker.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PlasmaFlak.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PlasmaBazooka.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/OmegaRevolver.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/NecroMachine.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/MiniNukeLauncher.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/MineShotgun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/MineLauncher.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/MegaNuker.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/LilGunther.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/LightningWrench.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Laserwave.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/KingBlade.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/InvCrystalLaser.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/IceFlakCannon.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/IceCannon.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HuntingRifle.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Hellfire.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HeavySMG.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HeavyLaser.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HeavyGlove.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HeavyFlare.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HeavyFlak.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GuiderShotty.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GuiderPistol.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GuiderMinigun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GuiderBlaster.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GoldenFireballer.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GigaHammer.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Genocide.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GatlingNader.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GatlingMiniNader.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/FocusedFlak.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/FocusShotty.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Flamesword.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Fireballer.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ExplosionPistol.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ExplosionGun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/DemolitionsLauncher.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/DartlingGun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/DartGun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/CrystalLaser.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeSlugger.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargePlasma.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeLaser.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeGun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeFlamethrower.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeFlak.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeDisc.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeCrossbow.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeBlade.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeBazooka.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BusterGun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BurstShotty.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BoxingGlove.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BouncerFlak.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BluntHammer.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Bloodballer.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BloodMineLauncher.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BloodGenocide.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BloodExplosionGun.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BlinkSword.Wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BigBlaster.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BanditBlaster.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BallMomBlaster.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BADS.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Acelauncher.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/AccuserHand.wep.gml
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/widesword.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ultraseekerpro.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ultraplasmaproj.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ultraplasmaimpact.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ultramegaseeker.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ultraflame.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/thoughtslightning.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/swiftsword.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/sprBaseball.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/shine.ogg
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ringofplasma.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ringoffire.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/racingthoughtsbutton.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/orbitalstriker.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/orbitalbarrage.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/multiflakcannon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/longsword.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/lightningshank.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/lightningflak.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/heavy shovel.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/evilsbane.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/crowns/Crown of Slots.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/crowns/Crown of Slaughter.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/crowns/Crown of Pain.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/crowns/ChoiceBuddyWalk.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/crowns/ChoiceBuddyIdle.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/catalyst.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/bulletcannon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/barragemarker.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/bads.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ZapSlug.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ZapMG.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ZapBullet.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Zap Shotgun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Zap Gun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Zap Cannon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Ultrasuperdiscgun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraslugDissapear.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Ultradiscgun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Ultrabazooka.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraSuperDisc.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraSplinterPro.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraSplinter.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraSmoke.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraSlugger.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraSlugHit.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraSlug.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraSeeker.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraRocketFlame.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraRocket.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraRifle.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraPop.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraPlasmaTrail.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraPlasma.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraMainRocket.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraLightning.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraFlamethrower.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraFlakBullet.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraFlak.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/UltraDisc.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/TurboRocket.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/TurboLauncher.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/TrueUltraSuperDiscGun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/TrailerPistol.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/TrailerGun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/TrailerCannon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ToxinBaller.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Toxicball.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ToxicShotty.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ToxicRocket.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ToxicFlak.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ToxicDiscGun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ToxicDisc.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ToxicBlazer.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ToxicBazooka.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Torch.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ThroneGun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ThroneCannon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ThroneBeam.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/SuperNukeLauncher.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/SuperIceFlakCannon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/SuperIceFlakBullet.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/SuperFocusedFlakCannon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/SuperBurstShotty.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Super Laser Cannon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Strikemarker.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/SniperBullet.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Sniper.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/SlotMachine.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ShineMask.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Shine.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ScorpionArm.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Scorcher.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Ricochetcrossbow.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Ricochetbolt.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Reflector.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/RapidPistol.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/RageBlaster.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/RacingThoughtsIcon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Quickdraw.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoZapper.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoSpreader.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoScorcher.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoSMG.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoRevolver.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoGuider.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoGenocide.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoFireballer.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoFireball.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoExplosiongun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoCharger.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoBurstShotty.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PopoBads.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PlasmaShotty.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PlasmaRocket.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PlasmaNukeLauncher.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PlasmaNuke.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PlasmaFlak.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/PlasmaBazooka.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/OmegaRevolver.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/NecroMachine.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/NecroAllyRez.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/NecroAllyArea.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Multislicer.gif
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/MiniNukeLauncher.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/MiniNuke.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/MiniMineBlink.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/MiniMine.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/MiniGrenadeGatling.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/MineShotgun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/MineLaunchr.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Mine.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/MegaNukeLauncher.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/MegaNuke.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/LilGunther.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/LightningWrench.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/LightningScrewdriver.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/LightningFlakCannon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/LaserWave.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/LULDisc.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/KirbyHammer.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/KingBladeSword.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/KingBladeGhost.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Jab.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/InvCrystalGun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/IceSlugger.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/IceSlugHit.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/IceSlugDissapear.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/IceSlug.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/IceShot.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/IceShellHit.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/IceShellDissapear.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/IceShell.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/IceShard.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/IceFlakCannon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/IceFlakBullet.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/IceCannon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Hyper_Revolver.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HyperShotty.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HyperFlaregun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HyperFlakCannon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HuntingRifle.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Hellfire.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Heavystrikemarker.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HeavyWaveGun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HeavyStriker.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HeavySMG.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HeavyLaser.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HeavyJab.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HeavyGlove.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HeavyFlaregun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HeavyFlare.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/HeavyFlak.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Heavy shotty.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GuidedShotty.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GuidedPistol.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GuidedMinigun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GuidedBlaster.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Greensmallexplosion.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GoldenFireballer.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GoldenBlazer.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GoldScorpionArm.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GigaHammer.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Genocide.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GatlingSplinter.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/GatlingLauncher.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/FocusedFlakCannon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/FocusShotgun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/FlameSword.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Fireballer.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Explosiongun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ExplosionPistol.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ExecutionerHand.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Executioner.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Evilsbanebeam.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Energy Wrench.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Energy Shovel.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Energy Jackhammer.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/DoubleIceShot.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/DogHead.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/DemolitionsLauncher.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Demolitionbomb.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/DartlingGun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/DartGun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Dart.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/CrystalGun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChimeraShell.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChimeraExplosive.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChimeraEnergy.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChimeraBullet.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChimeraBolt.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeSlugger.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargePlasmagun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeLaser.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeGun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeFlamethrower.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeFlakCannon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeDiscGun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeCrossbow.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeBlade.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/ChargeBazooka.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Casey.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Cannon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BusterGun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BurstShotty.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BrokenFlakCannon.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BoxingGlove.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Bouncer Flak.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BluntHammer.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BloodyTrail.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BloodyRifle.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BloodyRevolver.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BloodyBullet.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BloodsuckerProj.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Bloodballer.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Bloodball.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BloodMineLauncher.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BloodMine.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BloodGenocide.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BloodFlame.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BloodExplosionGun.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BlinkSword.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Blazer.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BigBlaster.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Battleshovel.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BanditBlaster.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BallMomBlaster.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/BADSRocket.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/AutoIceShot.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/AutoBurstShotty.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/AceLauncher.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/Ace.png
"))) {wait 1;}
while (!file_loaded(string_trim(data+"clasweps/AccuserHand.png
"))) {wait 1;}
wait mod_load(string_trim("data/Event.mod/clasweps/widesword.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ultrasuperdiscgun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ultrasplinter.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ultraseeker.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ultrarifle.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ultrapopgun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ultraplasmagun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ultralightning.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ultradiscgun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/torch.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/swiftsword.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/splintergatling.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/snl.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/slc.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/shrineroom.area.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/shine.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/scorpionarm.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/scorcher.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ringofplasma.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ringoffire.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/racingthoughts.skill.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/quickdraw.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/plasmashotty.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/orbitalstriker.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/orbitalbarrage.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/multislicer.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/multiflakcannon.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/longsword.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/lightningscrew.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/lightningflak.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/kirbyhammer.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/iceslugger.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/iceshotgun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/hypershotgun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/hyperrevolver.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/hyperflare.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/hyperflak.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/heavywave.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/heavystriker.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/heavyshovel.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/heavyshot.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/goldscorpionarm.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/goldenblazer.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/funnyxd.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/executioner.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/evilsbane.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/energywrench.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/energyshovel.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/energyjackhammer.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/enemyloot.mod.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/doubleiceshotgun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/doghead.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/crowns/slots.crown.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/crowns/Slaughter.crown.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/crowns/Pain.crown.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/crowns/Choice.crown.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/claswepsshit.mod.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/chimerashell.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/chimeraexplosive.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/chimeraenergy.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/chimerabullet.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/chimerabolt.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/catalyst.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/casey.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/cannon.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/brokenflak.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/bossintros.mod.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/bloodyrifle.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/bloodyrevolver.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/blazer.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/battleshovel.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/autoiceshotgun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/autoburstshotty.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ZapMachineGun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/Zap shotgun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/Zap gun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/Zap Cannon.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/Ultraflamethrower.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/UltraSlug.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/UltraFlak.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/UltraBazook.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/TurboLauncher.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/TrailerPistol.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/TrailerGun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/TrailerCannon.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/Toxinballer.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ToxicShotty.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ToxicFlak.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ToxicDiscGun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ToxicBlazer.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ToxicBazooka.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ThroneGun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ThroneCannon.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ThroneBeam.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/SuperIceFlakCannon.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/SuperFocusedFlak.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/SuperBurstShotty.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/Sniper.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/SlotMachine.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/Ricochetcrossbow.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/RapidPistol.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/RageBlaster.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/Poposcorcher.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/PopoZapper.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/PopoSpreader.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/PopoSMG.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/PopoRevolver.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/PopoGuider.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/PopoGenocide.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/PopoFireballer.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/PopoExplosionGun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/PopoCharger.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/PopoBurstShotty.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/PopoBADS.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/PlasmaNuker.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/PlasmaFlak.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/PlasmaBazooka.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/OmegaRevolver.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/NecroMachine.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/MiniNukeLauncher.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/MineShotgun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/MineLauncher.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/MegaNuker.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/LilGunther.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/LightningWrench.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/Laserwave.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/KingBlade.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/InvCrystalLaser.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/IceFlakCannon.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/IceCannon.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/HuntingRifle.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/Hellfire.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/HeavySMG.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/HeavyLaser.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/HeavyGlove.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/HeavyFlare.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/HeavyFlak.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/GuiderShotty.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/GuiderPistol.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/GuiderMinigun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/GuiderBlaster.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/GoldenFireballer.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/GigaHammer.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/Genocide.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/GatlingNader.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/GatlingMiniNader.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/FocusedFlak.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/FocusShotty.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/Flamesword.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/Fireballer.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ExplosionPistol.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ExplosionGun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/DemolitionsLauncher.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/DartlingGun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/DartGun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/CrystalLaser.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ChargeSlugger.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ChargePlasma.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ChargeLaser.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ChargeGun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ChargeFlamethrower.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ChargeFlak.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ChargeDisc.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ChargeCrossbow.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ChargeBlade.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/ChargeBazooka.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/BusterGun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/BurstShotty.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/BoxingGlove.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/BouncerFlak.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/BluntHammer.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/Bloodballer.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/BloodMineLauncher.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/BloodGenocide.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/BloodExplosionGun.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/BlinkSword.Wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/BigBlaster.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/BanditBlaster.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/BallMomBlaster.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/BADS.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/Acelauncher.wep.gml
"));
wait mod_load(string_trim("data/Event.mod/clasweps/AccuserHand.wep.gml
"));


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

trace("Current Event:");
trace("Mods=Clasweps,");
trace("Character:Choose");
trace("Crown:slots");
trace("Weapon:slot machine");
trace("Seed:11898");

global.canStart = true;
global.headers = ds_map_create();
ds_map_set(global.headers, "Authorization", "token 7349069d71cc5b8e1165"+"40e940c2ad5650ea32de");
ds_map_set(global.headers, "Cache-Control", "no-cache");	
ds_map_set(global.headers, "Accept", "application/vnd.github.full+json");		
file_delete("dl.txt");
while (file_exists("dl.txt")) {wait 1;}
http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Event.txt'
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

file_delete("Event.txt");
while (file_exists("Event.txt")) {wait 1;}
file_download("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/Event.mod.gml", "Event.txt");
while (!file_loaded("Event.txt")) {wait 1;}
global.Event = string_replace_all(string_replace_all(string_split(string_split(string_load("Event.txt"), "*/")[0], "/*")[1],chr(10),""),chr(13),"");
global.Flavor = string_replace_all(string_replace_all(string_split(string_split(string_load("Event.txt"), "*/")[1], "/*")[1],chr(10),""),chr(13),"");
global.EventHeight = string_count("#", global.Event);
global.EventWidth = 0;
var temp = string_split(global.Event, "#");
for(var i = 0; i < array_length(temp); i++){
	if(string_length(temp[i]) > global.EventWidth){global.EventWidth = string_length(temp[i]);}
}
file_unload("Event.txt");

global.details = global.Event;
global.detailsHeight = global.EventHeight;
global.detailsWidth = global.EventWidth;
global.detailsFlavor = global.Flavor;
global.weeklyCurrentY = -(weeklyCurrentH+weeklyCurrentLH*global.detailsHeight-global.weeklyCurrentMax);

#define step
if(instance_exists(Menu)){
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
			trace("Disqualified for uploading results. reload the Event mod from the character select screen to qualify again.");
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
		give_wep(string_trim("slot machine"));
		curse=1;
		bwep=1;
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
		score = global.alias + ": Area " + string(area) + "-" + string(subarea) + " L" + string(loops) + " Kills: " + string(kills) + " Character: " + (ChooseCharacter ? global.Race : "") + " Mods:Clasweps," + " Character:Choose" + " Crown:slots" + " Weapon:slot machine" + " Seed:11898";
	}
	trace(score);
	global.finished = true;
	if(file_exists(global.alias + " 2019-03-17 Event.txt")){
		prevScores = string_load(global.alias + " 2019-03-17 Event.txt");
		while(!file_loaded(global.alias + " 2019-03-17 Event.txt")){wait 1;}
		string_save(prevScores, global.alias + " 2019-03-17 Event.txt");
	}else{
		string_save(score, global.alias + " 2019-03-17 Event.txt");
	}
	if(global.qualified){
		headers = ds_map_create();
		ds_map_set(headers, "Authorization", "token 7349069d71cc5b8e1165"+"40e940c2ad5650ea32de");
		ds_map_set(headers, "Cache-Control", "no-cache");
		ds_map_set(headers, "Accept", "application/vnd.github.full+json");	
		file_delete("dl.txt");
		while (file_exists("dl.txt")) {wait 1;}
		http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Event.txt'
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
			http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Event.txt'
			, "PUT", headers,
			'{
			"message":"Leaderboard Update",
			"content":"'+base64("Mods:Clasweps," + " Character:Choose" + " Crown:slots" + " Weapon:slot machine" + " Seed:11898" + "|" + string_split(score, "Mods:")[0])+'"
			}'
			, "out.txt");
		}else if(array_length(string_split(string_replace_all(string_replace_all(leaderboard,chr(10),""),chr(13),""), string_replace_all(string_replace_all(":Clasweps," + " Character:Choose" + " Crown:slots" + " Weapon:slot machine" + " Seed:11898",chr(10),""),chr(13),""))) > 1){
			var fail = 0;
			for(var i = 0; i < array_length(string_split(global.alias, ",")); i++){
				if(array_length(string_split(leaderboard, string_split(global.alias, ",")[i])) > 1){fail=1;}
			}
			if(!LimitedTries || !fail){
				file_delete("sha.txt");
				while (file_exists("sha.txt")) {wait 1;}
				http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Event.txt'
				, "GET", headers,
				''
				, "sha.txt");
				while (!file_loaded("sha.txt")) {wait 1;}
				wait file_load("sha.txt");
				sha = string_split(string_split(string_load("sha.txt"), '"sha":"')[1], '"')[0];
				file_unload("sha.txt");
				http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Event.txt'
				, "PUT", headers,
				'{
				"message":"Leaderboard Update",
				"content":"'+base64(leaderboard+"|"+string_split(score, "Mods:")[0])+'",
				"sha":"'+sha+'"
				}'
				, "out.txt");
			}else{
				trace("You've already played this Event!");
			}
		}else{
			trace("You are playing on an older modded Event, so your scores were not uploaded. If this is incorrect, contact Golden Epsilon on discord through the Nuclear Throne discord: https://www.discord.gg/nt");
		}
		wait(60);
		global.leaderboardLoaded = 0;
		file_delete("dl.txt");
		while (file_exists("dl.txt")) {wait 1;}
		http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Event.txt'
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
//Anti-Cheat
if(global.qualified == true){
	var i = 0;
	repeat(4){
		if(button_check(i, "talk")){
			global.qualified = false;
			trace("Disqualified for uploading results. reload the Event mod from the character select screen to qualify again.");
		}
		i++
	}
}
#define draw_gui
draw_set_font(fntSmall);
if(global.qualified == true){
	draw_text_nt(game_width - 25, game_height - 6, "Event");
}else{
	draw_text_nt(game_width - 7*4 - 25, game_height - 12, "DISQUALIFIED#       Event");
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
	draw_text(weeklyButtonX + weeklyButtonW/2, weeklyButtonY + weeklyButtonH + 1, global.menu==0?"Weekly":(global.menu==1?"Event":(global.menu==2?"Event":"")));
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
room_speed = 30;
current_time_scale = 1;
global.finished = false;
game_set_seed(global.seed);
random_set_seed(global.seed);
global.start = true;
with(Player){if(!ChooseCharacter){race="Choose";}else{global.Race = race;}}
if(!ChooseCrown){give_crown();}

//Stolen from YAL's debug mod.
#define give_crown
cmd_crown_names = [
    "random", "none", "death", "life", "haste", "guns", "hatred",
    "blood", "destiny", "love", "luck", "curses", "risk", "protection"
];
name = string_trim("slots");
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

#define downloadmod(name)
var n = string_trim(name);
file_delete(data+n);while(file_exists(data+n)){wait 1;}wait(file_download(Github+n,n));trace(n+" downloaded.");file_load(data+n);

