r = 50;
h = 20;
cut_side = 7;

$fn = 100;

difference() {
    cube([r,r,h]);
    cylinder(r=r, h=h);

    translate([r-cut_side/2,0,0])
    cube([cut_side, cut_side, h]);
    
    translate([0, r-cut_side/2,0])
    cube([cut_side, cut_side, h]);
}


module check() {
    cut = 0.5;
    
    translate([r-cut,cut_side-cut-0.3,0])
    cube([cut,cut,h]);
}

//check();