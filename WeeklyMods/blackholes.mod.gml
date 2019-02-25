#define step
with(projectile)
{
  with(hitme)
  {
    if (variable_instance_exists(other, "damage") && team != other.team && distance_to_object(other) < (other.damage * 50))
    {
      motion_add(point_direction(x,y,other.x,other.y),other.damage / 3);
    }
  }
}