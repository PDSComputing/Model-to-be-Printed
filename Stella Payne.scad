width_1   = 700; //width from center of the loop to outer radius

width_2   = 400; // width from outer radius to inner radius

loop_1   = 1; // number of loops wanted:  middle, bottom, top 

walls_1  = 100; // wall height / 2



 module loop_middle(){  //middle loops inside larger loop

    for(count = [0 : (360 * loop_1)]){  //A count of 360 x the amount of loops given as a variable above. This is because each loop has 360°  

        

//Ramp base     

        translate([ width_1 * cos(count), width_1 * sin(count), count]) //Made parametrically using parametric form of a loop

        rotate([count,270,0]) //rotated with count so that it rotates properly around the center of the loop

        cube(size = [20, 30, width_2], center = false); //The size of the rectangles that add together to create the ramp of the loop

        

//Loop outer-wall

        translate([width_1*cos(count),width_1*sin(count),count+walls_1]) //Made parametrically using parametric form of a loop

        rotate([count,270,0]) //rotated with count so that it rotates properly around the center of the loop

        cube(size = [2*walls_1, 20, 30], center = true); //The size of the rectangles that add together to create the outer-wall of the loop

        

//Loop inner-wall

        translate([(width_1-width_2)*cos(count)*1.05,(width_1-width_2)*sin(count)*1.05,count+walls_1]) //Made parametrically using parametric form of a loop

        rotate([count,270,0]) //rotated with count so that it rotates properly around the center of the loop

        cube(size = [2*walls_1, 10, 30], center = true); //The size of the rectangles that add together to create the inner-wall of the loop

    }



//Lowest-outer Pillar

    for(count= [0:360*loop_1]){//The height of the pillar

        translate([0,width_1,count+60]) //Moves it upward so that it can connect to the pillar bellow

        cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1); //Each block has a height of 1. These are stacked on each other. The radius is veriable with the width_1 and width_2

 

//Lowest-inner Pillar       

        translate([0,(width_1-width_2),count+60])//Moves it upward so that it can connect to the pillar bellow

        cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);//Each block has a height of 1. These are stacked on each other. The radius is variable with the width_1 and width_2

    }

    

//Second lowest-outer Pillar

    for(count= [0:360*loop_1]){//The height of the pillar

        translate([-(width_1),0,count+150])//Moves it upward so that it can connect to the pillar bellow

        cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);//Each block has a height of 1. These are stacked on each other. The radius is variable with the width_1 and width_2

        

//Second lowest-inner Pillar

        translate([-(width_1-width_2),0,count+150])//Moves it upward so that it can connect to the pillar bellow

        cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);//Each block has a height of 1. These are stacked on each other. The radius is variable with the width_1 and width_2



//Tallest outer Pillar

    }

    for(count= [0:360*loop_1]){//The height of the pillar

        translate([0,-(width_1),count+240])//Moves it upward so that it can connect to the pillar bellow

        cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);//Each block has a height of 1. These are stacked on each other. The radius is variable with the width_1 and width_2

        

//Tallest inner Pillar

        translate([0,-(width_1-width_2),count+240])//Moves it upward so that it can connect to the pillar bellow

        cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);//Each block has a height of 1. These are stacked on each other. The radius is variable with the width_1 and width_2

    }

}













 module loop_bottom(){   

    for(count= [0:(360*loop_1)]){

        color("red")

        translate([width_1*cos(count),width_1*sin(count),count])rotate([count,270,0]) cube(size = [20, 30, width_2], center = false);

        translate([width_1*cos(count),width_1*sin(count),count+walls_1])rotate([count,270,0])cube(size = [2*walls_1, 20, 30], center = true);

        translate([(width_1-width_2)*cos(count)*1.05,(width_1-width_2)*sin(count)*1.05,count+walls_1])rotate([count,270,0])cube(size = [2*walls_1, 20, 30], center = true);

    }

    for(count= [0:360*loop_1+60]){

        color("red")

        translate([0,width_1,count])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

        translate([0,(width_1-width_2),count])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

    }

    for(count= [0:360*loop_1+150]){

        color("red")

        translate([-(width_1),0,count])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

        translate([-(width_1-width_2),0,count])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

    }

    for(count= [0:360*loop_1+240]){

        color("red")

        translate([0,-(width_1),count])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

        translate([0,-(width_1-width_2),count])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

    }

}



















 module loop_top(){  

    for(count= [0:(360*loop_1)]){                                                 

        color("red")

        translate([width_1*cos(count),width_1*sin(count),count])rotate([count,270,0]) cube(size = [20, 30, width_2], center = false);

        translate([width_1*cos(count),width_1*sin(count),count+walls_1])rotate([count,270,0])cube(size = [2*walls_1, 20, 30], center = true);

        translate([(width_1-width_2)*cos(count)*1.05,(width_1-width_2)*sin(count)*1.05,count+walls_1])rotate([count,270,0])cube(size = [2*walls_1, 10, 30], center = true);

    }

    for(count= [0:360*loop_1-120]){

        color("red")

        translate([0,width_1,count+60])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

        translate([0,(width_1-width_2),count+60])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

    }

    for(count= [0:360*loop_1-120]){

        color("red")

        translate([-(width_1),0,count+150])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

        translate([-(width_1-width_2),0,count+150])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

    }

    for(count= [0:360*loop_1-120]){

        color("red")

        translate([0,-(width_1),count+240])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

        translate([0,-(width_1-width_2),count+240])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

    }

}

loop_bottom();

translate([0,0,500])loop_middle();//should be at 360 up in the z direction! Can add more if you want more loops in the long spiral

translate([0,0,1080])loop_top(); //should be 360 above highest middle loop!