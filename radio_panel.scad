b_w = 13;
b_h = 20;

include <panel.scad>

T=8;
U = 2;

difference() {
    linear_extrude(3)
    difference() {
    panel();
    translate([w/2,h/2])
   
    intersection() {
        circle(d=5.75, true);
        //square([20,22],true);
    }

    }

}

/*
intersection() {
    translate([0,h/2,25])
    rotate([0,90,0])
    linear_extrude(3)
    circle(d=h, $fn=6);
    
    translate([0,0,-6])
    linear_extrude(6)
    panel(); 
}


intersection() {
    translate([w-3,h/2,25])
    rotate([0,90,0])
    linear_extrude(3)
    circle(d=h, $fn=6);
    
    translate([0,0,-6])
    linear_extrude(6)
    panel(); 
}
*/