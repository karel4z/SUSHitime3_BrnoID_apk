import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BrnoID',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black26),
        useMaterial3: true,
      ),
      home: const Home(title: 'BrnoID'),
    );
  }
}

_launchURL() async {
  const url = 'https://www.brnoid.cz/';
  final uri = Uri.parse(url);
  await launchUrl(uri);
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});


  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfc0d1b),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Background.png"), 
              fit: BoxFit.cover
            ),
          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child:  Image.asset("assets/images/Brno.png",),
              ),
              Padding(
                padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 110),
                child: Center(
                  child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xFF000000), // change background color of button
                      backgroundColor: const Color(0xFFffffff), // change text color of button
                    ),
                    onPressed: _launchURL,
                    child: const  Text('Pokračovat'),
                  ),
                ),
              ),
            ],
          ),
        ),
       )
      ),
    );
  }
}

