import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home',style: TextStyle(fontSize: 24,),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      body: const Center(
        child: Column(
          children: [
            Text('Wel Come',style: TextStyle(fontSize: 64,),),
          ],
        ),
      ),
    );
  }
}
