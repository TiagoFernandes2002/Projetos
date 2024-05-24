import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCYYXZ9zrEXs_xdJl_-tVseNI3EGan36zo",
            authDomain: "car-sharing-utad-pmv445.firebaseapp.com",
            projectId: "car-sharing-utad-pmv445",
            storageBucket: "car-sharing-utad-pmv445.appspot.com",
            messagingSenderId: "753684571890",
            appId: "1:753684571890:web:95f47a9563e4527dfe926b"));
  } else {
    await Firebase.initializeApp();
  }
}
