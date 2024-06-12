public class Emojify {
  private ArrayList<PImage> emojiList;
  private ArrayList<Integer[]> colorList;
  
  public Emojify(File folder) {
    emojiList = new ArrayList<PImage>();
    colorList = new ArrayList<Integer[]>();
    // load the folder with emoji photos, add them to emojiList
    File[] files = folder.listFiles();
    try {
      for (int i = 0; i < files.length; i++) {
        String fileName = files[i].getName();
        String fileType = fileName.substring(fileName.length() - 4);
        if (fileType.equals(".gif") || fileType.equals(".jpg") 
            || fileType.equals(".tga") || fileType.equals(".png")) {
              emojiList.add(loadImage(fileName));
            }
      }
      averageColor();
    } catch (Exception e) {
      e.printStackTrace();
      System.out.println("Check that the file path in setup() matches your device's!");
    }
  }
  
  // finds average color of each emoji, and add to colorList
  void averageColor() {
    for (int i = 0; i < emojiList.size(); i++) {
      Integer[] Color = new Integer[] {0, 0, 0};
      PImage currentImage = emojiList.get(i);
      Image currentEmoji = new Image(currentImage);
      int times = 0;
      while (!currentEmoji.isDone()) {
        color col = currentEmoji.nextRegion();
        Color[0] += (int) red(col);
        Color[1] += (int) green(col);
        Color[2] += (int) blue(col);
        times++;
      }
      Color[0] = Color[0]/times;
      Color[1] = Color[1]/times;
      Color[2] = Color[2]/times;
      colorList.add(Color);
    }
  }
  
  // find emoji with closest color given by Color
  public PImage findClosest(Integer[] Color) {
    double distance = Double.MAX_VALUE;
    int index = 0;
    int red = Color[0];
    int green = Color[1];
    int blue = Color[2];
    for (int i = 0; i < colorList.size(); i++) {
      int curRdiff = (int) Math.pow(red - colorList.get(i)[0], 2);
      int curGdiff = (int) Math.pow (green - colorList.get(i)[1], 2);
      int curBdiff = (int) Math.pow(blue - colorList.get (i)[2], 2);
      double currDistance = Math.sqrt(curRdiff + curGdiff + curBdiff);
      if (currDistance < distance) {
        distance = currDistance;
        index = i;
      }
    }
    return emojiList.get(index);
  }
  
}
