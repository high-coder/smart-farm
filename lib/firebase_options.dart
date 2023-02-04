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
    apiKey: 'AIzaSyAGvIs1DkyJ-iEfTw2J2pEDbxhYvtKIogc',
    appId: '1:732423278799:web:e0c7dfe6cb6850faa2e7ba',
    messagingSenderId: '732423278799',
    projectId: 'nodemcu-29c03',
    authDomain: 'nodemcu-29c03.firebaseapp.com',
    databaseURL: 'https://nodemcu-29c03-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'nodemcu-29c03.appspot.com',
    measurementId: 'G-NGN1VN9FY3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBv-Uz_4btm69yVdT-I7_VSYkHxpzvnky8',
    appId: '1:732423278799:android:a46e6854ed3529f2a2e7ba',
    messagingSenderId: '732423278799',
    projectId: 'nodemcu-29c03',
    databaseURL: 'https://nodemcu-29c03-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'nodemcu-29c03.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCD3bFtFwf_Q8FQ4AH6yGc-ZvsZKL5kgQU',
    appId: '1:732423278799:ios:4cc537edb6da9e07a2e7ba',
    messagingSenderId: '732423278799',
    projectId: 'nodemcu-29c03',
    databaseURL: 'https://nodemcu-29c03-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'nodemcu-29c03.appspot.com',
    iosClientId: '732423278799-e13e4turbl8fsgq1tt78l0mooqdg541h.apps.googleusercontent.com',
    iosBundleId: 'com.high.coder.nodeConnect',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCD3bFtFwf_Q8FQ4AH6yGc-ZvsZKL5kgQU',
    appId: '1:732423278799:ios:4cc537edb6da9e07a2e7ba',
    messagingSenderId: '732423278799',
    projectId: 'nodemcu-29c03',
    databaseURL: 'https://nodemcu-29c03-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'nodemcu-29c03.appspot.com',
    iosClientId: '732423278799-e13e4turbl8fsgq1tt78l0mooqdg541h.apps.googleusercontent.com',
    iosBundleId: 'com.high.coder.nodeConnect',
  );
}