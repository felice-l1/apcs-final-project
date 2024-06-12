public class Image {
  private int xcor;
  private int ycor;
  private PImage img;
  private boolean isDone;
  
  public Image (PImage image) {
    img = image;
    xcor = -5;
    ycor = 0;
    isDone = false;
  }
  
  public int getX() {
    return xcor;
  }
  
  public int getY() {
    return ycor;
  }
  
  public color nextRegion() {
    try {
      while (!this.isDone()) {
        int red = 0;
        int green = 0;
        int blue = 0;
        int times = 0;
        // goes through the region, adds colors
        for (int r = ycor; r < ycor+5; r++) {
          for (int c = xcor; c < xcor+5; c++) {
            color currentColor = img.get(c, r);
            red += red(currentColor);
            green += green(currentColor);
            blue += blue(currentColor);
            times++;
          }
        }
        // after going through region, average the colors
        red /= times;
        green /= times;
        blue /= times;
        color c = color(red, green, blue);
        
        // set up x and y coordinates for next region
        int oldX = xcor;
        xcor += 5;
        if (xcor > img.width) {
            ycor += 5;
            xcor = 0;
        }
        if (ycor > img.height) {
          isDone = true;
          xcor = oldX;
          ycor -= 5;
          return c;
        }
        return c;
      }
      isDone = false;
      return color(255, 255,255);
    } catch (Exception e) {
      return color(255, 255, 255);
    }
  }
  
  
  public boolean isDone() {
    return isDone;
  }
}
