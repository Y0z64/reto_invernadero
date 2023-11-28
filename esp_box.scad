/*
    Hecho por Y0z64
    Using parametrizable-rugged-box.scad
    
    Box for NodeMCU V1 esp8266 with base
*/

include <parametrizable-rugged-box.scad>;

//outside length without ribs
outSideLength=105;

//outside width without ribs
outSideWidth=85;

//outside height
outSideHeight=30;

//shell thickness
shellThickness=3; // [3:9]

//rib thickness
ribThickness=10; // [6:20]

//fillet radius
filletRadius=4; // [4:20]

//calculated heights top split box
heiBottom=0.7*outSideHeight;
heiTop=outSideHeight-heiBottom;


//calls
//esp_box();

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
    }
    if(opened){
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