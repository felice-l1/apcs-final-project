public class Emojify {
  ArrayList<PImage> emojiList;
  ArrayList<Float[]> colorList;
  
  public Emojify(File folder) {
    // load the folder with emoji photos, add them to emojiList
    File[] files = folder.listFiles();
    for (int i = 0; i < files.length; i++) {
      String fileName = files[i].getName();
      emojiList.add(loadImage(fileName));
    }
  }
  
  void averageColor() {
    for (int i = 0; i < emojiList.size(); i++) {
      Float[] Color = new Float[3];
      PImage currentImage = emojiList.get(i);
      int times = 0;
      for (int r = 0; r < currentImage.width; r += 10) {
        for (int c = 0; c < currentImage.height; c += 10) {
          color currentColor = currentImage.get(r, c);
          Color[0] = red(currentColor);
          Color[1] = green(currentColor);
          Color[2] = blue(currentColor);
          times++;
        }
      }
      Color[0] = Color[0]/times;
      Color[1] = Color[1]/times;
      Color[2] = Color[2]/times;
      colorList.add(Color);
    }
  }
  
  public PImage findClosest(Float[] Color) {
    int rdiff = Integer.MAX_VALUE;
    int gdiff = Integer.MAX_VALUE;
    int bdiff = Integer.MAX_VALUE;
    int closest = 0;
    for (int i = 0; i < colorList.size(); i++) {
      int curRdiff = (int) Math.abs(Color[0] - colorList.get(i)[0]);
      int curGdiff = (int) Math.abs(Color[1] - colorList.get(i)[1]);
      int curBdiff = (int) Math.abs(Color[2] - colorList.get(i)[2]);
      if (curRdiff < rdiff) {
        
    }
  }
}
