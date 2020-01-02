PImage bg; // creating various variables that will be used through out the code // This variable is to store the background image
PShape earthG, moonG; // these variables are created to store the texturemap of the two spheres used
float angle, angle2; // angle variables created to set different travel speeds

void setup() { 
  size(1300, 800, P3D); // size of window is established. P3D enables the size to be 3 dimensional
  String http = "http://"; // string variable is created to URL calling easier
  PImage earth = loadImage( http + "previewcf.turbosquid.com/Preview/2014/08/01__15_41_30/Earth.JPG5a55ca7f-1d7c-41d7-b161-80501e00d095Larger.jpg"); // local variable made to get the texture from online
  PImage moon = loadImage(http + "orig05.deviantart.net/6673/f/2011/198/4/6/moon___map_by_horizoied-d3y3lvg.jpg"); // local variable made to get the texture from online but for the moon
  bg = loadImage(http+ "i.imgur.com/UzMziur.jpg"); // background image is being collected from the url specified
  bg.resize(1300,800); //background image is resized to fit the window size previously established
  background(bg); //background image is being used
  noStroke(); // gets rid of the spherical outline
  earthG = createShape(SPHERE,200); //Earth sphere is being created with 200 pixel radius
  earthG.setTexture(earth); // earth texture is being placed on the sphere
  moonG = createShape(SPHERE,50);
  moonG.setTexture(moon);
  angle = 0; // angle variables are initialised and set to 0 
  angle2 = 0;
}

void draw()
{
  lights(); // ambient lights are placed on the objects that are drawn below
  
  translate(width/2, height/2, 0); //centers the first sphere
  rotateY(radians(angle)); //rotates both spheres on the x axis based on the angle value
  background(bg);


  shape(earthG); //earth sphere is created here
  rotateY(radians(angle2)); // this is to provide a faster speed for the moon's rotation in comparision to the earth's rotation
  translate(400,0,0); // places the moon sphere away from the centre of the screen and more to the right but in line with the earth
  rotateY(radians(angle2)); // so the moon has its own x axis rotation while it is orbiting the earth
  shape(moonG); // moon sphere is created here
  
  angle = angle + 1; //angle variables are being incremented so the rotations can happen
  angle2 = angle2 + 1.5;
}
