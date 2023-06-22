import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yemekcii/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC-F9m2O8UdPxZD3_kpEG8jVBvTVyB_MWk",
            appId: "1:831856121129:web:b0a2e23ae68f63515e5338",
            messagingSenderId: "831856121129",
            projectId: "yemekcii",
            storageBucket: "yemekcii.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('beklenilmeyen bir hata oluştu'));
              } else if (snapshot.hasData) {
                return SplashScreen(
                  title: 'Flutter giris',
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
