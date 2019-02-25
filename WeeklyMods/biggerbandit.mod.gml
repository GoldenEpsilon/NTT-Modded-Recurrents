#define init
 // Sprites
global.sprScrapSleepIdle = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGYAAABOCAYAAADSIGM5AAAABmJLR0QAoACqALHh7X9FAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QEQFwEH4qMNvwAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAADI0lEQVR42u2cQWsTQRSAN0VPSkMalNJSFUGKaNWDxZve60UQj178f4IXe9CTPQilCtpUSkSkWiylEqWiJ6HrbfMS5mXm7c4mm/X7TkPY2U5m8z7em5ltkgAAAADA5GnU4DukdfyeM/w2eTBQI5WllovvrFzK2u252ay9/mp76rRGxPBgYNpVlrrUJJGakvR+/PJeP6S1ys4FEYPKYBpV5s2+rFrT0HS32dmr1LwQMagMqqyy1Kepg4OfphsuLLRya62z88V5nypojYhBZVA1lTkLRqkdLVOyak2ycv2i8/Pv+z3n54fHv519J7XORsSgMqiCyjJ9rd27YSr6QjIrmU2FMN88a9KXxji1RsSgMhinytK8HUMUZy0SrfoKyejmLyz3+37tjk1rRAwqAwunytbXUruZOxOTGglRmVVf2vUD9xRjGBzPNhGDymDqVGY6ICE1ZV3vCtFXiI6KIO8pM7ERY0tjZ2hEDCqDWAVmlPNdISrT1qm04k5buj+31M6txw/vtpxj1lSp/a1YhScRg8ogusq0gjHkIETIEn2R+8i+GtdureaeoJfrL5xakyor46waEYPKIFaB2fBpTWYvmoKkaoocrrCqT8vorMiMUep05sxp5xhGvE1gKkKJGFQGsVTm5Pzyzax91H3vvV6GuaayECWGFLZaIWldf5NIDWpak+ORO7NFik0iBpVBrALTW2xqhBy00HYetWwn1o5nEaTWtDcFYr3GTsSgMigjKwsJwzTGgE7+/O3rK3GvQWlrU0nSjTIpIUrc7x07szU5tqEMjQITlUF1CkxNX1ompmkhZDtAak1ma0PL6U7krqt12d+6tqapVX4ux7PZ2fNqjYhBZVBGgWnKvqTWQjIcbZdw4BekqOz+g4f9nKzbV9Dd21ejT9bGm92s/Wl3p9TnQcSgMihbZVF0F8Lq5cWsvfX5m1a4eRUqFSQVp6npyeNHzgyt0bri1OaQ1jgii8qgNiqbiBKlyj4enXg1JVXWbM1l7bevNyY+p0QMKoM6qSy3+mTh+fzZU2/HEdfz/8qAB4PKKpLFNUruS8SgMgAAAACA/55/VI8lzeoaHtgAAAAASUVORK5CYII=",1,54,28);
global.sprScrapSleepHurt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAATIAAABOCAYAAACjUZrLAAAABmJLR0QAoACqALHh7X9FAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QEQFwUBb6xtjgAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAAEXklEQVR42u3dz4sTZxjA8UT0VHFZF4so2lIQKdXqodJbe28vgvTYS/+/Qi96sKd6KIgtqKtISim2UimWVZT2VDC9zT4b5t28k8yPzMzncxpCNs7mifp+eZPJZAIAAAAAAADQpWnff4H5fD5f+ktOp1Ojbn80Y3j9mctmOGKuQN/5hwyQll1nY+VfWGa2lSeFTy+/XxzvnDxRHN/64aHMNBcrMgD/kAHSsi85KTnrzZaYJFHMk2jv5Zul91/IGclpLlZkgLQEkJZ9yUmZmZ8tKVVzJiWVOXd3n8pMc7EiA6QlgLTc5ISUmYenSsyT589fVXrAM2e2V86Z3Ue/lz7OCDPTXKzIAGkJIC37m5MjyczSN1LG3EjtWFXNmejypfdKb//72V7p7X+9/qf0Zwf8OU1zsSIDpCWAtBxeTg4sM4u5fPH5x0vvHBMmZ4cr7mrlOL11vFK2pAwgM83FigyQlgBjTssxJGRPM3PlueSkTY5UzuRkS0rMmdPnL+7/7B+zvmSmuTQ0FysyQFoCdO2onByMSnM5t7NVenvOjljMh5yEqZotqfsfeMxwDgfP56G5jHAuVmSAtAToRVrKyfznp+UdzEpfPBHzpOrn8nKyJSdD1hEfM+6IHXJu8XVrLgOeixUZIC0BujaVkw0+uc1kZi3fY5iTMKnP06Xe9Ji65MupczsrZ9Hj+/dKzzmVSKk/q4U3yppLh3OxIgOkJYC0lJkrJ0wU30iZ8wUTOZd2Wedx4s+mfHT12spPwve3bpfmTEyYlr+T0Vw6nIsVGSAtAbp2NCeFZGYN3VHfm2any3Im7iKl0iMmxjpfWlE1eVI7a1XFnbuYUUfeOVZ6Dgu7Y6kkNJeezsWKDJCWABubltSr6c9gvnvxSnH8YvZg6f3j8j6VMDkplHrMVLbk3J4j5k8qZ+L5xCustnkVWXNpZy5WZIC0BOi8eHLuZNdyY9Oy0lxyvsAidQXR1K5TXVcuXUfMmXj+qd26Nj93aS7tzMWKDJCWAF3L2rXMySL5mf/81JiZOY9Ty1ze/vvffrZMyj8rl/oM3WQyq+WXzUmhZ3uvi+O4axbPbWGnrImryJpLy3OxIgOkJUAv0lJO9iIzS7MltSOWyoGcy8jEnIm7ZguXYSkVr55a9XIxVT8DmEqqeHs8n7u7T5v+shJzaWguVmSAtAToWuXls5xscBjrZebSucScydlpSl3t88D/hImE+fL6jeJ4NttPj88++bD25+3OT0+K41+fPNqIvyfm0u5crMgAaQnQu7SUn43mYdNqmcu1D84Wx/d++7M0keLn5lLpFNMjpk0qSb75+qviOO6UTbcvlObSQs6Yy4DnYkUGSEuAQablmBN1w9OykxSKCfPLi7dL8yQmzNb2yeL45x/vDPa1bi5WZIC0BJCWg07RkaRia8kT35B587tvl/7gIfc3F3OxIgOkJYC0bDMt17nCrbSsN2FWeP3Nx/DaNRcrMkBaAgAAAAAAAACwuv8BepmzESUsytQAAAAASUVORK5CYII=",3,54,28);

#define step
 // Sleeping & Snoring:
with(BecomeScrapBoss){
	spr_idle = global.sprScrapSleepIdle;
	spr_hurt = global.sprScrapSleepHurt;
	if(GameCont.loops != 0){
		image_xscale = (2.5 * (1.28 + (GameCont.loops * 0.05))) / 2.5;
		image_yscale = image_xscale;
	}
	if("snoozetimer" not in self || snoozetimer <= 0){
		snoozetimer = 180;
		sound_play_pitchvol(sndFrogB,0.4,3.5); // bigger bandit's snores are made of farts
		repeat(5) if instance_exists(self){
			repeat(6) with instance_create(x,y + 28,Smoke){
				motion_set(choose(0,180) + (random(15)*random_range(-1,1)),3);
				friction = 0.4 * random(1);
			}
			wait 1;
		}
	}
	else snoozetimer -= 1;
}

 // Change Big Dog to Bigger Bandit:
with(ScrapBoss){
	sound_stop(sndFrogB);
	with instance_create(x,y,BanditBoss){
		name = "ScrapBanditBoss";
		ScrapBanditDivisions = 1;
	}
	instance_delete(self);
}

 // Bigger Bandit Mechanics | High Health, Split in Half When Killed:
with instances_matching(BanditBoss, "name", "ScrapBanditBoss"){
	 // Set Stats on Creation:
	if("freshboy" not in self){
		freshboy = 1;
		raddrop = round(45 / ScrapBanditDivisions);
		maxhealth = round(320 / ScrapBanditDivisions);
		if(GameCont.loops != 0){
			maxhealth *= 1.28 + (GameCont.loops * 0.05);
		}
		my_health = maxhealth;
		image_xscale = 0.5 + (maxhealth/150);
		image_yscale = image_xscale;

		 // Bigger Gun:
		with instance_create(x,y,CustomObject){
			name = "ScrapBanditBossGun";
			creator = other;
		}
	}

	if(meleedamage = 10){
		meleedamage *= image_xscale;
	}

	 // Splitting:
	if(my_health < maxhealth / 2){
		if image_xscale > 1.2{
			repeat(2) with instance_create(x,y,BanditBoss){
				name = "ScrapBanditBoss";
				ScrapBanditDivisions = other.ScrapBanditDivisions * 2;
			}
		}
		else{
			repeat(2) with instance_create(x,y,Bandit){
				raddrop = round(other.raddrop / 2);
				maxhealth = other.maxhealth/3;
				my_health = other.my_health/3;
			}
		}
		my_health = 0;
	}
}

 // Bigger Gun:
with instances_matching(CustomObject, "name", "ScrapBanditBossGun"){
	sprite_index = sprBanditBossGun;
	if(instance_exists(creator)){
		creator.wkick = 9999;
		image_xscale = creator.image_xscale;
		image_yscale = creator.image_xscale * creator.right;
		image_angle = creator.gunangle;
		x = creator.x;
		y = creator.y;
		if(creator.gunangle < 180) depth = creator.depth;
		else depth = creator.depth - 1;
	}
	else instance_destroy();
}

 // Bigger Bullets:
with(EnemyBullet1){
	with(creator) if("name" in self && name = "ScrapBanditBoss" && image_xscale != 1){
		with(other) if(image_xscale = 1){
			image_xscale = other.image_xscale;
			image_yscale = image_xscale;

			direction = other.gunangle + (image_xscale * random_range(15, -15));
			image_angle = direction;
			speed /= image_xscale;
			damage = round(image_xscale * damage);
		}
	}
}