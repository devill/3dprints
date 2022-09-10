use<polygear/shortcuts.scad>
use<polyparts/ratchet.scad>
use<polyparts/rails.scad>

module ratched_assembly(h, steps, r1, r2, hole_r, rail_depth, clearance) {
    D() {
        ratchet(steps, r1, r2, h=h);
        cylinder_rail(h=h, r1=hole_r+clearance, r2=hole_r+clearance-rail_depth);
    }

    cylinder_rail(h=h, r1=hole_r, r2=hole_r-rail_depth);
}

ratched_assembly(
    h=4, 
    steps=12, 
    r1=15, 
    r2=18, 
    hole_r=8, 
    rail_depth=2, 
    clearance=0.5 
);

 
module paw_assembly() { 
    Ty(9.4)
    Tx(-0.5)
    ratched_paw(12,15,18,16,23,4, id=0);
     
    Tx(14.5)
    Ty(50)
    Rx(90)
    linear_extrude(height = 30)
    polygon([[0,0],[1.2,2],[0,4],[5,4],[3.8,2],[5,0]]);

    Tx(14.5)
    Ty(40)
    Rx(90)
    {
        linear_extrude(height = 15)
        polygon([[-0.4,0],[0.8,2],[-0.4,4],[-5,4],[-5,0]]);
        
        
        linear_extrude(height = 15)
        polygon([[10,0],[10,4],[10,4.5],[5.4,4.5],[5.4,4],[4.2,2],[5.4,0]]);    
    }

    Tz(4)
    cylinder(h=0.5, r=8);
}

paw_assembly();

Rz(60)
paw_assembly();

D() {
    cylinder(h=8,r=48,$fn=6);
    cylinder(h=4.5,r=20);
    Tx(12)
    cube([11,50, 4.5]);
    Rz(60)
    Tx(12)
    cube([11,50, 4.5]);
}

