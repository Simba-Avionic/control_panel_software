$fn = 20;
U = 3;
T = 16;

h = U * 44.5 - 5;
w = T * 5.08 - 2*.2;

m_x = 7.47;
//m_x = 0;
m_y = 3.1;
m_d = 3;

F = U * 44.5 + (122.5 - 3 * 44.5);

echo(w);

module hole() {
//    hull() {
    //circle(d=m_d);
    translate([5.08/2,0]) circle(d=m_d);
//    }
}

module holes() {
    translate([m_x, m_y]) hole();
    translate([m_x, m_y + F]) hole();
}

module panel() {
    difference() {
    square([w, h]);
        holes();
        if(T>6) {
            translate([(T-3) * 5.08 - 5.08, 0]) holes();
        }
        translate([(T-24) * 5.08, 0]) holes();
    }
}

//panel();

//#square([46,62]);
//#import("jr-module-bay-cover.stl");