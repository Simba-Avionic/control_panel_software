b_w = 13;
b_h = 20;

include <panel.scad>

T=10;
U = 2;

difference() {
    linear_extrude(2)
    polygon(points=[[0, 0], [30, 0], [0, 30]]);
    difference() {
    
    linear_extrude(2)
    translate([10, 10])
    intersection() {
        circle(d=2.75);
    }

    }

}