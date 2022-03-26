
function divisor(u,v) = 2-sqrt(2)*sin(3*u)*sin(2*v);

function boys(u, v) = [
    (sqrt(2) * cos(2*u)*pow(cos(v),2)+cos(u)*sin(2*v))/ divisor(u,v),
    (sqrt(2) * sin(2*u)*pow(cos(v),2)-sin(u)*sin(2*v))/ divisor(u,v),
    3*pow(cos(v),2) / divisor(u,v)
];

for(i=[0:10:360]) {
    for(j=[0:10:180]) {
        hull() {
            translate(boys(i,j))
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