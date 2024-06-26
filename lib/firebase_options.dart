// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-yUSRBzYIHZsnjNO-SmosQ9kpEwZ_Qzs',
    appId: '1:1028681100254:android:b88299730923ed87eb0b4f',
    messagingSenderId: '1028681100254',
    projectId: 'kbu-sm',
    databaseURL: 'https://kbu-sm-default-rtdb.firebaseio.com',
    storageBucket: 'kbu-sm.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6n_cCHsDlOfBb05CeKK7H64e0K_VuM7E',
    appId: '1:1028681100254:ios:cdfb6e4cc5d02498eb0b4f',
    messagingSenderId: '1028681100254',
    projectId: 'kbu-sm',
    databaseURL: 'https://kbu-sm-default-rtdb.firebaseio.com',
    storageBucket: 'kbu-sm.appspot.com',
    iosBundleId: 'com.example.kbushuttlebus01',
  );

}