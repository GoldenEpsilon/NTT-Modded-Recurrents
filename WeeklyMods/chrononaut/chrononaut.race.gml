#define init
global.last_pitch = 1

// PLAYER
global.spr_idle = sprite_add("sprites/sprChrononautIdle.png", 9, 12, 12);
global.spr_walk = sprite_add("sprites/sprChrononautWalk.png", 6, 12, 12);
global.spr_hurt = sprite_add("sprites/sprChrononautHurt.png", 3, 12, 12);
global.spr_dead = sprite_add("sprites/sprChrononautDead.png", 6, 12, 12);
global.spr_sit1 = sprite_add("sprites/sprChrononautGoSit.png", 3, 12, 12);
global.spr_sit2 = sprite_add("sprites/sprChrononautSit.png", 1, 12, 12);

global.spr_idleout = sprite_add("sprites/sprChrononautEmptyIdle.png", 9, 12, 12);
global.spr_walkout = sprite_add("sprites/sprChrononautEmptyWalk.png", 6, 12, 12);
global.spr_hurtout = sprite_add("sprites/sprChrononautEmptyHurt.png", 3, 12, 12);
global.spr_deadout = sprite_add("sprites/sprChrononautEmptyDead.png", 6, 12, 12);

// HOLOGRAM
global.spr_holoidle = sprite_add("sprites/sprChrononautHologramIdle.png", 9, 12, 12);
global.spr_holowalk = sprite_add("sprites/sprChrononautHologramWalk.png", 6, 12, 12);

// EFFECTS
global.spr_sparkles = sprite_add("sprites/sprChrononautSparkles.png", 10, 12, 12);
global.spr_trailsmol = sprite_add("sprites/sprChrononautTrail.png", 4, 2.5, 2.5);
global.spr_trailbig = sprite_add("sprites/sprChrononautTrailBig.png", 4, 2.5, 4);
global.spr_warp = sprite_add("sprites/sprChrononautWarp.png", 6, 10.5, 10.5);
global.spr_explo = sprite_add("sprites/sprChrononautExplo.png", 8 ,48, 48);
global.spr_flame = sprite_add("sprites/sprChrononautGroundFlame.png", 8, 4.5, 6);
global.spr_flamedisappear = sprite_add("sprites/sprChrononautGroundFlameDisappear.png", 4, 4.5, 6);
	
	
// MENU STUFF
global.spr_menu_button = sprite_add("sprites/sprChrononautCharSelect.png", 1, 0, 0);
global.spr_iconnormal = sprite_add("sprites/sprChrononautMapIcon.png", 1, 9.5, 9.5);
global.spr_iconout = sprite_add("sprites/sprChrononautEmptyMapIcon.png", 1, 9.5, 9.5);
	
global.spr_portrait = undefined; //sprite_add("sprites/sprChrononautBigPortrait.png", 1, 35, 232);
global.spr_loadout = sprite_add("sprites/sprChrononautLoadoutSkin.png",1,16,16);

// SHADERS
global.shd_chrono = shader_create(
	"/// Vertex Shader ///

	struct VertexShaderInput
	{
		float4 vPosition : POSITION;
		float2 vTexcoord : TEXCOORD0;
		float4 vColour : COLOR0;
	};

	struct VertexShaderOutput
	{
		float4 vPosition : SV_POSITION;
		float2 vTexcoord : TEXCOORD0;
		float4 vColour : COLOR0;
	};

	uniform float4x4 matrix_world_view_projection;

	VertexShaderOutput main(VertexShaderInput INPUT)
	{
		VertexShaderOutput OUT;

		OUT.vPosition = mul(matrix_world_view_projection, INPUT.vPosition); // (x,y,z,w)
		OUT.vTexcoord = INPUT.vTexcoord;
		OUT.vColour = INPUT.vColour;

		return OUT;
	}
	"
,
	"/// Fragment/Pixel Shader ///

	struct PixelShaderInput
	{
		float2 vTexcoord : TEXCOORD0;
		float4 vColour : COLOR0;
	};
	
	
	float3 HUEtoRGB(in float H)
	{
		float R = abs(H * 6 - 3) - 1;
		float G = 2 - abs(H * 6 - 2);
		float B = 2 - abs(H * 6 - 4);
		return saturate(float3(R,G,B));
	}
	
	float Epsilon = 1e-10;
 
	float3 RGBtoHCV(in float3 RGB)
	{
		float4 P = (RGB.g < RGB.b) ? float4(RGB.bg, -1.0, 2.0/3.0) : float4(RGB.gb, 0.0, -1.0/3.0);
		float4 Q = (RGB.r < P.x) ? float4(P.xyw, RGB.r) : float4(RGB.r, P.yzx);
		float C = Q.x - min(Q.w, Q.y);
		float H = abs((Q.w - Q.y) / (6 * C + Epsilon) + Q.z);
		return float3(H, C, Q.x);
	}
	
	float3 HSVtoRGB(in float3 HSV)
	{
	float3 RGB = HUEtoRGB(HSV.x);
	return ((RGB - 1) * HSV.y + 1) * HSV.z;
	}
	
	  float3 RGBtoHSV(in float3 RGB)
	{
		float3 HCV = RGBtoHCV(RGB);
		float S = HCV.y / (HCV.z + Epsilon);
		return float3(HCV.x, S, HCV.z);
	}
	
	float _h;
	float _s;
	float _sos;
	
	sampler2D s0;
	
	float4 main(PixelShaderInput INPUT) : SV_TARGET
	{
		float3 col;
		col = float3(_h,_s,1);
		float4 base_color;
		base_color = tex2D(s0, INPUT.vTexcoord);
		
		if (base_color.r == 0.0 && base_color.b == 0.0)
		{
			col.z = RGBtoHSV(base_color.rgb).z;
			base_color.rgb = HSVtoRGB(col);
		}
		else if(base_color.g == 0.0)
		{
			col.z = _sos*RGBtoHSV(base_color.rgb).z;
			base_color.rgb = HSVtoRGB(col);
		}
		
		return base_color;
	}"
)

// SELECT SOUND
var _race = [];
for(var i = 0; i < maxp; i++) _race[i] = player_get_race(i);
while(true)
{	
	for(var i = 0; i < maxp; i++) if player_is_active(i)
	{
		var r = player_get_race(i);
		if(_race[i] != r && r == "chrononaut")
		{
			sound_play_pitchvol(sndEliteInspectorFire,0.6,0.5)
			sound_play_pitchvol(sndMutant8Wrld,2.4,1)
			sound_play_pitchvol(sndEnergyScrewdriverUpg,1.3,1)
			wait 3
			sound_play_pitchvol(sndEnergyScrewdriverUpg,0.7,1)
			wait 2
			sound_play_pitchvol(sndEnergyScrewdriverUpg,0.6,1)
		}
		_race[i] = r;
	}
	wait(1);
}


#define create
//SPRITES
spr_idle = undefined;
spr_walk = undefined;
spr_hurt = global.spr_hurtout;
spr_dead = global.spr_dead;
spr_sit1 = undefined;
spr_sit2 = undefined;
spr_menu = global.spr_holoidle;
spr_to = global.spr_hurt;
spr_slct = global.spr_idle;
spr_from = global.spr_hurt;

spr_holoidle = undefined;
spr_holowalk = undefined;
spr_sparkles = global.spr_sparkles;
spr_trail = undefined;
spr_trailsmol = global.spr_trailsmol;
spr_trailbig = global.spr_trailbig;
spr_warp = global.spr_warp;
spr_icon = global.spr_iconnormal;
	
//VARIOUS VARIABLES
Cooldown = 0;
j=0;
i=0;
time= 100;
repeat(time)
{
	trail[i,0]=x;
	trail[i,1]=y;
	
	pasthp[i]=0;
	pastdmg[i]=0;
	
	i++;
}
specswitchx = 0;
specswitchy = 0;
wasded = false;
lastarea = GameCont.hard;
delay = 15
redtimer = 0;
hptravel = 0;
spirittravel = 0;
wallbud = noone;
tips = array_create(0);
tip1 = ["@bEXPLOSION @sDAMAGE SCALES WITH YOUR LEVEL","@bREWINDING TIME @sRECOVERS#SOME OF YOUR LOST @rHP","WELCOME TO THE PAST","NO NEED FOR ROADS","@bFREEZE@s, PUNK"]
tip2 = ["INSIGHTFUL ULTRA TIP","TOTAL RECALL"]
pitch = 1;
bomboblast = 0;
flames = true;
trails = true;

// SOUNDBANK
snd_hurt = (sndPlasmaMinigunUpg)
snd_dead = (sndIDPDNadeExplo)
snd_lowa = (sndIDPDNadeAlmost)
snd_lowh = (sndShielderDeflect)
snd_crwn = (sndUltraLaser)
snd_chst = (sndEliteInspectorFire)
snd_wrld = (sndDevastator)
snd_valt = (sndIDPDNadeLoad)
snd_spch = (sndPlasmaHugeUpg)
snd_idpd = (sndEnergySwordUpg)
snd_cptn = (sndPlasmaHugeUpg)

#define race_swep
return "idpdslugpistol";

#define race_mapicon
if array_length(instances_matching(Player,"race","chrononaut"))
	return instances_matching(Player,"race","chrononaut")[0].spr_icon;

#define race_menu_button
sprite_index = global.spr_menu_button;

#define race_skin_button(index)
switch(index)
{
	case 0: sprite_index = global.spr_loadout; break;
	case 1: sprite_index = global.spr_loadout; break;
}

#define race_portrait
return global.spr_portrait;

#define race_name
return "CHRONONAUT";

#define race_text
return "@bCHARGED @sSHOTS#@sCAN @bREWIND TIME";

#define race_tb_text
return "WARPING TIME ATTRACTS NEARBY @wENEMIES"

#define race_ttip
return tips

#define race_ultra_name
switch (argument0)
{
	case 1: return "TOTAL RECALL";
	case 2: return "ABSOLUTE UNIT";
	default: return "";
}

#define race_ultra_text
switch (argument0)
{
case 1: return "@bREWINDING TIME @sAPPLIES#TO @wENEMIES @sAND @wPROJECTILES#@sWIDER TIME-SPAN AND @rFULL HEALING";
case 2: return "@bTIME EXPLOSIONS @sCREATE#CHAINS OF EXPLOSIONS";
default: return "";
}

#define race_ultra_take
if ultra_get("chrononaut",1)
{
	sound_play(sndPlasmaHugeUpg)
	
	with instances_matching(Player,"race","chrononaut")
	{
		time = 200
		
		i=0;
		repeat(time)
		{
			trail[i,0]=x;
			trail[i,1]=y;
			
			pasthp[i]=my_health;
			pastdmg[i]=0;
			
			shot[i,0]=-1; // object_index
			shot[i,1]=0; // speed
			shot[i,2]=0; // direction
			shot[i,3]=0; // damage
			shot[i,4]=0; // force
			shot[i,5]=0; // count (multiple shots)
	
			i++;
		}
		
		Cooldown = 0;
	}
	
}
else if ultra_get("chrononaut",2)
{
	sound_play(sndPlasmaHugeUpg)
}

#define game_start
ultra_set("chrononaut",1,0)
ultra_set("chrononaut",2,0)
specswitchx=x;
specswitchy=y;
spr_hurt = global.spr_hurtout

bombobalst = 4

if (!ultra_get("chrononaut",1) && !ultra_get("chrononaut",2))
	tips = tip1
else
	tips = tip2

sound_play_pitchvol(sndMutant8Spch,2.4,1)
sound_play_pitchvol(sndEliteInspectorFire,0.7,0.5)
sound_play_pitchvol(sndEnergyScrewdriverUpg,0.6,1)
wait 4
sound_play_pitchvol(sndEnergyScrewdriverUpg,0.7,1)
wait 4
sound_stop(sndEliteInspectorFire)
sound_play_pitchvol(sndEnergyScrewdriverUpg,0.4,1)
wait 6
sound_stop(sndEnergyScrewdriverUpg)
sound_stop(sndMutant8Spch)

#define step
// SND_WRLD CUSTOMIZATION
if GameCont.hard != lastarea && GameCont.area = 1 && GameCont.subarea = 1 && sound_exists(snd_wrld)
{
	sound_play_pitchvol(sndEnergyScrewdriverUpg,0.7,1)
	sound_play_pitchvol(sndMutant8Wrld,2,0.7)
	sound_play_pitchvol(sndInspectorEnterM,1.3,1)
}

// TIPS
if (!ultra_get("chrononaut",1) && !ultra_get("chrononaut",2))
	tips = tip1
else
	tips = tip2

// SPRITES MANAGEMENT
spr_idle = global.spr_idle;
spr_walk = global.spr_walk;
spr_hurt = global.spr_hurt;
spr_dead = global.spr_deadout;
spr_sit1 = global.spr_sit1;
spr_sit2 = global.spr_sit2;
spr_trailsmol = global.spr_trailsmol;
spr_trailbig = global.spr_trailbig;
spr_warp = global.spr_warp;
spr_holoidle = global.spr_holoidle;
spr_holowalk = global.spr_holowalk;
spr_sparkles = global.spr_sparkles;
spr_icon = global.spr_iconnormal;

// POST-DEATH TRAIL MANAGEMENT
if wasded
{
	i=0;
	repeat(time)
	{
		trail[i,0]=x;
		trail[i,1]=y;
		
		pasthp[i]=my_health;
		pastdmg[i]=pasthp[(i+1)%time]-pasthp[i];
		
		i++;
	}
	current_time_scale = 30/room_speed
}

// ENEMY TRAIL
if ultra_get("chrononaut",1) with (enemy)
{
	if ("i" not in self && "trail" not in self)
	{
		i = 0
		trail = array_create(other.time)
		
		repeat(other.time) {trail[i,0] = x; trail[i,1] = y; i++;}
	}
	if i > other.time-1
	i=0;

	if (other.Cooldown < other.delay)
	{
		trail[i,0]=x
		trail[i,1]=y
		
		i++
	}
}

//TRAIL MANAGEMENT
if i >time-1
	i=0

if (Cooldown < time-delay) && (floor(current_frame%floor(1/current_time_scale)) == 0)
{
	trail[i,0]=x
	trail[i,1]=y
	
	if ultra_get("chrononaut",1)
	{
		shot[i,5]= array_length(instances_matching(instances_matching(projectile, "creator", self), "bbd", true)) // count
		if shot[i,5]
		{
			shot[i,0]= instances_matching(instances_matching(projectile, "creator", self), "bbd", true)[0].object_index
			shot[i,1]= instances_matching(instances_matching(projectile, "creator", self), "bbd", true)[0].speed
			shot[i,2]= instances_matching(instances_matching(projectile, "creator", self), "bbd", true)[0].direction
			shot[i,3]= instances_matching(instances_matching(projectile, "creator", self), "bbd", true)[0].damage
			shot[i,4]= instances_matching(instances_matching(projectile, "creator", self), "bbd", true)[0].force
		}
	}
	
	i++
	if i >time-1
	i=0
	
	pastdmg[i] = pasthp[i] - my_health
	pasthp[i]=my_health
	if pastdmg[i] < 0
	{
		var j = 0
		repeat(time){pasthp[j]=my_health; pastdmg[j]=0; j++;}
	}
}

// "FORCED CONSTANTS" (don't laugh)
image_alpha=1
if distance_to_object(Portal) <= 5
	image_alpha = 0
canwalk = 1
snd_hurt = (sndPlasmaMinigunUpg)
if (my_health = 0 && candie = 0 && Cooldown!= time-delay)
	my_health = hptravel
if instance_exists(wallbud) instance_delete(wallbud)

//TIMERS MANAGEMENT
if (Cooldown > -time)
	{
		if Cooldown < time-delay
			Cooldown-= current_time_scale*(1+(ultra_get("chrononaut",1) && Cooldown <= 0))
		else
			Cooldown--
	}
else
	Cooldown = -time
if (redtimer > 0) redtimer--;
if (Cooldown = -time) redtimer = 0;

// B O M B O B L A S T
if (bomboblast < 3*GameCont.level)
	bomboblast += 0.03*(GameCont.level/2)*current_time_scale
else
	bomboblast = 3*GameCont.level;

// TIMECLONE
if (i==time-1 || wasded) && !array_length(instances_matching(CustomObject,"creator",self))
{
	with instance_create(trail[i,0],trail[i,1],CustomObject)
	{
		creator = other
		script_bind_draw(draw_chrono, -2, creator, self)
		creator.lastarea = GameCont.hard
		index = other.index
		spr_shadow = mskNone
		maxspeed=0
	}
	
	wasded = false
}

with instances_matching(CustomObject,"creator",self)
{
	image_alpha = ((creator.Cooldown > 0 && creator.Cooldown < creator.time-creator.delay)? 0 : 1)
	
	if (creator.Cooldown >= 0 && creator.Cooldown<creator.time-creator.delay)
		image_alpha = 0;
	
	if (creator.trail[(creator.i+1)%creator.time,0]-creator.trail[(creator.i)%creator.time,0] != 0)
	{
		image_xscale = sign(creator.trail[(creator.i+1)%creator.time,0]-creator.trail[(creator.i)%creator.time,0]);
	}
	
	x = (creator.trail[(creator.i)%creator.time,0] + creator.trail[(creator.i+1)%creator.time,0])/2
	y = (creator.trail[(creator.i)%creator.time,1] + creator.trail[(creator.i+1)%creator.time,1])/2
	
	if distance_to_object(creator) = 0
		image_xscale = creator.right
}

// WHEN TRAIL IS UP (COOLDOWN < 0)
if Cooldown<=0
{
	// STUFF DONE ONCE
	if (Cooldown = 0)
	{
		sound_stop(sndPortalStrikeLoop);
		sound_play_pitchvol(sndPlasmaReloadUpg,1.75,2.5);
        sound_play_pitchvol(sndLightningPistol,1.25,1.25);
		repeat(time) {trail[(i)%time,0]=x;trail[(i)%time,1]=y;i++;}
		
	}
	
	if Cooldown = -(time-current_time_scale-ultra_get("chrononaut",1)) // this means that this is done just moments before the clone starts to move again (and once, since Cooldown = -time when the player can spec)
	{
		sound_play_pitchvol(sndLaserCannonCharge,1.3,1.2);
	}
	
	// SPARKLES SOUND
	if (Cooldown!= -time && Cooldown < -delay)
	{
		if(Cooldown%floor(irandom_range(4,8)/current_time_scale)=0) sound_play_pitchvol(sndLightningHit,random_range(1.1,1.2),0.9);
		if (Cooldown%floor(irandom_range(8,12)/current_time_scale)=0) sound_play_pitchvol(sndLightningReload,random_range(0.9,1.0),0.8);
		if (Cooldown%floor(irandom_range(12,16)/current_time_scale)=0) sound_play_pitchvol(sndLightningHammer,random_range(0.8,0.9),0.3);
		
		if button_pressed(index, "spec")
		{
			sound_play_pitchvol(sndEnergyScrewdriverUpg,0.57,1.5);
			sound_play_pitchvol(sndRogueCanister,0.4,1.3);
			
			redtimer = floor(18/current_time_scale)
		}
		
		if (bomboblast < 3*GameCont.level)
			bomboblast += 0.04*(GameCont.level/2)*current_time_scale
		else
			bomboblast = 3*GameCont.level
	}
	
	// ACTIVE
	if button_pressed(index, "spec") && Cooldown = -time
	{
		specswitchx=trail[(i)%time,0];
		specswitchy=trail[(i)%time,1];
		
		hptravel = my_health;
		spirittravel = canspirit;
		
		sound_play(sndPlasmaMinigunUpg);
		
		Cooldown = time;
		STOPIT = 0;

		sound_play(sndDevastator);
	}
}

// WHEN TRAIL IS DOWN (COOLDOWN > 0)
else
{
	if (Cooldown<time-delay) // AFTER TIMETRAVEL
	{
		spr_idle = global.spr_idleout;
		spr_walk = global.spr_walkout;
		spr_hurt = global.spr_hurtout;
		spr_dead = global.spr_deadout;
		spr_icon = global.spr_iconout;
		
		image_alpha = 1
		
		with instances_matching(CustomObject,"creator",self)
		{
			image_alpha = 0;
		}
	}
	
	if (Cooldown >= time-delay) // TIMETRAVEL
	{
		speed = 0;
		if (GameCont.hard == lastarea)
		{
			x = trail[(i - floor((delay -(Cooldown -(time-delay)))*time/delay) + time)%time,0]
			y = trail[(i - floor((delay -(Cooldown -(time-delay)))*time/delay) + time)%time,1]
		}
		if ultra_get("chrononaut",1) with(enemy)
		{
			x = trail[(i - floor((other.delay -(other.Cooldown -(other.time-other.delay)))*other.time/other.delay) + other.time)%other.time,0]
			y = trail[(i - floor((other.delay -(other.Cooldown -(other.time-other.delay)))*other.time/other.delay) + other.time)%other.time,1]
			
			sprite_index = spr_hurt
		}
		if ultra_get("chrononaut",1) with(projectile)
		{
			if image_alpha > 0
				image_alpha -= 1/other.delay
			else
				instance_delete(self)
		}
		
		image_alpha = 0;
		
		if (Cooldown != time-delay)
		{
			my_health = hptravel;
			candie = 0;
			canspirit = spirittravel;
			
			// time distortion, https://www.wolframalpha.com/input/?i=(5%2F9)%5Ex%2B(1.5)%5E(x-15) to see the plot yourself (it's an old version but you get the idea) (this took me a whole hour of testing, you'd better appreciate it)
			current_time_scale = (power(5/9,time - Cooldown) + power(1.5,(time - Cooldown) - delay));
			// (it sounded like a printer) so i shifted it and scaled it back to normal (he pitch starts at 1, goes down quickly to 0.3 (or at least really close to it) and goes back to 1 quickly)
			pitch = (power(5/9,time - Cooldown) + power(1.5,time - Cooldown - room_speed/30*delay) + 0.3)/1.3;
			if button_check(index, "spec") && delay < 50
				delay++
		}
		
		snd_hurt = sndLogoLoop;
		sound_play_pitchvol(sndLogoLoop,10,5);
		
		if !instance_exists(wallbud)
		{
			with instance_create(x,y,Wall)
			{
				outspr = mskNone;
				image_alpha = 0;
				mask_index = mskNone;
				creator = other.id;
				other.wallbud = id;
			}
		}
		
		else with wallbud
		{
			x = other.bbox_left
			y = other.bbox_top
		}
		
		if skill_get(mut_throne_butt) with enemy
		{
			if "orig_friction" not in self orig_friction = friction
			speed = 1
			friction = -10000*(size+1)/power(distance_to_point(other.trail[other.i%other.time,0],other.trail[other.i%other.time,1]),1 + (distance_to_point(other.trail[other.i%other.time,0],other.trail[other.i%other.time,1])>100))
			friction = clamp(friction,-distance_to_point(other.trail[other.i%other.time,0],other.trail[other.i%other.time,1]),0)
			direction = point_direction(x,y,other.trail[other.i%other.time,0],other.trail[other.i%other.time,1])
		}
	}
	
	if (Cooldown = time-delay + floor(delay/5))
	{
		if !ultra_get("chrononaut",2)
		{
			with instance_create(specswitchx, specswitchy, PopoExplosion)
			{
				sprite_index = global.spr_explo
				image_alpha = 0
				
				damage = (10 + 2 * GameCont.level)*(1 + ultra_get("chrononaut",2))
				team = other.team
				if (ultra_get("chrononaut",2))
				{
					image_xscale *= 1.25;
					image_yscale *= 1.25;
				}
				
				image_angle = 0
			}
				
			repeat (4) with instance_create(specswitchx+random_range(-14,14), specswitchy+random_range(-14,14), BlueFlame)
			{
				creator = other
				image_alpha = 0
			}
		}
		else
			ultra_explode(specswitchx,specswitchy,6)
	}
	
	if (Cooldown = time-delay) // AFTER DELAY HAS ELAPSED, COMPLETE TIMETRAVEL
	{
		
		delay = 15;
		Cooldown = time-delay;
		canwalk = 0;
		if ultra_get("chrononaut",1)
			bomboblast = 3*GameCont.level;
		speed = 0;
		current_time_scale = 30 / room_speed;
		
		if !ultra_get("chrononaut",1)
		{
			if (floor(pastdmg[i]/2) > 0)
			{
				with instance_create(x,y,PopupText){text = "+" + string(floor(other.pastdmg[other.i]/2)) + " HP";}
				my_health += floor(pastdmg[i]/2);
				sound_play(sndHPPickup);
			}
		}
		else
		{
			if (pastdmg[i] > 0)
			{
				with instance_create(x,y,PopupText){text = "+ " + string(other.pastdmg[other.i]) + " HP";}
				my_health += pastdmg[i]
				sound_play(sndHPPickup);
			}
		}
		
		candie = 1;
		spr_idle = global.spr_idle;
		spr_walk = global.spr_walk;
		spr_hurt = global.spr_hurt;
		spr_dead = global.spr_deadout;
		spr_icon = global.spr_iconnormal;
		
		sound_play_pitchvol(sndIDPDNadeExplo,2,1)
		sound_play_pitchvol(sndPortalStrikeLoop,0.65,2.5)
		
		if skill_get(mut_throne_butt) with enemy friction = orig_friction
	}
}

// WHEN THE PLAYER DIES OR THE LEVEL CHANGES
if my_health <= 0 || GameCont.hard != lastarea
{
	with instances_matching(CustomObject,"creator",self) instance_destroy();
	wasded = true;
	sound_play_pitchvol(sndIDPDNadeExplo,2,1);
	Cooldown = time-delay-1;
	redtimer = 0;
}

if (image_alpha=0)
	canfire = 0
else
	canfire = 1

if (current_time_scale)*room_speed/30 = 1 pitch = 1
if (global.last_pitch != pitch)
{
	global_pitch(pitch);
	global.last_pitch = pitch;
	
	sound_pitch(sndPortalStrikeLoop , 0.65*pitch)
	sound_pitch(sndIDPDNadeExplo, 2*pitch)
	sound_stop(sndLogoLoop)
}

lastarea = GameCont.hard;
lasthealth = my_health;

for(var o = 0; o < maxp; o++) if(button_pressed(o, "paus"))
	current_time_scale = 30/room_speed;

if distance_to_object(Portal) <= 5
	spr_hurt = global.spr_hurtout

// PASSIVE
with instances_matching(projectile,"creator",self)
{
	bbd = ("bbd" not in self? true : false)
}

if bomboblast = 3*GameCont.level with instances_matching(projectile,"creator",self) if ("bbd" in self && bbd)
{
	if "timefrz" not in self timefrz = true
	image_blend = player_get_color(other.index)
	sound_play_pitchvol(sndEliteInspectorFire,2.6,power(creator.bomboblast/4/GameCont.level,2))	
	other.bomboblast = 0
}

with instances_matching(instances_matching(projectile,"creator",self),"timefrz",true)
{
	damage += GameCont.level/array_length(instances_matching(instances_matching(projectile,"creator",self),"timefrz",true))
	
	if place_meeting(x+hspeed,y+vspeed,enemy) with instance_create(x+hspeed,y+vspeed,CustomObject)
	{
		creator = other.creator
		name = "dummy_targ"
		sprite_index = other.sprite_index
	}
}

with enemy
{
	with instances_matching(instances_matching(CustomObject,"creator",other),"name","dummy_targ")
	{
		if place_meeting(x,y,other)
		{
			if "img_spd" not in other other.img_spd = other.image_speed
			if "frzx" not in other other.frzx = other.x
			other.frzx = other.x
			if "frzy" not in other other.frzy = other.y
			other.frzy = other.y
			if "_freeze" not in other other._freeze = 30
			other._freeze = 30
			instance_destroy()
		}
	}
	
	if "_freeze" in self
	{	
		if _freeze > 0
		{
			image_blend = c_aqua
			image_speed = 0
			x = frzx
			y = frzy
			alarm0 = 2
			alarm1 = 2
			
			_freeze -= current_time_scale
		}
		else
		{
			image_blend = c_white
			image_speed = img_spd
		}
	}
}

with instances_matching(instances_matching(CustomObject,"creator",other),"name","dummy_targ")
	instance_destroy()

//ULTRA A (PROJECTILES)
if ultra_get("chrononaut",1)
{
	var _obj_ind = shot[i%time,0]
	var _speed = shot[i%time,1]
	var _dir = shot[i%time,2]
	var _dmg = shot[i%time,3]
	var _force = shot[i%time,4]
	var _count = shot[i%time,5]

	if (_count && Cooldown > 0) repeat(_count) with instance_create(trail[i,0],trail[i,1],_obj_ind)
	{
		speed = _speed
		direction = _dir + _count*random_range(-4,4)
		image_angle = direction
		damage = _dmg
		force = _force
		team = other.team
		creator = other
		if "bbd" not in self
			bbd = false
		sound_play_pitchvol(sndEliteInspectorFire,2.6,0.6)
	}
}

#define draw
image_xscale = right

// PLAYER
shader_set(global.shd_chrono)
shader_set_vertex_constant_f(0, matrix_multiply(matrix_multiply(matrix_get(matrix_world), matrix_get(matrix_view)), matrix_get(matrix_projection)))
if !redtimer
{
	shader_set_fragment_constant_f(0, [color_get_hue(player_get_color(index))/255])
	shader_set_fragment_constant_f(1, [color_get_saturation(player_get_color(index))/255])
}
else
{
	shader_set_fragment_constant_f(0, [(6-4*dcos(100*(floor(18/current_time_scale)-redtimer)))/360])
	shader_set_fragment_constant_f(1, [(177 + 30*dcos(100*(floor(18/current_time_scale)-redtimer)))/200])
}
shader_set_fragment_constant_f(2, [(1+dcos(current_frame*4))*0.29 + 0.61])

if time-Cooldown < delay || distance_to_object(Portal) <= 5
	image_alpha = 0
else
	image_alpha = 1

if image_alpha != 0
	draw_self()
shader_reset()

if !(image_alpha != 0 && distance_to_object(Portal) > 5)
	draw_sprite_chrono(spr_hurt,1,x,y,image_xscale,image_yscale,-current_frame*31%360,image_blend,1,player_get_color(index),0)

// EXPLOSIONS
var _explos = instances_matching(PopoExplosion, "sprite_index", global.spr_explo)
for (var i = 0; i<array_length(_explos); i++)
{
	draw_sprite_chrono(global.spr_explo,_explos[i].image_index,_explos[i].x,_explos[i].y,_explos[i].image_xscale,_explos[i].image_yscale,_explos[i].image_angle,_explos[i].image_blend,1,player_get_color(index),0)
}

// SPARKLES (ON PLAYER)
if (Cooldown != -time && Cooldown < -delay)
	if Cooldown%(1/current_time_scale) = 0
		draw_sprite_chrono(spr_sparkles, irandom(10), x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha, player_get_color(index), redtimer)

// WARP
if (time-Cooldown < delay)
{
	var _rot = 0
	if ((trail[(i+1 - floor((delay -(Cooldown -(time-delay)))*time/delay) + time)%time,1]-y) != 0 && (trail[(i+1 - floor((delay -(Cooldown -(time-delay)))*time/delay) + time)%time,0]-x) != 0) && ((trail[(i+1 - floor((delay -(Cooldown -(time-delay)))*time/delay) + time)%time,1]-y) == 0 && (trail[(i+1 - floor((delay -(Cooldown -(time-delay)))*time/delay) + time)%time,0]-x) != 0)
		_rot = (trail[(i+1 - floor((delay -(Cooldown -(time-delay)))*time/delay) + time)%time,1]-y)/(trail[(i+1 - floor((delay -(Cooldown -(time-delay)))*time/delay) + time)%time,0]-x)
	draw_sprite_chrono(spr_warp, image_index, x, y, 1.3 + cos(delay/15*delay)/5, 1.3 + sin(delay/15*delay)/5, _rot, image_blend, image_alpha, player_get_color(index), 0)
	
	image_index += 0.5
}

image_xscale = 1

#define draw_chrono(timeboi, timeclone)
// "this draws stuff, any questions?" - Sreak, the sprite-slave
image_speed = 0.499;

if (instance_exists(timeboi) && instance_exists(timeclone))
{
	// HEALTH-REGEN TEXT
	draw_set_colour(c_red)
	draw_set_halign(fa_center)
	if !ultra_get("chrononaut",1)
	{
		if  (timeboi.i<timeboi.time) && (floor(timeboi.pastdmg[(timeboi.i)]/2) > 0) && (timeboi.Cooldown = -timeboi.time || timeboi.time-timeboi.Cooldown < timeboi.delay)
			draw_text_shadow(timeboi.x, timeboi.y+17, string(floor(timeboi.pastdmg[(timeboi.i)]/2)))
	}
	else
	{
		if  timeboi.i<timeboi.time && timeboi.pastdmg[(timeboi.i)] > 0 && (timeboi.Cooldown = -timeboi.time || timeboi.time-timeboi.Cooldown < timeboi.delay)
		draw_text_shadow(timeboi.x-8, timeboi.y+17, string(timeboi.pastdmg[(timeboi.i)]))
	}
	draw_set_colour(c_white)
	draw_set_halign(fa_left)
	
	// HOLOGRAM
	var _holo = timeboi.spr_holowalk
	if (timeboi.trail[(timeboi.i)%timeboi.time,0] == timeboi.trail[(timeboi.i+1)%timeboi.time,0]   &&   timeboi.trail[(timeboi.i)%timeboi.time,1] == timeboi.trail[(timeboi.i+1)%timeboi.time,1]) || (timeboi.Cooldown > timeboi.time-timeboi.delay)
		_holo = timeboi.spr_holoidle
	if (timeclone.image_alpha != 0 && !ultra_get("chrononaut",1)) || ultra_get("chrononaut",1)
		draw_sprite_chrono(_holo, timeboi.image_index, timeclone.x, timeclone.y, timeclone.image_xscale,1,0, timeclone.image_blend, timeclone.image_alpha, player_get_color(timeboi.index),timeboi.redtimer)
	
	// SPARKLES (ON HOLO)
	if (irandom(100)< current_time_scale*(20 + 30*(timeclone.image_alpha==0 && point_distance(timeclone.x,timeclone.y,timeboi.x,timeboi.y)<=timeboi.maxspeed)) && timeboi.Cooldown < -timeboi.delay)
		draw_sprite_chrono(timeboi.spr_sparkles, irandom(10), timeclone.x, timeclone.y, 1, 1, 0, image_blend, image_alpha,player_get_color(timeboi.index),timeboi.redtimer)
	
	// TRAIL
	var detract = timeboi.time/2;
	timeboi.spr_shadow = shd24;
	
	if (timeboi.Cooldown <= 0)
	{
		detract = 1;
		
		if (timeboi.Cooldown != -timeboi.time)
			detract = (timeboi.time + timeboi.Cooldown)/8
	}
	
	if (timeboi.time-timeboi.Cooldown < timeboi.delay)
	{
		detract = floor((timeboi.delay -(timeboi.Cooldown -(timeboi.time-timeboi.delay)))*timeboi.time/2/timeboi.delay) + 1;
		
		timeboi.spr_trail = timeboi.spr_trailbig;
		timeboi.spr_shadow = mskNone;
	}
	else
		timeboi.spr_trail = timeboi.spr_trailsmol;
	
	if timeboi.trails
	{
		if (timeboi.Cooldown < timeboi.time - timeboi.delay)
			orig_timescale = current_time_scale * (1 + !ultra_get("chrononaut",1))/2/array_length(instances_matching(Player,"race","chrononaut"))
		j = timeboi.i + ceil(2/orig_timescale) - timeboi.i%ceil(2/orig_timescale);
		
		if timeclone.image_alpha != 0 repeat (floor(timeboi.time/2*orig_timescale) - floor(detract*orig_timescale))
		{
			j = j%timeboi.time;
			
			if timeboi.Cooldown = -timeboi.time
			{
				if (j = (2*(timeboi.i + floor(2/orig_timescale) - timeboi.i%floor(2/orig_timescale)))%timeboi.time)
				{
					image_xscale = 1.8
					image_yscale = 1.8
				}
				else if ((j + floor(2/orig_timescale))%timeboi.time = (2*(timeboi.i + floor(2/orig_timescale) - timeboi.i%floor(2/orig_timescale)))%timeboi.time || ((timeboi.time + j - floor(2/orig_timescale))%timeboi.time = (2*(timeboi.i + floor(2/orig_timescale) - timeboi.i%floor(2/orig_timescale)))%timeboi.time))
				{
					image_xscale = 1.5
					image_yscale = 1.5
				}
				else if ((j + 2*floor(2/orig_timescale))%timeboi.time = (2*(timeboi.i + floor(2/orig_timescale) - timeboi.i%floor(2/orig_timescale)))%timeboi.time || ((timeboi.time + j - 2*floor(2/orig_timescale))%timeboi.time = (2*(timeboi.i + floor(2/orig_timescale) - timeboi.i%floor(2/orig_timescale)))%timeboi.time))
				{
					image_xscale = 1.3
					image_yscale = 1.3
				}
				else if ((j + 3*floor(2/orig_timescale))%timeboi.time = (2*(timeboi.i + floor(2/orig_timescale) - timeboi.i%floor(2/orig_timescale)))%timeboi.time || ((timeboi.time + j - 3*floor(2/orig_timescale))%timeboi.time = (2*(timeboi.i + floor(2/orig_timescale) - timeboi.i%floor(2/orig_timescale)))%timeboi.time))
				{
					image_xscale = 1.1
					image_yscale = 1.1
				}
				else
				{
					image_xscale = 1
					image_yscale = 1
				}
			}
			else
			{
				image_xscale = 1
				image_yscale = 1
			}
			
			if !(timeboi.trail[j,0]==timeboi.trail[(j+1)%timeboi.time,0] && timeboi.trail[j,1]==timeboi.trail[(j+1)%timeboi.time,1])
				draw_sprite_chrono(timeboi.spr_trail, image_index, timeboi.trail[j,0], timeboi.trail[j,1], image_xscale, image_yscale, 180*(timeboi.Cooldown > timeboi.time-timeboi.delay)+point_direction(timeboi.trail[j,0],timeboi.trail[j,1],timeboi.trail[(j+1)%timeboi.time,0],timeboi.trail[(j+1)%timeboi.time,1]), image_blend, timeclone.image_alpha, player_get_color(timeboi.index), timeboi.redtimer)
			
			j+=floor(2/orig_timescale);
		}
	}
	
	// FLAMES
	if timeboi.flames
	{
		var _flames = instances_matching(BlueFlame, "creator", timeboi)
		for (var i = 0; i<array_length(_flames); i++)
		{
			var spr = _flames[i].sprite_index
			if (spr = sprBlueFlame || spr = sprBlueFlameBig)
				spr = global.spr_flame
			else if (spr = sprBlueFlameDisappear || spr = sprBlueFlameBigDisappear)
				spr = global.spr_flamedisappear
			
			draw_sprite_chrono(spr,_flames[i].image_index,_flames[i].x,_flames[i].y,_flames[i].image_xscale,_flames[i].image_yscale,_flames[i].image_angle,_flames[i].image_blend,1,player_get_color(timeboi.index),0)
		}
	}
	
	// PASSIVE BAR
	if "_perc" not in self _perc = timeboi.bomboblast/3/GameCont.level
	_perc = (timeboi.bomboblast/3/GameCont.level + _perc)/2
	if "_alpha" not in self _alpha = 1
	_alpha -= 0.05*current_time_scale
	if "_fade" not in self _fade = true
	if (_perc < timeboi.bomboblast/3/GameCont.level && _alpha < 0.3)
		_alpha = 0.3
	else if (_perc = 1 && _fade)
	{
		_alpha = 1.5
		_fade = false
		sound_play_pitchvol(sndIDPDNadeAlmost,3,1)
	}
	else if (_perc > timeboi.bomboblast/3/GameCont.level)
	{
		_alpha = 1.5
		_fade = true
	}
	if (timeboi.Cooldown + timeboi.delay > timeboi.time)
		_alpha = 0
	
	draw_set_alpha(abs(dcos(timeboi.gunangle))*_alpha)
	draw_set_colour(c_aqua)
	draw_rectangle(timeboi.x - 14*dcos(timeboi.gunangle), timeboi.y + 9, timeboi.x - 21*dcos(timeboi.gunangle), timeboi.y - 9, false)
	draw_set_colour(merge_colour(c_red,c_blue,power(_perc,2)))
	draw_rectangle(timeboi.x - 15*dcos(timeboi.gunangle), timeboi.y + 8, timeboi.x - 20*dcos(timeboi.gunangle), timeboi.y + 8 - 16*(_perc), false)
	draw_set_alpha(1)
	draw_set_colour(c_white)
}
else if (!instance_exists(timeboi)) instance_destroy();

#define global_pitch(_pitch)
for(var i = 0; i <= sndStrongSpiritLost; i++)
{
	sound_pitch(i, _pitch);
}

#define ultra_explode(_x,_y,_chain)
sound_play(sndExplosion)
with instance_create(_x, _y, PopoExplosion)
{
	if "chain_count" not in self
		chain_count = _chain
	sprite_index = global.spr_explo
	image_alpha = 0
	image_xscale = 1.2
	image_yscale = 1.2
	if "creator" in other
		creator = other.creator
	else
		creator = other
	team = creator.team
	script_bind_end_step(explo_step, -2, self)
}
repeat (4) with instance_create(_x+random_range(-14,14), _y+random_range(-14,14), BlueFlame)
{
	if "creator" in other
		creator = other.creator
	else
		creator = other
	image_alpha = 0
}
if object_index != Player
	instance_destroy()

#define explo_step
if instance_exists(argument0)
{
	if "start" not in self
		start = current_frame
	if "chain_count" not in self
		chain_count = argument0.chain_count - 1
	if "creator" not in self
		creator = argument0.creator
	if "team" not in self
		team = argument0.team
	if "targetx" not in self
		targetx = undefined
	if "targety" not in self
		targety = undefined
	if "max_dist" not in self
		max_dist = -1
	
	with enemy if distance_to_point(argument0.x,argument0.y) < 48*1.5
	{
		if other.max_dist < distance_to_point(argument0.x,argument0.y)
		{
			other.max_dist = distance_to_point(argument0.x,argument0.y)
			other.targetx = x
			other.targety = y
		}
	}
	if max_dist = -1
		chain_count = 0
}

if chain_count
{
	if start + 3*current_time_scale <= current_frame
	{
		ultra_explode(targetx,targety,chain_count)
		instance_destroy()
	}
}
else if !instance_exists(argument0)
	instance_destroy()

#define draw_sprite_chrono(_sprite,_subimg,_x,_y,_xscale,_yscale,_rot,_color,_alpha,_shadercol,_red)
if sprite_exists(_sprite)
{
	shader_set(global.shd_chrono)
	shader_set_vertex_constant_f(0, matrix_multiply(matrix_multiply(matrix_get(matrix_world), matrix_get(matrix_view)), matrix_get(matrix_projection)))
	if (!_red)
	{
		shader_set_fragment_constant_f(0, [color_get_hue(_shadercol)/255])
		shader_set_fragment_constant_f(1, [color_get_saturation(_shadercol)/255])
	}
	else
	{
		shader_set_fragment_constant_f(0, [(6-4*dcos(100*(floor(18/current_time_scale)-_red)))/360])
		shader_set_fragment_constant_f(1, [(177 + 30*dcos(100*(floor(18/current_time_scale)-_red)))/200])
	}
	shader_set_fragment_constant_f(2, [(1+dcos(current_frame*4))*0.29 + 0.61])
	texture_set_stage(0, sprite_get_texture(_sprite, _subimg))
	draw_sprite_ext(_sprite, _subimg, _x, _y, _xscale, _yscale, _rot, _color, _alpha)
	shader_reset()
}