PImage pimg;
Image img;
Emojify emojis;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

//import java.nio.file;

void setup() {
  size(1000, 500);
  background(176, 196, 222);
  textSize(50);
  textAlign(CENTER);
  text("Press Any Key To Get Started", 500, 250);
  //if (keyPressed) {
  //  selectInput("Select a file to start: ", "fileSelected");
  //}
  // file path may differ... um
  File file = new File("/Users/feliceli/Downloads/apcs/apcs-final-project/Final/data/emojis");
  emojis = new Emojify(file);
 //emojis.printColors();
  //System.out.println(file);
  //File[] files = file.listFiles();
  //System.out.println("THIS MANY " + files.length);
  
}

void fileSelected(File selection) {
  if (selection == null) {
      println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    pimg = loadImage(selection.getAbsolutePath());
    img = new Image(pimg);
    noLoop();
  }
  
}

void draw() {
  if (keyPressed) {
    selectInput("Select a file to start: ", "fileSelected");
  }
  try {
    image(pimg, 0, 0);
    setEmojis();
  } catch (Exception e) {
    //System.out.println("waiting...");
  }
  //emojis.printColors();
  //try {
  //  setEmojis();
  //  //System.out.println("emojis..");
  //} catch (Exception e) {
  //  //e.printStackTrace();
  //  //System.out.println("nO EMOJIS");
  //}
}

void setEmojis() {
  try {
    while (!img.isDone()) {
      
      color c = img.nextRegion();
      Integer[] col = new Integer[] {(int) red(c), (int) green(c), (int) blue(c)};
      //for (int i = 0; i < 3; i++) {
      //  System.out.print(i + " " + col[i] + " ");
      //}
      //System.out.println();
      PImage closestEm = emojis.findClosest(col);
      closestEm.resize(5, 5);
      image(closestEm, pimg.width + img.xcor, img.ycor);
      //System.out.println("emojis? " + img.getX() + " " + img.getY());
    }
  } catch (Exception e) {
    System.out.println("NO");
    e.printStackTrace();
  }
}
