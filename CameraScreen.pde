import processing.video.*;

class CameraScreen {

    PFont f;

    Capture cam;
    int threshold = 150;
    int startTime = 0;
    int tmp = 0 ;

    CameraScreen(Capture c) {
        cam = c;
        cam.start();
    }

    void setupFunction() {
        f = createFont("NotoSerifCJKkr-SemiBold.otf",24);
        textFont(f);
    }
    
    boolean drawFunction() {

        int pixelNumber = 0;

        if(startTime == 0) { startTime = millis(); }

        if(millis() - startTime >= 10000) {

            cam.loadPixels();
            println(cam.height);
            println(cam.width);
    
            //black -> whhite
            for(int y = 0; y < cam.height; y += 3) {
                for(int x = 0; x < cam.width;x++){
                    int loc = x + y*cam.width;
                    int r = (int)red(cam.pixels[loc]);
                    int g = (int)green(cam.pixels[loc]);
                    int b = (int)blue(cam.pixels[loc]);
                    //println("red : " + r + " green : " + g + " blue : " + b );
                    
                    if( abs(dist(255,r,255,g,255,b)) <= threshold ) {
                        pixelNumber++;
                    } 
                }
            }
            
            cam.updatePixels();
        }

        image(cam,0,0,1200,2000);

        if( pixelNumber > 30000) { return true; }
        else {
            textAlign(CENTER);
            fill(0);
            textFont(f);
            text("마스크를 착용해주세요",width/2,height-300);
        }

        return false;
    }

}
