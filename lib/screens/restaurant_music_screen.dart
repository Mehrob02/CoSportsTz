// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_ordering_app/screens/music_order_screen.dart';

class RestaurantMusicScreen extends StatefulWidget {
  
  const RestaurantMusicScreen({super.key, required this.restaurantName});
final String restaurantName;
  @override
  State<RestaurantMusicScreen> createState() => _RestaurantMusicScreenState();
}

class _RestaurantMusicScreenState extends State<RestaurantMusicScreen> {
  final List<String> musicList = [
    'Композиция 1',
    'Композиция 2',
    // Добавьте другие композиции
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Медиатека ${widget.restaurantName}', style: GoogleFonts.lobster(fontSize: 24)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: musicList.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(musicList[index], style: GoogleFonts.roboto(fontSize: 16)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => MusicOrderScreen(order:musicList[index]),));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
