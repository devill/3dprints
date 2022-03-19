module frame() {
    difference() {
        union() {
            translate([-15/2,0,0])
            cylinder(h=15, d=1, center=true, $fn=180);
            translate([15/2,0,0])
            cylinder(h=15, d=1, center=true, $fn=180);


            translate([0,0,-15/2])
            rotate([0,90,0])
            cylinder(h=15, d=1, center=true, $fn=180);
            translate([0,0, 15/2])
            rotate([0,90,0])
            cylinder(h=15, d=1, center=true, $fn=180);

            translate([-15/2,0,-15/2])
            sphere(d=1, $fn=180);
            translate([-15/2,0,15/2])
            sphere(d=1, $fn=180);
            translate([15/2,0,-15/2])
            sphere(d=1, $fn=180);
            translate([15/2,0,15/2])
            sphere(d=1, $fn=180);
        }
        translate([0,-0.2,0])
        cube(size = [15,0.8,15], center = true);
        translate([0,-0.35,0])
        cube(size = [16,0.4,16], center = true);
        
        translate([15/2,0,0])
        difference() {
            cylinder(h=15, d=0.7, center=true, $fn=180);
            cylinder(h=15, d=0.5, center=true, $fn=180);
            translate([0,0.4,0])
            cube(size=[16,0.4,16], center=true);
        }
        
        translate([-15/2,0,0])
        difference() {
            cylinder(h=15, d=0.7, center=true, $fn=180);
            cylinder(h=15, d=0.5, center=true, $fn=180);
            translate([0,0.4,0])
            cube(size=[16,0.4,16], center=true);
        }
        
        translate([0,0,15/2-0.1])
        cube(size=[15.6,0.4,0.2], center=true);
        translate([0,0.1,15/2-0.2])
        cube(size=[15.6,0.2,0.2], center=true);
        
        mirror(v= [0, 0, 1] ) {
            translate([0,0,15/2-0.1])
            cube(size=[15.6,0.4,0.2], center=true);
            translate([0,0.1,15/2-0.2])
            cube(size=[15.6,0.2,0.2], center=true);
        }
        translate([0,0.1,15/2])
        cube([1,0.2,0.4], center=true);
        
        translate([0,0,15/2])
        cube([0.2,0.4,0.2], center=true);
    }
    

    
    translate([15/2+0.25,0.1,0])
    cube([0.2,0.2,14],center=true);
    
    translate([-15/2-0.25,0.1,0])
    cube([0.2,0.2,14],center=true);

}

scale([10,10,10])
rotate([90,0,0])
frame();

//intersection() {
//    cube(1.8, center=true);
//    translate([0,0,-15/2])
//    frame();
//}