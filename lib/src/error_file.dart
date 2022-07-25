import 'package:flutter/foundation.dart';

///to parse error file name
String errorFile(FlutterErrorDetails errorDetails) {
  ///if the file name is not available
  String errorFile = "unable to retrieve";

  try {
    errorFile = TextTreeRenderer(
      maxDescendentsTruncatableNode: 5,
    )
        .render(
            errorDetails.toDiagnosticsNode(style: DiagnosticsTreeStyle.error))
        .trimRight()
        .split('The relevant error-causing widget was:')[1]
        .split(":")[3];
  } catch (error) {
    //skipp
  }
  return errorFile;
}

/// line number causing error is parsed
int errorLine(FlutterErrorDetails errorDetails) {
  int lineNumber = 0;

  try {
    lineNumber = int.parse(TextTreeRenderer(
      maxDescendentsTruncatableNode: 5,
    )
        .render(
            errorDetails.toDiagnosticsNode(style: DiagnosticsTreeStyle.error))
        .trimRight()
        .split('The relevant error-causing widget was:')[1]
        .split(":")[4]);
  } catch (error) {
    //skipp
  }
  return lineNumber;
}

/// starting line of the errorLines to be shown
int startLine(FlutterErrorDetails errorDetails) {
  int start = 0;
  start = errorLine(errorDetails) - 10;
  return start;
}

/// ending lines of the errorLines to be shown
int endLine(FlutterErrorDetails errorDetails) {
  int end = 0;
  end = errorLine(errorDetails) + 10;
  return end;
}

/// name of the file which causes e=the error
String fileName(FlutterErrorDetails errorDetails) {
  String drive = "null", absFile = "null", filename;

  /// file path is retrieved from  error information
  try {
    absFile = TextTreeRenderer(
      maxDescendentsTruncatableNode: 5,
    )
        .render(
            errorDetails.toDiagnosticsNode(style: DiagnosticsTreeStyle.error))
        .trimRight()
        .split('The relevant error-causing widget was:')[1]
        .split(":")[3];
  } catch (error) {
    //skipp
  }

  /// drive at which error file exist parsed from error information
  try {
    drive = "${TextTreeRenderer(
      maxDescendentsTruncatableNode: 5,
    ).render(errorDetails.toDiagnosticsNode(style: DiagnosticsTreeStyle.error)).trimRight().split('The relevant error-causing widget was:')[1].split(':')[2].split('/')[3]}:";
  } catch (error) {
    //skipp
  }

  ///file path is created by combining drive and directory path
  filename = drive + absFile;
  return filename;
}
