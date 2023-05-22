import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:thesis_app/home/home_screen.dart';
import 'package:thesis_app/pet_profile/pet_profile_screen.dart';
import 'package:thesis_app/user/login.dart';

Future <void> main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dog App',
      home: const LogInPage(),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(), // Register HomeScreen with the routeName
        PetProfile.routeName: (context) => const PetProfile(), // Regi
      },

    );
  }
}
