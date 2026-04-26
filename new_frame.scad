U = 44.45;
T = 5.08;

hU = 5*U;
wT = 64*T;

// Wysokość panelu 
d = 37.5; 

$fn=30;

l = 237 + 2;
w = 357;

r=17.5;  // promień zaokrąglenia

wf_diff = r-13;

a = 3.5;
skew_a = tan(a) * d;

module skew(dims) {
matrix = [
	[ 1, dims[0]/45, dims[1]/45, 0 ],
	[ dims[2]/45, 1, dims[4]/45, 0 ],
	[ dims[5]/45, dims[3]/45, 1, 0 ],
	[ 0, 0, 0, 1 ]
];
multmatrix(matrix)
children();
}

module holes(d) {
    translate([5,21.5]) circle(d=d);
    translate([5,3.5]) circle(d=d);
}

module all_holes(d=5.5) {
    translate([-hU/2 -1,0]) {
                                 holes(d);
    translate([3 * U - 10,0])    holes(d);
    translate([3 * U,0])         holes(d);
    translate([5 * U - 10,0])    holes(d);
    }
}

module top_mount_hole() {
    translate([55+3, 11]) {
        cylinder(100, d=6);
        translate([0,2,0]) cube([15,12,d*2 - 12], true);
    }
}

module shape() {
    difference() { translate([-(l-2*r)/2,0]) union() {
            square([l-2*r,r]);

            rotate([0,0,90]) intersection() {
                circle(r=r);
                square(r);
            }
            translate([l-2*r,0]) intersection() {
                circle(r=r);
                square(r);
            }
        }
        square([l,wf_diff*2 -1], true);
    }
}

module _shape() {
    intersection() {
            linear_extrude(d) shape();
            skew([0, skew_a, 0, 0, skew_a, 0]) translate([-skew_a,-skew_a,0]) linear_extrude(d) shape();
            cube([l,l,d]);
    }
}

module shape_extruded() {
    union() {
    _shape();
    mirror([1,0,0]) _shape();
    }
}

// ZMODYFIKOWANY MODUŁ - Dodano wcięcie (kieszeń) 10mm
module fan_50_cutout(x_pos, z_pos) {
    translate([x_pos, 0, z_pos]) {
        
        rotate([90, 0, 0]) {
            // Otwór na powietrze
            cylinder(h=100, d=40, center=true, $fn=60);
            
            // Otwory montażowe dla wentylatora 50mm (rozstaw 40x40 mm)
            for (dx = [-20, 20]) {
                for (dy = [-20, 20]) {
                    translate([dx, dy, 0]) cylinder(h=100, d=3.5, center=true, $fn=20);
                    
                    translate([dx, dy, -18]) cylinder(h=10, d=7, center=true, $fn=20);
                }
            }
        }
        
        // NOWOŚĆ: Kieszeń na wentylator (51x51 mm, głębokość 10 mm)
        // Przesunięcie w osi Y tak, aby wciąć się na 10mm w głąb od płaskiej strony
        translate([0, 5, 0]) 
        cube([51, 10, 51], center=true);
    }
}

// ==========================================
// GŁÓWNY MODUŁ BUDUJĄCY ELEMENT
// ==========================================
module final_part() {
    intersection() {
        difference() {
            shape_extruded();

            // mounting
            rotate([90,0,0]) linear_extrude(50,center=true) all_holes(5.5);
            translate([0,(wf_diff+20+4)]) rotate([90,0,0]) linear_extrude(20) all_holes(11);
            
            // MIEJSCA NA WENTYLATORY
            fan_50_cutout(-25, d - 37.5);
            // fan_50_cutout(65, d - 30);
        }
    }
}

// ==========================================
// PRZEŁĄCZNIK GENEROWANIA LEWEJ/PRAWEJ STRONY
// ==========================================
// false = oryginalna strona
// true  = strona przeciwna (lustrzane odbicie)

odwroc_model = false;

echo(skew_a);

if (odwroc_model) {
    mirror([1, 0, 0]) final_part();
} else {
    final_part();
}
