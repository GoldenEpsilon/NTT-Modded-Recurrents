// /loadmod mods/pgw/pgw_idpd.mod.gml

#define step
var _idpds = [EliteGrunt, EliteInspector, EliteShielder];
for(var i = 0; i < array_length_1d(_idpds); i += 1)
{
	with(_idpds[i])
	{
		if(my_health <= 0)
		{
			with(instance_create(x, y, WepPickup))
			{
				procwep_brand = "I.D.P.D.";
				procwep_lvl = 999;
			}
		}
	}
}

#define init
global.mod_name = "idpd";


/* SPRITES */

//	sprBrandTypePartNum					mods/res/modName/brand/type/partNum.png
var sprHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/han0.png",	1,	6,	5]);
var sprBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/bod0.png",	1,	0,	5]);
var sprMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/muz0.png",	1,	0,	5]);
var sprHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/han1.png",	1,	9,	4]);
var sprBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/bod1.png",	1,	0,	4]);
var sprMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/muz1.png",	1,	0,	4]);
var sprHan2 = procwep_add_sprite(["mods/res/" + global.mod_name + "/han2.png",	1,	10,	6]);
var sprBod2 = procwep_add_sprite(["mods/res/" + global.mod_name + "/bod2.png",	1,	0,	6]);
var sprMuz2 = procwep_add_sprite(["mods/res/" + global.mod_name + "/muz2.png",	1,	0,	6]);
var sprHan3 = procwep_add_sprite(["mods/res/" + global.mod_name + "/han3.png",	1,	7,	6]);
var sprBod3 = procwep_add_sprite(["mods/res/" + global.mod_name + "/bod3.png",	1,	0,	6]);
var sprMuz3 = procwep_add_sprite(["mods/res/" + global.mod_name + "/muz3.png",	1,	0,	6]);
var sprHan4 = procwep_add_sprite(["mods/res/" + global.mod_name + "/han4.png",	1,	10,	4]);
var sprBod4 = procwep_add_sprite(["mods/res/" + global.mod_name + "/bod4.png",	1,	0,	4]);
var sprMuz4 = procwep_add_sprite(["mods/res/" + global.mod_name + "/muz4.png",	1,	0,	4]);


/* BRANDS */

procwep_add_brand({name: "I.D.P.D.", modname: global.mod_name});


/* WEAPON TYPES */

procwep_add_weptype({name: "GUN", auto: 1});


/* WEAPON PARTS */
// HANDLES

procwep_add_handle({brand: "I.D.P.D.",	weptype: "GUN",		lvl: 999,	prefix: ["YKSI-"],			spr: [sprHan0],		reloadtime: [10, 20],	reloadsound: sndPlasmaReloadUpg,	dmgmult: [3, 4],	projectile: {name: IDPDBullet,		speed: [12, 16],	pellets: [1, 1],	sound: [sndGruntFire]}})
procwep_add_handle({brand: "I.D.P.D.",	weptype: "GUN",		lvl: 999,	prefix: ["KIKTA-"],			spr: [sprHan1],		reloadtime: [15, 30],	reloadsound: sndPlasmaReloadUpg,	dmgmult: [2, 4],	projectile: {name: PopoSlug,		speed: [12, 16],	pellets: [1, 1],	sound: [sndGruntFire]}})
procwep_add_handle({brand: "I.D.P.D.",	weptype: "GUN",		lvl: 999,	prefix: ["NOPEA "],			spr: [sprHan2],		reloadtime: [1, 4],		reloadsound: sndPlasmaReloadUpg,	dmgmult: [1, 3],	projectile: {name: IDPDBullet,		speed: [12, 16],	pellets: [1, 1],	sound: [sndGruntFire]}})
procwep_add_handle({brand: "I.D.P.D.",	weptype: "GUN",		lvl: 999,	prefix: ["VIKKELA "],		spr: [sprHan3],		reloadtime: [5, 10],	reloadsound: sndPlasmaReloadUpg,	dmgmult: [2, 6],	projectile: {name: IDPDBullet,		speed: [12, 16],	pellets: [1, 1],	sound: [sndGruntFire]}})
procwep_add_handle({brand: "I.D.P.D.",	weptype: "GUN",		lvl: 999,	prefix: ["VAHVA "],			spr: [sprHan4],		reloadtime: [3, 6],		reloadsound: sndPlasmaReloadUpg,	dmgmult: [2, 6],	projectile: {name: PopoPlasmaBall,	speed: [8, 8],		pellets: [1, 1],	sound: [sndEliteShielderFire]}})

// BODIES

procwep_add_body({brand: "I.D.P.D.",	weptype: "GUN",		lvl: 999,	name: ["KIVAARI"],			spr: [sprBod0],		ammocost: [1, 2],		ammotype: 1,	elementalchance: 0});
procwep_add_body({brand: "I.D.P.D.",	weptype: "GUN",		lvl: 999,	name: ["HAULIKKO"],			spr: [sprBod1],		ammocost: [3, 6],		ammotype: 1,	elementalchance: 0});
procwep_add_body({brand: "I.D.P.D.",	weptype: "GUN",		lvl: 999,	name: ["KONEKIVAARI"],		spr: [sprBod2],		ammocost: [1, 1],		ammotype: 1,	elementalchance: 0});
procwep_add_body({brand: "I.D.P.D.",	weptype: "GUN",		lvl: 999,	name: ["SARJATULIASE"],		spr: [sprBod3],		ammocost: [2, 3],		ammotype: 1,	elementalchance: 0});
procwep_add_body({brand: "I.D.P.D.",	weptype: "GUN",		lvl: 999,	name: ["PUHTITYKKI"],		spr: [sprBod4],		ammocost: [4, 6],		ammotype: 1,	elementalchance: 0});

// MUZZLES

procwep_add_muzzle({brand: "I.D.P.D.",	weptype: "GUN",		lvl: 999,	spr: [sprMuz0],		spread: [0, 5],	knockback: [0, 2],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "I.D.P.D.",	weptype: "GUN",		lvl: 999,	spr: [sprMuz1],		spread: [0, 5],	knockback: [0, 2],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "I.D.P.D.",	weptype: "GUN",		lvl: 999,	spr: [sprMuz2],		spread: [0, 5],	knockback: [0, 2],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "I.D.P.D.",	weptype: "GUN",		lvl: 999,	spr: [sprMuz3],		spread: [0, 5],	knockback: [0, 2],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "I.D.P.D.",	weptype: "GUN",		lvl: 999,	spr: [sprMuz4],		spread: [0, 5],	knockback: [0, 2],		burstammo: 0,	burstdelay: 0});


/* BRAND-SPECIFIC RELOADS */

#define procwep_idpd_reload(w)
with(instance_create(x, y, PopoNade))
{
	team = other.team;
	creator = other;
	speed = 12;
	direction = other.gunangle;
	sound_play(sndChickenThrow);
}


/* API WRAPPER */

#define procwep_add_sprite(spr)
return mod_script_call("mod", "pgw", "procwep_add_sprite", spr);

#define procwep_add_brand(bra)
return mod_script_call("mod", "pgw", "procwep_add_brand", bra);

#define procwep_add_weptype(typ)
return mod_script_call("mod", "pgw", "procwep_add_weptype", typ);

#define procwep_add_handle(han)
return mod_script_call("mod", "pgw", "procwep_add_handle", han);

#define procwep_add_body(bod)
return mod_script_call("mod", "pgw", "procwep_add_body", bod);

#define procwep_add_muzzle(muz)
return mod_script_call("mod", "pgw", "procwep_add_muzzle", muz);
