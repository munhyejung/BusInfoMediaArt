import processing.video.*;


class CameraScreen {

    Capture cam;
    int threshold = 100;
    int tmp = 0 ;

    CameraScreen(Capture c) {
        cam = c;
        cam.start();
    }

    void setupFunction() {
    }
    
    void drawFunction() {
        image(cam, 0, 0);
          cam.loadPixels();
  
        int pixelNumber = 0;
        
        //black -> whhite
        for(int y = 0; y < height; y += 3) {
            for(int x = 0; x < width;x++){
            int loc = x + y*width;
            int r = (int)red(cam.pixels[loc]);
            int g = (int)green(cam.pixels[loc]);
            int b = (int)blue(cam.pixels[loc]);
            //println("red : " + r + " green : " + g + " blue : " + b );
            
            if( abs(dist(0,r,0,g,0,b)) <= threshold ) {
                pixelNumber++;
            } 
            }
        }
        
        if( pixelNumber > 30000) {
            tmp++;
            println("------------------------");
            println("mask"+tmp);
        }
        
        cam.updatePixels();
        image(cam,0,0,width,height);

    }

}
