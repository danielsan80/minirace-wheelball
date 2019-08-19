min_thick = 0.3;
field_width = 1200;
field_length = 1800;
door_width = 300;


include <corner.scad>;

module field() {
    fix = 0.1;
    color("gray")
    cube([field_width, field_length, fix]);
}

module corners() {
    corner();

    translate([field_width,0,0])
    mirror([1,0,0])
    corner();

    translate([0,field_length,0])
    mirror([0,1,0])
    corner();

    translate([field_width,field_length,0])
    mirror([1,1,0])
    corner();
}

module door_corners() {
    r = 77;
    translate([(field_width-door_width)/2,0,0])
    union() {
        mirror([1,0,0])
        corner(r=r);
        
        translate([door_width,0,0])
        corner(r=r);
    }
}

module door_base() {
    w = 30;
    l = 71;
    h = 20;
    $fn=100;
    
    translate([(field_width-door_width)/2,0,0])
    union() {
        cube([w,l,h]);
    
        translate([door_width-w,0,0])
        cube([w,l,h]);
    
        cube([door_width, l, min_thick]);
    
        translate([0,l-8,-(20-2)])
        rotate([0,90,0])
        cylinder(r=20, h=door_width);
    }
}

module gate() {
//    translate([10.6,26.75,0])
//    import("gate/gate.stl");
    
    translate([10.6,26.75,0])
    union() {
        import("gate/upright.stl");
//
//        translate([1.5,0,77.55])
//        import("gate/angle_L.stl");
//
//        translate([97.9,0,88.1])
//        import("gate/traverse_186mm.stl");
//
//        translate([203.0,0,77.55])
//        import("gate/angle_R.stl");

        translate([203.7,0,0])
        import("gate/upright.stl");
    }
}

corners();
field();

door_corners();

translate([0,field_length,0])
mirror([0,1,0])
door_corners();

door_base();

translate([(field_width-door_width)/2,0,20])
scale([1.32,1.32,1.32])
gate();

