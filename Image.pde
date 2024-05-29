public class Image {
  private int xcor;
  private int ycor;
  private PImage img;
  
  public Image(PImage image) {
    img = image;
    xcor = 16;
    ycor = 16;
  }
  
  public color nextRegion() {
    int red = 0;
    int green = 0;
    int blue = 0;
    for (int r = 0; r < xcor; r ++) {
      for (int c = 0; c < ycor; c++) {
        color currentColor = img.get(r, c);
        red += red(currentColor);
        green += green(currentColor);
        blue += blue(currentColor);
      }
    }
    red /= 256;
    green /= 256;
    blue /= 256;
    return color(red, green, blue);
  }
}
