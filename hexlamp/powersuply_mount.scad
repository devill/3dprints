use<polygear/shortcuts.scad>
width = 20;

for(m = [0:1:1]) {
    mirror([m,0,0]) {
        cube([50, 8, width]);
        Tx(50)
        Ty(8)
        cube([8, 43, width]);

        Tx(50)
        I() {
            Ty(8)
            cylinder(h = width, r1 = 8, r2 = 8);
            cube([8, 8, width]);
        }

        Ty(43-8)
        Tx(58)
        D() {
            cube([width, 16, width]);
            Tx(width/2)
            Tz(width/2)
            Ty(8)
            Rx(90){
                
                cylinder(h = 8, r1 = 5, r2 = 5, $fn=100);
                Tz(-4)
                cylinder(h = 4, r1 = 2.5, r2 = 5, $fn=100);
                Tz(-8)
                cylinder(h = 4, r1 = 2.5, r2 = 2.5, $fn=100);
            }
            Tx(8)
            cylinder(h = width, r1 = 8, r2 = 8);
            Tx(8)
            cube([width-8, 8, width]);
        }
    }
}
