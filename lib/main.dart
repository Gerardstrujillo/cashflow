// DART
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

// FIREBASE
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

// SCREENS
import 'app/responsive/layout.dart';
import 'package:cashflow/core/colors.dart';
import 'package:cashflow/app/screens/auth/login.dart';
import 'package:cashflow/app/responsive/mobilelayout.dart';
import 'package:cashflow/app/responsive/weblayout.dart';

// AUTH USERS
import 'package:cashflow/database/providers/user.dart';

Future<void> main() async {
  // SDK FIREBASE
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: '<apiKey>',
      appId: '<appId>',
      messagingSenderId: '<messagingSenderId>',
      projectId: '<projectId>',
      storageBucket: '<storageBucket>',
    ));
  } else {
    await Firebase.initializeApp();
  }
  // APP START
  runApp(const MyApp());
}

// APP
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // WIDGETS
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // INTERFACE USER
      providers: [
        ChangeNotifierProvider(
          create: (e) => UserProvider(),
        ),
      ],
      // BODY
      child: MaterialApp(
        title: 'APP',
        debugShowCheckedModeBanner: false,
        // DESING
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: background,
        ),
        // EVENTS WIDGETS
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          // REBUILDS - ASYNCHRONOUS
          builder: (context, e) {
            // SCREEN SASYNCHRONOUS
            if (e.connectionState == ConnectionState.active) {
              if (e.hasData) {
                return const Layout(
                  webLayout: WebLayout(),
                  mobileLayout: MobileLayout(),
                );
              } else if (e.hasError) {
                // ERROR ASYNCHRONOUS
                return Center(
                  child: Text('${e.error}'),
                );
              }
            }
            // LOADING ASYNCHRONOUS
            if (e.connectionState == ConnectionState.waiting) {
              return Container(
                color: background,
                child: const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: white,
                  ),
                ),
              );
            }

            // SCREEN AUTHENTICATION
            return const Login();
          },
        ),
      ),
    );
  }
}