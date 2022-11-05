import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF394730),
          title: const Text('Gibbor Team'),
        ),
        body: Container(
          color: Colors.white,
        ));
  }
}
