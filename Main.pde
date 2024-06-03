PImage img;

void setup() {
  size(1000, 400);
  selectInput("Select a file to start: ", "fileSelected");
  
}

void fileSelected(File selection) {
  if (selection == null) {
      println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
  }
  img = loadImage(selection.getAbsolutePath());
}
