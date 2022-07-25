# <img src="https://lh3.googleusercontent.com/a-/AFdZucq7_CuN_qLTe-vvMMasQZOCT2bqKPIr3ed1i7Ze=s360-p-rw-no" width="30px">   Ziton Error
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>


A Flutter package for error monitoring and reporting. Listen for common flutter errors & push error details along with Stack trace, platform & screen information to ziton project dashboard when it occurs at debug level.
Production level errors are reported using reportError Function where user can specify custom error message and description, platform and screen information along with error message pushed to ziton dashboard.


## Features
* Error information with context
* Platform and screen information
* Error file info with lines causing error 
* Project panel for collaboration 
* Assign & share errors  
* Report error in production mode


## Getting Started
### 0. Create project
Create a flutter project in <a href = "https://ziton.live/">Ziton</a> dashboard and copy down the dsn for that project

### 1. Depend on it
Add package name with version to your package's `pubspec.yaml` file:
```yaml
dependencies:
  ziton_error 0.0.3
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


## Usage in debug level
Import package ziton_error  and Listen for errors with ZitonError function

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


## Usage in production level
Import package ziton_error add reportError in catch block with error message and description

```dart
 try {
    //something won't work
 } 
 catch (error) {
  //call report error function with parameters dsn,name, filename, description.
    ReportError(
      "https://OokNpSGVsSrzqesUiHBTXHnzFDtGMVoViJdgtXcFNCUmYwhQhwXiouYWbTFy.ziton.live",
      "error function does not exist",
      "main.dart",
      "error in running this code.this code produces error that must be reported to the ziton live"
      );
}
```


dsn is the unique key provided to each project, look something like this 
```
https://OokNpSGxxxxxxxxxxxxxxxxxxxxxcFNCUmYwhQhwXiouYWbTFy.ziton.live
```

## Dashboard Error View
- [x] Error Listing with tracking number of occurance sort out based on time

<img src ="https://github.com/Ziton-live/Ziton-Flutter/blob/main/assets/result1.png" width = "800px">


- [x] Individual Error with meta data and detailed clean view of stack trace 
<img src ="https://github.com/Ziton-live/Ziton-Flutter/blob/main/assets/result2.png" width = "800px">

## Create project and generate dsn
- [x] Head on to ziton.live homepage

<img src ="https://github.com/Ziton-live/Ziton-Flutter/blob/main/assets/s1.png" width = "600px">

- [x] Login to ziton.live 

<img src ="https://github.com/Ziton-live/Ziton-Flutter/blob/main/assets/s2.png" width = "600px">

- [x] click on create new project

<img src ="https://github.com/Ziton-live/Ziton-Flutter/blob/main/assets/s3.png" width = "600px">


- [x] add name and description of the project

<img src ="https://github.com/Ziton-live/Ziton-Flutter/blob/main/assets/s4.png" width = "600px">

- [x] choose the stack whether flutter/django

<img src ="https://github.com/Ziton-live/Ziton-Flutter/blob/main/assets/s5.png" width = "600px">

- [x]  here you go 🥳 copy your dsn and add to project 😍

<img src ="https://github.com/Ziton-live/Ziton-Flutter/blob/main/assets/s6.png" width = "600px">


## Project info
- [x] select red mark on top right side of the project card

<img src ="https://github.com/Ziton-live/Ziton-Flutter/blob/main/assets/r1.png" width = "600px">

- [x] project dsn
- [x] deleting project
- [x] add collaberators

can be done from this screen

<img src ="https://github.com/Ziton-live/Ziton-Flutter/blob/main/assets/r2.png" width = "600px">

## Additional information

head on to <a href="https://ziton.live/home">Ziton Home</a> for further information.
