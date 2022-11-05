import 'package:flutter/material.dart';
import 'package:Gibbor/auth/service/auth_service.dart';
import 'package:Gibbor/feed/ui/feed_screen.dart';
import 'package:Gibbor/home/ui/home_screen_2.dart';
import 'package:Gibbor/profile/ui/profile_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int CurrentPage = 0;
  late PageController pc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pc = PageController(initialPage: CurrentPage);
  }

  setCurrentPage(index) {
    setState(() {
      CurrentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*       appBar: AppBar(
        backgroundColor: Colors.black,,
        title: const Text('Gibbor Airsoft'),
      ), */
      body: PageView(
        controller: pc,
        onPageChanged: setCurrentPage,
        children: const [
          Home(),
          FeedPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey,
            padding: const EdgeInsets.all(10),
            gap: 8,
            selectedIndex: CurrentPage,
            onTabChange: (index) {
              pc.animateToPage(index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease);
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
