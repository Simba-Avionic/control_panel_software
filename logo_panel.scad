

//include "panel.scad";



include <panel.scad>

U = 2;
T = 5;

difference() {
linear_extrude(3)
difference() {
    panel();
    
}

translate([w/2+5,h/2-23,2])
linear_extrude(2,true)
rotate([0,0,90])
scale(0.5)
    import("test1.svg");

}