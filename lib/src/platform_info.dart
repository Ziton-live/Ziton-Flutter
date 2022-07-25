import 'dart:io';
import 'dart:ui';

///platform information such as system, version, host name... retrieved using Platform class
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

///screen details such as dimensions and pixel information retrieved using window class
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

/// theme of the os currently the application running on
String theme(){
  ///obtained from window class
  if (window.platformBrightness == Brightness.light) {
    return "Light";
  } else {
    return "Dark";
  }
}