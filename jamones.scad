/*
    Hecho por Y0z64
    Tenemos 3 paneles de acrilico de diferentes tamanos
    Este es el panel de las lechugas
*/

$fn = 10000;
include <invernadero.scad>;

projection() jamones();

module jamones(){
    translate([1,thickness+6,0]) jamon();
    translate([x+2,thickness+6,0]) jamon();
}