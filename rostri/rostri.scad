thick = 3;
min_thick = 0.3;
fix = 0.01;
trapeze_b_min=13;
trapeze_b_maj=23;
trapeze_h = 21;

trapeze_z_top = 21;
trapeze_z_bottom = 18;

module trapeze() {
    translate([0, thick-fix, trapeze_z_bottom])
    hull() {
        translate([0,0,thick-min_thick])
        linear_extrude(height=min_thick)
        polygon(points=[[-trapeze_b_min/2,0],[+trapeze_b_min/2,0],[+trapeze_b_maj/2,trapeze_h],[-trapeze_b_maj/2,trapeze_h]]);

        translate([-trapeze_b_min/2,0,0])
        cube([trapeze_b_min,min_thick,min_thick]);
    }
}

module extension(length) {
    translate([-trapeze_b_min/2,thick-length,trapeze_z_bottom])
    cube([trapeze_b_min, length, trapeze_z_top-trapeze_z_bottom]);
}

shovel_width = 35;
shovel_height = 25;


module shovel1() {
    translate([-shovel_width/2,0,0])
    cube([shovel_width,thick,shovel_height]);
}


module shovel2() {
    slope = 30;


    translate([-shovel_width/2,0,0])
    hull() {
        translate([0,0,shovel_height-min_thick])
        cube([shovel_width,thick,min_thick]);

        translate([0,-slope,0])
        cube([shovel_width,thick,min_thick]);
    }

    extension(7.9);

}

module shovel3(r=20) {

    $fn=100;

    cube_width = shovel_width+fix*2;
    cube_length = r*4;
    cube_height = r*2;

    shift = 0;

    translate([0,thick-shift,0])
    difference() {
        translate([0,-r,shovel_height/2])
        rotate([0,90,0])
        cylinder(r=r,h=shovel_width, center=true);

        translate([0,-r,shovel_height/2])
        rotate([0,90,0])
        cylinder(r=r-thick,h=shovel_width+fix*2, center=true);

        translate([0,0,-cube_height/2])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([0,0,cube_height/2+shovel_height])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([0,-cube_length/2-r,cube_height/2-fix])
        cube([cube_width,cube_length,cube_height], center=true);

    }

    extension(3);

}


module shovel4(r=30) {

    $fn=100;

    cube_width = r*4;
    cube_length = r*4;
    cube_height = r*2;

    shift = 0;

    translate([0,thick-shift,0])
    difference() {
        translate([0,-r,shovel_height/2])
        rotate([0,0,0])
        cylinder(r=r,h=shovel_width, center=true);

        translate([0,-r,shovel_height/2])
        rotate([0,0,0])
        cylinder(r=r-thick,h=shovel_width+fix*2, center=true);

        translate([0,0,-cube_height/2])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([0,0,cube_height/2+shovel_height])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([cube_width/2+shovel_width/2,0,cube_height/2-fix])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([-cube_width/2-shovel_width/2,0,cube_height/2-fix])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([0,-cube_length/2-r,cube_height/2-fix])
        cube([cube_width,cube_length,cube_height], center=true);

    }

    extension(2);

}

module shovel5(r=30) {

    $fn=100;

    cube_width = r*4;
    cube_length = r*4;
    cube_height = r*2;

    shift = 0;

    translate([0,thick-shift,0])
    difference() {
        translate([0,-r,shovel_height/2])
        rotate([0,0,0])
        sphere(r=r, center=true);

        translate([0,-r,shovel_height/2])
        rotate([0,0,0])
        sphere(r=r-thick, center=true);

        translate([0,0,-cube_height/2])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([0,0,cube_height/2+shovel_height])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([cube_width/2+shovel_width/2,0,cube_height/2-fix])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([-cube_width/2-shovel_width/2,0,cube_height/2-fix])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([0,-cube_length/2-r,cube_height/2-fix])
        cube([cube_width,cube_length,cube_height], center=true);

    }

    extension(2);

}

module shovel6(r=33) {

    $fn=100;

    cube_width = shovel_width+fix*2;
    cube_length = r*4;
    cube_height = r*2;

    shift = 0;

    translate([0,thick-shift,0])
    difference() {
        translate([0,-r,shovel_height+4])
        rotate([0,90,0])
        cylinder(r=r,h=shovel_width, center=true);

        translate([0,-r,shovel_height+4])
        rotate([0,90,0])
        cylinder(r=r-thick,h=shovel_width+fix*2, center=true);

        translate([0,0,-cube_height/2])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([0,0,cube_height/2+shovel_height])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([cube_width/2+shovel_width/2,0,cube_height/2-fix])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([-cube_width/2-shovel_width/2,0,cube_height/2-fix])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([0,-cube_length/2-r,cube_height/2-fix])
        cube([cube_width,cube_length,cube_height], center=true);

    }

    extension(3);

}


module shovel7(r=40) {

    $fn=100;

    cube_width = shovel_width+fix*2;
    cube_length = r*4;
    cube_height = r*2;

    mul = 1.15;
    shift = 0.8;

    translate([0,thick,0])
    difference() {
        translate([0,-r,shovel_height+10])
        rotate([0,90,0])
        cylinder(r=r,h=shovel_width, center=true);

        translate([r*shift,-r*mul-thick+1.5,shovel_height+6])
        sphere(r=r*mul,h=shovel_width+fix*2, center=true);

        translate([-r*shift,-r*mul-thick+1.5,shovel_height+6])
        sphere(r=r*mul,h=shovel_width+fix*2, center=true);

        translate([0,0,-cube_height/2])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([0,0,cube_height/2+shovel_height])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([cube_width/2+shovel_width/2,0,cube_height/2-fix])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([-cube_width/2-shovel_width/2,0,cube_height/2-fix])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([0,-cube_length/2-r,cube_height/2-fix])
        cube([cube_width,cube_length,cube_height], center=true);

    }

    extension(3);

}

module shovel(i=1) {
    if (i==1)
        shovel1();
    if (i==2)
        shovel2();
    if (i==3)
        shovel3();
    if (i==4)
        shovel4();
    if (i==5)
        shovel5();
    if (i==6)
        shovel6();
    if (i==7)
        shovel7();
}


for (i=[4:4]) {
    translate([50*i,0,0])
    union() {
        trapeze();
        shovel(i);
    }
}
