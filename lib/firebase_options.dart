// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDZm2HzTJjHiReaXJfl6uu-jYmBqOEzIkM',
    appId: '1:711292400554:web:ba2f2337dc95cb85de31d3',
    messagingSenderId: '711292400554',
    projectId: 'notes-app-1c1ce',
    authDomain: 'notes-app-1c1ce.firebaseapp.com',
    storageBucket: 'notes-app-1c1ce.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeHxK_0BnSumUCwuY164X_leEe8lZjEy0',
    appId: '1:711292400554:android:f4969627d474ffebde31d3',
    messagingSenderId: '711292400554',
    projectId: 'notes-app-1c1ce',
    storageBucket: 'notes-app-1c1ce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBs5Hkjux6maECSzZv0KbOhp_6NSWBrjnA',
    appId: '1:711292400554:ios:7d3c56c4b8ce27fcde31d3',
    messagingSenderId: '711292400554',
    projectId: 'notes-app-1c1ce',
    storageBucket: 'notes-app-1c1ce.appspot.com',
    iosBundleId: 'com.example.notesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBs5Hkjux6maECSzZv0KbOhp_6NSWBrjnA',
    appId: '1:711292400554:ios:51fc098399ee6661de31d3',
    messagingSenderId: '711292400554',
    projectId: 'notes-app-1c1ce',
    storageBucket: 'notes-app-1c1ce.appspot.com',
    iosBundleId: 'com.example.notesApp.RunnerTests',
  );
}