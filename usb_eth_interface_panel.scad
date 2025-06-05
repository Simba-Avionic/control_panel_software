b_w = 13;
b_h = 20;

include <panel.scad>

T=8;
U=2;

module hollow_box() {
    box_width = 20;
    box_height = 44;
    box_depth = 4;
    wall_thickness = 8;

    difference() {
        // Outer shape
        translate([10, 6, -box_depth])
            cube([box_width, box_height, box_depth]);
        

        // Inner cutout
        translate([10, 6 + wall_thickness, -box_depth])
            cube([
                box_width,
                box_height - 2 * wall_thickness,
                box_depth
            ]);
        
        translate([20, 11, -box_depth])
        cylinder(d=3, h=10, $fn=12);
        
        translate([20, 45, -box_depth])
        cylinder(d=3, h=10, $fn=12);
        
    }

}

render()
union() {
difference() {
    linear_extrude(3)
    difference() {
    panel();
        translate([w/2,3/4*h+5])
        circle(d=21.4, $fn=32, true);
        
        offset(r=5)  // <--- Rounding here
        offset(delta=-4)
        translate([w/2, h/3])
        square([10, 40], true);
    }
}
hollow_box();
}