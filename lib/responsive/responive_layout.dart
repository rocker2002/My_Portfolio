import 'package:flutter/material.dart';

class ResponiveLayout extends StatelessWidget {
  const ResponiveLayout({super.key, required this.mobile, required this.tablet, required this.desktop});

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
          if (constraints.maxWidth <= 500){ 
            Text('Current Width: ${constraints.maxWidth.toStringAsFixed(1)}',style: TextStyle(fontSize: 24),);
            return mobile;
          }else if(constraints.maxWidth <= 1100){
            Text('Current Width: ${constraints.maxWidth.toStringAsFixed(1)}',style: TextStyle(fontSize: 24),);
            return tablet;
          }else{
             Text('Current Width: ${constraints.maxWidth.toStringAsFixed(1)}',style: TextStyle(fontSize: 24),);
            return desktop;
          }
        }
        ),
    );
  }
}