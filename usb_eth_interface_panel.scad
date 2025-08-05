b_w = 13;
b_h = 20;

box_width = 40;
box_height = 40;
box_depth = 5;
wall_thickness = 8;

include <panel.scad>

T=12;
U=2;

render()
difference(){
union() {
difference() {
    linear_extrude(3)
    difference() {
    panel();
        translate([w/2,h/2])
        circle(d=21.4, $fn=32, true);
      
        translate([w/2, 3*h/4+3])
        rotate([0, 0, 90])
        square([7, 14], true);
        
        translate([w/2, h/4-3])
        rotate([0, 0, 90])
        square([7, 14], true);
    }
}
}
 
translate([w/2 + 15, 3*h/4+3, 0])
cylinder(d=3.3, h=33, $fn=16);

translate([w/2 + 15, 3*h/4+3, 0])
cylinder(d=3, h=3, $fn=32, r1=1, r2=3);
   

translate([w/2 - 15, 3*h/4+3, 0])
cylinder(d=3.3, h=33, $fn=16);

translate([w/2 - 15, 3*h/4+3, 0])
cylinder(d=3, h=3, $fn=32, r1=1, r2=3);
       

translate([w/2 - 15, h/4-3, 0])
cylinder(d=3.3, h=33, $fn=16);

translate([w/2 - 15, h/4-3, 0])
cylinder(d=3, h=3, $fn=32, r1=1, r2=3);


translate([w/2+ 15, h/4-3, 0])
cylinder(d=3.3, h=33, $fn=16);

translate([w/2+ 15, h/4-3, 0])
cylinder(d=3, h=3, $fn=32, r1=1, r2=3);


}