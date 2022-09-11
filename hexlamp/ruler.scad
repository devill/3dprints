use<polygear/shortcuts.scad>
D() {
    cube([210,8,2]);
    Tz(0.8)
    Rx(20)
    {
        cube([210,8,2]);
        Tz(-0.3)
        Tx(5)
        U() {
            for(d = [0:10:200]) {
                Tx(d)
                cube([0.3,4,2]);
            }
            for(d = [0:5:200]) {
                Tx(d)
                cube([0.3,3,2]);
            }
            for(d = [0:1:200]) {
                Tx(d)
                cube([0.3,2,2]);
            }
        }
    }
}

Ty(4.5)
Tx(5)
U() {
    for(d = [0:1:20]) {
        Tx(10*d)
        linear_extrude(2.6)
        text(str(d), font = "Arial Black:style=Bold", size=2.5, halign="center");
    }
    
}

