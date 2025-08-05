

//include "panel.scad";



include <panel.scad>

U = 2;
T = 21;

difference() {
linear_extrude(3)
difference() {
    panel();
    
}


translate([12,h/2 - 10,1])
linear_extrude(5,true)
scale(0.9)
    import("svg/logo_simba_4.svg");

}