PImage pimg;
Image img;

void setup() {
  size(1000, 400);
  selectInput("Select a file to start: ", "fileSelected");
  
}

void fileSelected(File selection) {
  //if (selection == null) {
  //    println("Window was closed or the user hit cancel.");
  //} else {
  //  println("User selected " + selection.getAbsolutePath());
  //}
  ////Image = new Image(selection.getAbsolutePath());
  pimg = loadImage(selection.getAbsolutePath());
  img = new Image(pimg);
}

void draw() {
  image(pimg, 0, 0);
}

//void setEmojis() {
//    while (!img.isDone()) {
//      /// huh 
//    }
