min_thick = 0.3;
fix = 0.001;
field_width = 1200;
field_length = 1800;

gate_inner_w = 240;
gate_outer_w = 298;

gate_upright_l = 70.5;
gate_upright_w = (gate_outer_w-gate_inner_w)/2;

gate_middle_w = gate_upright_w+gate_inner_w;

w_margin = 3;
l_margin = 3;

goalpost_w = (gate_outer_w-gate_inner_w)/2+w_margin*2;
goalpost_l = gate_upright_l+l_margin*2;
goalpost_h = 20;

door_inner_width = gate_inner_w - w_margin*2;
door_outer_width = door_inner_width + goalpost_w*2;

pin_epsilon = 0.3;


include <corner.scad>;

module field() {
    fix = 0.1;
    color("gray")
    cube([field_width, field_length, fix]);
}

module pin(void = false) {
    $fn=100;
    length = 14;
    r=3.2;

    function p() = void?0.2:0;
    function pd() = void?0.7:0;

    rotate([0,90,0])
    cylinder(r=r+p(),h=length+pd()*2, center=true);

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

module door_corners_pins(void=false) {
        translate([field_width/2 - door_outer_width/2,goalpost_l*(0.5),goalpost_h/2])
        pin(void);

        translate([field_width/2 - door_outer_width/2,goalpost_l*(0.5-pin_epsilon),goalpost_h/2])
        pin(void);



        translate([field_width/2 + door_outer_width/2,goalpost_l*(0.5),goalpost_h/2])
        pin(void);

        translate([field_width/2 + door_outer_width/2,goalpost_l*(0.5-pin_epsilon),goalpost_h/2])
        pin(void);

}


module door_base_pins(void=false) {

        door_corners_pins(void);

        translate([field_width/2 - door_outer_width/2,goalpost_l*(0.5+pin_epsilon),goalpost_h/2])
        pin(void);

        translate([field_width/2 + door_outer_width/2,goalpost_l*(0.5+pin_epsilon),goalpost_h/2])
        pin(void);
}


module door_corners() {
    r = 77;

    difference() {
        translate([(field_width-door_outer_width)/2,0,0])
        union() {
            mirror([1,0,0])
            corner(r=r);

            translate([door_outer_width,0,0])
            corner(r=r);
        };
        door_corners_pins(void=true);
    }
}

module door_base() {
    $fn=100;

    r = 20;

    difference() {
        translate([field_width/2,0,0])
        translate([-door_outer_width/2,0,0])
        union() {
            cube([goalpost_w, goalpost_l, goalpost_h]);

            translate([goalpost_w+door_inner_width,0,0])
            cube([goalpost_w, goalpost_l, goalpost_h]);

            translate([goalpost_w-fix,0,0])
            cube([door_inner_width+fix*2, goalpost_l, min_thick]);

            intersection() {
                translate([goalpost_w-fix, 0, 0])
                cube([door_inner_width+fix*2, goalpost_l, goalpost_h]);

                translate([goalpost_w-fix, goalpost_l-10.04, -(r-3)])
                rotate([0, 90, 0])
                cylinder(r=r, h=door_inner_width+fix*2);
            }
        }

        door_base_pins(void=true);

    }



}

module gate() {
//    translate([10.6,26.75,0])
//    import("gate/gate.stl");

    translate([field_width/2, 0, goalpost_h])
    translate([-gate_middle_w/2, gate_upright_l/2+l_margin,0])
    scale([1.32,1.32,1.32])
    union() {
        import("gate/upright.stl");

        translate([1.5,0,77.55])
        import("gate/angle_L.stl");

        translate([97.9,0,88.1])
        import("gate/traverse_186mm.stl");

        translate([203.0,0,77.55])
        import("gate/angle_R.stl");

        translate([203.7,0,0])
        import("gate/upright.stl");
    }
}
