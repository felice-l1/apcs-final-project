PImage pimg;
Image img;
Emojifi emojis;

void setup() {
  size(1000, 500);
  selectInput("Select a file to start: ", "fileSelected");
  File file = new File("/apcs-final-project/emojis");
  emojis = new Emojifi(file);
}

void fileSelected(File selection) {
  if (selection == null) {
      println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    pimg = loadImage(selection.getAbsolutePath());
    img = new Image(pimg);
  }
}

void draw() {
  try {
    image(pimg, 0, 0);
  } catch (Exception e) {
    System.out.println("waiting...");
  }
}

//void setEmojis() {
//    while (!img.isDone()) {
//      color c = img.nextRegion();
      
//    }
//}
