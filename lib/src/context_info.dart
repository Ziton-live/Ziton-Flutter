import 'package:flutter/foundation.dart';

/// check whether application is running on debug/release/profile mode
String runningMode() {
  //mode check
  if (kDebugMode) {
    return "Debug Mode";
  } else if (kReleaseMode) {
    return "Release Mode";
  } else {
    return "Profile Mode";
  }
}

///retrieve context from the error object
String runningContext(FlutterErrorDetails errorDetails) {
  return errorDetails.context.toString();
}

///retrieve library from the error object
String runningLibrary(FlutterErrorDetails errorDetails) {
  return errorDetails.library.toString();
}
