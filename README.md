# Glitch Text
A Flutter package for testing error monitoring and reporting.

## Features
* Error information with context
* platform and screen information
* error file info with lines causing error 
* project panel for collaboration 

## Getting Started

### 1. Depend on it

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  ziton_error 0.0.1
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```
$ pub get
```

with `Flutter`:

```
$ flutter pub get ziton_error 
```

### 3. Import it

Now in your `Dart` code, you can use:

```dart
import 'package:ziton_error/ziton_error.dart';
```


## Usage

import package and Listen for errors with ZitonError function

```dart
    FlutterError.onError = (FlutterErrorDetails errorDetails){
ZitonError("your dsn",errorDetails);
};
```





## Additional information

head on to https://ziton.live/home for further information.