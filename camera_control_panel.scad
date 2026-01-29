

//include "panel.scad";



include <panel.scad>

U = 2;
T = 21;

difference() {
linear_extrude(3)
difference() {
    panel();
    
    translate([w/2,h/2])
    intersection() {
       circle(d=12, true);
       square([20,22],true);
    }
    
}




// translate([12,h/2 - 10,1])
// linear_extrude(5,true)
// scale(0.9)
// import("svg/logo_simba_4.svg");

}