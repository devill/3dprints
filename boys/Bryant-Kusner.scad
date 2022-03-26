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
    100*g1(z)/g(z),
    100*g2(z)/g(z),
    100*g3(z)/g(z)
];

function boys(u,v) = cboys(z(u,v));

ustep = 0.05;
vstep = 18;

for(u=[0:ustep:1]) {
    for(v=[0:vstep:360]) {
        hull() {
            translate(boys(u,v))
            sphere(1, $fn=10);
            translate(boys(u+ustep,v))
            sphere(1, $fn=10);
            
            translate(boys(u,v+vstep/4))
            sphere(1, $fn=10);
            translate(boys(u+ustep,v+vstep/4))
            sphere(1, $fn=10);
        }
    }
}

ustep2 = 0.1;
vstep2 = 4.5;

for(u=[0:ustep2:1]) {
    for(v=[0:vstep2:360]) {
        
        hull() {
            translate(boys(u,v))
            sphere(2, $fn=10);
            translate(boys(u,v+vstep2))
            sphere(2, $fn=10);
        }
    }
}
/*
for(u=[0:0.1:1]) {
    for(v=[0:36:360]) {
        hull() {
            translate(boys(u,v))
            sphere(0.01, $fn=10);
            translate(boys(i+10,j))
            sphere(0.01, $fn=10);
        }
        
        hull() {
            translate(boys(i,j))
            sphere(0.01, $fn=10);
            translate(boys(i+2,j))
            sphere(0.01, $fn=10);
            if(i%20==0) {
                translate(boys(i,j+5))
                sphere(0.01, $fn=10);
                translate(boys(i+2,j+5))
                sphere(0.01, $fn=10);
            }
        }
        
    }
}
*/