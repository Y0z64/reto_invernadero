/*
    Hecho por Y0z64
    Using parametrizable-rugged-box.scad
    
    Box for NodeMCU V1 esp8266 with base
*/
$fn=99;

include <parametrizable-rugged-box.scad>;

//outside length without ribs
outSideLength=85;

//outside width without ribs
outSideWidth=70;

//outside height
outSideHeight=24;

//shell thickness
shellThickness=3; // [3:9]

//rib thickness
ribThickness=10; // [6:20]

//fillet radius
filletRadius=4; // [4:20]

//calculated heights top split box
heiBottom=0.7*outSideHeight;
heiTop=outSideHeight-heiBottom;

//Test
// modif_esp_box();

// Print this
translate([outSideLength/2+10,outSideWidth/2+10,0]) modif_esp_box(print=true);
//translate([(outSideLength/2+10)*3,outSideWidth/2+10,0]) modif_esp_box(print=true);
//translate([(outSideLength/2+10)*5,outSideWidth/2+10,0]) modif_esp_box(print=true);

module esp_box(combined=false, opened=false) {
    ruggedBox(length=outSideLength, width=outSideWidth, height=heiBottom, fillet=filletRadius, shell=shellThickness, rib=ribThickness, top=false, fillHeight=0);
    if(combined){
        //bottom
        color([0.5,0.5,1])
        ruggedBox(length=outSideLength, width=outSideWidth, height=heiBottom, fillet=filletRadius, shell=shellThickness, top=false, fillHeight=0);
    
        //top
        color([1,1,1])
        translate([0,0,heiTop+heiBottom])
        rotate([0,180,180])
        ruggedBox(length=outSideLength, width=outSideWidth, height=heiTop, fillet=filletRadius, shell=shellThickness, top=true); 
    } else if(opened){
        //bottom
        color([0.5,0.5,1])
        ruggedBox(length=outSideLength, width=outSideWidth, height=heiBottom, fillet=filletRadius, shell=shellThickness, top=false, fillHeight=0);
    
        //top
        color([1,1,1])
        translate([-outSideLength/2-heiTop-shellThickness,0,outSideHeight+outSideLength/2-heiTop+shellThickness])
        rotate([0,270,180])
        ruggedBox(length=outSideLength, width=outSideWidth, height=heiTop, fillet=filletRadius, shell=shellThickness, top=true); 
}
}

module modif_esp_box(top=false, print=false) {
    if(!print){
    //bottom
        difference() {
        ruggedBox(length=outSideLength, width=outSideWidth, height=heiBottom, fillet=filletRadius, shell=shellThickness, top=false, fillHeight=0);
        translate([20,outSideWidth/2,14]) cube([30,50,6], center=true);
        translate([outSideLength/2,-outSideWidth/2+7,13]) rotate([0,90,0]) cylinder(30, d=10, center=true);
        translate([outSideLength/2+10,0,15]) cube([30,10,10],center=true);
        }
    //top
        difference() {
        translate([0,0,heiTop+heiBottom+9.7])
        rotate([0,180,180])
        color("Red", 1)
        ruggedBox(length=outSideLength, width=outSideWidth, height=heiBottom, fillet=filletRadius, shell=shellThickness, top=true, fillHeight=0);
        translate([outSideLength/2+10,0,10]) cube([30,10,10],center=true);
        }
    } else if(print) {
        //bottom
        difference() {
        ruggedBox(length=outSideLength, width=outSideWidth, height=heiBottom, fillet=filletRadius, shell=shellThickness, top=false, fillHeight=0);
        translate([20,outSideWidth/2,14]) cube([30,50,6], center=true);
        translate([outSideLength/2,-outSideWidth/2+7,13]) rotate([0,90,0]) cylinder(30, d=12, center=true);
        translate([outSideLength/2+10,0,18]) cube([30,10,10],center=true);
        }
    //top
        translate([0,outSideWidth+10,(heiTop+heiBottom+9.7)]) rotate([0,180,180]) difference() {
        translate([0,0,heiTop+heiBottom+9.7])
        rotate([0,180,180])
        color("Red", 1)
        ruggedBox(length=outSideLength, width=outSideWidth, height=heiBottom, fillet=filletRadius, shell=shellThickness, top=true, fillHeight=0);
        translate([outSideLength/2+10,0,16]) cube([30,10,10],center=true);
        }
    }
}
