thick = 2.5;
min_thick = 0.3;
fix = 0.1;
trapeze_b_min=13;
trapeze_b_maj=19;
trapeze_h = 13;
trapeze_z_shift = 2;
trapeze_z_top = 18;
trapeze_z_bottom = 15;


module trapeze() {
    translate([0, thick-fix, trapeze_z_bottom])
    hull() {

        translate([-trapeze_b_maj/2,trapeze_h-min_thick,thick-min_thick+trapeze_z_shift])
        cube([trapeze_b_maj,min_thick,min_thick]);

        translate([-trapeze_b_min/2,0,thick-min_thick])
        cube([trapeze_b_min,min_thick,min_thick]);

        translate([-trapeze_b_min/2,0,0])
        cube([trapeze_b_min,min_thick,min_thick]);
    }
}

module extension(length_tl, length_tr=length_tl, length_bl=length_tl, length_br=length_tl) {
    translate([-trapeze_b_min/2,thick-length,trapeze_z_bottom-shovel_z_bottom])
    cube([trapeze_b_min, length, thick]);

}

module extension_fine(length_tl, length_tr, length_bl, length_br) {
    translate([-trapeze_b_min/2,thick,trapeze_z_bottom-shovel_z_bottom])
    hull() {

        translate([0,-length_bl,0])
        cube([min_thick, length_bl, min_thick]);

        translate([trapeze_b_min-min_thick,-length_br,0])
        cube([min_thick, length_br, min_thick]);

        translate([0,-length_tl,thick-min_thick])
        cube([min_thick, length_tl, min_thick]);

        translate([trapeze_b_min-min_thick,-length_tr,thick-min_thick])
        cube([min_thick, length_tr, min_thick]);
    }

}

shovel_width = 35;
shovel_height = 18;
shovel_z_bottom = 2;


module shovel1() {
    translate([-shovel_width/2,0,0])
    cube([shovel_width,thick,shovel_height]);
}


module shovel2() {
    slope = 28;


    translate([-shovel_width/2,0,0])
    hull() {
        translate([0,0,shovel_height-min_thick])
        cube([shovel_width,thick,min_thick]);

        translate([0,-slope,0])
        cube([shovel_width,thick,min_thick]);
    }

    extension(6.16);

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

    cyl_z = 10;

    translate([0,thick-shift,0])
    difference() {
        translate([0,-r,shovel_height+cyl_z])
        rotate([0,90,0])
        cylinder(r=r,h=shovel_width, center=true);

        translate([0,-r,shovel_height+cyl_z])
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

    extension(4);

}


module shovel7(r=40) {

    $fn=100;

    cube_width = shovel_width+fix*2;
    cube_length = r*4;
    cube_height = r*2;

    cyl_z =16;
    sph_z = 13;
    sph_y = 1.5;
    mul = 1.15;
    shift = 0.8;

    translate([0,thick,0])
    difference() {
        translate([0,-r,shovel_height+cyl_z])
        rotate([0,90,0])
        cylinder(r=r,h=shovel_width, center=true);

        translate([r*shift,-r*mul-thick+sph_y,shovel_height+sph_z])
        sphere(r=r*mul, center=true);

        translate([-r*shift,-r*mul-thick+sph_y,shovel_height+sph_z])
        sphere(r=r*mul, center=true);

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

    extension(6);

}

module shovel8(r=33) {

    $fn=100;

    cube_width = 300;
    cube_length = 300;
    cube_height = 300;

    shift = 0;

    cyl_z = 10;

    translate([0,thick-shift,0])
    difference() {
        rotate([0,0,30])
        difference() {
            translate([0,-r,shovel_height+cyl_z])
            rotate([0,90,0])
            cylinder(r=r,h=cube_width, center=true);

            translate([0,-r,shovel_height+cyl_z])
            rotate([0,90,0])
            cylinder(r=r-thick,h=cube_width+fix*2, center=true);

            translate([0,-cube_length/2-r,cube_height/2-fix])
            cube([cube_width+fix*2,cube_length,cube_height], center=true);

            translate([0,0,-cube_height/2])
            cube([cube_width+fix*2,cube_length,cube_height], center=true);

            translate([0,0,cube_height/2+shovel_height])
            cube([cube_width+fix*2,cube_length,cube_height], center=true);
        }




        translate([cube_width/2+shovel_width/2,0,cube_height/2-fix])
        cube([cube_width,cube_length,cube_height], center=true);

        translate([-cube_width/2-shovel_width/2,0,cube_height/2-fix])
        cube([cube_width,cube_length,cube_height], center=true);


    }

    extension_fine(8,2,8,2);

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
    if (i==8)
        shovel8();
}


for (i=[8:8]) {
    translate([50*i,0,0])
    union() {
        trapeze();
        translate([0,0,shovel_z_bottom])
        shovel(i);
    }
}
