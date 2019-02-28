#define step
with(Bandit)
{
  if "stacked" not in self or "stack" not in self
  {
    stacked = noone;
    stack = noone;
    if irandom(5) == 1
    {
      repeat(irandom(3)) 
      {
        with instance_create(x,y,Bandit)
        {
          stacked = noone;
          stack = noone;
          natdepth = depth;
        }
      }
    }
    natdepth = depth;
  }
  if stacked == noone
  {
    x += 10000;
    near = instance_nearest(xprevious, y, Bandit);
    x = xprevious;
  }
  if place_meeting(x,y,near)
  {
    stacked = near;
  }
  if stack != noone && !instance_exists(stack)
  {
    stack = noone;
  }
  if stacked != noone
  {
    if instance_exists(stacked)
    {
      if stacked.stack != noone && stacked.stack != self
      {
        stacked = stacked.stack;
      }
      x = stacked.x;
      y = stacked.y - 12;
      speed = 0;
      stacked.stack = self;
      mask_index = mskNone;
      canfly = 1;
      depth = stacked.depth - 8;
      spr_shadow = mskNone;
    }
    else
    {
      stacked = noone;
      //stack = noone;
      mask_index = mskBandit;
      spr_shadow = shd24;
      canfly = 0;
      y += 12;
      depth = natdepth;
    }
  }
}