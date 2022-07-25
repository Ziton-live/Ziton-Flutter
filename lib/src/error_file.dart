import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///to parse error file name
String errorFile(FlutterErrorDetails errorDetails) {
  ///if the file name is not available
  String errorFile = "unable to retrieve";

  ///
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

int startLine(FlutterErrorDetails errorDetails) {
  int start = 0;
  start = errorLine(errorDetails) - 10;
  return start;
}

int endLine(FlutterErrorDetails errorDetails) {
  int end = 0;
  end = errorLine(errorDetails) + 10;
  return end;
}

String fileName(FlutterErrorDetails errorDetails) {
  String drive = "null", absFile = "null", filename;

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

  try {
    drive = "${TextTreeRenderer(
      maxDescendentsTruncatableNode: 5,
    ).render(errorDetails.toDiagnosticsNode(style: DiagnosticsTreeStyle.error)).trimRight().split('The relevant error-causing widget was:')[1].split(':')[2].split('/')[3]}:";
  } catch (error) {
    //skipp
  }

  filename = drive + absFile;
  return filename;
}
