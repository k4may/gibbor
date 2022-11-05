import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF394730),
        title: const Text('Gibbor Airsoft'),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFF394730),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            backgroundColor: const Color(0xFF394730),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: const Color(0xFF3e5b3d),
            padding: const EdgeInsets.all(10),
            gap: 8,
            onTabChange: (index) {
              print(index);
            },
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(
                icon: Icons.feed,
                text: 'Feed',
              ),
              GButton(
                icon: Icons.account_box,
                text: 'Perfil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
