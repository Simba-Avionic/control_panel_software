

//include "panel.scad";

b_w = 13;
b_h = 20;

//intersection() {
//    translate([w/2,h/2, -19])
//    cube([jr_w*2, jr_h+5, 50], true);
//
//    translate([w/2-jr_w/2,h/2-jr_h/2, -19])
//    import("Tx_Jr_Module_Holder.stl");
//}

include <panel.scad>

U=2;
T=8;

module oled_mount() {
    d=1.8;
    translate([0,0,-3])
    linear_extrude(6,true) {
        translate([21/2, 22/2]) circle(d=d);
        mirror([0,1]) translate([21/2, 22/2]) circle(d=d);
        mirror([1,1]) translate([21/2, 22/2]) circle(d=d);
        mirror([1,0]) translate([21/2, 22/2]) circle(d=d);
    }
}


module oled() {
    linear_extrude(1)
    square([25.5,27], true);
    linear_extrude(2)
    square([25.5,20], true);
    
    translate([0,13.5/2-5])
    linear_extrude(10)
    square([25.5,13.5], true);
}


difference() {
    linear_extrude(3)
    difference() {
    panel();
//        translate([w/2-6,h*(3/5)+10])
//        square([b_w,b_h], true);
//        
//        translate([w/2+9,h*(3/5)+10])
//        offset(1.3) offset(-1.3) square([3,9], true);
        

    }
    translate([w/2,h*(1/5) +10])
    oled();

}

translate([w/2,h*(1/5) +10])
oled_mount();

