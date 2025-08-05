b_w = 13;
b_h = 20;

include <panel.scad>

T=6;
U = 2;

difference() {
    linear_extrude(3)
    difference() {
    panel();
    translate([w/2,h/2])
   
    intersection() {
        circle(d=6.5, true);
        //square([20,22],true);
    }

    }

}