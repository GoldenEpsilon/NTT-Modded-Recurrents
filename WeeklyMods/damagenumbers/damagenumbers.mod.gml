
#region Init
#define init

#macro MAX_SPD 1.5
#macro THATS_A_LOT_OF_DAMAGE 20 //https://i.imgflip.com/1ygc6f.jpg

#endregion

#region Step
#define step

with(enemy) if("my_health" in self)
{
  
  // Add alt health if not already added
  if("_my_health" not in self) _my_health = my_health;
  
  //Hurted
  if(nexthurt == current_frame + 5)
  {
    var dmg = abs(my_health - _my_health);
    if(dmg > 0)
    {
      dmgnum_create(x, bbox_top, dmg);
    }
  }
  
  // Update hp
  _my_health = my_health;
  
}

#endregion

#region Damage numbers

#define dmgnum_create(_x, _y, _num)

// Create
with(instance_create(_x, _y, CustomObject))
{
  on_draw = dmgnum_draw;
  on_step = dmgnum_step;
  depth = -99;
  wiggle = 0;
  num = _num;
  spd = 0.25;
}

#define dmgnum_step

// Float up
y -= spd;
spd = clamp(spd + 0.1, 0, MAX_SPD);
// Wiggle
wiggle += 0.4;
if(wiggle >= 2 * pi) wiggle -= 2 * pi;
// Fade away
if(spd == MAX_SPD)
{
  image_alpha -= 0.033;
  if(image_alpha <= 0) instance_destroy();
}

#define dmgnum_draw

// Draw
draw_set_font(fntM);
draw_set_halign(fa_center);
draw_set_alpha(0.75 * image_alpha);
var percent = clamp(num / THATS_A_LOT_OF_DAMAGE, 0, 1);
var _x = x + (spd / MAX_SPD * 2) * sin(wiggle);
var scale = 0.9 + 0.3 * percent;
draw_set_color(c_black);
draw_text_transformed(_x - 1, y + 1, string(num), scale, scale, 0);
draw_set_color(merge_color(c_white, c_red, percent));
draw_text_transformed(_x, y, string(num), scale, scale, 0);
draw_set_alpha(1);

#endregion