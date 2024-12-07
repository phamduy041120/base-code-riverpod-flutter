# base-code-riverpod-flutter

## <a name="installation"></a>⚙ ️Installation

| Tool name      | Version         |
| -------------- |-----------------|
| Android Studio | Iguana 2023.2.1 |
| Xcode          | 15.2            |

| Programming language | Version |
| -------------------- |---------|
| Dart                 | 3.4.3   |

| Framework | Version |
| --------- |---------|
| Flutter   | 3.22.2  |
| CocoaPods | 1.15.2  |

## <a name="getting-started"></a>🚀 Getting Started

- Create fake api : https://jsonblob.com/
- State management : https://riverpod.dev/docs/introduction/getting_started
- Navigation management : https://pub.dev/packages/auto_route

To run the project, please perform the following steps:

- Step 1: Verify installations

```sh
$ flutter doctor
```

- Step 2: Pull project dependencies

```sh
$ flutter pub get
```

- Step 3: Generate the generated files

```sh
$ flutter pub run build_runner build --delete-conflicting-outputs
``` 

- Step 4: Build and test app

- Step 5: Build debug app android : Run script build_app_for_debug.sh

## <a name="architecture"></a>🏠‍‍ Architecture

This project implements MVVM Design Pattern and uses Riverpod for state management.

### Folder structure

```
📁 flutter-base-code-template
    |- 📁 assets
        |- 📁 colors
            |- colors.xml
        |- 📁 fonts
            |- ....ttf
        |- 📁 icons
            |- ....svg
        |- 📁 images
            |- ....png
    |- 📁 android
    |- 📁 build
    |- 📁 ios
    |- 📁 lib
        |- 📁 common_widgets
        |- 📁 data
            |- 📁 models
            |- 📁 providers
            |- 📁 repositories
            |- 📁 services
        |- 📁 router
            |- app_router.dart
            |- app_router.g.dart
        |- 📁 screens
            |- 📁 login
                |- 📁 models
                |- 📁 widgets
                |- login_screen.dart
                |- login_view_model.dart
                |- login_state.dart            
        |- 📁 resources
            |- 📁 gen
                |- assets.gen.dart
                |- colors.gen.dart
                |- fonts.gen.dart
            |- app_text_styles.dart
        |- 📁 utilities
            |- 📁 constants
            |- 📁 extensions
            |- 📁 helpers  
        app.dart      
    |- 📁 test
```

### Models

When we get access to the API and get some Sample JSON files, we can use something
like [JSONToDart](https://jsontodart.com/) to generate our models, then add `@Freezed` annotations
to them. Please store the models in `lib/data/models/` and `lib/data/models/api/`.

### View Models

To avoid cluttering up the "View" classes, let's move to here most of the logic and variables which
are not directly related to the UI. The View Model should be Unit Testable, so avoid referencing the
UI.

### States

As you know, state management is very important in Flutter.
To avoid bugs we'll write this project in a reactive way, so that the View is observing the State.
We will use the `Riverpod` library to achieve this.

## <a name="coding"></a>🔥‍ Coding guidelines

### Code Re-use

#### Common Widgets

Identify as many places as possible in the Figma design where the same pattern is often repeating
and make a common widget. Please store the common widgets in `lib/common_widgets`.

#### Colors, Styles, Themes

Use [FlutterGen](https://pub.dev/packages/flutter_gen) to generate assets, fonts, colors, images,...
Feel free to modify the existing contents to match the Figma specification.
Treat the existing contents as a guide.
