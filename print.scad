include <all.scad>;

/* corners(); */
/* field(); */


/* translate([0,field_length,0])
mirror([0,1,0])
door_corners(); */



/* gate(); */

/*
intersection() {
    translate([field_width/2,-fix,-fix])
    cube([field_width/2, goalpost_l+10+fix*2, goalpost_h+10+fix*2]);

    //door_base();
    door_corners();
} */

corner2();

/* corner(corner2_r); */


/* intersection() {
    translate([0,-fix,-fix])
    cube([field_width/2, goalpost_l+10+fix*2, goalpost_h+10+fix*2]);

    //door_base();
    door_corners();

} */


/* pin(); */

echo(door_inner_width);
