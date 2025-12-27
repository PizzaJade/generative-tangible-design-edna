// Images & Masks
PImage img01, img02, img03; 
PImage currentMask;

// 1. Arrays für die verschiedenen Gefühle (Patterns)
PImage[] peacefulPatterns = new PImage[2]; 
PImage[] playfulPatterns = new PImage[2]; // Beispiel für ein zweites Set

void setup() {
  size(1000, 1000); 
  background(0); 
  colorMode(HSB, 360, 100, 100, 100); 

  // Bilder in Arrays laden
  peacefulPatterns[0] = loadImage("peaceful_pattern1.png");
  peacefulPatterns[1] = loadImage("peaceful_pattern2.png");
  
  // Masken laden
  img01 = loadImage("img01.png"); // Wort 1 -> Peaceful
  img01.resize(1000, 1000);
  img02 = loadImage("img02.jpg"); // Wort 2 -> Playful
  img02.resize(1000, 1000);
  img03 = loadImage("img03.png"); // Wort 3 -> Optimistic
  img03.resize(1000, 1000);
  
  currentMask = img01; // Standardmaske für die 'F'-Funktion
} 

void draw() {   
  
  // Eraser - Leertaste
  if (keyPressed && key == ' ') {    
    background(0, 100, 0);
  } 

  // Dein physischer Makey Makey Button (UP): Einzelne Symbole im Wort "Love"
  if (keyPressed && keyCode == UP) {
    displayRandomFromSet(peacefulPatterns, img01);
  }

  // DIE ORIGINAL 'F'-FUNKTION (angepasst auf Arrays)
  if (keyPressed && (key == 'f' || key == 'F')) {
    background(0, 100, 0); 
    int tiles = 100; 
    float tileSize = width/tiles; 
    
    for (int x = 0; x < tiles; x++) { 
      for (int y = 0; y < tiles; y++) { 
        int tile_posX = int(x * tileSize);
        int tile_posY = int(y * tileSize);
        
        // Nutzt img02 als Maske wie im Original
        PImage tile_img = img02; 
        color c = tile_img.get(tile_posX, tile_posY); 
        float size = map(brightness(c), 0, 100, tileSize, 0); 
        
        // Hier kommt die Array-Logik rein:
        int pattern_select = int(random(peacefulPatterns.length)); 
        image(peacefulPatterns[pattern_select], tile_posX, tile_posY, size, size);
      } 
    }
  }
}

// Funktion für das zufällige Platzieren (wird vom Makey Makey Button UP genutzt)
void displayRandomFromSet(PImage[] set, PImage mask) {
    int posX = int(random(0, width));
    int posY = int(random(0, height));
    
    color c = mask.get(posX, posY);
    if (brightness(c) < 50) { // Wenn Pixel im Wort/Dunkel
      float tileSize = random(20, 80);
      int pSel = int(random(set.length)); 
      image(set[pSel], posX, posY, tileSize, tileSize);
    }
}