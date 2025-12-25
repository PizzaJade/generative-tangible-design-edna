// Images
PImage img01; // mask 1 (letter A)
PImage img02; // *STEP1: k 2 new declaration
PImage pattern1; // tile 1

PImage pattern2; // tile 2 -> STEP 1: Declare PImage and chooose Name


///////////////////////////////////////////
void setup(){
 size(1000,1000); // size of our sketch in pixels
 background(0); // initial color of our background 
 colorMode(HSB,360,100,100,100); // We use HSB Mode  

 
 // we load our masks our tile images
 pattern1 = loadImage("pattern-03-1.png");  
 pattern2 = loadImage("fleur_iceland_jaune500.png");  // STEP 2: Fill the name of your image file here
 
 // we load our masks
 img01 = loadImage("alpha-01.jpg");
 img01.resize(1000,1000);

img02 = loadImage("m&ms.jpg");
img02.resize(750,750);
 // *STEP 2: copy img01 to img02 and change the file name
 
 
} // end of the setup function



void draw(){  
  
  // eraser
  if(keyPressed && key == ' '){    
    //bkd_color = round(random(0,360));
    background(0,100,0);
  } // end of '1'
  
  
  if(keyPressed && key == 'w'){    
    int posX = round(random(0,1000));
    int posY = round(random(0,1000));
    float tileSize = round(random(0,100));
    image(pattern1,posX,posY,tileSize,tileSize);
  } // end of 'W'
  
  if(keyPressed && key == 'a'){    
    int posX = round(random(0,1000)); // STEP 3: Copy Paste Code from W key and change pattern1 to pattern2
    int posY = round(random(0,1000));
    float tileSize = round(random(0,100));
    image(pattern2,posX,posY,tileSize,tileSize);

  } // end of 'A'
    
  if(keyPressed && key == 's'){

      background(0,100,0); // we draw a black background
      int tiles = 90; // let's choose the number of tiles
      float tileSize = width/tiles; // responsive size (depending of the tile's number)
      for (int x =0; x < tiles; x++) { // we create a grid in the x axis thanks to this first loop
      for (int y = 0; y < tiles; y++) { // we create a grid in the y axis thanks to this second loop
      
        int tile_posX = int(x*tileSize);// let's create a variable in order to compute the position of each tile. We multiply by the tile size in order to cover the width
        int tile_posY = int(y*tileSize);// idem for the y positions
    
        int pattern_select = round(random(1,200)); //  we choose randomly a number between 1 and 2
        if(pattern_select == 1){  image(pattern1,tile_posX, tile_posY, tileSize, tileSize); } // case 1 // enum emptyness

      } // end of the first loop
     } // end of the second loop    

     //add another condition here for pattern2 if you want to use it??
     
  } // end of 'S'
 
  if(keyPressed && key == 'd'){

       background(0,100,0); // we draw a black background
      int tiles = 50; // let's choose the number of tiles
      float tileSize = width/tiles; // responsive size (depending of the tile's number)
      for (int x =0; x < tiles; x++) { // we create a grid in the x axis thanks to this first loop
      for (int y = 0; y < tiles; y++) { // we create a grid in the y axis thanks to this second loop
      
        int tile_posX = int(x*tileSize);// let's create a variable in order to compute the position of each tile. We multiply by the tile size in order to cover the width
        int tile_posY = int(y*tileSize);// idem for the y positions
    
        int pattern_select = round(random(1,2)); //  we choose randomly a number between 1 and 2
        if(pattern_select == 1){  image(pattern1,tile_posX, tile_posY, tileSize, tileSize); } // case 1
        if(pattern_select == 2){  image(pattern2,tile_posX, tile_posY, tileSize, tileSize); } // case 2

      } // end of the first loop
     } // end of the second loop       

  } // end of 'D'
  
  if(keyPressed && key == 'f'){

      background(0,100,0); // we draw a black background
      int tiles = 100; // let's choose the number of tiles
      float tileSize = width/tiles; // responsive size (depending of the tile's number)
      for (int x =0; x < tiles; x++) { // we create a grid in the x axis thanks to this first loop
      for (int y = 0; y < tiles; y++) { // we create a grid in the y axis thanks to this second loop
      
        int tile_posX = int(x*tileSize);// let's create a variable in order to compute the position of each tile. We multiply by the tile size in order to cover the width
        int tile_posY = int(y*tileSize);// idem for the y positions
        
        PImage tile_img = img02; // we choose the image we want to use as a tile // *Step3 : change img01 to img02 to use the second mask
        color c = tile_img.get(tile_posX, tile_posY); // let's analyze on our image the color of the pixel at these specific positions
        float size = map(brightness(c),0,100,tileSize,0); // we convert the brightness into a size for each tile
        // !!! play with 100 -> Blackness = big size, White = small size
       
        int pattern_select = round(random(1,3)); //  we choose randomly a number between 1 and 2
        if(pattern_select == 1){  image(pattern1,tile_posX, tile_posY, size, size); } // case 1
        if(pattern_select == 2){  image(pattern2,tile_posX, tile_posY, size, size); } // case 2
        
      } // end of the first loop
     } // end of the second loop

  } // end of 'F'

} // end of the draw function


//-----------------------------------------
//What matters: Nummber of tiles,  pattern selection, 60fps, 




//anmerkung pattern & image fehlt