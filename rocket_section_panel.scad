b_w = 13;
b_h = 20;

include <panel.scad>

T = 32.5;
U = 3;

difference() {
    linear_extrude(3)
    difference() {
    panel();
        
    // ARM TANK
    translate([5*w/6,h/2])
    intersection() {
        circle(d=22, true);
        square([20,22],true);
    }
    
    // IGNITION
    translate([w/2+5,h/2-32])
    intersection() {
        circle(d=12, true);
        square([20,22],true);
    }
    
    // TANK VENT
    translate([w/5,h/2+32])
    intersection() {
        circle(d=22, true);
        square([20,22],true);
    }
    
    // DUMP VALVE
    translate([w/2+5,h/2+32])
    intersection() {
        circle(d=22, true);
        square([20,22],true);
    }
    
    // CAMERA SWITCH
    translate([w/5,h/2-32])
    
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