# Glitch Text
A Flutter package for error monitoring and reporting.Listen for common flutter errors & pushed to the project dashboard when it occurs.



## Features
* Error information with context
* Platform and screen information
* Error file info with lines causing error 
* Project panel for collaboration 
* Assign & share errors  
* Report error in production mode

## Getting Started

## 0. Create project
Create a flutter project in Ziton dashboard and copy down the dsn for that project

### 1. Depend on it
Add package name with version to your package's `pubspec.yaml` file:

```yaml
dependencies:
  ziton_error 0.0.1
```

### 2. Install it

Install packages from the command line:

with `pub`:

```
$ pub get
```

with `Flutter`:

```
$ flutter pub get
```

### 3. Import it

Import in `Dart` contains runApp function, you can use:

```dart
import 'package:ziton_error/ziton_error.dart';
```


## Usage

Import package and Listen for errors with ZitonError function

```dart
//call FlutterError function inside main()
void main() {
  FlutterError.onError = (FlutterErrorDetails errorDetails){
    //report error to ziton
    ZitonError("your dsn",errorDetails);
  };
  runApp(const MyApp());
}
```



dsn is the unique key provided to each project, look something like this 
```
https://OokNpSGxxxxxxxxxxxxxxxxxxxxxcFNCUmYwhQhwXiouYWbTFy.ziton.live
```

## Additional information

head on to https://ziton.live/home for further information.