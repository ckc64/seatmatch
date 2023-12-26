import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCER_t-uIZsuBFCaJzTluoxmxzQTlFITsU",
            authDomain: "seatmatch-11.firebaseapp.com",
            projectId: "seatmatch-11",
            storageBucket: "seatmatch-11.appspot.com",
            messagingSenderId: "42169028759",
            appId: "1:42169028759:web:07aa4aa9610469dd2a59d2",
            measurementId: "G-ZT6XPBC8E9"));
  } else {
    await Firebase.initializeApp();
  }
}
