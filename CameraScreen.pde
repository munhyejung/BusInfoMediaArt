import processing.video.*;


class CameraScreen {

    Capture cam;

    void setupFunction() {
        String[] cameras = Capture.list();
        
        if(cameras.length == 0) {
            println("No Camera Exist");
            exit();
        }
        else {
            // parent PApplet required
            //cam = new Capture(this, cameras[0]);
            cam.start();
        }
    }

    void drawFunction() {
        image(cam, 0, 0);
    }

    void captureEvent(Capture c) {
        c.read();
    }

}
