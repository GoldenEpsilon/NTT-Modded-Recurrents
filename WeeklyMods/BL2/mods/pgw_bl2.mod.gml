// /loadmod mods/pgw/pgw_bl2.mod.gml
/*
Sprites by Elkopolo
Old Maliwan SMG sprites by dillpickaxe
*/

#define init
global.mod_name = "bl2";


/* SPRITES */

//	sprBrandTypePartNum					mods/res/modName/brand/type/partNum.png
var sprBanPisHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/pis/han0.png",	1,	-4,	3]);
var sprBanPisBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/pis/bod0.png",	1,	0,	3]);
var sprBanPisMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/pis/muz0.png",	1,	0,	3]);
var sprBanPisHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/pis/han1.png",	1,	-4,	3]);
var sprBanPisBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/pis/bod1.png",	1,	0,	3]);
var sprBanPisMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/pis/muz1.png",	1,	0,	3]);

var sprBanSmgHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/smg/han0.png",	1,	1,	3]);
var sprBanSmgBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/smg/bod0.png",	1,	0,	3]);
var sprBanSmgMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/smg/muz0.png",	1,	0,	3]);
var sprBanSmgHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/smg/han1.png",	1,	1,	3]);
var sprBanSmgBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/smg/bod1.png",	1,	0,	3]);
var sprBanSmgMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/smg/muz1.png",	1,	0,	3]);

var sprBanShotHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/shot/han0.png",	1,	2,	3]);
var sprBanShotBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/shot/bod0.png",	1,	0,	3]);
var sprBanShotMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/shot/muz0.png",	1,	0,	3]);
var sprBanShotHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/shot/han1.png",	1,	2,	3]);
var sprBanShotBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/shot/bod1.png",	1,	0,	3]);
var sprBanShotMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/shot/muz1.png",	1,	0,	3]);

var sprBanArHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/ar/han0.png",		1,	2,	3]);
var sprBanArBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/ar/bod0.png",		1,	0,	3]);
var sprBanArMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/ar/muz0.png",		1,	0,	3]);
var sprBanArHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/ar/han1.png",		1,	2,	3]);
var sprBanArBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/ar/bod1.png",		1,	0,	3]);
var sprBanArMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/ar/muz1.png",		1,	0,	3]);

var sprBanRlHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/rl/han0.png",		1,	6,	3]);
var sprBanRlBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/rl/bod0.png",		1,	0,	3]);
var sprBanRlMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/rl/muz0.png",		1,	0,	3]);
var sprBanRlHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/rl/han1.png",		1,	6,	3]);
var sprBanRlBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/rl/bod1.png",		1,	0,	3]);
var sprBanRlMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ban/rl/muz1.png",		1,	0,	3]);


var sprDahPisHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/pis/han0.png",	1,	-4,	3]);
var sprDahPisBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/pis/bod0.png",	1,	0,	3]);
var sprDahPisMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/pis/muz0.png",	1,	0,	3]);
var sprDahPisHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/pis/han1.png",	1,	-4,	3]);
var sprDahPisBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/pis/bod1.png",	1,	0,	3]);
var sprDahPisMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/pis/muz1.png",	1,	0,	3]);

var sprDahSmgHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/smg/han0.png",	1,	1,	3]);
var sprDahSmgBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/smg/bod0.png",	1,	0,	3]);
var sprDahSmgMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/smg/muz0.png",	1,	0,	3]);
var sprDahSmgHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/smg/han1.png",	1,	1,	3]);
var sprDahSmgBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/smg/bod1.png",	1,	0,	3]);
var sprDahSmgMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/smg/muz1.png",	1,	0,	3]);

var sprDahArHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/ar/han0.png",		1,	2,	3]);
var sprDahArBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/ar/bod0.png",		1,	0,	3]);
var sprDahArMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/ar/muz0.png",		1,	0,	3]);
var sprDahArHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/ar/han1.png",		1,	2,	3]);
var sprDahArBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/ar/bod1.png",		1,	0,	3]);
var sprDahArMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/ar/muz1.png",		1,	0,	3]);

var sprDahSniHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/sni/han0.png",	1,	2,	3]);
var sprDahSniBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/sni/bod0.png",	1,	0,	3]);
var sprDahSniMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/sni/muz0.png",	1,	0,	3]);
var sprDahSniHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/sni/han1.png",	1,	3,	3]);
var sprDahSniBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/sni/bod1.png",	1,	0,	3]);
var sprDahSniMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/dah/sni/muz1.png",	1,	0,	3]);


var sprHypPisHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/pis/han0.png",	1,	-4,	3]);
var sprHypPisBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/pis/bod0.png",	1,	0,	3]);
var sprHypPisMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/pis/muz0.png",	1,	0,	3]);
var sprHypPisHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/pis/han1.png",	1,	-4,	3]);
var sprHypPisBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/pis/bod1.png",	1,	0,	3]);
var sprHypPisMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/pis/muz1.png",	1,	0,	3]);

var sprHypSmgHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/smg/han0.png",	1,	1,	3]);
var sprHypSmgBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/smg/bod0.png",	1,	0,	3]);
var sprHypSmgMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/smg/muz0.png",	1,	0,	3]);
var sprHypSmgHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/smg/han1.png",	1,	1,	3]);
var sprHypSmgBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/smg/bod1.png",	1,	0,	3]);
var sprHypSmgMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/smg/muz1.png",	1,	0,	3]);

var sprHypShotHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/shot/han0.png",	1,	2,	3]);
var sprHypShotBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/shot/bod0.png",	1,	0,	3]);
var sprHypShotMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/shot/muz0.png",	1,	0,	3]);
var sprHypShotHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/shot/han1.png",	1,	2,	3]);
var sprHypShotBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/shot/bod1.png",	1,	0,	3]);
var sprHypShotMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/shot/muz1.png",	1,	0,	3]);

var sprHypSniHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/sni/han0.png",	1,	2,	3]);
var sprHypSniBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/sni/bod0.png",	1,	0,	3]);
var sprHypSniMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/sni/muz0.png",	1,	0,	3]);
var sprHypSniHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/sni/han1.png",	1,	3,	3]);
var sprHypSniBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/sni/bod1.png",	1,	0,	3]);
var sprHypSniMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/hyp/sni/muz1.png",	1,	0,	3]);


var sprJakPisHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/pis/han0.png",	1,	-4,	3]);
var sprJakPisBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/pis/bod0.png",	1,	0,	3]);
var sprJakPisMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/pis/muz0.png",	1,	0,	3]);
var sprJakPisHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/pis/han1.png",	1,	-4,	3]);
var sprJakPisBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/pis/bod1.png",	1,	0,	3]);
var sprJakPisMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/pis/muz1.png",	1,	0,	3]);

var sprJakArHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/ar/han0.png",		1,	2,	3]);
var sprJakArBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/ar/bod0.png",		1,	0,	3]);
var sprJakArMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/ar/muz0.png",		1,	0,	3]);
var sprJakArHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/ar/han1.png",		1,	2,	3]);
var sprJakArBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/ar/bod1.png",		1,	0,	3]);
var sprJakArMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/ar/muz1.png",		1,	0,	3]);

var sprJakShotHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/shot/han0.png",	1,	2,	4]);
var sprJakShotBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/shot/bod0.png",	1,	0,	4]);
var sprJakShotMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/shot/muz0.png",	1,	0,	4]);
var sprJakShotHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/shot/han1.png",	1,	3,	4]);
var sprJakShotBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/shot/bod1.png",	1,	0,	4]);
var sprJakShotMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/shot/muz1.png",	1,	0,	4]);

var sprJakSniHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/sni/han0.png",	1,	2,	4]);
var sprJakSniBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/sni/bod0.png",	1,	0,	4]);
var sprJakSniMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/sni/muz0.png",	1,	0,	4]);
var sprJakSniHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/sni/han1.png",	1,	3,	4]);
var sprJakSniBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/sni/bod1.png",	1,	0,	4]);
var sprJakSniMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/jak/sni/muz1.png",	1,	0,	4]);


var sprMalPisHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/pis/han0.png",	1,	-4,	3]);
var sprMalPisBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/pis/bod0.png",	1,	0,	3]);
var sprMalPisMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/pis/muz0.png",	1,	0,	3]);
var sprMalPisHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/pis/han1.png",	1,	-4,	3]);
var sprMalPisBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/pis/bod1.png",	1,	0,	3]);
var sprMalPisMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/pis/muz1.png",	1,	0,	3]);

var sprMalSmgHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/smg/han0.png",	1,	1,	3]);
var sprMalSmgBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/smg/bod0.png",	1,	0,	3]);
var sprMalSmgMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/smg/muz0.png",	1,	0,	3]);
var sprMalSmgHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/smg/han1.png",	1,	1,	3]);
var sprMalSmgBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/smg/bod1.png",	1,	0,	3]);
var sprMalSmgMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/smg/muz1.png",	1,	0,	3]);

var sprMalSniHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/sni/han0.png",	1,	2,	4]);
var sprMalSniBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/sni/bod0.png",	1,	0,	4]);
var sprMalSniMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/sni/muz0.png",	1,	0,	4]);
var sprMalSniHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/sni/han1.png",	1,	3,	4]);
var sprMalSniBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/sni/bod1.png",	1,	0,	4]);
var sprMalSniMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/sni/muz1.png",	1,	0,	4]);

var sprMalRlHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/rl/han0.png",		1,	6,	3]);
var sprMalRlBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/rl/bod0.png",		1,	0,	3]);
var sprMalRlMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/rl/muz0.png",		1,	0,	3]);
var sprMalRlHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/rl/han1.png",		1,	6,	3]);
var sprMalRlBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/rl/bod1.png",		1,	0,	3]);
var sprMalRlMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/mal/rl/muz1.png",		1,	0,	3]);


var sprTedPisHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/pis/han0.png",	1,	-4,	3]);
var sprTedPisBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/pis/bod0.png",	1,	0,	3]);
var sprTedPisMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/pis/muz0.png",	1,	0,	3]);
var sprTedPisHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/pis/han1.png",	1,	-4,	3]);
var sprTedPisBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/pis/bod1.png",	1,	0,	3]);
var sprTedPisMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/pis/muz1.png",	1,	0,	3]);

var sprTedSmgHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/smg/han0.png",	1,	1,	3]);
var sprTedSmgBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/smg/bod0.png",	1,	0,	3]);
var sprTedSmgMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/smg/muz0.png",	1,	0,	3]);
var sprTedSmgHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/smg/han1.png",	1,	1,	3]);
var sprTedSmgBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/smg/bod1.png",	1,	0,	3]);
var sprTedSmgMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/smg/muz1.png",	1,	0,	3]);

var sprTedShotHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/shot/han0.png",	1,	2,	4]);
var sprTedShotBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/shot/bod0.png",	1,	0,	4]);
var sprTedShotMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/shot/muz0.png",	1,	0,	4]);
var sprTedShotHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/shot/han1.png",	1,	3,	4]);
var sprTedShotBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/shot/bod1.png",	1,	0,	4]);
var sprTedShotMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/shot/muz1.png",	1,	0,	4]);

var sprTedRlHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/rl/han0.png",		1,	6,	3]);
var sprTedRlBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/rl/bod0.png",		1,	0,	3]);
var sprTedRlMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/rl/muz0.png",		1,	0,	3]);
var sprTedRlHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/rl/han1.png",		1,	6,	3]);
var sprTedRlBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/rl/bod1.png",		1,	0,	3]);
var sprTedRlMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/ted/rl/muz1.png",		1,	0,	3]);


var sprTorPisHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/pis/han0.png",	1,	-4,	3]);
var sprTorPisBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/pis/bod0.png",	1,	0,	3]);
var sprTorPisMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/pis/muz0.png",	1,	0,	3]);
var sprTorPisHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/pis/han1.png",	1,	-4,	3]);
var sprTorPisBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/pis/bod1.png",	1,	0,	3]);
var sprTorPisMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/pis/muz1.png",	1,	0,	3]);

var sprTorArHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/ar/han0.png",		1,	2,	3]);
var sprTorArBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/ar/bod0.png",		1,	0,	3]);
var sprTorArMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/ar/muz0.png",		1,	0,	3]);
var sprTorArHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/ar/han1.png",		1,	2,	3]);
var sprTorArBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/ar/bod1.png",		1,	0,	3]);
var sprTorArMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/ar/muz1.png",		1,	0,	3]);

var sprTorShotHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/shot/han0.png",	1,	2,	4]);
var sprTorShotBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/shot/bod0.png",	1,	0,	4]);
var sprTorShotMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/shot/muz0.png",	1,	0,	4]);
var sprTorShotHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/shot/han1.png",	1,	3,	4]);
var sprTorShotBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/shot/bod1.png",	1,	0,	4]);
var sprTorShotMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/shot/muz1.png",	1,	0,	4]);

var sprTorRlHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/rl/han0.png",		1,	6,	3]);
var sprTorRlBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/rl/bod0.png",		1,	0,	3]);
var sprTorRlMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/rl/muz0.png",		1,	0,	3]);
var sprTorRlHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/rl/han1.png",		1,	6,	3]);
var sprTorRlBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/rl/bod1.png",		1,	0,	3]);
var sprTorRlMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/tor/rl/muz1.png",		1,	0,	3]);


var sprVlaPisHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/pis/han0.png",	1,	-4,	3]);
var sprVlaPisBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/pis/bod0.png",	1,	0,	3]);
var sprVlaPisMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/pis/muz0.png",	1,	0,	3]);
var sprVlaPisHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/pis/han1.png",	1,	-4,	3]);
var sprVlaPisBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/pis/bod1.png",	1,	0,	3]);
var sprVlaPisMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/pis/muz1.png",	1,	0,	3]);

var sprVlaArHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/ar/han0.png",		1,	2,	3]);
var sprVlaArBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/ar/bod0.png",		1,	0,	3]);
var sprVlaArMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/ar/muz0.png",		1,	0,	3]);
var sprVlaArHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/ar/han1.png",		1,	2,	3]);
var sprVlaArBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/ar/bod1.png",		1,	0,	3]);
var sprVlaArMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/ar/muz1.png",		1,	0,	3]);

var sprVlaRlHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/rl/han0.png",		1,	6,	3]);
var sprVlaRlBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/rl/bod0.png",		1,	0,	3]);
var sprVlaRlMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/rl/muz0.png",		1,	0,	3]);
var sprVlaRlHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/rl/han1.png",		1,	6,	3]);
var sprVlaRlBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/rl/bod1.png",		1,	0,	3]);
var sprVlaRlMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/rl/muz1.png",		1,	0,	3]);

var sprVlaSniHan0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/sni/han0.png",	1,	2,	4]);
var sprVlaSniBod0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/sni/bod0.png",	1,	0,	4]);
var sprVlaSniMuz0 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/sni/muz0.png",	1,	0,	4]);
var sprVlaSniHan1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/sni/han1.png",	1,	3,	4]);
var sprVlaSniBod1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/sni/bod1.png",	1,	0,	4]);
var sprVlaSniMuz1 = procwep_add_sprite(["mods/res/" + global.mod_name + "/vla/sni/muz1.png",	1,	0,	4]);


/* BRANDS */

procwep_add_brand({name: "BANDIT",		modname: global.mod_name} );	// ban
procwep_add_brand({name: "DAHL",		modname: global.mod_name});		// dah
procwep_add_brand({name: "HYPERION",	modname: global.mod_name});		// hyp
procwep_add_brand({name: "JAKOBS",		modname: global.mod_name});		// jak
procwep_add_brand({name: "MALIWAN",		modname: global.mod_name});		// mal
procwep_add_brand({name: "TEDIORE",		modname: global.mod_name});		// ted
procwep_add_brand({name: "TORGUE",		modname: global.mod_name});		// tor
procwep_add_brand({name: "VLADOF",		modname: global.mod_name});		// vla


/* WEAPON TYPES */

procwep_add_weptype({name: "PISTOL", auto: 0});				// pis
procwep_add_weptype({name: "ASSAULT RIFLE", auto: 1});		// ar
procwep_add_weptype({name: "ROCKET LAUNCHER", auto: 0});	// rl
procwep_add_weptype({name: "SHOTGUN", auto: 0});			// shot
procwep_add_weptype({name: "SMG", auto: 1});				// smg
procwep_add_weptype({name: "SNIPER RIFLE", auto: 0});		// sni
procwep_add_weptype({name: "LASER", auto: 0});				// lsr


/* WEAPON PARTS */
// HANDLES

procwep_add_handle({brand: "BANDIT",	weptype: "PISTOL",			lvl: 0,		prefix: ["murduerer's ", "Baynaneted ", "Marxmans ", "Extendified ", "misles ", "Rapider ", "Dubble "],					spr: [sprBanPisHan0, sprBanPisHan1],		reloadtime: [8, 8],		reloadsound: sndSwapPistol,		dmgmult: [0.25, 0.35],	projectile: {name: Bullet1,		speed: [16, 16],	pellets: [4, 4],	sound: [sndPistol, sndPopgun, sndRustyRevolver]}})
procwep_add_handle({brand: "BANDIT",	weptype: "SMG",				lvl: 1,		prefix: ["Murduring ", "Cutting ", "Bulets Go Fasterifed ", "Ballanced ", "Akurate ", "Agresive "],						spr: [sprBanSmgHan0, sprBanSmgHan1],		reloadtime: [4, 5],		reloadsound: sndSwapPistol,		dmgmult: [0.25, 0.35],	projectile: {name: Bullet1,		speed: [16, 18],	pellets: [3, 3],	sound: [sndBouncerSmg, sndHyperRifle, sndMachinegun, sndMinigun]}})
procwep_add_handle({brand: "BANDIT",	weptype: "SHOTGUN",			lvl: 1,		prefix: ["Slising ", "Sketer ", "Drumed ", "Quik Loadeder ", "Assssult " , "Critikal Hit ", "Redy Stedy "],				spr: [sprBanShotHan0, sprBanShotHan1],		reloadtime: [10, 20],	reloadsound: sndShotReload,		dmgmult: [0.25, 0.35],	projectile: {name: Bullet2,		speed: [14, 18],	pellets: [18, 30],	sound: [sndShotgun, sndEraser, sndDoubleShotgun, sndSawedOffShotgun, sndWaveGun]}})
procwep_add_handle({brand: "BANDIT",	weptype: "ASSAULT RIFLE",	lvl: 2,		prefix: ["Nassty ", "Nifed ", "Fast Bulets ", "Taktikal ", "Expandifide ", "Akurate ", "Wyld Asss "],					spr: [sprBanArHan0, sprBanArHan1],			reloadtime: [6, 6],		reloadsound: sndSwapPistol,		dmgmult: [0.25, 0.35],	projectile: {name: Bullet1,		speed: [16, 16],	pellets: [3, 3],	sound: [sndBouncerSmg, sndHyperRifle, sndMachinegun, sndMinigun]}})
procwep_add_handle({brand: "BANDIT",	weptype: "ROCKET LAUNCHER",	lvl: 4,		prefix: ["Big ", "gratuitius ", "Speeedee ", "Roket Pawket ", "Snyper ", "fast actons ", "Quik Drawler ", "Rappid "],	spr: [sprBanRlHan0, sprBanRlHan1],			reloadtime: [30, 50],	reloadsound: sndSwapExplosive,	dmgmult: [1.05, 1.15],	projectile: {name: JockRocket,	speed: [4, 4],		pellets: [1, 1],	sound: [sndRocket, sndGoldRocket, sndEliteGruntRocketFire, sndJockFire]}})

procwep_add_handle({brand: "DAHL",		weptype: "PISTOL",			lvl: 1,		prefix: ["FLOATED ", "REACT ", "NEUTRALIZING ", "TACTICAL ", "CLOSE QUARTERS ", "LOADED ", "TWIN "],					spr: [sprDahPisHan0, sprDahPisHan1],		reloadtime: [5, 6],		reloadsound: sndSwapPistol,		dmgmult: [1, 1.1],		projectile: {name: Bullet1,		speed: [16, 16],	pellets: [1, 1],	sound: [sndPistol, sndPopgun, sndRustyRevolver]}})
procwep_add_handle({brand: "DAHL",		weptype: "SMG",				lvl: 1,	prefix: ["DEFT ", "FLYING ", "STOPPING ", "SKIRMISH ", "STOIC " , "BLADED "],											spr: [sprDahSmgHan0, sprDahSmgHan1],		reloadtime: [3, 6],		reloadsound: sndSwapPistol,		dmgmult: [1, 1.1],		projectile: {name: Bullet1,		speed: [16, 18],	pellets: [1, 1],	sound: [sndBouncerSmg, sndHyperRifle, sndMachinegun, sndMinigun]}})
procwep_add_handle({brand: "DAHL",		weptype: "ASSAULT RIFLE",	lvl: 3,	prefix: ["SCOUT ", "DEEP ", "ATTACK ", "PATROL ", "BREACH ", "ONSLAUGHT ", "FERAL ", "DOUBLE TAP "],					spr: [sprDahArHan0, sprDahArHan1],			reloadtime: [4, 6],		reloadsound: sndSwapPistol,		dmgmult: [1, 1.1],		projectile: {name: Bullet1,		speed: [16, 16],	pellets: [1, 1],	sound: [sndBouncerSmg, sndHyperRifle, sndMachinegun, sndMinigun]}})
procwep_add_handle({brand: "DAHL",		weptype: "SNIPER RIFLE",	lvl: 4,	prefix: ["SURGICAL ", "SUPPRESSIVE ", "PACIFYING ", "LIQUID ", "CARTEL ", "NIGHT ", "OPERATIONAL "],					spr: [sprDahSniHan0, sprDahSniHan1],		reloadtime: [20, 80],	reloadsound: sndSwapPistol,		dmgmult: [1, 1.1],		projectile: {name: Bullet1,		speed: [24, 24],	pellets: [3, 4],	sound: [sndUltraPistol, sndHeavyCrossbow, sndSuperCrossbow]}})

procwep_add_handle({brand: "HYPERION",	weptype: "PISTOL",			lvl: 1,		prefix: ["EARNEST ", "DYNAMIC ", "WIN-WIN ", "CORE ", "ACTION ", "MAXIMIZED ", "REDUNDANT "],							spr: [sprHypPisHan0, sprHypPisHan1],		reloadtime: [2, 3],		reloadsound: sndSwapPistol,		dmgmult: [1.1, 1.2],	projectile: {name: Bullet1,		speed: [16, 16],	pellets: [1, 1],	sound: [sndPistol, sndPopgun, sndRustyRevolver]}})
procwep_add_handle({brand: "HYPERION",	weptype: "SMG",				lvl: 2,		prefix: ["ANALYTICAL ", "PROACTIVE ", "RIGHTSIZING ", "SOCIAL ", "CORPORATE " , "CUTTING EDGE "],						spr: [sprHypSmgHan0, sprHypSmgHan1],		reloadtime: [3, 4],		reloadsound: sndSwapPistol,		dmgmult: [1.1, 1.2],	projectile: {name: Bullet1,		speed: [16, 18],	pellets: [1, 1],	sound: [sndBouncerSmg, sndHyperRifle, sndMachinegun, sndMinigun]}})
procwep_add_handle({brand: "HYPERION",	weptype: "SHOTGUN",			lvl: 2,		prefix: ["PRACTICABLE ", "POTENTIAL ", "REACTIVE ", "RESTRUCTURING ", "CRITICAL " , "SCALABLE ", "SOCIAL "],			spr: [sprHypShotHan0, sprHypShotHan1],		reloadtime: [10, 18],	reloadsound: sndShotReload,		dmgmult: [1.1, 1.2],	projectile: {name: Bullet2,		speed: [14, 18],	pellets: [6, 10],	sound: [sndShotgun, sndEraser, sndDoubleShotgun, sndSawedOffShotgun, sndWaveGun]}})
procwep_add_handle({brand: "HYPERION",	weptype: "SNIPER RIFLE",	lvl: 4,		prefix: ["LONGITUDINAL ", "OPERATIONAL ", "AUDITING ", "COHESION ", "CONTINGENT ", "VENTURE ", "RESOURCE "],			spr: [sprHypSniHan0, sprHypSniHan1],		reloadtime: [20, 30],	reloadsound: sndSwapPistol,		dmgmult: [1.1, 1.2],	projectile: {name: Bullet1,		speed: [24, 24],	pellets: [4, 6],	sound: [sndUltraPistol, sndHeavyCrossbow, sndSuperCrossbow]}})

procwep_add_handle({brand: "JAKOBS",	weptype: "PISTOL",			lvl: 2,		prefix: ["BOWIE ", "STRAIGHT SHOOTIN' ", "TWO FER ", "GUNSTOCK ", "LOADED ", "DASTARDLY ", "TRICK SHOT "],				spr: [sprJakPisHan0, sprJakPisHan1],		reloadtime: [6, 8],		reloadsound: sndSwapPistol,		dmgmult: [0.75, 1],		projectile: {name: HeavyBullet,		speed: [24, 24],	pellets: [1, 1],	sound: [sndPistol, sndPopgun, sndRustyRevolver]}})
procwep_add_handle({brand: "JAKOBS",	weptype: "ASSAULT RIFLE",	lvl: 3,		prefix: ["BOSS ", "WILD ", "RAZOR ", "COWBOY ", "HORSE ", "FLUSH ", "DEADSHOT "],										spr: [sprJakArHan0, sprJakArHan1],			reloadtime: [3, 4],		reloadsound: sndSwapPistol,		dmgmult: [0.75, 1],		projectile: {name: HeavyBullet,		speed: [16, 16],	pellets: [1, 1],	sound: [sndBouncerSmg, sndHyperRifle, sndMachinegun, sndMinigun]}})
procwep_add_handle({brand: "JAKOBS",	weptype: "SHOTGUN",			lvl: 4,		prefix: ["BARBED ", "SIDEWINDER ", "WELL KEPT ", "HUNTIN' ", "DOC'S " , "TEXAS ", "RUSTLER'S "],						spr: [sprJakShotHan0, sprJakShotHan1],		reloadtime: [12, 24],	reloadsound: sndShotReload,		dmgmult: [0.25, .5],		projectile: {name: Slug,		speed: [20, 35],	pellets: [6, 10],	sound: [sndShotgun, sndEraser, sndDoubleShotgun, sndSawedOffShotgun, sndWaveGun]}})
procwep_add_handle({brand: "JAKOBS",	weptype: "SNIPER RIFLE",	lvl: 5,		prefix: ["SIAH-SIAH ", "KLOOK ", "SKOOKUM ", "CHIKAMIN ", "TL'KOPE ", "TUMTUM ", "HYIU "],								spr: [sprJakSniHan0, sprJakSniHan1],		reloadtime: [20, 30],	reloadsound: sndSwapPistol,		dmgmult: [1, 2],		projectile: {name: HeavyBullet,		speed: [24, 24],	pellets: [1, 5],	sound: [sndUltraPistol, sndHeavyCrossbow, sndSuperCrossbow]}})

procwep_add_handle({brand: "MALIWAN",	weptype: "PISTOL",			lvl: 5,	prefix: ["PUNCTILIOUS ", "EXPEDITIOUS ", "POTENT ", "ELEGANT ", "EVICERATION ", "SURFEIT ", "BINARY "],					spr: [sprMalPisHan0, sprMalPisHan1],		reloadtime: [6, 8],		reloadsound: sndSwapPistol,		dmgmult: [0.5, 0.8],	projectile: {name: IDPDBullet,		speed: [14, 14],	pellets: [1, 1],	sound: [sndPistol, sndPopgun, sndRustyRevolver]}})
procwep_add_handle({brand: "MALIWAN",	weptype: "SMG",				lvl: 7,	prefix: ["GUILELESS ", "IMPETUOUS ", "CONSUMMATE ", "APT ", "LUCID ", "ACUMINOUS "],									spr: [sprMalSmgHan0, sprMalSmgHan1],		reloadtime: [3, 6],		reloadsound: sndPlasmaReload,	dmgmult: [0.5, 0.8],	projectile: {name: IDPDBullet,	speed: [14, 14],	pellets: [1, 1],	sound: [sndPlasma, sndPlasmaRifle, sndPlasmaMinigun, sndLaser]}})
procwep_add_handle({brand: "MALIWAN",	weptype: "SNIPER RIFLE",	lvl: 7,	prefix: ["DANDY ", "BANBURY ", "BARKING ", "FASHIONABLE ", "SUBLIME ", "GENTLEMAN'S ", "MONSTROUS "],					spr: [sprMalSniHan0, sprMalSniHan1],		reloadtime: [20, 40],	reloadsound: sndSwapPistol,		dmgmult: [0.5, 0.8],	projectile: {name: IDPDBullet,		speed: [14, 14],	pellets: [4, 8],	sound: [sndUltraPistol, sndHeavyCrossbow, sndSuperCrossbow]}})
procwep_add_handle({brand: "MALIWAN",	weptype: "ROCKET LAUNCHER",	lvl: 8,	prefix: ["PERTINENT ", "PREDACIOUS ", "PUISSANT ", "PRUDENTIAL ", "PARATAXIS ", "PROXIMATE ", "PLENTEOUS "],			spr: [sprMalRlHan0, sprMalRlHan1],			reloadtime: [45, 90],	reloadsound: sndSwapExplosive,	dmgmult: [0.5, 0.8],	projectile: {name: JockRocket,	speed: [4, 4],		pellets: [1, 1],	sound: [sndRocket, sndGoldRocket, sndEliteGruntRocketFire, sndJockFire]}})

procwep_add_handle({brand: "TEDIORE",	weptype: "PISTOL",			lvl: 2,		prefix: ["DEPENDABLE ", "PEPPY ", "SUPER ", "CLEAN ", "PERMASHARP ", "JAM PACKED ", "TWO FOR ONE "],					spr: [sprTedPisHan0, sprTedPisHan1],		reloadtime: [5, 8],		reloadsound: sndSwapPistol,		dmgmult: [1, 1.1],		projectile: {name: Bullet1,		speed: [16, 16],	pellets: [1, 1],	sound: [sndPistol, sndPopgun, sndRustyRevolver]}})
procwep_add_handle({brand: "TEDIORE",	weptype: "SMG",				lvl: 4,		prefix: ["GUARANTEED ", "BRISK ", "HEFTY ", "REFILL ", "QUALITY " , "PERMA-SHARP "],									spr: [sprTedSmgHan0, sprTedSmgHan1],		reloadtime: [3, 6],		reloadsound: sndSwapPistol,		dmgmult: [1, 1.1],		projectile: {name: Bullet1,		speed: [16, 16],	pellets: [1, 1],	sound: [sndBouncerSmg, sndHyperRifle, sndMachinegun, sndMinigun]}})
procwep_add_handle({brand: "TEDIORE",	weptype: "SHOTGUN",			lvl: 4,		prefix: ["GENTLE ", "ORIGINAL ", "BASIC ", "SWISS ", "ROYAL " , "EXTRA LARGE ", "NEW AND IMPROVED "],					spr: [sprTedShotHan0, sprTedShotHan1],		reloadtime: [12, 24],	reloadsound: sndShotReload,		dmgmult: [1, 1.1],		projectile: {name: Bullet2,		speed: [14, 18],	pellets: [6, 10],	sound: [sndShotgun, sndEraser, sndDoubleShotgun, sndSawedOffShotgun, sndWaveGun]}})
procwep_add_handle({brand: "TEDIORE",	weptype: "ROCKET LAUNCHER",	lvl: 8,	prefix: ["ULTRAPRECISE ", "BUSTLING ", "LARGE ", "STOCKING ", "SWAPPER'S ", "MULTI-USE ", "BONUS"],						spr: [sprTedRlHan0, sprTedRlHan1],			reloadtime: [45, 90],	reloadsound: sndSwapExplosive,	dmgmult: [1, 1.1],		projectile: {name: JockRocket,	speed: [4, 4],		pellets: [1, 1],	sound: [sndRocket, sndGoldRocket, sndEliteGruntRocketFire, sndJockFire]}})

procwep_add_handle({brand: "TORGUE",	weptype: "PISTOL",			lvl: 4,		prefix: ["STRAIGHT ", "SLIPPERY ", "STIFF ", "CRAMMED ", "DOUBLE PENETRATING ", "THRUSTING "],							spr: [sprTorPisHan0, sprTorPisHan1],		reloadtime: [5, 8],		reloadsound: sndSwapPistol,		dmgmult: [1, 1.1],		projectile: {name: Bullet1,		speed: [16, 16],	pellets: [1, 1],	sound: [sndPistol, sndPopgun, sndRustyRevolver]}})
procwep_add_handle({brand: "TORGUE",	weptype: "ASSAULT RIFLE",	lvl: 5,		prefix: ["PLUMP ", "THICK ", "RHYTHMIC ", "ROCK "],																		spr: [sprTorArHan0, sprTorArHan1],			reloadtime: [4, 6],		reloadsound: sndSwapPistol,		dmgmult: [1, 1.1],		projectile: {name: Bullet1,		speed: [16, 16],	pellets: [1, 1],	sound: [sndBouncerSmg, sndHyperRifle, sndMachinegun, sndMinigun]}})
procwep_add_handle({brand: "TORGUE",	weptype: "SHOTGUN",			lvl: 6,	prefix: ["CASUAL ", "STRAIGHT ", "EASY "],																				spr: [sprTorShotHan0, sprTorShotHan1],		reloadtime: [12, 24],	reloadsound: sndShotReload,		dmgmult: [1, 1.1],		projectile: {name: Bullet2,		speed: [14, 18],	pellets: [6, 10],	sound: [sndShotgun, sndEraser, sndDoubleShotgun, sndSawedOffShotgun, sndWaveGun]}})
procwep_add_handle({brand: "TORGUE",	weptype: "ROCKET LAUNCHER",	lvl: 7,	prefix: ["FIDLE DEE "],																									spr: [sprTorRlHan0, sprTorRlHan1],			reloadtime: [45, 90],	reloadsound: sndSwapExplosive,	dmgmult: [1, 1.1],		projectile: {name: JockRocket,	speed: [4, 4],		pellets: [1, 1],	sound: [sndRocket, sndGoldRocket, sndEliteGruntRocketFire, sndJockFire]}})

procwep_add_handle({brand: "VLADOF",	weptype: "PISTOL",			lvl: 1,		prefix: ["RIGHTEOUS ", "VENGEFUL ", "PURGING ", "ANGRY ", "RESOLUTE ", "PATRIOT'S ", "UNENDING ", "DVA "],				spr: [sprVlaPisHan0, sprVlaPisHan1],		reloadtime: [2, 3],		reloadsound: sndSwapPistol,		dmgmult: [1.3, 2],		projectile: {name: AllyBullet,		speed: [16, 16],	pellets: [1, 1],	sound: [sndPistol, sndPopgun, sndRustyRevolver]}})
procwep_add_handle({brand: "VLADOF",	weptype: "ASSAULT RIFLE",	lvl: 3,		prefix: ["SEVERE ", "SWIFT ", "FEROCIOUS ", "RESOLUTE ", "SKEWERING ", "EXPANSIVE ", "RABID "],							spr: [sprVlaArHan0, sprVlaArHan1],			reloadtime: [1, 2],		reloadsound: sndSwapPistol,		dmgmult: [1.3, 2],		projectile: {name: AllyBullet,		speed: [16, 16],	pellets: [1, 1],	sound: [sndBouncerSmg, sndHyperRifle, sndMachinegun, sndMinigun]}})
procwep_add_handle({brand: "VLADOF",	weptype: "ROCKET LAUNCHER",	lvl: 4,		prefix: ["VICTORIOUS ", "TURBULENT ", "PARTISAN ", "MOSCOVITE'S ", "RUGGED ", "RUTHLESS ", "REVOLT "],					spr: [sprVlaRlHan0, sprVlaRlHan1],			reloadtime: [20, 30],	reloadsound: sndSwapExplosive,	dmgmult: [1, 1.1],		projectile: {name: JockRocket,	speed: [4, 4],		pellets: [1, 1],	sound: [sndRocket, sndGoldRocket, sndEliteGruntRocketFire, sndJockFire]}})
procwep_add_handle({brand: "VLADOF",	weptype: "SNIPER RIFLE",	lvl: 5,		prefix: ["ZAMMECHAT  ", "SKORRY ", "GROMKY ", "DOBBY ", "BRITVA ", "RAZREZ ", "BOLSHY "],								spr: [sprVlaSniHan0, sprVlaSniHan1],		reloadtime: [10, 15],	reloadsound: sndSwapPistol,		dmgmult: [1.3, 2],		projectile: {name: AllyBullet,		speed: [24, 24],	pellets: [5, 8],	sound: [sndUltraPistol, sndHeavyCrossbow, sndSuperCrossbow]}})

// BODIES

procwep_add_body({brand: "BANDIT",		weptype: "PISTOL",			lvl: 0,		name: ["Pistal", "Hed Shoter!", "Ass Beeter!", "Magamum!", "Ratatater!", "Spiker"],									spr: [sprBanPisBod0, sprBanPisBod1],					ammocost: [1, 1],	ammotype: 1,	elementalchance: 0});
procwep_add_body({brand: "BANDIT",		weptype: "SMG",				lvl: 1,		name: ["smig", "rokgun", "Acurate smgg"],																			spr: [sprBanSmgBod0, sprBanSmgBod1],					ammocost: [1, 2],	ammotype: 1,	elementalchance: 0});
procwep_add_body({brand: "BANDIT",		weptype: "SHOTGUN",			lvl: 1,		name: ["Room Clener", "longer ragne kilier", "Stret Sweper", "Skatergun", "oberkil!", "Splasher Blashter"],			spr: [sprBanShotBod0, sprBanShotBod1],					ammocost: [1, 2],	ammotype: 2,	elementalchance: 0});
procwep_add_body({brand: "BANDIT",		weptype: "ASSAULT RIFLE",	lvl: 2,		name: ["Mashine Gun", "Carbene", "Ass Beeter!", "Spinigun", "BlASSter"],											spr: [sprBanArBod0, sprBanArBod1],						ammocost: [1, 2],	ammotype: 1,	elementalchance: 0});
procwep_add_body({brand: "BANDIT",		weptype: "ROCKET LAUNCHER",	lvl: 4,		name: ["Launcher", "area efect", "Zooka!", "bombabarbardeer"],														spr: [sprBanRlBod0, sprBanRlBod1],						ammocost: [1, 2],	ammotype: 4,	elementalchance: 0});

procwep_add_body({brand: "DAHL",		weptype: "PISTOL",			lvl: 1,		name: ["REPEATER", "ANACONDA", "PEACEMAKER", "MAGNUM", "NEGOTIATOR"],												spr: [sprDahPisBod0, sprDahPisBod1],					ammocost: [1, 1],	ammotype: 1,	elementalchance: 0});
procwep_add_body({brand: "DAHL",		weptype: "SMG",				lvl: 1,	name: ["SMG", "FOX", "FALCON", "BEETLE", "EEL", "SCORPION", "JACKAL"],												spr: [sprDahSmgBod0, sprDahSmgBod1],					ammocost: [1, 2],	ammotype: 1,	elementalchance: 0.1,	elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "EXPLOSIVE",	color: "@y"}, {name: "CORROSIVE",	color: "@g"}]});
procwep_add_body({brand: "DAHL",		weptype: "ASSAULT RIFLE",	lvl: 3,	name: ["RIFLE", "CARBINE", "DEFENDER"],																				spr: [sprDahArBod0, sprDahArBod1],						ammocost: [1, 2],	ammotype: 1,	elementalchance: 0.1,	elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "EXPLOSIVE",	color: "@y"}, {name: "CORROSIVE",	color: "@g"}]});
procwep_add_body({brand: "DAHL",		weptype: "SNIPER RIFLE",	lvl: 4,	name: ["SNIPER", "STRIKE", "TERROR", "SCOUT"],																		spr: [sprDahSniBod0, sprDahSniBod1],					ammocost: [1, 2],	ammotype: 3,	elementalchance: 0.1,	elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "EXPLOSIVE",	color: "@y"}, {name: "CORROSIVE",	color: "@g"}]});

procwep_add_body({brand: "HYPERION",	weptype: "PISTOL",			lvl: 1,		name: ["APPARATUS", "VISION", "LEVERAGE", "IMPACT", "SYNERGY"],														spr: [sprHypPisBod0, sprHypPisBod1],					ammocost: [1, 1],	ammotype: 1,	elementalchance: 0});
procwep_add_body({brand: "HYPERION",	weptype: "SMG",				lvl: 2,		name: ["PROJECTILE CONVERGENCE", "PRESENCE", "TRANSMURDERA", "BACKBURNER", "STORM", "WEISENHEIMER", "WELLNESS"],	spr: [sprHypSmgBod0, sprHypSmgBod1],					ammocost: [1, 2],	ammotype: 1,	elementalchance: 0.1,	elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "EXPLOSIVE",	color: "@y"}, {name: "CORROSIVE",	color: "@g"}]});
procwep_add_body({brand: "HYPERION",	weptype: "SHOTGUN",			lvl: 2,		name: ["CROWDSOURCING", "THINKING", "FACE TIME", "PROJECTILE DIVERSIFICATION", "DEVELOPMENT", "SPLATGUN"],			spr: [sprHypShotBod0, sprHypShotBod1],					ammocost: [1, 2],	ammotype: 2,	elementalchance: 0.1,	elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "EXPLOSIVE",	color: "@y"}, {name: "CORROSIVE",	color: "@g"}]});
procwep_add_body({brand: "HYPERION",	weptype: "SNIPER RIFLE",	lvl: 4,		name: ["SNIPER RIFLE", "TRANSACTION", "POLICY", "COMPETITION"],														spr: [sprHypSniBod0, sprHypSniBod1],					ammocost: [1, 2],	ammotype: 3,	elementalchance: 0.1,	elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "EXPLOSIVE",	color: "@y"}, {name: "CORROSIVE",	color: "@g"}]});

procwep_add_body({brand: "JAKOBS",		weptype: "PISTOL",			lvl: 2,		name: ["REVOLVER", "WHEELGUN", "LONGARM", "IRON", "WIDOW MAKER", "PEPPERBOX"],										spr: [sprJakPisBod0, sprJakPisBod1],					ammocost: [2, 2],	ammotype: 1,	elementalchance: 0});
procwep_add_body({brand: "JAKOBS",		weptype: "ASSAULT RIFLE",	lvl: 3,		name: ["RIFLE", "SCARAB", "CANNON", "GATLING GUN"],																	spr: [sprJakArBod0, sprJakArBod1],						ammocost: [2, 3],	ammotype: 1,	elementalchance: 0});
procwep_add_body({brand: "JAKOBS",		weptype: "SHOTGUN",			lvl: 4,		name: ["BUSHWACK", "LONGRIDER", "COACH GUN", "SCATTERGUN", "QUAD"],													spr: [sprJakShotBod0, sprJakShotBod1],					ammocost: [2, 4],	ammotype: 2,	elementalchance: 0});
procwep_add_body({brand: "JAKOBS",		weptype: "SNIPER RIFLE",	lvl: 5,		name: ["CALLIPEEN", "CHINOOK", "MUCKAMUCK", "DIAUB"],																spr: [sprJakSniBod0, sprJakSniBod1],					ammocost: [2, 4],	ammotype: 3,	elementalchance: 0});

procwep_add_body({brand: "MALIWAN",		weptype: "PISTOL",			lvl: 5,	name: ["AEGIS", "PHOBIA", "TORMENT", "ANIMOSITY", "UMBRAGE"],														spr: [sprMalPisBod0, sprMalPisBod1],					ammocost: [2, 2],	ammotype: 1,	elementalchance: 1,		elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "CORROSIVE",	color: "@g"}]});
procwep_add_body({brand: "MALIWAN",		weptype: "SMG",				lvl: 7,	name: ["SUBMALEVOLENT GRACE", "TRANCE", "GOSPEL", "PROVOCATEUR", "VEXATION", "VENOM", "REVENANT"],					spr: [sprMalSmgBod0, sprMalSmgBod1],					ammocost: [2, 4],	ammotype: 1,	elementalchance: 1,		elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "CORROSIVE",	color: "@g"}]});
procwep_add_body({brand: "MALIWAN",		weptype: "SNIPER RIFLE",	lvl: 7,	name: ["SNIDER", "JERICHO", "CORINTHIAN", "RAKEHELL"],																spr: [sprMalSniBod0, sprMalSniBod1],					ammocost: [2, 2],	ammotype: 3,	elementalchance: 1,		elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "CORROSIVE",	color: "@g"}]});
procwep_add_body({brand: "MALIWAN",		weptype: "ROCKET LAUNCHER",	lvl: 8,	name: ["PROJECTILE", "PANORAMA", "PUNISHMENT", "PROWLER"],															spr: [sprMalRlBod0, sprMalRlBod1],						ammocost: [2, 4],	ammotype: 4,	elementalchance: 1,		elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "CORROSIVE",	color: "@g"}]});

procwep_add_body({brand: "TEDIORE",		weptype: "PISTOL",			lvl: 2,		name: ["HANDGUN", "AIMSHOT", "POWER SHOT", "BIGGUN", "QUICKSHOT"],													spr: [sprTedPisBod0, sprTedPisBod1],					ammocost: [1, 1],	ammotype: 1,	elementalchance: 0.1,	elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "EXPLOSIVE",	color: "@y"}, {name: "CORROSIVE",	color: "@g"}]});
procwep_add_body({brand: "TEDIORE",		weptype: "SMG",				lvl: 4,		name: ["SUBCOMPACT MG", "SPECIAL", "ACE"],																			spr: [sprTedSmgBod0, sprTedSmgBod1],					ammocost: [1, 2],	ammotype: 1,	elementalchance: 0.1,	elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "EXPLOSIVE",	color: "@y"}, {name: "CORROSIVE",	color: "@g"}]});
procwep_add_body({brand: "TEDIORE",		weptype: "SHOTGUN",			lvl: 4,		name: ["TRIPLE BARRELS!", "SPORTSMAN", "DOUBLE BARRELS!", "HOME SECURITY", "SHOTGUN SUPREME!"],						spr: [sprTedShotBod0, sprTedShotBod1],					ammocost: [1, 2],	ammotype: 2,	elementalchance: 0.1,	elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "EXPLOSIVE",	color: "@y"}, {name: "CORROSIVE",	color: "@g"}]});
procwep_add_body({brand: "TEDIORE",		weptype: "ROCKET LAUNCHER",	lvl: 8,	name: ["LAUNCHER", "SPREAD", "BAZOOKA", "DISPATCH"],																spr: [sprTedRlBod0, sprTedRlBod1],						ammocost: [2, 4],	ammotype: 4,	elementalchance: 0.1,	elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "EXPLOSIVE",	color: "@y"}, {name: "CORROSIVE",	color: "@g"}]});

procwep_add_body({brand: "TORGUE",		weptype: "PISTOL",			lvl: 5,		name: ["HAND CANNON", "HOLE PUNCHER", "ROD", "SLAPPER", "INJECTOR"],												spr: [sprTorPisBod0, sprTorPisBod1],					ammocost: [2, 2],	ammotype: 1,	elementalchance: 1,		elemental: [{name: "EXPLOSIVE",	color: "@y"}]});
procwep_add_body({brand: "TORGUE",		weptype: "ASSAULT RIFLE",	lvl: 9,		name: ["RIFLE", "ROOT", "LANCE", "TORPEDO"],																		spr: [sprTorArBod0, sprTorArBod1],						ammocost: [2, 3],	ammotype: 1,	elementalchance: 1,		elemental: [{name: "EXPLOSIVE",	color: "@y"}]});
procwep_add_body({brand: "TORGUE",		weptype: "SHOTGUN",			lvl: 10,	name: ["HULK", "STALKER", "POUNDER", "BANGSTICK", "RAVAGER"],														spr: [sprTorShotBod0, sprTorShotBod1],					ammocost: [2, 3],	ammotype: 2,	elementalchance: 1,		elemental: [{name: "EXPLOSIVE",	color: "@y"}]});
procwep_add_body({brand: "TORGUE",		weptype: "ROCKET LAUNCHER",	lvl: 11,	name: ["BOOM", "BLAAA", "DUUURP!", "DEEE!"],																		spr: [sprTorRlBod0, sprTorRlBod1],						ammocost: [2, 4],	ammotype: 4,	elementalchance: 1,		elemental: [{name: "EXPLOSIVE",	color: "@y"}]});

procwep_add_body({brand: "VLADOF",		weptype: "PISTOL",			lvl: 1,		name: ["TMP", "ASSASSIN", "FIGHTER", "TROUBLEMAKER", "ANARCHIST"],													spr: [sprVlaPisBod0, sprVlaPisBod1],					ammocost: [1, 1],	ammotype: 1,	elementalchance: 0.1,	elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "EXPLOSIVE",	color: "@y"}, {name: "CORROSIVE",	color: "@g"}]});
procwep_add_body({brand: "VLADOF",		weptype: "ASSAULT RIFLE",	lvl: 3,		name: ["RIFLE", "RENEGADE", "GUERRILLA", "SPINIGUN"],																spr: [sprVlaArBod0, sprVlaArBod1],						ammocost: [1, 2],	ammotype: 1,	elementalchance: 0.1,	elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "EXPLOSIVE",	color: "@y"}, {name: "CORROSIVE",	color: "@g"}]});
procwep_add_body({brand: "VLADOF",		weptype: "ROCKET LAUNCHER",	lvl: 4,		name: ["RPG", "GLORY", "HERO", "VANQUISHER"],																		spr: [sprVlaRlBod0, sprVlaRlBod1],						ammocost: [2, 4],	ammotype: 4,	elementalchance: 0.1,	elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "EXPLOSIVE",	color: "@y"}, {name: "CORROSIVE",	color: "@g"}]});
procwep_add_body({brand: "VLADOF",		weptype: "SNIPER RIFLE",	lvl: 5,		name: ["POOSHKA", "BRATCHNY", "HORRORSHOW", "DROOG"],																spr: [sprVlaSniBod0, sprVlaSniBod1],					ammocost: [2, 2],	ammotype: 3,	elementalchance: 0.1,	elemental: [{name: "INCENDIARY",	color: "@y"}, {name: "SHOCK",	color: "@b"}, {name: "EXPLOSIVE",	color: "@y"}, {name: "CORROSIVE",	color: "@g"}]});

// MUZZLES

procwep_add_muzzle({brand: "BANDIT",	weptype: "PISTOL",			lvl: 0,		spr: [sprBanPisMuz0, sprBanPisMuz1],		spread: [8, 10],	knockback: [2, 4],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "BANDIT",	weptype: "SMG",				lvl: 1,		spr: [sprBanSmgMuz0, sprBanSmgMuz1],		spread: [12, 24],	knockback: [2, 4],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "BANDIT",	weptype: "SHOTGUN",			lvl: 1,		spr: [sprBanShotMuz0, sprBanShotMuz1],		spread: [22, 36],	knockback: [6, 8],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "BANDIT",	weptype: "ASSAULT RIFLE",	lvl: 2,		spr: [sprBanArMuz0, sprBanArMuz1],			spread: [7, 10],	knockback: [6, 8],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "BANDIT",	weptype: "ROCKET LAUNCHER",	lvl: 4,		spr: [sprBanRlMuz0, sprBanRlMuz1],			spread: [5, 12],	knockback: [6, 8],		burstammo: 0,	burstdelay: 0});

procwep_add_muzzle({brand: "DAHL",		weptype: "PISTOL",			lvl: 1,		spr: [sprDahPisMuz0, sprDahPisMuz1],		spread: [4, 8],		knockback: [1, 4],		burstammo: 1,	burstdelay: 2});
procwep_add_muzzle({brand: "DAHL",		weptype: "SMG",				lvl: 3,	spr: [sprDahSmgMuz0, sprDahSmgMuz1],		spread: [6, 12],	knockback: [1, 4],		burstammo: 1,	burstdelay: 2});
procwep_add_muzzle({brand: "DAHL",		weptype: "ASSAULT RIFLE",	lvl: 3,	spr: [sprDahArMuz0, sprDahArMuz1],			spread: [3, 8],		knockback: [2, 6],		burstammo: 1,	burstdelay: 2});
procwep_add_muzzle({brand: "DAHL",		weptype: "SNIPER RIFLE",	lvl: 4,	spr: [sprDahSniMuz0, sprDahSniMuz1],		spread: [2, 4],		knockback: [2, 10],		burstammo: 1,	burstdelay: 2});

procwep_add_muzzle({brand: "HYPERION",	weptype: "PISTOL",			lvl: 1,		spr: [sprHypPisMuz0, sprHypPisMuz1],		spread: [1, 3],		knockback: [1, 2],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "HYPERION",	weptype: "SMG",				lvl: 2,		spr: [sprHypSmgMuz0, sprHypSmgMuz1],		spread: [2, 9],		knockback: [1, 2],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "HYPERION",	weptype: "SHOTGUN",			lvl: 2,		spr: [sprHypShotMuz0, sprHypShotMuz1],		spread: [4, 12],	knockback: [1, 2],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "HYPERION",	weptype: "SNIPER RIFLE",	lvl: 4,		spr: [sprHypSniMuz0, sprHypSniMuz1],		spread: [1, 3],		knockback: [1, 2],		burstammo: 0,	burstdelay: 0});

procwep_add_muzzle({brand: "JAKOBS",	weptype: "PISTOL",			lvl: 2,		spr: [sprJakPisMuz0, sprJakPisMuz1],		spread: [2, 2],		knockback: [2, 4],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "JAKOBS",	weptype: "ASSAULT RIFLE",	lvl: 3,		spr: [sprJakArMuz0, sprJakArMuz1],			spread: [2, 5],		knockback: [2, 4],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "JAKOBS",	weptype: "SHOTGUN",			lvl: 4,		spr: [sprJakShotMuz0, sprJakShotMuz1],		spread: [12, 24],	knockback: [2, 4],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "JAKOBS",	weptype: "SNIPER RIFLE",	lvl: 5,		spr: [sprJakSniMuz0, sprJakSniMuz1],		spread: [1, 2],		knockback: [2, 4],		burstammo: 0,	burstdelay: 0});

procwep_add_muzzle({brand: "MALIWAN",	weptype: "PISTOL",			lvl: 5,	spr: [sprMalPisMuz0, sprMalPisMuz1],		spread: [2, 4],		knockback: [1, 3],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "MALIWAN",	weptype: "SMG",				lvl: 7,	spr: [sprMalSmgMuz0, sprMalSmgMuz1],		spread: [4, 6],		knockback: [1, 3],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "MALIWAN",	weptype: "SNIPER RIFLE",	lvl: 7,	spr: [sprMalSniMuz0, sprMalSniMuz1],		spread: [2, 3],		knockback: [4, 8],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "MALIWAN",	weptype: "ROCKET LAUNCHER",	lvl: 8,	spr: [sprMalRlMuz0, sprMalRlMuz1],			spread: [4, 6],		knockback: [6, 8],		burstammo: 0,	burstdelay: 0});

procwep_add_muzzle({brand: "TEDIORE",	weptype: "PISTOL",			lvl: 2,		spr: [sprTedPisMuz0, sprTedPisMuz1],		spread: [2, 6],		knockback: [4, 6],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "TEDIORE",	weptype: "SMG",				lvl: 4,		spr: [sprTedSmgMuz0, sprTedSmgMuz1],		spread: [2, 9],		knockback: [1, 2],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "TEDIORE",	weptype: "SHOTGUN",			lvl: 4,		spr: [sprTedShotMuz0, sprTedShotMuz1],		spread: [12, 24],	knockback: [4, 6],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "TEDIORE",	weptype: "ROCKET LAUNCHER",	lvl: 5,	spr: [sprTedRlMuz0, sprTedRlMuz1],			spread: [1, 4],		knockback: [6, 8],		burstammo: 0,	burstdelay: 0});

procwep_add_muzzle({brand: "TORGUE",	weptype: "PISTOL",			lvl: 4,		spr: [sprTorPisMuz0, sprTorPisMuz1],		spread: [4, 6],		knockback: [4, 8],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "TORGUE",	weptype: "ASSAULT RIFLE",	lvl: 5,		spr: [sprTorArMuz0, sprTorArMuz1],			spread: [2, 6],		knockback: [6, 8],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "TORGUE",	weptype: "SHOTGUN",			lvl: 6,	spr: [sprTorShotMuz0, sprTorShotMuz1],		spread: [12, 24],	knockback: [6, 8],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "TORGUE",	weptype: "ROCKET LAUNCHER",	lvl: 7,	spr: [sprTorRlMuz0, sprTorRlMuz1],			spread: [1, 4],		knockback: [6, 8],		burstammo: 0,	burstdelay: 0});

procwep_add_muzzle({brand: "VLADOF",	weptype: "PISTOL",			lvl: 1,		spr: [sprVlaPisMuz0, sprVlaPisMuz1],		spread: [6, 10],	knockback: [3, 4],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "VLADOF",	weptype: "ASSAULT RIFLE",	lvl: 3,		spr: [sprVlaArMuz0, sprVlaArMuz1],			spread: [5, 6],		knockback: [6, 4],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "VLADOF",	weptype: "ROCKET LAUNCHER",	lvl: 4,		spr: [sprVlaRlMuz0, sprVlaRlMuz1],			spread: [1, 4],		knockback: [6, 4],		burstammo: 0,	burstdelay: 0});
procwep_add_muzzle({brand: "VLADOF",	weptype: "SNIPER RIFLE",	lvl: 5,		spr: [sprVlaSniMuz0, sprVlaSniMuz1],		spread: [3, 8],		knockback: [1, 4],		burstammo: 0,	burstdelay: 0});


/* ELEMENTALS */

#define procwep_incendiary_create
// nothing

#define procwep_incendiary_step
if(random(1) < 0.1)
{
	with(instance_create(x, y, Flame))
	{
		team = other.team;
		creator = other;
	}
}

if(fork()
&& object_index == JockRocket)
{
	var _x = x;
	var _y = y;
	var _team = team;
	
	while(instance_exists(self))
	{
		_x = x;
		_y = y;
		
		wait(1);
	}
	
	if(!instance_exists(FlameBall)
	|| (instance_exists(FlameBall)
	&& point_distance(_x, _y, instance_nearest(_x, _y, FlameBall).x, instance_nearest(_x, _y, FlameBall).y) > 16))
	{
		repeat(4)
		{
			with(instance_create(_x, _y, FlameBall))
			{
				team = _team;
			}
		}
	}
	
	exit;
}

#define procwep_incendiary_destroy(_x, _y)
for(var i = 0; i < 360; i += 32+irandom(32))
{
	with(instance_create(_x, _y, Flame))
	{
		team = other.team;
		creator = other;
		direction = i;
		speed = 2+random(3);
		friction = 0.25;
		target = noone;
		damage = 1;
		
		if(fork())
		{
			while(instance_exists(self))
			{
				if(distance_to_object(enemy) <= 6)
				{
					target = instance_nearest(x, y, enemy);
				}
				
				if(instance_exists(target))
				{
					x = target.x;
					y = target.y;
					image_index -= image_speed/1.25;
					
					if(current_frame mod 3 == 0)
					{
						image_angle += choose(-90, 90);
					}
				}
				
				wait(1);
			}
			
			exit;
		}
	}
}


#define procwep_shock_create
// nothing

#define procwep_shock_step
if(fork()
&& object_index == JockRocket)
{
	var _x = x;
	var _y = y;
	var _team = team;
	
	while(instance_exists(self))
	{
		_x = x;
		_y = y;
		
		wait(1);
	}
	
	if(!instance_exists(LightningBall)
	|| (instance_exists(LightningBall)
	&& point_distance(_x, _y, instance_nearest(_x, _y, LightningBall).x, instance_nearest(_x, _y, LightningBall).y) > 16))
	{
		with(instance_create(_x, _y, LightningBall))
		{
			team = _team;
		}
	}
	
	exit;
}

#define procwep_shock_destroy(_x, _y)
var _lightningammo = 5;
var _other = other;
var _otherteam = _other.team;

while(_lightningammo)
{
	with(instance_create(_x, _y, Lightning))
	{
		team = _otherteam;
		creator = _other;
		ammo = _lightningammo;
		alarm0 = 1;
		direction = random(360);
		image_angle = direction;
		sound_play(sndLightningPistol);
		_x += lengthdir_x(_lightningammo*4, direction);
		_y += lengthdir_y(_lightningammo*4, direction);
	}
	
	_lightningammo -= 2;
	wait(3);
}


#define procwep_explosive_create
// nothing

#define procwep_explosive_step
// nothing

#define procwep_explosive_destroy(_x, _y)
with(instance_create(_x+lengthdir_x(12, gunangle), _y+lengthdir_y(12, gunangle), SmallExplosion))
{
	creator = other;
	team = other.team;
	sound_play(sndExplosionS);
}


#define procwep_corrosive_create
// nothing

#define procwep_corrosive_step
// nothing

#define procwep_corrosive_destroy(_x, _y)
for(var i = 0; i < 360; i += 64+irandom(64))
{
	with(instance_create(_x, _y, Flame))
	{
		team = other.team;
		creator = other;
		direction = i;
		speed = 2+random(3);
		friction = 0.25;
		target = noone;
		damage = 1;
		image_blend = c_green;
		
		if(fork())
		{
			while(instance_exists(self))
			{
				if(target == noone
				&& distance_to_object(enemy) <= 6)
				{
					target = instance_nearest(x, y, enemy);
					
					with(target)
					{
						if("corroded" not in self)
						{
							corroded = 1;
							image_blend = c_green;
							my_health /= 1.5;
						}
					}
				}
				
				if(instance_exists(target))
				{
					x = target.x;
					y = target.y;
					image_index -= image_speed/1.5;
					
					if(current_frame mod 3 == 0)
					{
						image_angle += choose(-90, 90);
					}
				}
				
				wait(1);
			}
			
			exit;
		}
	}
}


/* BRAND-SPECIFIC RELOADS */

#define procwep_tediore_reload(w)
with(instance_create(x, y, ThrownWep))
{
	wep = w;
	team = other.team;
	creator = other;
	sprite_index = weapon_get_sprite("procwep");
	speed = 12;
	direction = other.gunangle;
	oDir = direction;
	
	if(wep.procwep.weptype.name == "ROCKET LAUNCHER")
	{
		speed = 4;
		sound_play(sndRocket);
	}
	else sound_play(sndChickenThrow);
	
	if(fork())
	{
		while(instance_exists(self))
		{
			var ih = noone;
			if(instance_exists(enemy))
			ih = instance_nearest(x, y, enemy);
			
			if(instance_is(ih, prop)) ih = noone;
			
			if(wep.procwep.weptype.name == "ROCKET LAUNCHER")
			{
				friction = 0;
				speed += 0.25;
				direction = oDir+sin((current_frame/2)+(speed-4))*((speed-4)*8);
				image_angle = direction;
				instance_create(x, y, Smoke);
			}
			
			if(speed <= 2
			|| (ih != noone && distance_to_object(ih) <= 0)
			|| !place_free(x+hspeed, y+vspeed)
			/*|| oDir != direction*/)
			{
				with(instance_create(x, y, Explosion))
				{
					team = other.team;
				}
				
				image_speed = 99;
				sound_play(sndExplosionS);
				instance_change(Wind, 0);
			}
			
			wait(1);
		}
		exit;
	}
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
