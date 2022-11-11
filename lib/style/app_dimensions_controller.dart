import 'package:flutter/cupertino.dart';

class Dimensions{
  static double h (BuildContext context, double height){
    return MediaQuery.of(context).size.height*height;
  }
  
  static double w (BuildContext context, double width){
    return MediaQuery.of(context).size.width*width;
  }
}