// simple image converter for a led stick

void setup(){
  frame.setResizable(true);
  selectInput("Select a file to process:", "fileSelected");
  
  
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } 
  else {
    println("User selected " + selection.getAbsolutePath());
    convert(selection.getAbsolutePath());
  }
}

void convert(String filePath){
  String dataFilePath = "G:\\data.dat";
  
  int imageAndStickHeight = 144;
  // load and resize image
  PImage myImage = loadImage(filePath);
  
  
  myImage.resize(0, imageAndStickHeight);
  
  size(myImage.width, 144);
  
  byte[] nums = new byte[imageAndStickHeight*3*myImage.width];
  
  // display image
  image(myImage, 0, 0);
  
  // convert image into an array of bytes
  for(int i=0; i<myImage.width; i++){
    for(int j=0; j<imageAndStickHeight; j++){
      color c = myImage.get(i, j);
      nums[3*j+i*432] = byte(red(c));
      nums[3*j+1+i*432] = byte(green(c));
      nums[3*j+2+i*432] = byte(blue(c));
    }
  }
  // save this array into the specified file
  //saveBytes(dataFilePath, nums);
  
  //exit();
}
