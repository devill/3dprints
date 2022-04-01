color("orange")
difference() {
    cylinder(2,20,20);

    translate([-17.5,-5.5,-1])
    linear_extrude(height = 5) 
    scale([0.6,1.1,0.6])
    text("FITYISZ",font="Deja Vu Sans:style=Bold Oblique");
    
    translate([0,18,-1])    
    cylinder(5,1,1,$fn=20);
}