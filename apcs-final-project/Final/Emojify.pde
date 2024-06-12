public class Emojify {
  private ArrayList<PImage> emojiList;
  private ArrayList<Integer[]> colorList;
  
  public Emojify(File folder) {
    emojiList = new ArrayList<PImage>();
    colorList = new ArrayList<Integer[]>();
    // load the folder with emoji photos, add them to emojiList
    File[] files = folder.listFiles();
    //System.out.println("this many emjojis: " + files.length);
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
      System.out.println("constructor LOL");
    }
  }
  
  public void printColors() {
    for (Integer[] array: colorList) {
      for (int i = 0; i < array.length; i++) {
        System.out.println(i + " " + array[i]);
      }
      System.out.println();
    }
    //System.out.println(colorList.size());
  }
  
  
  // finds average color of emoji
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
      System.out.println(times);
      //System.out.println(Color[0] + " " + Color[1] + " " + Color[2]);
      colorList.add(Color);
      //int times = 0;
      //for (int r = 0; r < currentImage.width; r += 30) {
      //  for (int c = 0; c < currentImage.height; c += 30) {
      //    color currentColor = currentImage.get(c, r);
      //    Color[0] = (int) red(currentColor);
      //    Color[1] = (int) green(currentColor);
      //    Color[2] = (int) blue(currentColor);
      //    times++;
      //  }
      //}
      //Color[0] = Color[0]/times;
      //Color[1] = Color[1]/times;
      //Color[2] = Color[2]/times;
      //for (int j = 0; j < Color.length; j++) {
      //  System.out.print(j + " " + Color[j]);
      //}
      //System.out.println();
      //colorList.add(Color);
    }
  }
  
  public PImage findClosest(Integer[] Color) {
    double distance = Double.MAX_VALUE;
    int index = 0;
    int red = Color[0];
    int green = Color[1];
    int blue = Color[2];
    for (int i = 0; i < colorList.size(); i++) {
      //System.out.println(colorList.size() + " i: " + i);
      //int curRdiff = (int) Math.abs(Color[0] - colorList.get(i)[0]);
      //int curGdiff = (int) Math.abs(Color[1] - colorList.get(i)[1]);
      //int curBdiff = (int) Math.abs(Color[2] - colorList.get(i)[2]);
      //double currDistance = Math.sqrt(Math.pow(curRdiff, 2) + Math.pow(curGdiff, 2) + Math.pow(curBdiff, 2));  
      int curRdiff = (int) Math.pow(red - colorList.get(i)[0], 2);
      int curGdiff = (int) Math.pow (green - colorList.get(i)[1], 2);
      int curBdiff = (int) Math.pow(blue - colorList.get (i)[2], 2);
      double currDistance = Math.sqrt(curRdiff + curGdiff + curBdiff);
      //System.out.println(i);
      if (currDistance < distance) {
        //System.out.println("old distance: " + distance + "new distance " + currDistance + " index " + i);
        //System.out.println("red: " + red + " " + colorList.get(i)[0]);
        //System.out.println("green: " + green + " " + colorList.get(i)[1]);
        //System.out.println("blue: " + blue + " " + colorList.get(i)[2]);
        distance = currDistance;
        index = i;
        //System.out.println("index " + i);
      }
    }
    return emojiList.get(index);
  }
  
}
