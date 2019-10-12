include <all.scad>;

/* corners(); */
/* field(); */


/* intersection() {
    door_corners();

    color("red")
    translate([field_width/2-door_outer_width/2-16,7,0])
    cube([16,16,16]);
} */


/* translate([0,field_length,0])
mirror([0,1,0])
door_corners(); */



/* gate(); */


/* intersection() {
    translate([field_width/2,-fix,-fix])
    cube([door_outer_width/2, goalpost_l+fix*2, goalpost_h+fix*2]);

    door_base();
} */


intersection() {
    translate([field_width/2-door_outer_width/2,-fix,-fix])
    cube([door_outer_width/2, goalpost_l+fix*2, goalpost_h+fix*2]);

    door_base();

}


/* pin(); */

echo(door_inner_width);
