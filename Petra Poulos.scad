/*Why -1000 to 1000?
  This is an elegant solution to making a spiral, 
  but can you explain why the sin and cos translation
  strategy works?
  Why is the multiplier for y and i, 100?
  Why is the sphere radius 50?
  The 1000, 100, and 50 are also magic numbers; using
  variables to give these values names would help,
  even without additional commenting.*/
for (x=[-1000:1000]){
    y = sin(x) * 100;
    i = cos(x) *100;
    translate([x,y,i]) 
    sphere(50);
}