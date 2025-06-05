b_w = 13;
b_h = 20;

include <panel.scad>

T = 28;
U = 3;

difference() {
    linear_extrude(3)
    difference() {
    panel();
    
    // ARM TANK
    translate([w/3-5,h/2-27])
    intersection() {
        circle(d=22, true);
        square([20,22],true);
    }
    
    // IGNITION
    translate([2/3*w+5,h/2])
    intersection() {
        circle(d=22, true);
        square([20,22],true);
    }
    
    // TANK VENT
    translate([w/3-5,h/2+27])
    intersection() {
        circle(d=22, true);
        square([20,22],true);
    }

    }

}

intersection() {
    translate([0,h/2,40])
    rotate([0,90,0])
    linear_extrude(3)
    circle(d=h, $fn=12);
    
    translate([0,0,-6])
    linear_extrude(6)
    panel(); 
}

intersection() {
    translate([w-3,h/2,40])
    rotate([0,90,0])
    linear_extrude(3)
    circle(d=h, $fn=12);
    
    translate([0,0,-6])
    linear_extrude(6)
    panel(); 
}