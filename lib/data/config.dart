class Config{
  Config._();

  static String returnAnimalIcon(String animal){
    String url = "";
    switch (animal){
      case "dog":
        url = "dog-icon.png";
        break;
      case "cat":
        url = "cat-icon.png";
        break;
      case "cow":
        url = "cow-icon.png";
        break;
      case "pig":
        url = "pig-icon.png";
        break;
      default:
        url = "cat-icon.png";
        break;
    }
    return url;
  }

  static void displayNotification(){

  }
}