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
        return windows;
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
    apiKey: 'AIzaSyBnoQXM52ph2ONx3Xzj2dJVy25V_GQR77M',
    appId: '1:955334289558:web:cdcc8ea51da803fc843ab7',
    messagingSenderId: '955334289558',
    projectId: 'to-do-app-9a06c',
    authDomain: 'to-do-app-9a06c.firebaseapp.com',
    storageBucket: 'to-do-app-9a06c.appspot.com',
    measurementId: 'G-BZGFEF2KR6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5OEjglNTfqKb3RAtCMkEYuPTqfpTXegg',
    appId: '1:955334289558:android:2752edad3c95d401843ab7',
    messagingSenderId: '955334289558',
    projectId: 'to-do-app-9a06c',
    storageBucket: 'to-do-app-9a06c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAXhcUokvzBS2FfjchNL633VnKHo1F1hUQ',
    appId: '1:955334289558:ios:5652d3e2f6aefa27843ab7',
    messagingSenderId: '955334289558',
    projectId: 'to-do-app-9a06c',
    storageBucket: 'to-do-app-9a06c.appspot.com',
    iosBundleId: 'com.example.toDoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAXhcUokvzBS2FfjchNL633VnKHo1F1hUQ',
    appId: '1:955334289558:ios:5652d3e2f6aefa27843ab7',
    messagingSenderId: '955334289558',
    projectId: 'to-do-app-9a06c',
    storageBucket: 'to-do-app-9a06c.appspot.com',
    iosBundleId: 'com.example.toDoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBnoQXM52ph2ONx3Xzj2dJVy25V_GQR77M',
    appId: '1:955334289558:web:1f11447be2ebf331843ab7',
    messagingSenderId: '955334289558',
    projectId: 'to-do-app-9a06c',
    authDomain: 'to-do-app-9a06c.firebaseapp.com',
    storageBucket: 'to-do-app-9a06c.appspot.com',
    measurementId: 'G-V018XH4F21',
  );
}