b_w = 13;
b_h = 20;

include <panel.scad>
// 10
T=8;
U=2;

module xt60em() {
    translate([-20.5/2,0])circle(d=2.8);
    translate([20.5/2,0]) circle(d=2.8);
    hull() {
        translate([-8/2,0])
        square([8,8.2],true);
        translate([4+1,0-1])
        circle(4-1);
        translate([4+1,0+1])
        circle(4-1);
    }
}


difference() {
    linear_extrude(3)
    difference() {
    panel();
        translate([w/2,3/4*h - 1])
        square([b_w,b_h], true);
        
        translate([w/2,h/2 - 5])
        xt60em();

        hull() {
            offset(r=1.2)
            offset(delta=-1.2)
            translate([w/2,h/4 - 3])
            
            square([9, 3.5], true);           
        }
        
        translate([w/2 + 8,h/4 - 3])
        circle(d=2.85);
        
        translate([w/2 - 8,h/4 - 3])
        circle(d=2.85);   
    }
    
    difference() {
        linear_extrude(2)
        translate([w/2,h/4 - 3, 0])
        offset(r=2.5)
        offset(delta=-2.5)
        square([22,8], true);
    }
}

