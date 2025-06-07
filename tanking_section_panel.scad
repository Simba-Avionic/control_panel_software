b_w = 23;
b_h = 40;

include <panel.scad>

T=38;
U=3;

difference() {
    linear_extrude(3)
    difference() {
    panel();
    
    // ARM TANK SYSTEM
    translate([w/5,h/2])
    intersection() {
        circle(d=22, true);
        square([20,22],true);
    }
    
    // MAIN BOTTLE VALVE
    translate([w/2,h/2 + 32])
    intersection() {
        circle(d=22, true);
        square([20,22],true);
    }
    
    // HOSE VENT
    translate([w/2,h/2 - 32])
    intersection() {
        circle(d=22, true);
        square([20,22],true);
    }
    
    // DECOUPLER (HOSE DETACH)
    translate([4*w/5,h/2 - 32])
    intersection() {
        circle(d=22, true);
        square([20,22],true);
    }
    
    // NO2/HE SWITCH
    translate([4*w/5,h/2+ 32])
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

