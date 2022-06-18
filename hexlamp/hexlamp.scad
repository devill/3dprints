use<polygear/shortcuts.scad>


r_neck = 500/6;
r_cover = r_neck + 40;
r_base = r_neck + 80;
r_cavity = r_neck*0.7;

h_base = 5;
h_neck = 20;

color("white") {
    D() {
        U() {
            cylinder(h=h_neck+h_base, r1=r_neck, r2=r_neck, $fn=6);
            cylinder(h=h_base, r1=r_base, r2=r_base, $fn=6);
        }
        
        D() {
            Tz(h_base)
            cylinder(h=h_neck, r1=r_cavity, r2=r_cavity, $fn=100);
            for(d = [0:120:360]) {
                Tz(h_neck)
                Rz(d)
                D() {
                    cube([r_base,r_base,h_base]);
                    Rz(-60)
                    cube([r_base,r_base,h_base]);
                }
            }
        }
        Tz(h_neck)
        cylinder(h=5, r1=r_cavity, r2=r_cavity-3, $fn=100);
        cylinder(h=h_neck, r1=r_cavity-25, r2=r_cavity-25, $fn=100);
        
        for(d = [0:60:360]) {
            Rz(d)
            Tx(-2.5)
            cube([5, r_base, 2.5]);
        }
        Tz(h_base)
        Ty(-2.5)
        cube([r_neck+5, 5, 5]);
        Tx(r_neck-2)
        Tz(h_base)
        Ty(-2.5)
        cube([5,5,h_neck]);
        
        for(d = [0:60:360]) {
            
            Rz(d) 
            Tx(r_cavity - 12) {
                
                cylinder(h=h_base, r1=5, r2=5,  $fn=100);
                
                Tz(h_base-2)
                cylinder(h=2, r1=5, r2=10,  $fn=100);
            }
        }
    }
    for(d = [0:120:360]) {
        Rz(d)
        Tz(h_base)
        Ty(r_cavity-3)
        cube([3,3,h_neck]);
    }
}


/*color("black") {
    U() {
        Tz(h_neck) {
            cylinder(h=h_base, r1=r_cover, r2=r_cover, $fn=6);

        }

    }
}*/

U(){
    Tz(h_neck-1)
    D() {
        
        cylinder(h=h_base, r1=r_cavity, r2=r_cavity-3, $fn=100);
        for(d = [0:120:360]) {
            Rz(d+60)
            D() {
                Rz(5)
                cube([r_base,r_base,h_base]);
                Rz(-60)
                cube([r_base,r_base,h_base]);
            }
        }
        cylinder(h=h_base, r1=r_cavity-10, r2=r_cavity-10, $fn=100);
    }
}
