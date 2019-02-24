#define init 
	global.badend = 0;
#define game_start 
	global.badend = 0;
#define step 
	if GameCont.area = 106 && instance_exists(Messenger) && GameCont.loops >= 3{
		global.badend = 1;
		with(LastCutscene){
			var _x = x, _y = y;
			my_health = 0; // Creates a broken table prop here, does my work for me.
			with(BigTV) my_health = 0;
			sound_play_pitchvol(sndCrownRisk,1,0.4);
			wait 5;
			
			sound_stop_all(); // For dramatic effect
			sound_loop(amb106);
			with(Floor) image_blend = make_color_rgb(80,60,60);
			with(FloorMiddle) image_blend = make_color_rgb(80,60,60);
			with(Wall) image_blend = make_color_rgb(80,60,60);
			with(TopSmall) image_blend = make_color_rgb(80,60,60);
			with(TopPot) image_blend = make_color_rgb(80,60,60);
			background_color = make_color_rgb(77,59,59);
			BackCont.shadcol = make_color_rgb(40,20,20);
			
			with(instance_create(_x,_y,LastExecute)) alarm1 = -1;
			with(hitme) image_blend = make_color_rgb(80,60,60);
			with(Corpse) image_blend = make_color_rgb(80,60,60);
			var d = room_speed * 20;
			if(fork()){
				while(d > 0){
					d --;
					wait 1;
				}
				with(Messenger){
					event_perform(ev_alarm,3);
					TopCont.fadeout = 1;
					sound_stop_all();
				}
				exit;
			}
		}
	}
	if (global.badend){
		if random(5) < 1 sound_play_pitchvol(choose(sndRogueRifle,sndRogueRifle),1,0.4);
		if current_time mod 2 + irandom(3) = 0{
			sound_play_pitchvol(choose(sndRogueRifle,sndRogueRifle,sndExplosion),1,0.4);
			if current_time mod 20 = 0{
				var sndid = choose(sndGruntDeadM,sndGruntDeadF,sndGruntDeadM,sndGruntDeadF,sndInspectorDeadM,sndInspectorDeadF,sndShielderDeadM,sndShielderDeadF,sndGruntHurtM,sndGruntHurtF,sndInspectorHurtM,sndInspectorHurtF,sndShielderHurtM,sndShielderHurtF,sndGruntThrowNadeM,sndGruntThrowNadeF);
				if sndid = sndGruntThrowNadeM || sndid = sndGruntThrowNadeF
					instance_create(9000 + choose(0,2000),9000,PopoNade);
				sound_play_pitchvol(sndid,1,0.4);
			}
		}
		if current_time mod 3 + irandom(4) = 0{
			sound_play_pitchvol(choose(sndRogueRifle,sndRogueRifle),1,0.4);
			if current_time mod 20 = 0{
				var sndid = choose(sndFreakPopoHurt,sndFreakPopoDead);
				sound_play_pitchvol(sndid,1,0.6);
				if sndid = sndFreakPopoDead{
					if(fork()){
						wait 90;
						sound_play_pitchvol(sndFreakPopoReviveArea,1,0.6);
						wait 30;
						sound_play_pitchvol(sndFreakPopoRevive,1,0.6);
						sound_play_pitchvol(sndFreakPopoEnter,1,0.6);
						exit;
					}
				}
			}
		}
		TopCont.fade = clamp(TopCont.fade,0,99);
		if GameCont.area != 106 global.badend = false;
	}