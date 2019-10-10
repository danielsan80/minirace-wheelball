include <all.scad>;


corners();
field();

door_corners();

translate([0,field_length,0])
mirror([0,1,0])
door_corners();

door_base();


gate();
