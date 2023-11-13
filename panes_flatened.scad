use <lasercut.scad>;
$fn=60;
module flat(){
projection(cut = false)

lasercutout(thickness = 2.4, 
          points = [[0, 0], [458, 0], [458, 620], [0, 620], [0, 0]]
        , finger_joints = [[0, 1, 10], [180, 0, 10]]
        ) 

lasercutout(thickness = 2.4, 
          points = [[0, 0], [458, 0], [458, 620], [0, 620], [0, 0]]
        , finger_joints = [[0, 1, 10], [180, 0, 10]]
        ) 

;
}

flat();
