import 'package:flutter/material.dart';
import 'package:portfolio/responsive/desktop_layout.dart';
import 'package:portfolio/responsive/mobile_layout.dart';
import 'package:portfolio/responsive/responive_layout.dart';
import 'package:portfolio/responsive/tablet_layout.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget changeColor(){
    return Scaffold(
      backgroundColor: Colors.green,
    );
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponiveLayout(mobile: MobileLayout(), tablet: TabletLayout(), desktop: DesktopLayout())
    );
  }
}
