PImage pimg;
Image img;
Emojify emojis;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
boolean start = true;
//import java.nio.file;

void setup() {
  size(1000, 500);
  background(176, 196, 222);
  textSize(50);
  textAlign(CENTER);
  text("Press Any Key To Get Started", 500, 250);
  
  // instantiate an Emojify class
  File file = new File(dataPath("emojis"));
  emojis = new Emojify(file);
}

void keyPressed() {
  if (start) {
    background(176, 196, 222);
    selectInput("Select a file to start: ", "fileSelected");
    start = false;
  }
}

void fileSelected(File selection) {
  if (selection == null) {
      println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    background(176, 196, 222);
    pimg = loadImage(selection.getAbsolutePath());
    img = new Image(pimg);
  }
  
}

void draw() {
  try {
    image(pimg, (width-pimg.width*2)/2, (height-pimg.height)/2);
    setEmojis();
  } catch (Exception e) {
  }
}

void setEmojis() {
  try {
    while (!img.isDone()) {
      color c = img.nextRegion();
      Integer[] col = new Integer[] {(int) red(c), (int) green(c), (int) blue(c)};
      PImage closestEm = emojis.findClosest(col);
      closestEm.resize(5, 5);
      image(closestEm, (1000-pimg.width*2)/2 + pimg.width + img.xcor, img.ycor + (height-pimg.height)/2);
    }
  } catch (Exception e) {
    e.printStackTrace();
  }
}
