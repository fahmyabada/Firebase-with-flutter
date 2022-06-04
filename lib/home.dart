import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Home'),
      ),
      body: const Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Text(
          'home page',
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}