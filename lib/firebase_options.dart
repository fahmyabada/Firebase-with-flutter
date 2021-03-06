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
    apiKey: 'AIzaSyDmizVm1t_RnKaFhNhGxcr_JOuZQb5JUJk',
    appId: '1:1078091036641:android:ba2af75a1100e225bf84a0',
    messagingSenderId: '1078091036641',
    projectId: 'alesraa-25a4e',
    databaseURL: 'https://alesraa-25a4e.firebaseio.com',
    storageBucket: 'alesraa-25a4e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_cIfWAGRMezcWEIZ6Hf5jp2t55uU6g5k',
    appId: '1:1078091036641:ios:7023d73aa6c64d89bf84a0',
    messagingSenderId: '1078091036641',
    projectId: 'alesraa-25a4e',
    databaseURL: 'https://alesraa-25a4e.firebaseio.com',
    storageBucket: 'alesraa-25a4e.appspot.com',
    androidClientId: '1078091036641-5ttc26g0a97m2fndj7ung19v5fh63372.apps.googleusercontent.com',
    iosClientId: '1078091036641-h5h3nc47c2c8jb1v5tcddb3juoh864aa.apps.googleusercontent.com',
    iosBundleId: 'com.fahmy.firebaseflutter',
  );
}
