import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDH5MdMAemRthHOrqvANTHWMTzH_ZjiA0Q',
    appId: '1:700167109451:web:e34ef5981fb5ce84fd86ce',
    messagingSenderId: '700167109451',
    projectId: 'goconcert-ti3g',
    authDomain: 'goconcert-ti3g.firebaseapp.com',
    storageBucket: 'goconcert-ti3g.appspot.com',
    measurementId: 'G-7KFJHSEBL5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCezMgOisVClenN8rvEgI85Sdc9W9UuRTE',
    appId: '1:700167109451:android:6441729686b6402efd86ce',
    messagingSenderId: '700167109451',
    projectId: 'goconcert-ti3g',
    storageBucket: 'goconcert-ti3g.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIXgDBT4pRgzGAa0oId-5Z2f6SjPXJDi4',
    appId: '1:700167109451:ios:e15b9a79bbb6f5dffd86ce',
    messagingSenderId: '700167109451',
    projectId: 'goconcert-ti3g',
    storageBucket: 'goconcert-ti3g.appspot.com',
    iosBundleId: 'com.example.goconcert',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCIXgDBT4pRgzGAa0oId-5Z2f6SjPXJDi4',
    appId: '1:700167109451:ios:74b122446f3a4b9efd86ce',
    messagingSenderId: '700167109451',
    projectId: 'goconcert-ti3g',
    storageBucket: 'goconcert-ti3g.appspot.com',
    iosBundleId: 'com.example.goconcert.RunnerTests',
  );
}
