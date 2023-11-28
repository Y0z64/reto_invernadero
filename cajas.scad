/*
    Hecho por Y0z64
    Using parametrizable-rugged-box.scad
*/

include <parametrizable-rugged-box.scad>;

$fn=64;

//outside length without ribs
outSideLength=55;

//outside width without ribs
outSideWidth=55;

//outside height
outSideHeight=50;

//shell thickness
shellThickness=3; // [3:9]

//rib thickness
ribThickness=10; // [6:20]

//fillet radius
filletRadius=4; // [4:20]

//show example
showExample=false;

//show example combined
showExampleCombined=false;


//calculated heights top split box
heiBottom=0.7*outSideHeight;
heiTop=outSideHeight-heiBottom;

ruggedBox(lenght);