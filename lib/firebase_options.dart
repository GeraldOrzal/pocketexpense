// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
// / import 'firebase_options.dart';
// / // ...
// / await Firebase.initializeApp(
// /   options: DefaultFirebaseOptions.currentPlatform,
// / );
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
    apiKey: 'AIzaSyCo_OPrbL7N_Uj4q2FZ4MKHJgXQXNZ9oo0',
    appId: '1:393182782323:web:e7390ab2b57d27c2a21b06',
    messagingSenderId: '393182782323',
    projectId: 'pocketexpense-ddc1f',
    authDomain: 'pocketexpense-ddc1f.firebaseapp.com',
    storageBucket: 'pocketexpense-ddc1f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnAnRD0StIzxGtmi5IDjgLXt3P4HH1jDA',
    appId: '1:393182782323:android:f9867eb678f5115aa21b06',
    messagingSenderId: '393182782323',
    projectId: 'pocketexpense-ddc1f',
    storageBucket: 'pocketexpense-ddc1f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTtATcDiFCB0bUzBV5ZZG6WoLaD_DcVRA',
    appId: '1:393182782323:ios:8d7d1b8dab0f51b9a21b06',
    messagingSenderId: '393182782323',
    projectId: 'pocketexpense-ddc1f',
    storageBucket: 'pocketexpense-ddc1f.appspot.com',
    iosClientId:
        '393182782323-obk5n0t0tlrh5s8f4sur57f302c5p05h.apps.googleusercontent.com',
    iosBundleId: 'com.example.pocketexpense',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCTtATcDiFCB0bUzBV5ZZG6WoLaD_DcVRA',
    appId: '1:393182782323:ios:8d7d1b8dab0f51b9a21b06',
    messagingSenderId: '393182782323',
    projectId: 'pocketexpense-ddc1f',
    storageBucket: 'pocketexpense-ddc1f.appspot.com',
    iosClientId:
        '393182782323-obk5n0t0tlrh5s8f4sur57f302c5p05h.apps.googleusercontent.com',
    iosBundleId: 'com.example.pocketexpense',
  );
}