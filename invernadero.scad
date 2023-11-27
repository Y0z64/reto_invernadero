include <lasercut.scad>;

/* 
    Hecho por: Y0z64
    Medidas en mm
    
    Medidas panes:
    Del centro al jamon derecho: 101 -> 104
    Del centro al jamon izquierdo: 102 -> 105
*/

// Variables ---------------------------------------------->

//Globales 
thickness = 2.4;
opacity = 0.8;

//Panes
x = 448;
y = 620;
fingers = 10;
//Ventiladores
vent_r = 30;


//Lechugas
ly = 480;

//Jamon
jfingers = 3;
desp_l = 105;
desp_r = 102;


// Llamadas ----------------------------------------------->
//sandwich();

// Grupos
module sandwich(){
    //Pan1
    translate([thickness,thickness,0]) rotate([0,-90,0])  pan();
    //Pan2
    translate([ly+thickness*2,thickness,0]) rotate([0,270,0]) color("saddleBrown", opacity) pan();

    //Lechuga1
    translate([thickness,0,0]) rotate([-90,-90,0]) color("lightGreen", opacity) lechuga();
    //Lechuga2
    translate([thickness,y+thickness,0]) rotate([-90,-90,0]) color("lightGreen", opacity) lechuga();

    //Jamon1
    translate([thickness,y/2-desp_l,0]) rotate([-90,-90,0]) color("Pink",opacity) jamon();
    //Jamon2
    translate([thickness,y/2+desp_r,0]) rotate([-90,-90,0]) color("Pink",opacity) jamon();
}

// Piezas ------------------------------------------------->
//Pan
module pan(){
    difference(){
        color("saddleBrown", opacity) lasercutoutSquare(thickness=thickness, x=x, y=y,
            finger_joints=[
                [UP, 1, fingers],
                [DOWN, 0, fingers]
                ]
        );
        union(){
            translate([0,-thickness+y/2-desp_l,thickness*2]) rotate([-90,0,0]) for (i = [0:jfingers-1]){
                translate([(x/3)*i,0,0]) cube([x/6, ly+thickness*4, thickness]);
            }
            translate([0,-thickness+y/2+desp_r,thickness*2]) rotate([-90,0,0]) for (i = [0:jfingers-1]){
                translate([(x/3)*i,0,0]) cube([x/6, ly+thickness*4, thickness]);
            }
        }
    }
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

//Jamon
module jamon(){
    lasercutoutSquare(thickness=thickness, x=x, y=ly,
        finger_joints=[
            [UP, 1, 3],
            [DOWN, 0, 3],
        ]
    );
}