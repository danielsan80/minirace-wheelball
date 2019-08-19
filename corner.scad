corner_r = 100;
h = 20;
cut_side = 7;




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

module check() {
    cut = 0.5;
    
    translate([corner_r-cut_side+0.3,0,0])
    cube([cut,cut,h]);
}

//check();

//corner();