# Delivery App

This project was created for the Edge trainig course.

## Getting Started

**Step 1:**

If you wish to get this project:

Download or clone this repo by using the link below:

```
git@github.com:thiagobrunoms/edge_delivery.git
```
Otherwise, if you wish to start a similar project, open your terminal and type:

```
flutter create edge_delivery
```

**Step 2:**

Go to the project root and execute the following command in the console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

Change the project package ID: choose a project package ID for your app (e.g.: com.yourname.edge_delivery) and replace the default value in AndroidManifest files and in the MainActivity.kt kotlin file:

```
android/
|- app/
    |- src/
        |- debug/
            |- AndroidManifest.xml
        |- main/
            |- AndroidManifest.xml
            |- kotlin/com/example/delivery_app
                |- MainActivity.kt
        |- profile/
            |- AndroidManifest.xml
```

Similarly, replace the default package ID in the build.gradle file (look for applicationId):

```
android/
|- app/
    |- build.gradle
```

**Step 4:**

To run the application, choose an emulator or a real device. If you do not have an emulator installed yet, follow [these intructions](https://docs.flutter.dev/get-started/install) based on your operating system.

To list all emulators available, type the following command on your terminal

```
flutter emulators
```

Choose one emulator and open it with the following command:

```
flutter emulator --launch [EMULATOR_ID]
```

If you with to run the application on a real device, follow [these instructions](https://flutteragency.com/how-to-run-test-flutter-app-on-a-real-device/) to configure your mobile device as `developer mode`.

Now, list all available connected devices:

```
flutter devices
```

To run the application on a device, type:

```
flutter run -d [DEVICE_ID]
```

**Step 5:**

Soon...

