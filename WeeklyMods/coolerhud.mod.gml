#define init 
    for(var i = 0;i<=3;i++){
        for(var o = 0;o<=3;o++){
            player_set_show_hud(i,o,0);
        }
    }

global.sprHudBase = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGYAAAAcCAYAAACTZsrFAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjEuMWMqnEsAAAQHSURBVGhD7ZcxWttAEEYpKVNSUqZ0mZIjuOQIKSk5io+QI3AEjsBtHJ6Sp+/3sLKxJCzli4vn3R3Nzs7MrxUfN/v9fjF2u+f9dvu9pz5fG+RIzg8/7t6XbZ+5aBovhYXC8/N2leKQE7mZp2uoArGeS7SmsUIyQ1Tfc1AQxpeXXV84xdVzLo05ZG7mqj3zhSHBxtA0iknWhByx61P3HgN/C7+/v+1gTrxswpKQA7kwr3ny7PbbH5v+2t1Taz6XppFDPMgmsaaZHGxTsevjnhqrkm8WhVHgvwQ5W2+urcd5rftcPhg4kOD5ttBM4GDRxnP8fNMVJwVIX3z0e3x8bPL09KtpryzhpxiwefjZr7Nf9nIKBwuCegCN5EDfFDGZRKEUiDjOFYE1GBN7np28vr6+D+1nyVJ+1r3ZbL5MnH5CMJpFYJrs4ZWWMKI4xmEk4Zzj51m7HcJ95O3tpWmvLOUH3B78Ece6GKmLPtjXsXQ/+YYfE+UzsN9bk3EzeaCgTCRZ+40BavHGUA91Ui/z6juG7sc3mOA2cCyZZEuU9M1EEr711dZiKT+wBoWxf3PcFuh+FIYxGzcW3xxipii8YXwC8nPQ4jN/hEE/z63z6neKz/pJ/ftCvbMJk7dl6DNmAjlK+glxvH3eHAUCD889U9jebTrq/FJYp59w65vCwW3J5iVViLqumKiC582BmsQUiDckTPWdk+6svz2zTtZQfcfQCQO85ceEaY1DEId4xCVp/86w5rmftJrMGIinGAn26jsn1mldjIpTfcfQ3xibd+wmnMK9xPGb6/XGho/iQE1mLF3cBURx9FMNs/6NgWM35lxM0FuTnzOFqYlMhZiXEAWs0X4x5udMcWr9vqjA/0DOfZb7u80YMXjQVBTAw1wzeoZFinur/Rym7m/Ryou1dVib9bJOX/pr3fq10EdRb1goDEYTmQJx8jBQIJ47JiZY7UvTysuasNeXjxuQz2my83pznHtT8MO/F8YDfNgnFd/sIaqP8WoyxmXMuWdnkmsic8u6zNsG48uz9HO/zcaW+/UDfaT78XNmcJts04fEaT1nvwkxN1GT0IdRP8ZMknzWgPmQW83VfBkVJ22AL2tG+oyN0bjAukX342aCm5CNbjV/yM4+9lsACZus8V1DziETWxOZIzmbdz7TVkd9UqQUWJ9KP8HBDTS3JcIpG/tSAMZMJt+sY0mtGXJu5U3trVFYuxdcp09ysMCR5ikO62w8tP7H8SD2sZ+1jVegvD0Kk2f/b5yq/4OBxlVxQBFSGJ9VUYyTQuibz5hfadM00jg/P8CcRiIAzWdkXX1svOCXY1J9rxzSNAKN881WAOY5Kpi+NcaV8TSNSRVIroJ8LU1jC0VIqs+Vudjf/AbS95YXNJ2Q5wAAAABJRU5ErkJggg==",1,0,0)

global.sprXPBar = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAADIAAAAFCAIAAACIIijzAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjEuMWMqnEsAAAA1SURBVChTY2DI+ABCDB2DixGS2zeo0I8XGy50nGAQ4LgAceDgYnCAATD0BhdDg8Fj0CEGDwAhQNcBlF0JHgAAAABJRU5ErkJggg==",1,0,0)

global.sprfntHP = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEYAAAALCAYAAADC6Ps2AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjEuMWMqnEsAAAFCSURBVEhLrZPBjcMwDAT1zPPKuDJSRspIWVeKu3JAA2MMCFJW4HssIu5oaWMRj33fx+Pnd7fCszpmf4WN5+vk+U6erer+zEcdx+9YvOcB3u+/fdu2Q3HmgoPBst/lOuZiYg55L7NlNnueM6HVXMXOYljkcwQJE6z8+PV5xnIxvFScqxyq2Cx3ly0X0/ldrmMUY3+Ww+8YPLPZzhW2VExeYM8y75iLwcu5mFH+23MXhQ+zqp3fsFvF4JtVPJi/Xe6R8V7PHUMuzapyfLI517F/+cc4mxniDsV0z8PrWJezMvOcGTyz28U4h18xzi7GCm+Wu2JWZp4rZsGWisk+LHszxpliLD/P8zfMyszzKjuL6b5BhxEs+5l1325wxI6r3BWzwru78yiGC1Z4KDN45Ye6XHhVMebZs3/FUMXt2e/YeL7GB/uYXYN46CHlAAAAAElFTkSuQmCC",10,0,0)

global.fntHP = font_add_sprite_ext(global.sprfntHP, "0123456789", 0, 0);

global.sprfntAmmo = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACgAAAAICAYAAACLUr1bAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABh0RVh0U29mdHdhcmUAcGFpbnQubmV0IDQuMS4xYyqcSwAAAKNJREFUOE+dUEEOhEAI87hHn+H/P6iW2LFUcCc2YaAUKnHZM8DZ05ro5tmfmVf85dH4rVswZuCqS93yMNU+g/xrrg7QXqkbB9KcIHn53kyeOdCNQ0e2fpsFU34EuB6TFqR2g9TD4/vGH/oVo39C/dJ++QGvkZ3j4R4hvPJVzzcdGHoUhAwQST9RzT/+GNFweIwDFBWPYRSML5zR6c4ZnX7zbT8AqI+GQAHbtxYAAAAASUVORK5CYII=",10,0,0)

global.fntAmmo = font_add_sprite_ext(global.sprfntAmmo, "0123456789", 0, 0);

global.sprGlowHeart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjEuMWMqnEsAAAApSURBVBhXY3jBwfEfhDkENOBs/ILImAFZBQiD+AwhuX1wCRAdktvHAABUYSWGKO2lrwAAAABJRU5ErkJggg==",1,0,0)

global.sprWepHolder = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGAAAAAPCAYAAAAbOsq3AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjEuMWMqnEsAAAJUSURBVFhH7ZcxYsMgDEU99gg9QsaOGTNmzJixY+9/AcpX/IksSyDsNcOLbaEvQAjsLKUUl+X7uxDbluGjz+n3Bohu17Jcf+qjsg0CEeu7PG5ludd4B/WRLYK+X3/P+ri18bmH+D7v9dbYZvTGt6ffPiBRFW0jy+UyHATbMQEBySeIXReWvh67gf8+isBYyf4jEMPaNDbxFl2UHkfG977pJF8TdUL7JmnOhKJJNH2tXIAK1rS4QRJHkweij8Y/SD6JiqiNf5BD238zZpJPdkHYOZK+JoptHpFe7pFsk3zSfDr6COi5gEf0RAo10KcK2Jwkr5/B0WDxBsCKz1RSNAGbcEI/Eul7MJaM0eoTYyY8Tje2RP8a7S8Po7PNg0HaNZl8YvVAJx3Q7qH1I18dk7vT6z+DLIDaRbN60vSnA/CKQZ1YACRGJwq2HlbfQ8c9swBSZHWecn9Ar2n60wHqlVXBtgxaL9eJBZBEGn2EjqnjZvUavcuP6AlOnKaXn8kg1l9eTBMLYHcK4sFmkxSx698Zv066Bm0ZvYXJFw7oNfqd+/qpAfB2pjGCLx9vAJkvAOLqsYvWXaDbPDw9723CAb+s6NPTe2Bcwlo4s3qNFKvyfzeMBhEkn2S/pDgJC+LyfO4R9r8uIBcxWoBQ73yItIpf44ot0gd2jSTfFOrWYRBk2D76pxgkn4yOscz4ZCFM0nS7fragiCRJiEHWRZD2TP/BSeIlX+w7A4KYjjxbhKvHJA7qpYKdmBGe77R+XYSNbUavfOWFi4UN9DsDYaBIOOKjz+jL8g8l2oDDGIAlEwAAAABJRU5ErkJggg==",6,0,0)


#define draw_gui_end
if instance_exists(Player)
{
	draw_sprite_part(global.sprXPBar,0,0,0,GameCont.rad/(60*GameCont.level+1)*50,5,31,6);
	draw_sprite(global.sprHudBase,0,0,0)
	draw_set_font(global.fntHP)
	draw_set_halign(fa_center)
	if Player.my_health <= Player.maxhealth/4
	draw_set_color(c_yellow)
	draw_text(13,14,string(Player.lasthealth))
	draw_set_color(c_white)
	if Player.ammo[weapon_get_type(Player.wep)] >= weapon_get_cost(Player.wep)
	draw_sprite_ext(global.sprGlowHeart,0,49,11,1,1,0,c_white,(sin(current_frame/30)/2+0.5))
	draw_set_font(global.fntAmmo)
	draw_set_halign(fa_left)
	if current_frame mod 2 = 1 and Player.ammo[weapon_get_type(Player.wep)] >= weapon_get_cost(Player.wep)
	draw_set_color(c_lime)
	else
	draw_set_color(make_color_rgb(200,200,200))
	draw_text(57,12,string(Player.ammo[weapon_get_type(Player.wep)]))
	draw_set_color(c_white)
	/*var _spr = weapon_get_sprite(Player.wep)
	draw_sprite(_spr,0,95-sprite_get_xoffset(_spr)+sprite_get_width(_spr)/2,10-sprite_get_yoffset(_spr)-sprite_get_height(_spr)/2)*/
	draw_sprite(global.sprWepHolder,5,87,0)
}

#define step
with Player
{
	if "current_health" not in self
	{
		current_health = my_health*10
		lasthealth = current_health
	}
	current_health = my_health*10
	if lasthealth > current_health
	lasthealth -= 1
	if lasthealth < current_health
	lasthealth += 1

}