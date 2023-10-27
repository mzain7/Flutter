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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB4ltnU_jk720KF458yDsOISFYjUd-g44Y',
    appId: '1:921357846257:web:0af138efd02dcc8b5e4b50',
    messagingSenderId: '921357846257',
    projectId: 'flutter-chat-app-a0ea4',
    authDomain: 'flutter-chat-app-a0ea4.firebaseapp.com',
    storageBucket: 'flutter-chat-app-a0ea4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCl6rcCavEj7GenVm6eUPTkBgxtLgLbzZI',
    appId: '1:921357846257:android:0f113287aa90e41d5e4b50',
    messagingSenderId: '921357846257',
    projectId: 'flutter-chat-app-a0ea4',
    storageBucket: 'flutter-chat-app-a0ea4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLvNRjPvti3iAWr-jz1yaww9PcEut1k0U',
    appId: '1:921357846257:ios:86561f31da70a1fe5e4b50',
    messagingSenderId: '921357846257',
    projectId: 'flutter-chat-app-a0ea4',
    storageBucket: 'flutter-chat-app-a0ea4.appspot.com',
    iosClientId: '921357846257-5b42aq7quijcg8tgbg73or95g1c0e1cg.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}