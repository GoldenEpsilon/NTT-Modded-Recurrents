#define init 
global.sprHUDIcon = sprite_add("Racingthoughtsicon.png", 1, 8, 8);
global.sprButton = sprite_add("racingthoughtsbutton.png",1,12,16);
global.sprlaser = sprite_add("thoughtslightning.png",5,8,8);
global.thoughtstimer = 0;

#define game_start
global.thoughtstimer = 0;

#define skill_icon
	return global.sprHUDIcon

#define skill_button
	sprite_index = global.sprButton

#define skill_name
	return "RACING THOUGHTS"
	
#define skill_text
	return "@rKILLING @wENEMIES @sGRANTS #A @wTEMPORARY DAMAGE @sBONUS#KILLSTREAKS INCREASE @wTIME AND DAMAGE"
	
#define skill_take
sound_play(sndMutant3LowA)
sound_play(sndShotgun)
wait(6)
sound_play(sndPistol)
wait(6)
sound_play(sndSwapPistol)
wait(2)
sound_play(sndSwapShotgun)

#define step
with(Player){
if global.thoughtstimer > 0{
if random(90) > (global.thoughtstimer){
with instance_create(x,y,LaserBrain){
sprite_index = global.sprlaser
image_alpha = global.thoughtstimer * 0.025;
      }
    }
  }
}
     with(enemy){
    if "my_health" in self && "thoughts" not in self && my_health <= 0
	{
	thoughts = 1;
	if global.thoughtstimer = 0{
	global.thoughtstimer += 20;
	}else{
	global.thoughtstimer += 20;
	}
      }
   }

if global.thoughtstimer > 75{
global.thoughtstimer = 75
}

if global.thoughtstimer > 0{
global.thoughtstimer -= 1
}

with(projectile){
if team = 2{
if "thoughts" not in self{
thoughts = 1
if global.thoughtstimer > 1{
if global.thoughtstimer > 30{
damage *= 1.3
	}else{
damage *= 1.15
	}
      }
    }
  }
}

with(Slash){
if team = 2{
if "thoughts" not in self{
thoughts = 1
if global.thoughtstimer > 1{
if global.thoughtstimer > 60{
damage *= 1.3
damage = round(damage)
	}else{
damage *= 1.15
damage = round(damage)
	}
      }
    }
  }
}

#define skill_tip
return "SHOOT. RELOAD."