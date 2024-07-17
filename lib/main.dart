// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'app.dart';
import 'screens/profile_screen.dart';
import 'screens/restaurant_list_screen.dart';
import 'screens/restaurant_music_screen.dart';
import 'screens/music_order_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Ordering App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>App(),
        '/restaurantListScreen': (context) => RestaurantListScreen(),
        '/restaurantMusic': (context) => RestaurantMusicScreen(),
        '/musicOrder': (context) => MusicOrderScreen(),
        '/profile':(context)=>ProfileScreen()
      },
    );
  }
}
