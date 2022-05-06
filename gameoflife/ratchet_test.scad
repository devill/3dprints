use<polygear/shortcuts.scad>
use<polyparts/ratchet.scad>
use<polyparts/rails.scad>

module ratched_assembly(h, steps, r1, r2, hole_r, rail_depth, clearance) {
    #D() {
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

 module ratchet_paw_polygon(steps, r1, r2, r3, r4, id=0, $rfn=10) {
     teeth_angle=360/steps;
     face_angle=teeth_angle/$rfn;
     rs1 = (r2-r1)/$rfn;
     rs2 = (r4-r3)/$rfn;
     coords=[  
            for(fi = [0:$rfn])
                [
                    (r1+rs1*fi)*cos(teeth_angle*id+fi*face_angle), 
                    (r1+rs1*fi)*sin(teeth_angle*id+fi*face_angle)
                ],
            for(fi = [$rfn:-1:0])
                [
                    (r3+rs2*fi)*cos(teeth_angle*id+fi*face_angle), 
                    (r3+rs2*fi)*sin(teeth_angle*id+fi*face_angle)
                ],
            
        ];
     polygon(coords);
 }
 
 Ty(9.4)
 Tx(-0.5)
 linear_extrude(height = 4, convexity = 10)
 ratchet_paw_polygon(12,15,18,16,23, id=0);
 
 Tx(16)
 Ty(20)
 cube([4,20,10]);