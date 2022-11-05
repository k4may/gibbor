import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF394730),
          title: const Text('Feed'),
        ),
        body: Container(
          color: Colors.white,
        ));
  }
}
