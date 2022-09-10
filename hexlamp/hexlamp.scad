use<polygear/shortcuts.scad>


r_neck = 500/6;
r_cover = r_neck + 25;
r_base = r_neck + 50;

r_cavity = r_neck*0.7;

h_base = 5;
h_neck = 20;

// v2
r_base = r_neck;
h_neck = 15;




r_inner_base = sqrt(pow(r_base,2) - pow(r_base/2,2));
distance = 90;
r_back = r_base+distance/2/sin(60);


module base() {
    color("blue") {
        D() {
            U() {
                cylinder(h=h_neck+h_base, r1=r_neck, r2=r_neck, $fn=6);
                cylinder(h=h_base, r1=r_base, r2=r_base, $fn=6);
                cylinder(h=h_neck+h_base-12, r1=r_neck+1, r2=r_neck+1, $fn=6);
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
            cube([r_neck+5, 5, 10]);
            Tx(r_neck-2)
            Tz(h_base)
            Ty(-2.5)
            cube([5,5,h_neck]);
            
            for(d = [0:60:360]) {
                
                Rz(d) 
                Tx(r_cavity - 12) {
                    
                    cylinder(h=h_base, r1=2.5, r2=2.5,  $fn=100);
                    
                    Tz(h_base-2)
                    cylinder(h=2, r1=2.5, r2=5,  $fn=100);
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
}

module cover() {
    color("black") {
        Tz(h_neck+h_base) {
            cylinder(h=h_base, r1=r_cover, r2=r_cover, $fn=6);

        }

        Tz(h_neck)
        D() {
            
            cylinder(h=h_base, r1=r_cavity-0.3, r2=r_cavity-3.3, $fn=100);
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
            Tz(-h_neck)
            for(d = [0:120:360]) {
                Rz(d)
                Tz(h_base)
                Ty(r_cavity-30)
                Tx(-0.5)
                cube([4,30,h_neck]);
            }
        }
    }
}

module back() {
    color("white")
    Tz(-10)
    cylinder(h=10, r1=r_back, r2=r_back, $fn=6);
}




I() {
    U() {
        cube([25,60,50], center=true);
        Tx(-25)
        cube([35,60,50], center=true);
    }
    U() {
        electronics_mounts();
        //base();
        D() {
            cover();
            Tz(h_neck+h_base) 
            cylinder(h=5, r1=3, r2=1, $fn=100);
        }
        //back();
    }
}

module electronics_mounts() {
    Tz(h_neck-1) {
        D() {
            cylinder(h=6, r1=8.5, r2=9.2, $fn=100);
            cylinder(h=6, r1=7.5, r2=7.5, $fn=100);
            Tz(2.5){
                Rz(45)
                cube([2,19,5], center=true);
                Rz(-45)
                cube([2,19,5], center=true);
            }
            Tz(1)
            Tx(2)
            cube([1,19,4], center=true);
            Tz(1)
            Tx(-2)
            cube([1,19,4], center=true);
        }
        I() {
            cube([3,17,4], center=true);
            D() {
                cylinder(h=2, r1=7.5, r2=7.5, $fn=100);
                
                cylinder(h=2, r1=5.2, r2=7.5, $fn=100);
                cylinder(h=2, r1=7.5, r2=5.2, $fn=100);
                cylinder(h=2, r1=6.7, r2=6.7, $fn=100);
            }
        }
        Tx(-7.5)
        cylinder(h=5, r1=0.7, r2=0.7, $fn=100);
        Tx(7.5)
        cylinder(h=5, r1=0.7, r2=0.7, $fn=100);
        Ty(6.7)
        Tz(4.5)
        cube([7, 1, 3], center=true);
        Ty(-6.7)
        Tz(4.5)
        cube([7, 1, 3], center=true);
        
        Tx(7)
        Tz(4.5)
        cube([1, 6, 3], center=true);
        Tx(-7)
        Tz(4.5)
        cube([1, 6, 3], center=true);
    }

    Tz(h_neck-1) 
    Tx(-25) {
        
        Tz(4.5)
        cube([15,45,3], center=true);
        
        
        D() {
            U() {
                Tx(29/2-0.5)
                Ty(49/2-0.5)
                Tz(3)
                cube([5,5,6], center=true);
                Tx(-29/2+0.5)
                Ty(49/2-0.5)
                Tz(3)
                cube([5,5,6], center=true);
                Tx(29/2-0.5)
                Ty(-49/2+0.5)
                Tz(3)
                cube([5,5,6], center=true);
                Tx(-29/2+0.5)
                Ty(-49/2+0.5)
                Tz(3)
                cube([5,5,6], center=true);
            }
            Tz(3)
            cube([29,49,6], center=true);
        }
        
        esp_peg();
        mirror([1,0,0])
        esp_peg();
        mirror([0,1,0])
        esp_peg();
        Rz(180)
        esp_peg();

        
    }
    
    
    Ty(20)
    Tz(h_neck+5) {
        Ty(1.9)
        Rz(90)
        peg();
        
        Ty(-1.9)
        Rz(-90)
        peg();
    }

    
    Ty(-2)
    Ty(20)
    Tz(h_neck+5)
    Rz(-90)
    peg();
}

module esp_peg() {
    Tx(29/2+1)
    Ty(49/2-5.5)
    Tz(3)
    {
        peg();
        Tz(1.5)
        cube([2,5,3], center=true);
    }
}

module peg() 
{
    hull() {
        Tx(-0.5) 
        Tz(-1.5)
        cube([1,3,3], center=true);
        Tx(0.5)
        cube([1,3,0.1], center=true);
    }
    
    Tx(-1)
    Tz(-2)
    D() {
        Ry(45)
        cube([1.4,3,1.4], center=true);
        Tx(-1.4)
        cube([1.4,3,1.4], center=true);
    }
}

/*
center_point_distance = 2*r_inner_base + distance;
for(alpha = [0:60:360]) {
    Rz(alpha)
    Ty(center_point_distance)
    {
        base();
        cover();
        back();
    }
}

Ty(center_point_distance)
for(alpha = [-60:60:60]) {
    Rz(alpha)
    Ty(center_point_distance)
    {
        base();
        //cover();
        back();
    }
}
*/

total_width = 2*(sin(60)*center_point_distance+r_back);
total_height = 4*center_point_distance;
/*
Tx(-total_width/2)
Ty(-1.5*center_point_distance)
Tz(-11)
cube([total_width,total_height, 10]);
*/

echo(total_width, total_height);

//r_big_base = 3*r_inner_base
//cylinder(h=10, r1=r_cover, r2=r_cover, $fn=6);