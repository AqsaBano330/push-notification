import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pushnotification/HomeScreen.dart';
import 'package:pushnotification/NotificationScreen.dart';
import 'package:pushnotification/firebase_api.dart';
import 'package:pushnotification/firebase_options.dart';

final navigatorkey = GlobalKey<NavigatorState>();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform,);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorkey,
      home: const HomeScreen(),
      routes: {
        NotificationScreen.route: (context) => NotificationScreen()
      }
    );
  }
}

