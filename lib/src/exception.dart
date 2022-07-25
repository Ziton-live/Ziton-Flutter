import 'package:flutter/foundation.dart';

///exception name
String exceptionName(FlutterErrorDetails errorDetails) {
  String exceptionName = "not available";

  ///if exception of errorObject is too large trimmed
  try {
    if (errorDetails.exception.toString().length > 500) {
      exceptionName = errorDetails.exception.toString().split(".")[0];
    } else {
      exceptionName = errorDetails.exception.toString();
    }
  } catch (error) {
    //skipp
  }
  return exceptionName;
}

String errorInfo(FlutterErrorDetails errorDetails) {
  String inform = "not available";
  inform = TextTreeRenderer(
    maxDescendentsTruncatableNode: 5,
  )
      .render(errorDetails.toDiagnosticsNode(style: DiagnosticsTreeStyle.error))
      .trimRight();
  return inform;
}




