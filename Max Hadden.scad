/*I reworked some basic formatting, and put all uses of modules below the module definitions.
There are some comments like "wall 1" and "wall 2" that are not useful for anyone who 
does not have the model in his head.  The for loops are also mysterious at first glance
sans comments.  Variables and module parameters could also do with some explanation.*/

cubesize = 1;
length = 10;
height = 18;


//vertical ramp module
module ramp(CubeSize,CylSize1,CylSize2,curvature){
    difference(){
        //cube for outer "shell" of ramp
        cube(CubeSize,center=true);
            
        //rotated cylinder to mark curve that will be within the cube to form the ramp
        rotate([90,90,90])
        translate([-12.2,10,0])
        cylinder(CylSize1,curvature,CylSize2, center=true);
    }
}

//90 degree turn module
module turn(){
    difference(){
        //cube "shell"
        translate([0,20,0])
        cube([20,20,20],center=true);
        //cylinder for curve
        translate([7.5,10,1.2])
        cylinder(18,15,15,center=true);
    }
}


for (pillar = [0 : cubesize :  height]){
    translate([10,-10,pillar-28])
    cube(size = cubesize, center = true);
}
for (pillar = [0 : cubesize :  height]){
    translate([-10,-10,pillar-28])
    cube(size = cubesize, center = true);
}

for (pillar = [0 : cubesize :  height]){
    translate([-10,10,pillar-28])
    cube(size = cubesize, center = true);
}

for (pillar = [0 : cubesize :  height]){
    translate([-10,27,pillar-28])
    cube(size = cubesize, center = true);
}

//render first ramp
ramp([20,20.4,20],15,20,20);

difference(){
    //render turn
    turn();
    //cube to shave off part of ramp in difference function
    translate([-10,27.7,-10])
    cube([20,3.5,20]);
}

//render final ramp
rotate([0,0,270])
translate([-17.71,19.89,-17.9])
ramp(20,15,20,20);

//wall 1
translate([10,25.2,-10])
cube([19.9,2.5,20]);

//wall 2
translate([10,7.7,-10])
cube([19.9,2.5,20]);