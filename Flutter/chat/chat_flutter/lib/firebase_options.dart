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
    apiKey: 'AIzaSyCGKndWnohAXJj5gfiN-b-o4QgndPuvpO8',
    appId: '1:58489689852:web:12f3aa2a572e9326636979',
    messagingSenderId: '58489689852',
    projectId: 'chat-b395d',
    authDomain: 'chat-b395d.firebaseapp.com',
    storageBucket: 'chat-b395d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDt8xaT-Khb4eDzGSG36iA7rc4QFblErg0',
    appId: '1:58489689852:android:7933ab9843ad394e636979',
    messagingSenderId: '58489689852',
    projectId: 'chat-b395d',
    storageBucket: 'chat-b395d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVcotnMtZJ_psZjeOlg376LRqekywFYhA',
    appId: '1:58489689852:ios:731d7e0fb0c74c69636979',
    messagingSenderId: '58489689852',
    projectId: 'chat-b395d',
    storageBucket: 'chat-b395d.appspot.com',
    iosClientId: '58489689852-sd8t8vq626f9cu9d3vhk3r30h3vfqekg.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBVcotnMtZJ_psZjeOlg376LRqekywFYhA',
    appId: '1:58489689852:ios:731d7e0fb0c74c69636979',
    messagingSenderId: '58489689852',
    projectId: 'chat-b395d',
    storageBucket: 'chat-b395d.appspot.com',
    iosClientId: '58489689852-sd8t8vq626f9cu9d3vhk3r30h3vfqekg.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatFlutter',
  );
}
