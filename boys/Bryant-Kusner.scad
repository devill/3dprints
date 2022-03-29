function cmul(a,b) = [
    a[0]*b[0] - a[1]*b[1],
    a[0]*b[1] + a[1]*b[0]
];

function cnorm(b) = (b[0]*b[0]+b[1]*b[1]);

function cdiv(a,b) = [
    (a[0]*b[0]+a[1]*b[1])/cnorm(b),
    (a[1]*b[0]-a[0]*b[1])/cnorm(b)
];

function cadd(a,b) = [
    a[0] + b[0],
    a[1] + b[1]
];

function cminus(a,b) = [
    a[0] - b[0],
    a[1] - b[1]
];

function cr(a) = a[0];
function ci(a) = a[1];

function cpow(a,p) = p == 0 ? [1,0] : cmul(a,cpow(a,p-1));

function gd(z) = cminus(cadd(cpow(z,6),cmul([sqrt(5),0],cpow(z,3))), [1,0]);

function g1(z) = 3/2*ci(cdiv(cmul(z,cminus([1,0], cpow(z,4))),gd(z)));
function g2(z) = 3/2*cr(cdiv(cmul(z,cadd([1,0], cpow(z,4))),gd(z)));
function g3(z) = ci(cdiv(cadd([1,0],cpow(z,6)),gd(z)))-1/2;

function g(z) = pow(g1(z),2) + pow(g2(z),2) + pow(g3(z),2);

function z(u,v) = [
    u*cos(v), u*sin(v)
];

function cboys(z) = [
    30*g1(z)/g(z),
    30*g2(z)/g(z),
    30*g3(z)/g(z)
];

function boys(u,v) = cboys(z(u,v));

module section(from,to) {
    intersection() {
        translate([-50,-50,from])
        cube([100,100,to-from]);
        model();
    }
}

/*
translate([cos(-120)*50,sin(-120)*50,12])
section(-12,20);
*/
//translate([cos(120)*50,sin(120)*50,30])
section(-30,-12);
/*
translate([50,0,61.5])
section(-61.5,-30);
*/

//strips(0,1);
//lines(0,1);

module model() {
    strips(0,1);
    lines(0,1);
    translate([0,0,-61.5])
    cylinder(6,18,16.5);
}

module strips(uf, ut) {
    ustep = 0.05;
    vstep = 18;
    
    for(u=[uf:ustep:ut]) {
        for(v=[0:vstep:360]) {
            hull() {
                translate(boys(u,v))
                sphere(1, $fn=10);
                translate(boys(u+ustep,v))
                sphere(1, $fn=10);
                
                translate(boys(u,v+vstep/8))
                sphere(1, $fn=10);
                translate(boys(u+ustep,v+vstep/8))
                sphere(1, $fn=10);
            }
        }
    }
}

module lines(uf,ut) {
    ustep = 0.1;
    vstep = 2;

    for(u=[uf:ustep:ut]) {
        for(v=[0:vstep:360]) {
            
            hull() {
                translate(boys(u,v))
                sphere(1.1, $fn=10);
                translate(boys(u,v+vstep))
                sphere(1.1, $fn=10);
            }
        }
    }
}
