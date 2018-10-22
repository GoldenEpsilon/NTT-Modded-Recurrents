#define init
global.sprRocketButton = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAIAAACHPC9vAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAAAyklEQVRIS+2VwQ3CMAxFsw4nJDboAqzRI0tw6gDcYBZW6EThw4+c4Ag3DT5QCes1qpz8pyht1XAah5LpfGxEBbNIrWtE4kmkpleRRWqiA1eRanWzaVEMAaim0Cq6v2qFaL6GGBPsUMGSZTVZJArplNgWkGKGhc1lUV32vj4Zw3S5CbBwFFc90oVSB+8n2u0PSJYllhoqVJM8twCXw2HDAnDn8/gFhxfShiKHbw3A4iOy+YuW+cH/Gq4vXTQkUbdL4llE1DqDt+A4PAAtPBt/4+NELAAAAABJRU5ErkJggg==", 1, 12, 16)
global.sprRocketIcon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAAAjUlEQVQ4T62TUQqAMAxDPerO4wH89Cy7WW0cwdZlDlThNTW1QQcuZvYJaSpKKQbufroZUWs18BCQPKc1XCT0I17Y50FktAy8QPtBAzIJ8As1ePmBiPqUM2DddhGilSEAh/pPQL+s4WL0vEAvIwOZHOLV50FkEoAmeU5r+MqEfqQzFAx4/S8ALH8K0NhyANmR7HPfYViJAAAAAElFTkSuQmCC", 1, 8, 8)

#define skill_name
	return "Rocket Casings";
	
#define skill_text
	return "@wBullets@d go @wfaster@d and do more @wknockback@d";

#define skill_button
	sprite_index = global.sprRocketButton;
	
#define skill_icon
	return global.sprRocketIcon;
	
#define skill_wepspec
	return 1;

#define skill_tip
	return "WHOOSH";
	
#define skill_take
	sound_play(sndMutTriggerFingers)
	
#define step

with(instances_matching(instances_matching(Bullet1,"rocket",null),"team",2)){
	speed = speed * 1.5;
	force = force * 2;
	rocket = true;
}
with(instances_matching(instances_matching(UltraBullet,"rocket",null),"team",2)){
	speed = speed * 1.5;
	force = force * 2;
	rocket = true;
}
with(instances_matching(instances_matching(HeavyBullet,"rocket",null),"team",2)){
	speed = speed * 1.5;
	force = force * 2;
	rocket = true;
}
with(instances_matching(instances_matching(Bullet2,"rocket",null),"team",2)){
	speed = speed * 1.5;
	force = force * 2;
	rocket = true;
}