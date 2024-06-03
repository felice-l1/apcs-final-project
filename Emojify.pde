public class Emojify {
  private ArrayList<PImage> emojiList;
  private ArrayList<Integer[]> colorList;
  
  public Emojify(File folder) {
    // load the folder with emoji photos, add them to emojiList
    File[] files = folder.listFiles();
    for (int i = 0; i < files.length; i++) {
      String fileName = files[i].getName();
      emojiList.add(loadImage(fileName));
    }
  }
  // finds average color of emoji
  void averageColor() {
    for (int i = 0; i < emojiList.size(); i++) {
      Integer[] Color = new Integer[3];
      PImage currentImage = emojiList.get(i);
      int times = 0;
      for (int r = 0; r < currentImage.width; r += 16) {
        for (int c = 0; c < currentImage.height; c += 16) {
          color currentColor = currentImage.get(r, c);
          Color[0] = (int) red(currentColor);
          Color[1] = (int) green(currentColor);
          Color[2] = (int) blue(currentColor);
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
    double distance = Double.MAX_VALUE;
    int index = 0;
    for (int i = 0; i < colorList.size(); i++) {
      int curRdiff = (int) Math.abs(Color[0] - colorList.get(i)[0]);
      int curGdiff = (int) Math.abs(Color[1] - colorList.get(i)[1]);
      int curBdiff = (int) Math.abs(Color[2] - colorList.get(i)[2]);
      double currDistance = Math.sqrt(Math.pow(curRdiff, 2) + Math.pow(curGdiff, 2) + Math.pow(curBdiff, 2));  
      if (currDistance < distance) {
        distance = currDistance;
        index = i;
      }
    }
    return emojiList.get(index);
  }
  
}
