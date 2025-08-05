b_w = 13;
b_h = 20;

include <panel.scad>

U=2;
T=8;

module oled_mount() {
    d=2.5;
    translate([0,0,-3])
    linear_extrude(6,true) {
        translate([15, 16.5]) circle(d=d);
        mirror([0,1]) translate([15, 10.5]) circle(d=d);
        mirror([1,1]) translate([10.5, 15]) circle(d=d);
        mirror([1,0]) translate([15, 16.5]) circle(d=d);
    }
}


module oled() {
    translate([0, 2])
    linear_extrude(2)
    square([37, 34], true);
    //linear_extrude(2)
    //square([32, 20], true);
    
    translate([0, 13.5/2-6])
    linear_extrude(10)
    square([32, 19], true);
}


difference() {
    linear_extrude(3)
    difference() {
    panel();
    }
    translate([w/2, h/2])
    oled();

}

translate([w/2,h/2])
oled_mount();

