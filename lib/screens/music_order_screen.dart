// ignore_for_file: prefer_const_constructors,

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicOrderScreen extends StatefulWidget {
  const MusicOrderScreen({super.key});

  @override
  State<MusicOrderScreen> createState() => _MusicOrderScreenState();
}

class _MusicOrderScreenState extends State<MusicOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final String musicTitle = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Заказ $musicTitle', style: GoogleFonts.lobster(fontSize: 24)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Вы заказали: $musicTitle',
                style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Вернуться на главную', style: GoogleFonts.roboto(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
