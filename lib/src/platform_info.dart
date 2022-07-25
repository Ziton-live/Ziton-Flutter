import 'dart:io';
import 'dart:ui';


Map platformInfo()
{
  Map plat = {
    "Operating System": Platform.operatingSystem,
    "Operating System Version": Platform.operatingSystemVersion,
    "local host name": Platform.localHostname,
    "Number of processors": Platform.numberOfProcessors,
    "OS Details": Platform.version,
  };
  return plat;
}

Map screenDetails(){
  Map screenDetails = {
    "Pixel Ratio": window.devicePixelRatio,
    "Height": window.physicalSize.height,
    "Width": window.physicalSize.width,
    "Theme": theme(),
    "Padding": {
      "Left": window.padding.left,
      "Right": window.padding.right,
      "Top": window.padding.top,
      "Bottom": window.padding.bottom,
    },
  };
  return screenDetails;
}

String theme(){
  if (window.platformBrightness == Brightness.light) {
    return "Light";
  } else {
    return "Dark";
  }
}