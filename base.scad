include <lasercut.scad>;
$fn=100;
/* 
    Hecho por: Y0z64
    Medidas en mm
*/

// Variables ---------------------------------------------->

//Globales 
thickness = 2.4;
opacity = 0.8;

//Panes
x = 458;
y = 660;
fingers = 10;

//Lechugas
ly = 500;


// Llamadas ----------------------------------------------->
//Panel 1
//Pan1
translate([thickness,thickness,0]) rotate([0,-90,0]) color("saddleBrown", opacity) pan();
//Pan2
translate([ly+thickness*2,thickness,0]) rotate([0,270,0]) color("saddleBrown", opacity) pan();

//Lechuga1
translate([thickness,0,0]) rotate([-90,-90,0]) color("lightGreen", opacity) lechuga();
//Lechuga2
translate([thickness,y+thickness,0]) rotate([-90,-90,0]) color("lightGreen", opacity) lechuga();

// Piezas ------------------------------------------------->
//Pan
module pan(){
    lasercutoutSquare(thickness=thickness, x=x, y=y,
        finger_joints=[
            [UP, 1, fingers],
            [DOWN, 0, fingers]
        ]
    );
}

//Lechuga
module lechuga(){
    lasercutoutSquare(thickness=thickness, x=x, y=ly,
        finger_joints=[
            [UP, 0, fingers],
            [DOWN, 1, fingers],
        ]
    );
}
