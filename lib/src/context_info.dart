import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

String runningMode(){
  //mode check
  if (kDebugMode) {
    return "Debug Mode";
  } else if (kReleaseMode) {
    return "Release Mode";
  } else {
    return "Profile Mode";
  }
}

String runningContext(FlutterErrorDetails errorDetails){
  return errorDetails.context.toString();
}

String runningLibrary(FlutterErrorDetails errorDetails){
  return errorDetails.library.toString();
}