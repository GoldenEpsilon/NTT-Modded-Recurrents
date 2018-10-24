#define init
global.sprSkinButton = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAIAAACHPC9vAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwQAADsEBuJFr7QAAABl0RVh0U29mdHdhcmUAcGFpbnQubmV0IDQuMC4xOdTWsmQAAAF3SURBVEhLrZXBUcNAEASdjb+UA+DDR1EQBKU4eCoV0iETM7oZ7Q2jk8uo6NqS7/ZmWwYjfPm4Xb0+X1+erBjsosg9WTUuURz/qbooDk7Uv4qidboeiaYdEfAaizj2tYP9CLO6iCGiuQMUatS4RGhViAsyz3MsiOe7yIdDBKAIC4iRQ5F33hvajAJYryK8eBdwyz6gSJudBbB/qRW7wNdDIsztKvI913Ud4slaS0R4AGLr7GPkl4hEYs8wkCKElmVZbzdN9/sbrtXnFjDAfrF+alpuFqeGsVBrA02NtUF9/EQRo5pHp0X/0bDBGe4cxVw0URRp2H9H6PJR+DZ8Uq0GYggPRGUBym7sLYBJdw1EgI8FZ1zEvkIh4ipENYZribgFCpkIVz394LQI6N8IXSViGhyJAJMU0dC/jsqFHGbc4i72w5LfazgAPox60KxBifxNxd/rEYyVpYvoYsKpm2Oh1gaaZUF1EQpnSjU43Dx6elpboNlnb9cfkZmAJ6KtTZ8AAAAASUVORK5CYII=", 1, 12, 16)
global.sprSkinIcon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAAAeklEQVQ4T7WQUQ6AMAhDd3SOwrG8DY4lJWzrzKbx40VaSjUWM/sENU+g5gnUPGE2L38MHiC7TqiqObSkerFPfhyJSARAK0qHIGdpgc8OCqBZdirIb13NjwWYHRxBs+w//wA6f8G4w1wTBD/c8SqTsQo2yK4Tb6DmPlZu+h/nX9OjQeMAAAAASUVORK5CYII=", 1, 8, 8)

#define skill_name
	return "Steel Nerves";
	
#define skill_text
	return "Chance to take 1 less damage";

#define skill_button
	sprite_index = global.sprSkinButton;
	
#define skill_icon
	return global.sprSkinIcon;

#define skill_tip
	return "You've got nerves of steel.";
	
#define skill_take
	sound_play(sndMutStrongSpirit);
	
#define step

with Player {
    if (fork()) {
        var OldHealth = my_health;
        if(my_health > 0){
            candie = 0;
        }
        wait 0;
        if(instance_exists(self)){
            if (my_health < OldHealth && irandom(1) && my_health + 1 <= maxhealth){
                my_health++;
            }
            candie = 1;
        }
        exit
    }
}