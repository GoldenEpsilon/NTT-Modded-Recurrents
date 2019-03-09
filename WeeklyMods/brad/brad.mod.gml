
#region Global Variables / Sprites / Technical
#define init

#macro JERKY_MAX 3
#macro JOY_MAX 4

global.offset = 0;
global.has_brad = 0;
global.joy = 0;

global.spr_itemframe = sprite_add("itemframe.png", 1, 8, 8);
global.spr_sack = sprite_add("sack.png", 1, 5, 5);
global.spr_joypickup = sprite_add("joypickup.png", 1, 5, 5);

global.spr_wepicons = [];
global.spr_wepicons[0] = sprite_add("wep0.png", 1, 8, 8);
global.spr_wepicons[1] = sprite_add("wep1.png", 1, 8, 8);
global.spr_wepicons[2] = sprite_add("wep2.png", 1, 8, 8);
global.spr_wepicons[3] = sprite_add("wep3.png", 1, 8, 8);
global.spr_wepicons[4] = sprite_add("wep4.png", 1, 8, 8);
global.spr_wepicons[5] = sprite_add("wep5.png", 1, 8, 8);

global.snd_get = sound_add("get.ogg");
global.snd_select = sound_add("select.ogg");
global.snd_use = sound_add("use.ogg");

global.new_level = 0;
while(true)
{
  // On level start
  if(instance_exists(GenCont))
  {
    with(Player) if(is_brad())
    {
      inv_open = 0;
      inv_sin = 0;
    }
    global.new_level = 1;
  }
  else if(global.new_level)
  {
    global.new_level = 0;
    level_start();
  }
  
  wait(1);
}

#endregion

#region Scripts

#define is_brad
return race == "brad";

#define draw_sprite_scale(spr, subimg, _x, _y, xscale, yscale)
draw_sprite_ext(spr, subimg, _x, _y, xscale, yscale, 0, draw_get_color(), draw_get_alpha());

#define add_to_inv(playerid, itemname, count, _wep)
mod_script_call("race", "brad", "add_to_inv", playerid, itemname, count, _wep);

#define remove_from_inv(playerid, itemname, count)
mod_script_call("race", "brad", "remove_from_inv", playerid, itemname, count);

#define get_inv_index(playerid, itemname)
mod_script_call("race", "brad", "get_inv_index", playerid, itemname);

#define create_sack(_x, _y, _item, _count)
with(instance_create(_x, _y, CustomObject))
{
  is_sack = 1;
  instance_create(x, y, Dust);
  near = 0;
  item = _item;
  count = _count;
  sprite_index = (item == "Joy") ? global.spr_joypickup : global.spr_sack;
  on_step = sack_step;
  on_draw = sack_draw;
  return id;
}

#endregion

#region Game Start
#define game_start

global.joy = 0;
global.has_brad = 0;

with(Player) if(is_brad())
{
  global.has_brad = 1;
  inv = [];
}

#endregion

#region Level Start
#define level_start

if(global.has_brad && instance_exists(Player))
{
  var created, jerkynum = 0, joynum = 0;
  with(Floor)
  {
    created = 0;
    // Jerky spawns
    if(jerkynum < JERKY_MAX && skill_get(mut_throne_butt))
    {
      if(point_distance(x, y, Player.x, Player.y) > 64) if(irandom(100) <= 4)
      {
        with(create_sack(x + 16, y + 16, (ultra_get("brad", 1)) ? "Horse Jerky" : "Mystery Jerky", 1))
        {
          if(!place_free(x, y) || place_meeting(x, y, chestprop) || place_meeting(x, y, prop) || place_meeting(x, y, enemy))
          {
            instance_destroy();
          }
          else
          {
            created = 1;
            jerkynum++;
          }
        }
      }
    }
    // Joy spawns
    if(joynum < JOY_MAX && ultra_get("brad", 2) && !created)
    {
      if(point_distance(x, y, Player.x, Player.y) > 64) if(irandom(100) <= 3)
      {
        with(create_sack(x + 16, y + 16, "Joy", 1))
        {
          if(!place_free(x, y) || place_meeting(x, y, chestprop) || place_meeting(x, y, prop) || place_meeting(x, y, enemy))
          {
            instance_destroy();
          }
          else
          {
            created = 1;
            joynum++;
          }
        }
      }
    }
  }
}

#endregion

#region GUI
#define draw

if(global.has_brad)
{
  draw_set_color(c_white);
  var s, no_hover, w, h, spr, mx, my, scale, dist, i, inv_size, _x, _y;
  with(Player) if(is_brad())
  {
      // Text box
      if(show_text || text_scale_sinval < pi/2)
      {
          draw_set_font(fntSmall);
          draw_set_halign(fa_center);
          draw_set_valign(fa_center);
          var _str = cur_text;
          var _scale = (show_text) ? sin(text_scale_sinval) : cos(text_scale_sinval);
          var _m = 2*_scale;
          var _p = 3*_scale;
          var _x = x;
          var _y = y - 30 - _m - _p;
          var _left = _x - string_width(_str)*_scale/2 - _p;
          var _right = _x + string_width(_str)*_scale/2 + _p;
          var _top = _y - string_height(_str)*_scale/2 - _p;
          var _bottom = _y + string_height(_str)*_scale/2 + _p;
          draw_set_color(c_white);
          draw_rectangle(_left - _m, _top - _m, _right + _m, _bottom + _m, false);
          draw_set_color(c_black);
          draw_rectangle(_left, _top, _right, _bottom, false);
          draw_set_color(c_white);
          draw_text_transformed(_x, _y, _str, _scale, _scale, 0);
      }
      // Inventory
      if(inv_open)
      {
        no_hover = 1; // whether or not nothing is being hovered over
        inv_size = array_length(inv); // size of inv array
        dist = 11 + 13 * sin(inv_sin); // distance from player to inv items
        // Inventory empty
        if(inv_size < 1)
        {
          _x = x + lengthdir_x(dist - 2, 90);
          _y = y + lengthdir_y(dist - 2, 90) + 0.5 * sin(global.offset + pi * 0.25 * i);
          draw_set_font(fntSmall);
          draw_set_halign(fa_center);
          draw_text_shadow(_x, _y, "Inventory empty");
        }
        // Inventory not empty
        else
        {
          mx = mouse_x[index]; // mouse x position
          my = mouse_y[index]; // mouse y position
          for(i = 0; i < inv_size; i++)
          {
            scale = 0.8 + 0.5 * sin(inv_sin); // scale of inv items
            spr = inv[i, 2]; // sprite of item
            sw = sprite_get_width(global.spr_itemframe) / 2; // width of side
            sh = sprite_get_height(global.spr_itemframe) / 2; // height of side
            _x = x + lengthdir_x(dist, i / inv_size * 360 + (i % 1 == 0) * 90);
            _y = y + lengthdir_y(dist, i / inv_size * 360 + (i % 1 == 0) * 90) + 0.66 * sin(global.offset + pi * 0.25 * i);
            if(no_hover && mx >= _x - sw && mx <= _x + sw && my >= _y - sh && my <= _y + sh)
            {
              // Tooltip
              draw_set_font(fntSmall);
              if(inv[i, 3] != -1)
              {
                var type = weapon_get_type(inv[i, 3]);
                s = "WEAPON#(" + inv[i, 0] + ")";
                if(type != 0) s = s + "#" + string(ammo[type]) + "/" + string(typ_amax[type]);
              }
              else s = string(inv[i, 1]) + "x " + inv[i, 0];
              draw_tooltip(_x, _y - sh - 3, s);
              // Other stuff
              if(inv_hovering != i) sound_play(global.snd_select);
              no_hover = 0;
              inv_hovering = i;
            }
            scale += (inv_hovering == i) * 0.15;
            if(inv[i, 3] != -1) draw_set_color(merge_color(c_white, make_color_rgb(250, 171, 0), ammo[weapon_get_type(inv[i, 3])] / typ_amax[weapon_get_type(inv[i, 3])]));
            else draw_set_color(c_white);
            draw_sprite_scale(spr, 0, _x, _y, (scale - 0.15) + (0.15 * (inv_hovering == i)), (scale - 0.15) + (0.15 * (inv_hovering == i)));
            draw_set_color((inv_hovering == i) ? player_get_color(index) : c_black);
            draw_sprite_scale(global.spr_itemframe, 0, _x, _y, scale, scale);
          }
        }
        // Reset hovered item
        if(no_hover) inv_hovering = -1;
      }
  }
}

#endregion

#region Step
#define step

// Select icon
with(CharSelect) if(race == "brad")
{
    image_index = 0;
    for(var i = 0; i < maxp; i++) if(player_get_skin(i) == 1)
        image_index = 1;
}

// Game
if(global.has_brad)
{

  // On hit
  //with(enemy) if(nexthurt = current_frame + 5) trace(1); // this doesn't do anything i just wanted to see if it worked

  // Joy
  if(global.joy >= 1)
  {
    if(global.joy == 1) with(Player) with(instance_create(x, y, PopupText)) mytext = "Withdrawl!";
    global.joy--;
    with(Player) reload = clamp(reload - 1.5, 0, reload);
  }

  // Icon Offset
  global.offset += 0.075;
  if(global.offset >= 2 * pi) global.offset = 0;

  // Destroy nowep weapon pickups
  //with(WepPickup) if(wep == "nowep") instance_destroy();

  // Convert health pickups to jerky
  if(global.has_brad)
  {
    // Jerky
    with(HPPickup) if("tojerky" not in self)
    {
      if(instance_number(Player) == 1 || irandom(instance_number(Player) - 1) == 0)
      {
        create_sack(x, y, "Mystery Jerky", 1);
        instance_destroy();
      }
      else tojerky = 1;
    }
  }

  // Player
  with(Player) if(is_brad())
  {
    
    // No text in portals
    if(instance_exists(GenCont)) mod_script_call("race", "brad", "textbox_silence");
    
    // Use items
    if(inv_open && inv_hovering != -1)
    {
      // Use items
      if(button_pressed(index, "spec"))
      {
        // Mystery / Horse Jerky
        if(inv[inv_hovering, 0] == "Mystery Jerky" || inv[inv_hovering, 0] == "Horse Jerky")
        {
          sound_play_pitch(global.snd_use, random_range(1, 1.1));
          with(Player) repeat(1 + ultra_get("brad", 1)) instance_create(x, y, HPPickup);
        }
        // Drop weapon
        else if(inv[inv_hovering, 3] != -1)
        {
          sound_play(sndWeaponPickup);
          with(instance_create(x, y, WepPickup)) wep = other.inv[other.inv_hovering, 3];
        }
        // Joy
        else if(inv[inv_hovering, 0] == "Joy")
        {
          with(Player) with(instance_create(x, y, PopupText)) mytext = "Joy!";
          sound_play_pitch(global.snd_use, random_range(1, 1.1));
          global.joy += 90;
        }
        // Error
        else trace("Item error.");
        
        remove_from_inv(id, inv[inv_hovering, 0], 1);
        inv_sin = 0;
      }
      // Equip weapon
      else if(button_pressed(index, "pick"))
      {
        if(inv[inv_hovering, 3] != -1)
        {
          inv_sin = 0;
          sound_play(sndWeaponPickup);
          var w = inv[inv_hovering, 3];
          inv[inv_hovering, 0] = weapon_get_name(wep);
          inv[inv_hovering, 3] = wep;
          inv[inv_hovering, 2] = global.spr_wepicons[weapon_get_type(wep)];
          wep = w;
          reload = weapon_get_load(wep);
        }
      }
    }
    
  }

}

#endregion

#region Sacks

// Step
#define sack_step

near = 0;
with(Player) if(is_brad())
{
  if(point_distance(x, y, other.x, other.y) <= 16)
  {
    other.near = 1;
    // Pick up
    if(button_pressed(index, "pick") && !inv_open)
    {
      sound_play(global.snd_get);
      add_to_inv(id, other.item, other.count, -1);
      with(other)
      {
        with(instance_create(x, y, PopupText)) mytext = other.item + "!";
        instance_create(x, y, Dust);
        instance_destroy();
      }
    }
  }
}

// Draw
#define sack_draw

if(near)
{
  draw_set_font(fntM);
  draw_set_halign(fa_center);
  draw_sprite(sprEPickup, 0, x, y - 3);
  draw_text_shadow(x, y - 27, item);
}

#endregion