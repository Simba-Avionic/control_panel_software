b_w = 13;
b_h = 20;

include <panel.scad>

T=4;
U = 2;

difference() {
    linear_extrude(3)
    difference() {
    panel();
        
    translate([w/2,h/2])
    intersection() {
        square([11,12],true);
    }
    
        translate([w/2,h/4-2])
    intersection() {
        square([11,12],true);
    }
    
        translate([w/2,3*h/4+2])
    intersection() {
        square([11,12],true);
    }

    }

}