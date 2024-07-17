// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_ordering_app/extensions/extensions.dart';
import 'package:music_ordering_app/models/restaurant.dart';

import 'restaurant_detail_screen.dart';

class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({super.key});

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
   int? selectedIndex;
  bool isExpanded = false;
  final List<Map<String, String>> restaurants = [
    {
      'name': 'Ресторан 1',
     'image': 'images/restaurant1.jpg'.definePath(),
     'adress':'restaurant1 street',
     },
    {
      'name': 'Ресторан 2',
      'image': 'images/restaurant2.jpg'.definePath(),
     'adress':'restaurant2 street',
      },
    {
      'name': 'Ресторан 3', 
      'image': 'images/restaurant3.jpg'.definePath(),
     'adress':'restaurant3 street',
      },
    {
      'name': 'Ресторан 4', 
      'image': 'images/restaurant4.jpg'.definePath(),
     'adress':'restaurant4 street',
      },
    // Добавьте другие рестораны
  ];

  @override
  Widget build(BuildContext context) {
    void onCardClick(int index){
      setState(() {
                selectedIndex = index;
                isExpanded = !isExpanded;
              });
              Future.delayed(Duration(milliseconds: 300), () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        RestaurantDetailScreen(restaurant:Restaurant(name:  restaurants[index]['name']!, cuisine: "cuisine", address: restaurants[index]["adress"]!, rating: "rating", price: "price", image: restaurants[index]["image"]!)),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var begin = Offset(0.0, 1.0);
                      var end = Offset.zero;
                      var curve = Curves.ease;

                      var tween =
                          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                ).then((_) {
                  setState(() {
                    isExpanded = false;
                  });
                });
              });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Рестораны', style: GoogleFonts.lobster(fontSize: 28)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: MediaQuery.of(context).size.width>1000?4:2),
          itemCount: restaurants.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            // onTap: () {
            //   Navigator.pushNamed(context, '/restaurantDetail', arguments: restaurants[index]['name']);
            // },
            onDoubleTap: (){
              onCardClick(index);
            },
            onTap: () {
               onCardClick(index);
              },
            child:AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: selectedIndex == index && isExpanded ? 200 : 100,
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.asset(
                        restaurants[index]['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      restaurants[index]['name']!,
                      style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
