# <img src="https://lh3.googleusercontent.com/a-/AFdZucq7_CuN_qLTe-vvMMasQZOCT2bqKPIr3ed1i7Ze=s360-p-rw-no" width="30px">   Ziton Error
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>


A Flutter package for error monitoring and reporting.Listen for common flutter errors & pushed to the project dashboard when it occurs.



## Features
* Error information with context
* platform and screen information
* error file info with lines causing error 
* project panel for collaboration 
* assign & share errors  

## Getting Started

## 0. Create project
Create a flutter project in <a href = "https://ziton.live/">Ziton</a> dashboard and copy down the dsn for that project

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

head on to <a href="https://ziton.live/home">Ziton Home</a> for further information.
