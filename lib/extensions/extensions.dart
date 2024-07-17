import 'package:flutter/foundation.dart';
extension DefineAssetPath on String{
String definePath(){
if(!kIsWeb){
return "assets/$this";
}else{
  return this;
}
}
}