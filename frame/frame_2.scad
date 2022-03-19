all(175,125);
//all(150,150);


module all(w,h) {
    if(w <= h) {
        translate([-w/2-10,0,0])
        frame(w,h);
        translate([w/2+10,0,0])
        back(w,h);
    } else {
        translate([0,-h/2-10,0])
        frame(w,h);
        translate([0,h/2+10,0])
        back(w,h);

    }
}    

module frame(w,h) {
    difference() {
        cube([w+20,h+20,10], center=true);
        cube([w-4,h-4,12], center=true);
        translate([0,0,4])
        cube([w+16,h+16,4], center=true);
        translate([0,0,4])
        cube([w+3,h+3,8], center=true);
    }
}

module back(w,h) {
    translate([0,0,-4.0])
    union() {
        difference() {
            cube([w+2.2,h+2.2,2], center=true);
            translate([0,0,0])
            cube([w-10,h-10,3], center=true);
        }
        translate([0,h/6,0])
        union() {
            cube([w-5,10,2], center=true);
            
            translate([0,0,5])
            difference() {
                cube([12,10,2], center=true);
                    translate([0,-8,0])
                rotate([0,0,45])
                cube([10,10,4], center=true);
            }
            
            translate([0,0,2.5])
            difference() {
                cube([12,10,3], center=true);
                translate([0,-2,0])
                cube([8,10,3.1], center=true);
            }
        }
        translate([0,-h/6,-0.5])
        cube([w-5,1,1], center=true);
        
        translate([-w/6,0,-0.5])
        cube([1,h-5,1], center=true);
        
        translate([w/6,0,-0.5])
        cube([1,h-5,1], center=true);
    }
}