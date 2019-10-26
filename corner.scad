corner_r = 100;

h = 20;
cut_side = 7;

corner2_r = 200;
corner2_w = 5;

corner2_buttress_w = corner2_w;
corner2_buttress_h = 18;
corner2_buttress_lb = 30;
corner2_buttress_lt = 5;
corner2_buttress_shift = 2;



module corner(r = corner_r) {
    $fn = 100;
    fix = 0.1;

    translate([r,r,0])
    rotate([0,0,180])
    difference() {
        cube([r,r,h]);
        translate([0,0,-fix])
        cylinder(r=r, h=h+fix*2);

        translate([r-cut_side/2,0,-fix])
        cube([cut_side, cut_side, h+fix*2]);

        translate([0, r-cut_side/2,-fix])
        cube([cut_side, cut_side, h+fix*2]);
    }
}

module corner2_buttress() {
    translate([-corner2_buttress_w/2, corner2_r+corner2_w-corner2_buttress_shift, 0])
    hull() {
        cube([corner2_buttress_w, corner2_buttress_lb, min_thick]);

        translate([0,0,corner2_buttress_h-min_thick])
        cube([corner2_buttress_w, corner2_buttress_lt, min_thick]);
    }
}

module corner2(r = corner2_r) {
    $fn = 100;
    fix = 0.1;

    translate([r,r,0])
    rotate([0,0,180])
    union() {

        difference() {
            intersection() {
                cube([r,r,h]);

                translate([0,0,-fix])
                cylinder(r=r+corner2_w, h=h+fix*2);

            }

            translate([0,0,-fix])
            cylinder(r=r, h=h+fix*2);

            translate([r-cut_side/2,0,-fix])
            cube([cut_side, cut_side, h+fix*2]);

            translate([0, r-cut_side/2,-fix])
            cube([cut_side, cut_side, h+fix*2]);
        }

        rotate([0,0,-45])
        corner2_buttress();

        rotate([0,0,-32])
        corner2_buttress();

        rotate([0,0,-58])
        corner2_buttress();
    }


}

module check() {
    cut = 0.5;

    translate([corner_r-cut_side+0.3,0,0])
    cube([cut,cut,h]);
}

//check();

//corner();
