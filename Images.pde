public class Image {
  private int xcor;
  private int ycor;
  private PImage img;
  
  public Image (PImage image) {
    img = image;
    xcor = 16;
    ycor = 16;
  }
  
  public color nextRegion() {
    while (!this.isDone()) {
      int red = 0;
      int green = 0;
      int blue = 0;
      for (int r = xcor; r < xcor+16; r ++) {
        for (int c = ycor; c < ycor+16; c++) {
          color currentColor = img.get(r, c);
          red += red(currentColor);
          green += green(currentColor);
          blue += blue(currentColor);
        }
      }
      red /= 256;
      green /= 256;
      blue /= 256;
      xcor += 16;
      ycor += 16;
      color c = color(red, green, blue);
      return c;
    }
    return color(0,0,0);
  }
  
  public boolean isDone() {
    if (xcor > img.width || ycor > img.height) {
      return true;
    }
    return false;
  }
}
