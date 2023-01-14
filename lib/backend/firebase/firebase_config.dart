import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBXceV4S5tjcPLCee1jivAcN_hQn64y0k4",
            authDomain: "qonvay.firebaseapp.com",
            projectId: "qonvay",
            storageBucket: "qonvay.appspot.com",
            messagingSenderId: "1066606163266",
            appId: "1:1066606163266:web:514f6ef6eef143e3bfc4db",
            measurementId: "G-PRJ786NRNZ"));
  } else {
    await Firebase.initializeApp();
  }
}
