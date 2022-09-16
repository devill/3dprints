use<polygear/shortcuts.scad>

D() {
    cube([25,100,15],center=true);
    Tz(2.5)
    cube([15,100,10],center=true);
    Tz(2.5)
    Rz(60)
    cube([50,1,11],center=true);
    Tz(2.5)
    Rz(30)
    cube([50,1,11],center=true);
}